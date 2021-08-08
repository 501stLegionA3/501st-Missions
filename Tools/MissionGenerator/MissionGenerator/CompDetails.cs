using System;
using System.Collections.Generic;
using System.Linq;
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
    }
}
