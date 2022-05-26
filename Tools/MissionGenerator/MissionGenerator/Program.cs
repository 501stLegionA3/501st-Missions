using FiveOhFirstMissionFileGenerator;

using McMaster.Extensions.CommandLineUtils;

using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.IO;
using System.Linq;
using System.Numerics;
using System.Text.Json;
using System.Threading.Tasks;

namespace MissionGenerator
{
    [Command(Name = "missiongen", Description = "Automatically generate missions based off compositions and framework missions.")]
    public class Program
    {
        public static async Task Main(string[] args)
            => await CommandLineApplication.ExecuteAsync<Program>(args);

        [Argument(0, Description = "Directory to pick Framework Missions from.")]
        private string BasePath { get; } = "";

        [Argument(1, Description = "Directory to pick Compositions from.")]
        private string CompPath { get; } = "";

        [Argument(2, Description = "Directory to place built mission files in.")]
        private string ResPath { get; } = "";

        [Option("-t|--title", Description = "Title format string. {0} is replaced with the composition name (without version numbers), " +
            "{1} is replaced with the mission name, and {2} is replaced with the version number.")]
        private string TitleOutline { get; } = "501st Legion FunOp {0}: {1} {2}";

        [Option("-d|--desc", Description = "Description format string. {0} is replaced with the version number.")]
        private string DescOutline { get; } = "Official 501st Legion FunOP | All 501st, 212th, 91st, 101st, and 327th slots! | {0}";

        [Option("-m|--missions", Description = "Location of the missions.cfg file. Will use the default file if none is provided.")]
        private string MissionCfgPath { get; } = "missions.cfg";

        [Option("-l|--latest", Description = "The file will be generated with V-Latest instead of a version number.")]
        private bool UseLatestMissionSystem { get; } = false;

        private async Task OnExecute()
        {
            Console.WriteLine("\nStarting File Generator\n");

            var missionNames = await GetMissionNames();

            var data = await GetMissionDataAsync(missionNames);

            Console.WriteLine($"\nFound {data.Count} mission files to build.\n");

            await BuildMissionFiles(data);

            Console.WriteLine("\nBuild Complete.\n");
        }

        private async Task<Dictionary<string, string>> GetMissionNames()
        {
            Dictionary<string, string> missionNames = new();
            await using FileStream cfg = new(MissionCfgPath, FileMode.Open, FileAccess.Read, FileShare.Read);
            using StreamReader sr = new(cfg);

            while(!sr.EndOfStream)
            {
                string? line = await sr.ReadLineAsync();

                if (line is null) break;

                var parts = line.Trim().Split(",", StringSplitOptions.RemoveEmptyEntries);

                if (parts.Length == 2)
                {
                    if (!missionNames.ContainsKey(parts[0]))
                    {
                        missionNames.Add(parts[0], parts[1]);
                    }
                }
            }

            return missionNames;
        }

        private async Task BuildMissionFiles(List<MissionData> missions)
        {
            List<Task> all = new();
            foreach (MissionData mission in missions)
                all.Add(BuildMissionFile(mission));

            await Task.WhenAll(all);
        }

        private async Task BuildMissionFile(MissionData missionData)
        {
            var rawFileName = Uri.EscapeDataString(missionData.FileName).Replace(".", "%2e");
            List<string> newMissionData = new();
            await using FileStream baseFile = new(Path.Combine(missionData.MapBasePath, "mission.sqm"), FileMode.Open, FileAccess.Read, FileShare.Read);
            using StreamReader baseReader = new(baseFile);

            while (!baseReader.EndOfStream)
            {
                string? line = await baseReader.ReadLineAsync();

                if (line is null) break;

                var trimmed = line.Trim();

                if (trimmed.StartsWith("version="))
                {
                    line = line[..(line.IndexOf('=') + 1)] + $"{missionData.CompositionDetails.EditorVersion};";
                }
                else if (trimmed.StartsWith("binarizationWanted="))
                {
                    line = line[..(line.IndexOf('=') + 1)] + "1;";
                }
                else if (trimmed.StartsWith("sourceName="))
                {
                    line = line[..(line.IndexOf('=') + 1)] + $@"""{rawFileName}"";";
                }
                else if (trimmed.StartsWith("addons[]="))
                {
                    newMissionData.Add(line);

                    while (!((line = await baseReader.ReadLineAsync())?.StartsWith("};") ?? true)) { }

                    newMissionData.Add("{");

                    for (int i = 0; i < missionData.CompositionDetails.RequiredAddons.Count; i++)
                    {
                        if (missionData.CompositionDetails.RequiredAddons.Count - 1 > i)
                        {
                            newMissionData.Add($@"  ""{missionData.CompositionDetails.RequiredAddons[i]}"",");
                        }
                        else
                        {
                            newMissionData.Add($@"  ""{missionData.CompositionDetails.RequiredAddons[i]}""");
                        }
                    }
                }
                else if (trimmed.StartsWith("class AddonsMetaData"))
                {
                    // This as well
                }
                else if (trimmed.StartsWith("class ScenarioData"))
                {
                    newMissionData.Add(line);

                    while (!((line = await baseReader.ReadLineAsync())?.StartsWith("};") ?? true)) { }

                    newMissionData.AddRange(new string[] {
                        @"{",
                        @"	author=""501st Mission Builders"";",
                        @"	briefing=0;",
                        @"	debriefing=0;",
                        @"	disabledAI=1;",
                        @"	respawn=3;",
                        @"	class Header",
                        @"	{",
                        @"		gameType=""Coop"";",
                        @"	};"
                    });
                }
                else if (trimmed.StartsWith("class Mission"))
                {
                    newMissionData.Add(line);

                    while (!((line = await baseReader.ReadLineAsync())?.StartsWith("};") ?? true)) { }

                    newMissionData.AddRange(new string[] {
                        @"{",
                        @"	assetType=""Free"";",
                        @"	class Intel",
                        @"	{",
                        @$"		briefingName=""{missionData.Title}"";",
                        $@"		overviewText=""{missionData.Description}"";",
                        @"		resistanceWest=0;",
                        @"  };",
                        @"	class Entities",
                        @"	{"
                    });

                    newMissionData.AddRange(missionData.GetOffsetObjectData());

                    newMissionData.AddRange(new string[] {
                        "   };",
                        "    class Connections",
                        "   {"
                    });

                    newMissionData.AddRange(missionData.CompositionDetails.Connections);

                    newMissionData.Add("    };");
                }

                // We should never have a null line, it means we are done.
                if (line is null) break;

                newMissionData.Add(line);
            }

            // Write updated mission data.
            var fileName = $"{rawFileName}.{missionData.MapId}";

            var fullPath = Path.Combine(ResPath, fileName);
            // get rid of special characters in the mission file save name for readability.
            fullPath = fullPath.Replace("%2e", "-").Replace("%20", "_");
            Directory.CreateDirectory(fullPath);

            await File.WriteAllLinesAsync(Path.Combine(fullPath, "mission.sqm"), newMissionData);

            // Leave a file that contains description.ext edit instructions.
            var missionCfg = new MissionConfig()
            {
                Author = missionData.Author,
                Description = missionData.Description,
                Title = missionData.Title,
                Version = missionData.Version
            };

            await using FileStream fs = new(Path.Combine(fullPath, "config.json"), FileMode.Create, FileAccess.Write, FileShare.Read);
            await JsonSerializer.SerializeAsync(fs, missionCfg);

            Console.WriteLine($"Created mission file for: {missionData.Title}");
        }

        private async Task<List<MissionData>> GetMissionDataAsync(Dictionary<string, string> missionNames)
        {
            List<MissionData> finalData = new();

            List<Task<List<MissionData>>> runners = new();
            foreach (string map in Directory.GetDirectories(BasePath))
            {
                runners.Add(GetIndividualMissionDataAsync(missionNames, map));
            }

            await Task.WhenAll(runners);

            foreach (var task in runners)
                finalData.AddRange(await task);

            return finalData;
        }

        private async Task<List<MissionData>> GetIndividualMissionDataAsync(Dictionary<string, string> missionNames, string map)
        {
            List<MissionData> finalData = new();

            // Check to make sure it has mission file structure.
            var dirName = Path.GetFileName(map);
            if (!dirName.Contains('.')) return finalData;

            // Get everything at the last dot and after.
            var mapName = dirName[dirName.LastIndexOf('.')..];

            // Make sure we have data beyond the dot.
            if (mapName.Length <= 1) return finalData;

            // Remove the dot.
            mapName = mapName[1..];

            // Get the mission name, or set the mission name to the map name if it is not in the dict.
            if (!missionNames.TryGetValue(mapName, out string? missionName))
                missionName = mapName;

            foreach (string comp in Directory.GetDirectories(CompPath))
            {
                var compName = Path.GetFileName(comp);

                if (IsValidComp(comp))
                {
                    var compData = await GetCompDetailsAsync(comp);

                    // Bad comp data, go to the next comp.
                    if (compData is null) continue;

                    await using FileStream fs = new(Path.Combine(map, "mission.sqm"), FileMode.Open, FileAccess.Read, FileShare.Read);
                    using StreamReader sr = new(fs);

                    Vector3? offsetPos = null;
                    bool found = false;

                    while (!sr.EndOfStream && !found)
                    {
                        string? line;
                        if ((line = await sr.ReadLineAsync()) is not null)
                        {
                            var trimmed = line.Trim();

                            if (trimmed.StartsWith("class Entities"))
                            {
                                while (!((line = await sr.ReadLineAsync())?.Trim().StartsWith("items=") ?? true)) { }

                                var itemCount = 0;
                                if (TryGetVaraibleFromLine(line ?? "", out var dat))
                                    _ = int.TryParse(dat, out itemCount);

                                if (itemCount <= 0) break;

                                // Skip to the line that has position data within entities. Should be only one of these in the base file.
                                while (!((line = await sr.ReadLineAsync())?.Trim().StartsWith("class") ?? true)) { }

                                int i = 0;
                                while (i < itemCount && !sr.EndOfStream)
                                {
                                    List<string> markerLines = new();

                                    while (!((line = await sr.ReadLineAsync())?.Trim().StartsWith("class") ?? true))
                                    {
                                        markerLines.Add(line.Trim());
                                    }

                                    if (markerLines.Count == 0) continue;

                                    string? position = markerLines.FirstOrDefault(x => x.StartsWith("position[]="));

                                    if (position is null) continue;

                                    var rawData = position[(position.IndexOf("{") + 1)..^2];

                                    var rawInts = rawData.Split(",", StringSplitOptions.RemoveEmptyEntries);

                                    if (rawInts.Length == 3)
                                    {
                                        if (!float.TryParse(rawInts[0], out float one))
                                            break;
                                        if (!float.TryParse(rawInts[1], out float two))
                                            break;
                                        if (!float.TryParse(rawInts[2], out float three))
                                            break;

                                        offsetPos = new Vector3(one, two, three);
                                    }

                                    string? name = markerLines.FirstOrDefault(x => x.StartsWith("name="));

                                    if (name is null) continue;

                                    if (TryGetVaraibleFromLine(name, out string? nameString))
                                    {
                                        var compNameActual = Uri.UnescapeDataString(compName.ToLower()).Replace("%2e", ".");
                                        if (nameString.Replace("_", " ")
                                            .Equals(compNameActual.Replace("_", " "), StringComparison.OrdinalIgnoreCase))
                                        {
                                            found = true;
                                            i += 1;
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // No offest means no proper map placement, skip.
                    if (!found || offsetPos is null) continue;

                    // Set the mission title.
                    var title = string.Format(TitleOutline, compData.Title, missionName, compData.Version);

                    var fileName = string.Format(TitleOutline, compData.Title, missionName,
                        UseLatestMissionSystem ? "V-Latest" : compData.Version);
                    // And description.
                    var desc = string.Format(DescOutline, compData.Version);

                    finalData.Add(new MissionData(title, desc, compData.Author, compData.Version, fileName, 
                        compData, map, mapName, offsetPos.Value));

                    Console.WriteLine($"Built data on {missionName} for {compData.Title}");
                }
            }

            return finalData;
        }

        private static bool IsValidComp(string path)
        {
            bool header = false;
            bool comp = false;
            foreach (string item in Directory.GetFiles(path))
            {
                if (Path.GetFileName(item).Equals("composition.sqe"))
                {
                    // We should not hit this twice.
                    if (comp) return false;

                    comp = true;
                    continue;
                }

                if (Path.GetFileName(item).Equals("header.sqe"))
                {
                    // We should not hit this twice.
                    if (header) return false;

                    header = true;
                    continue;
                }
            }

            return header && comp;
        }

        private static async Task<CompDetails?> GetCompDetailsAsync(string path)
        {
            CompDetails comp = new();

            try
            {
                // Open the header file.
                await using (FileStream fs = new(Path.Combine(path, "header.sqe"), FileMode.Open, FileAccess.Read, FileShare.Read))
                {
                    using StreamReader sr = new(fs);

                    bool startedDataCapture = false;
                    int skipLines = 0;

                    while (!sr.EndOfStream)
                    {
                        string? line = await sr.ReadLineAsync();

                        if (skipLines > 0)
                        {
                            skipLines--;
                            continue;
                        }

                        if (line is null) break;
                        if (!startedDataCapture)
                        {
                            if (line.StartsWith("version=")
                                && TryGetVaraibleFromLine(line, out string? data))
                            {
                                comp.EditorVersion = data;
                            }
                            else if (line.StartsWith("name=")
                                && TryGetVaraibleFromLine(line, out data))
                            {
                                var parts = data.Split(" ", StringSplitOptions.RemoveEmptyEntries).ToList();
                                var last = parts.Last();

                                if (last.StartsWith("V")
                                    || last.StartsWith("v"))
                                {
                                    comp.Version = last;
                                    parts.Remove(last);
                                    comp.Title = string.Join(" ", parts);
                                }
                                else
                                {
                                    comp.Title = data;
                                }
                            }
                            else if (line.StartsWith("author=")
                                && TryGetVaraibleFromLine(line, out data))
                            {
                                comp.Author = data;
                            }
                            else if (line.StartsWith("requiredAddons[]="))
                            {
                                startedDataCapture = true;
                                skipLines = 1;
                            }
                        }
                        else
                        {
                            if (line.StartsWith("}"))
                            {
                                startedDataCapture = false;
                                continue;
                            }

                            if (TryGetVaraibleFromLine(line, out string? addon))
                                comp.RequiredAddons.Add(addon);
                        }
                    }
                }

                await using (FileStream fs = new(Path.Combine(path, "composition.sqe"), FileMode.Open, FileAccess.Read, FileShare.Read))
                {
                    using StreamReader sr = new(fs);

                    bool startedDataCapture = false;
                    int skipLines = 0;
                    bool objects = true;

                    while (!sr.EndOfStream)
                    {
                        string? line = await sr.ReadLineAsync();

                        if (skipLines > 0)
                        {
                            skipLines--;
                            continue;
                        }

                        if (line is null) break;

                        if (!startedDataCapture)
                        {
                            line = line.Trim();

                            if (line.StartsWith("version="))
                            {
                                var data = line.Remove(0, "version=".Length);
                                data = data[..^1];
                                comp.EditorVersion = data;
                            }
                            else if (line.StartsWith("class items"))
                            {
                                startedDataCapture = true;
                                objects = true;
                                skipLines = 1;
                            }
                            else if (line.StartsWith("class connections"))
                            {
                                startedDataCapture = true;
                                objects = false;
                                skipLines = 1;
                            }
                        }
                        else
                        {
                            if (line.StartsWith("};"))
                            {
                                startedDataCapture = false;
                                continue;
                            }

                            if (objects)
                                comp.RawObjectData.Add(line);
                            else
                                comp.Connections.Add(line);
                        }
                    }
                }

                return comp;
            }
            catch
            {
                return null;
            }
        }

        private static bool TryGetVaraibleFromLine(string line,
            [NotNullWhen(true)] out string? data)
        {
            try
            {
                if (line.Contains('"'))
                {
                    // Get the value between the " " of the name variable.
                    data = line[(line.IndexOf('"') + 1)..(line.LastIndexOf('"'))];
                    // ArmA uses HTML encoding to preserve special chars in strings.
                    data = Uri.UnescapeDataString(data).Replace("%2e", ".");
                }
                else
                {
                    data = line[(line.IndexOf('=') + 1)..(line.LastIndexOf(';'))];
                }

                return true;
            }
            catch
            {
                data = null;
                return false;
            }
        }
    }
}

