using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class Resource
    {
        private string ResourceID;
        private string ResourceName;
        private string Active;

        public string resourceID
        {
            get { return ResourceID; }
            set { ResourceID = value; }
        }

        public string resourceName

        {
            get { return ResourceName; }
            set { ResourceName = value; }
        }

        public string active

        {
            get { return Active; }
            set { Active = value; }
        }

    }
}