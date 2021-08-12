using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace FiveOhFirstMissionFileGenerator
{
    public class MissionData
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string Author { get; set; }

        public CompDetails CompositionDetails { get; set; }

        public string MapBasePath { get; set; }
        public string MapId { get; set; }
        public Vector3 PresetCenter { get; set; }

        public MissionData(string title, string desc, string author, CompDetails compDetails, string basePath, string mapId, Vector3 presetCenter)
            => (Title, Description, Author, CompositionDetails, MapBasePath, MapId, PresetCenter) 
                = (title, desc, author, compDetails, basePath, mapId, presetCenter);

        public List<string> GetOffsetObjectData()
        {
            List<string> offsetData = new();
            foreach(var line in CompositionDetails.RawObjectData)
            {
                string data = line;
                
                if(data.Contains("position[]="))
                {
                    var rawData = line[(line.IndexOf("{") + 1)..^2];

                    var rawInts = rawData.Split(",", StringSplitOptions.RemoveEmptyEntries);

                    if (rawInts.Length == 3)
                    {
                        if (float.TryParse(rawInts[0], out float one)
                            && float.TryParse(rawInts[1], out float two)
                            && float.TryParse(rawInts[2], out float three))
                        {
                            var objectOffset = new Vector3(one, two, three);

                            var objectActual = PresetCenter + objectOffset;

                            data = $"{data[..(line.IndexOf("{") + 1)]}{objectActual.X},{objectActual.Y},{objectActual.Z}}};";
                        }
                    }
                }

                offsetData.Add(data);
            }

            return offsetData;
        }
    }
}
