using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LICT.DotNet.ChakrirFactory.com.EntityLayer
{
    public class Entity_Company_JobPost
    {
        public int id { get; set; }
        public string title { get; set; }
        public int category { get; set; }
        public int vacancyno { get; set; }
        public string gender { get; set; }
        public int nature { get; set; }
        public int location { get; set; }
        public string salrange { get; set; }
        public string description { get; set; }
        public string expreq { get; set; }
        public string edureq { get; set; }
        public string jobreq { get; set; }
        public string otherbenefit { get; set; }
        public DateTime deadline { get; set; }
    }
}
