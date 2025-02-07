using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace D424Capstone.Services
{
    public abstract class Report
    {
        public string Title { get; set; }
        public DateTime DateTimeStamp { get; set; }

        public Report()
        {
            DateTimeStamp = DateTime.Now;
        }

        public abstract Task GenerateReport();
    }
}
