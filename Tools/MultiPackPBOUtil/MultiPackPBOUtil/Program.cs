using McMaster.Extensions.CommandLineUtils;

using MissionGenerator;

using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text.Json;
using System.Threading.Tasks;

namespace MultiPackPBOUtil
{
    [Command(Name = "multipackpbo", Description = "Pack all folders in the selected directory into pbo files.")]
    public class Program
    {
        public static async Task Main(string[] args)
            => await CommandLineApplication.ExecuteAsync<Program>(args);

        [Argument(0, Description = "Directory to pack folders from.")]
        private string StartFolderPath { get; } = "";

        [Option("-m|--move", Description = "Moves the mission files to a new directory. This will occour before the --delete " +
            "option.")]
        private string MoveToFolderPath { get; } = "";

        [Option("-d|--delete", CommandOptionType.NoValue, Description = "Set to true to delete all folders in the start " +
            "directory after the process is done.")]
        private bool DeleteAfterConversion { get; } = false;

        [Option("-o|--output", Description = "Location where the outputed pbo files should go. A folder will be created" +
            " if it does not already exsist.")]
        private string OutputDirectoryPath { get; } = "";

        [Option("-c|--content", Description = "Location where additional content should be copied from and into each pbo file.")]
        private string ContentDirectoryPath { get; } = "";

        [Option("-i|--ignore", CommandOptionType.MultipleValue, Description = "File name(s) to ignore when running --delete and --move.")]
        public string[] FileNamesToIgnore { get; } = Array.Empty<string>();

        [Option("-l|--latest", CommandOptionType.NoValue, Description = "The latest file will always have the same name. Previous versions of" +
            "existing files will be renammed based upon the data in the generated version_config.json file.")]
        public bool UseLatestMissionSystem { get; } = false;

        private ConsoleColor ForegroundColor { get; set; } = ConsoleColor.Black;
        private ConsoleColor BackgroundColor { get; set; } = ConsoleColor.White;

        private async Task OnExecute()
        {
            ResetConsoleColors();

            if(!Directory.Exists(StartFolderPath))
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.BackgroundColor = ConsoleColor.Black;
                Console.WriteLine($"The directory at {StartFolderPath} does not exsist.");
                ResetConsoleColors();
                return;
            }

            var missionFolders = GetMissionFileDirectories(StartFolderPath);

            Console.WriteLine($"Found {missionFolders.Length} mission files.");

            if(missionFolders.Length <= 0)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.BackgroundColor = ConsoleColor.Black;
                Console.WriteLine($"The directory at {StartFolderPath} has no mission folders.");
                ResetConsoleColors();
                return;
            }

            var versioning = await CreatePboFiles(missionFolders);

            var output = OutputDirectoryPath;
            bool tempFolderUsed = false;
            if (string.IsNullOrWhiteSpace(output))
            {
                output = Path.Join(Path.GetDirectoryName(StartFolderPath), "temp_pbo_output");
                tempFolderUsed = true;
            }

            if (UseLatestMissionSystem)
            {
                Console.WriteLine($"Adjusting Existing File Names in {MoveToFolderPath}.");

                await UpdateExistingNamesAsync(versioning);
            }

            Console.WriteLine($"PBO files built, moving files to {output}.");

            CopyPboFilesToOutput(StartFolderPath, output);

            if(!string.IsNullOrWhiteSpace(MoveToFolderPath))
            {
                Console.WriteLine($"Moving Mission Files to {MoveToFolderPath}");

                Directory.CreateDirectory(MoveToFolderPath);

                await CopyFolderRecursively(StartFolderPath, MoveToFolderPath);
            }

            Console.WriteLine("Cleaning up...");

            if (DeleteAfterConversion)
                CleanupInputFolder(StartFolderPath);

            if (tempFolderUsed)
            {
                var outputActual = Path.Join(StartFolderPath, "output");

                Console.WriteLine($"Moving PBOs back to {outputActual}");

                CopyPboFilesToOutput(output, outputActual);

                Directory.Delete(output, true);
            }

            Console.WriteLine($"Completed. Parsed {missionFolders.Length} mission files.");
        }

        private string[] GetMissionFileDirectories(string path, List<string>? foundFolders = null)
        {
            if (foundFolders is null) foundFolders = new();

            foreach(var folder in Directory.GetDirectories(path))
            {
                bool foundSqm = false;
                var files = Directory.GetFiles(folder);
                foreach (var file in files)
                {
                    if (Path.GetFileName(file).Equals("mission.sqm"))
                    {
                        foundFolders.Add(folder);
                        foundSqm = true;
                        break;
                    }
                }

                if(!foundSqm)
                    foundFolders.AddRange(GetMissionFileDirectories(folder, foundFolders));
            }

            return foundFolders.ToArray();
        }

        private async Task CopyFolderRecursively(string copyFrom, string copyTo)
        {
            var files = Directory.GetFiles(copyFrom);
            foreach(var file in files)
            {
                Directory.CreateDirectory(copyTo);

                var name = Path.GetFileName(file);

                if (FileNamesToIgnore.Contains(name))
                    break;

                var path = Path.Combine(copyTo, name);
                if(File.Exists(path))
                    File.Delete(path);

                File.Copy(file, path);
            }

            var dirs = Directory.GetDirectories(copyFrom);
            foreach (var dir in dirs)
            {
                var newDirName = Path.GetFileName(dir);
                var dest = copyTo;
                var newDest = Path.Join(dest, newDirName);

                await CopyFolderRecursively(dir, newDest);
            }
        }

        private async Task<Dictionary<string, string>> CreatePboFiles(string[] missionFolders)
        {
            bool addContent = !string.IsNullOrWhiteSpace(ContentDirectoryPath);

            Dictionary<string, string> versionInfo = new();
            string toolPath;
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                toolPath = Path.Join(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "Utils", "MakePbo.exe");
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
            {
                toolPath = Path.Join(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "Utils", "depbo-tools-0.8.60", "bin", "makepbo");
            }
            else
            {
                Console.WriteLine("Invalid runtime for mikero tools.");
                return new();
            };

            if (File.Exists(toolPath))
            {
                Console.WriteLine($"Pulling tools from {toolPath}");
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.BackgroundColor = ConsoleColor.Black;
                Console.WriteLine("Failed to find a tool executable.");
                ResetConsoleColors();
                return new();
            }

            foreach (var folder in missionFolders)
            {
                try
                {
                    Console.WriteLine($"Building PBO for {folder}");

                    if (addContent)
                    {
                        await CopyFolderRecursively(ContentDirectoryPath, folder);
                        Console.WriteLine("... copied aditional contents ...");

                        if(File.Exists(Path.Join(folder, "config.json")))
                        {
                            // Modify description.ext file.

                            await using FileStream datafs = new(Path.Join(folder, "config.json"), FileMode.Open, FileAccess.Read, FileShare.Read);
                            var data = await JsonSerializer.DeserializeAsync<MissionConfig>(datafs);

                            if(data is not null)
                            {
                                // If there is a description file then update it.
                                if (File.Exists(Path.Join(folder, "description.ext")))
                                {
                                    List<string> descData = new();
                                    await using (FileStream descfs = new(Path.Join(folder, "description.ext"), FileMode.Open, FileAccess.Read, FileShare.None))
                                    {
                                        using StreamReader descsr = new(descfs);

                                        string? line;
                                        while ((line = await descsr.ReadLineAsync()) is not null)
                                        {
                                            if (line.StartsWith("author"))
                                            {
                                                var chars = line.TakeWhile(x => x != '"');
                                                line = new string(chars.ToArray()) + @$"""{data.Author}"";";
                                            }
                                            else if (line.StartsWith("onLoadName"))
                                            {
                                                var chars = line.TakeWhile(x => x != '"');
                                                line = new string(chars.ToArray()) + @$"""{data.Title}"";";
                                            }
                                            else if (line.StartsWith("onLoadMission"))
                                            {
                                                var chars = line.TakeWhile(x => x != '"');
                                                line = new string(chars.ToArray()) + @$"""{data.Description}"";";
                                            }

                                            descData.Add(line);
                                        }
                                    }

                                    await File.WriteAllLinesAsync(Path.Join(folder, "description.ext"), descData);
                                }

                                var dirname = Path.GetFileName(folder);
                                // Update versioning info ...
                                if (dirname is not null)
                                    _ = versionInfo.TryAdd(dirname, data.Version);
                            }
                        }
                    }

                    using var converting = Process.Start(new ProcessStartInfo()
                    {
                        Arguments = $"-A -X=\"thumbs.db,*.txt,*.h,*.dep,*.cpp,*.bak,*.png,*.log,*.pew,source,*.tga,*.bat\" -P \"{folder}\"",
                        FileName = toolPath,
                        RedirectStandardError = true,
                        RedirectStandardOutput = true
                    });

                    Console.WriteLine("... created process handle ...");

                    if (converting is null)
                    {
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.BackgroundColor = ConsoleColor.Black;
                        Console.WriteLine("Failed to lauch converter.");
                        ResetConsoleColors();
                        break;
                    }

                    await converting.WaitForExitAsync();

                    Console.WriteLine("... process execution finished, printing logs ...");

                    string? errors;
                    bool errored = false;
                    while ((errors = await converting.StandardError.ReadLineAsync()) is not null)
                    {
                        // TODO log the errors.
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.BackgroundColor = ConsoleColor.Black;
                        Console.WriteLine(errors);

                        errored = true;
                    }

                    if (errored)
                    {
                        ResetConsoleColors();
                    }

                    string? messages;
                    while ((messages = await converting.StandardOutput.ReadLineAsync()) is not null)
                    {
                        Console.WriteLine(messages);
                    }

                    Console.WriteLine("... Mission file built.");
                }
                catch (Exception ex)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.BackgroundColor = ConsoleColor.Black;
                    Console.WriteLine($"An unkown error occoured: {ex.Message}\n\n{ex.StackTrace}");
                    ResetConsoleColors();
                    break;
                }
            }

            return versionInfo;
        }

        private async Task UpdateExistingNamesAsync(Dictionary<string, string> newNames)
        {
            var versionPath = Path.Combine(OutputDirectoryPath, "version_config.json");

            ConcurrentDictionary<string, string> nameSet = new();
            if (File.Exists(versionPath))
            {
                await using FileStream datafs = new(versionPath, FileMode.Open, FileAccess.Read, FileShare.Read);
                var data = await JsonSerializer.DeserializeAsync<VersionData>(datafs);

                if (data is not null)
                {
                    nameSet = new(data.Versions);

                    foreach (var file in data.Versions)
                    {
                        var filePath = Path.Combine(OutputDirectoryPath, file.Key + ".pbo");
                        var checkPath = Path.Combine(StartFolderPath, file.Key + ".pbo");

                        if (File.Exists(filePath)
                            && File.Exists(checkPath))
                        {
                            var newFileNameBase = file.Key.Replace("V-Latest", file.Value);
                            if (newFileNameBase == file.Key)
                                newFileNameBase += Guid.NewGuid().ToString();
                            var newFileMap = Path.GetExtension(newFileNameBase);
                            newFileNameBase = Path.GetFileNameWithoutExtension(newFileNameBase);
                            var newFileName = newFileNameBase + newFileMap + ".pbo";
                            newFileName = Path.Combine(OutputDirectoryPath, newFileName);

                            int counter = 1;
                            while (File.Exists(newFileName))
                            {
                                newFileName = Path.Combine(OutputDirectoryPath, $"{newFileNameBase}_V{counter++}{newFileMap}.pbo");
                            }

                            File.Copy(filePath, newFileName);
                            File.Delete(filePath);

                            Console.WriteLine($"Renamed {filePath} to {newFileName}.");

                            if (newNames.TryGetValue(file.Key, out var newVer))
                                nameSet[file.Key] = newVer;
                        }
                    }
                }
            }

            // Add new values ...
            foreach (var pair in newNames)
                if (!nameSet.TryGetValue(pair.Key, out _))
                    nameSet[pair.Key] = pair.Value;

            var jsonData = JsonSerializer.Serialize(new VersionData()
            {
                Versions = nameSet.ToDictionary(x => x.Key, x => x.Value)
            }, new JsonSerializerOptions()
            {
                WriteIndented = true,
            });

            File.WriteAllText(versionPath, jsonData);

            Console.WriteLine("Updated version_config.json.");
        }

        private void CopyPboFilesToOutput(string path, string copyTo)
        {
            var pboFiles = GetPboFiles(path);

            Console.WriteLine($"Found {pboFiles.Length} PBO files.");

            Directory.CreateDirectory(copyTo);

            foreach(var file in pboFiles)
            {
                var fileName = Path.GetFileNameWithoutExtension(file);
                var extension = Path.GetExtension(file);
                var mapExtension = Path.GetExtension(fileName);
                fileName = Path.GetFileNameWithoutExtension(fileName);

                var dest = Path.Join(copyTo, $"{fileName}{mapExtension}{extension}");

                int c = 1;
                while (File.Exists(dest))
                    dest = Path.Join(copyTo, $"{fileName}_V{c++}{mapExtension}{extension}");

                File.Copy(file, dest);
                File.Delete(file);
            }
        }

        private string[] GetPboFiles(string path, List<string>? foundFiles = null)
        {
            if (foundFiles is null) foundFiles = new();

            var files = Directory.GetFiles(path);
            foreach (var file in files)
            {
                if (Path.GetExtension(file).Equals(".pbo"))
                {
                    foundFiles.Add(file);
                }
            }

            foreach (var folder in Directory.GetDirectories(path))
                return GetPboFiles(folder, foundFiles);

            return foundFiles.ToArray();
        }

        private void CleanupInputFolder(string path)
        {
            var files = Directory.GetFiles(path);
            foreach(var file in files)
            {
                if (!FileNamesToIgnore.Contains(Path.GetFileName(file)))
                    File.Delete(file);
            }

            foreach (var folder in Directory.GetDirectories(path))
                CleanupInputFolder(folder);

            var data = Directory.GetFileSystemEntries(path);
            if (data?.Length <= 0)
                Directory.Delete(path);
        }

        private void ResetConsoleColors()
        {
            Console.ForegroundColor = ForegroundColor;
            Console.BackgroundColor = BackgroundColor;
        }
    }
}
