using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class NewsletterItem
    {
        private int resourceID;
        private string resourceName;
        private string comment;

        public int ResourceID { get; set; }
        public string ResourceName { get; set; }
        public string Comment { get; set; }

        public NewsletterItem(int resourceID, string resourceName, string comment)
        {
            ResourceID = resourceID;
            ResourceName = resourceName;
            Comment = comment;
        }
    }
}
