using McMaster.Extensions.CommandLineUtils;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
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

        private ConsoleColor ForegroundColor { get; set; } = ConsoleColor.Black;
        private ConsoleColor BackgroundColor { get; set; } = ConsoleColor.White;

        private async Task OnExecute()
        {
            ForegroundColor = Console.ForegroundColor;
            BackgroundColor = Console.BackgroundColor;

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

            await CreatePboFiles(missionFolders);

            var output = OutputDirectoryPath;
            bool tempFolderUsed = false;
            if (string.IsNullOrWhiteSpace(output))
            {
                output = Path.Join(Path.GetDirectoryName(StartFolderPath), "temp_pbo_output");
                tempFolderUsed = true;
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

        private async Task CreatePboFiles(string[] missionFolders)
        {
            bool addContent = !string.IsNullOrWhiteSpace(ContentDirectoryPath);

            string toolPath;
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                toolPath = Path.Join(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "Utils", "MakePbo.exe");
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
            {
                toolPath = Path.Join(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "Utils", "u_bin", "makepbo");
            }
            else
            {
                Console.WriteLine("Invalid runtime for mikero tools.");
                return;
            };

            Console.WriteLine($"Pulling tools from {toolPath}");

            foreach (var folder in missionFolders)
            {
                Console.WriteLine($"Building PBO for {folder}");

                if (addContent)
                {
                    await CopyFolderRecursively(ContentDirectoryPath, folder);
                }

                var converting = Process.Start(new ProcessStartInfo()
                {
                    Arguments = $"-P \"{folder}\"",
                    FileName = toolPath,
                    RedirectStandardError = true
                });

                if (converting is null)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.BackgroundColor = ConsoleColor.Black;
                    Console.WriteLine("Failed to lauch converter.");
                    ResetConsoleColors();
                    break;
                }

                await converting.WaitForExitAsync();

                string? errors;
                bool errored = false;
                if ((errors = await converting.StandardError.ReadLineAsync()) is not null)
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
            }
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
                var dest = Path.Join(copyTo, $"{fileName}{extension}");

                int c = 1;
                while (File.Exists(dest))
                    dest = Path.Join(copyTo, $"{fileName}_V{c++}{extension}");

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
