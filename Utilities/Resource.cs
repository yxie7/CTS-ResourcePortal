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
        private int ResourceTypeID;
        private int Active;

        public string resourceID
        {
            get { return ResourceID; }
            set { ResourceID = value; }
        }

        public int resourceTypeID

        {
            get { return ResourceTypeID; }
            set { ResourceTypeID = value; }
        }

        public int active

        {
            get { return Active; }
            set { Active = value; }
        }

    }
}
