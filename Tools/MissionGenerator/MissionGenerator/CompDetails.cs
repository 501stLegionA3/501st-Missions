using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace FiveOhFirstMissionFileGenerator
{
    public class CompDetails
    {
        public string Title { get; set; } = "";
        public string Version { get; set; } = "";
        public string Author { get; set; } = "";
        public string EditorVersion { get; set; } = "";
        public List<string> RequiredAddons { get; set; } = new();
        public List<string> RawObjectData { get; set; } = new();
        public List<string> Connections { get; set; } = new();

        public Vector3 GetAdditionalOffset()
        {
            Vector3? lastPos = null;
            foreach(string line in RawObjectData)
            {
                if (line.Contains("position[]="))
                {
                    var rawData = line[(line.IndexOf("{") + 1)..^2];

                    var rawInts = rawData.Split(",", StringSplitOptions.RemoveEmptyEntries);

                    if (rawInts.Length == 3)
                    {
                        if (float.TryParse(rawInts[0], out float one)
                            && float.TryParse(rawInts[1], out float two)
                            && float.TryParse(rawInts[2], out float three))
                        {
                            lastPos = new Vector3(one, two, three);
                        }
                    }
                }
                else if (line.Contains(@"name=""mission_generator_center_point"";"))
                {
                    if (lastPos is not null)
                    {
                        return lastPos.Value;
                    }
                    else
                    {
                        throw new Exception("Found comp center point with no last position!");
                    }
                }
            }

            // No center point? No movement.
            return new Vector3(0, 0, 0);
        }
    }
}
