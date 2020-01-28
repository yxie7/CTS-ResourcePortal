using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class Training
    {
        private string ResourceTypeID;
        private string ResourceTitle;
        private string Company;
        private string AddressLine1;        //Possibly renamed in DB?
        private string AddressLine2;        //Possibly renamed in DB?
        private string City;
        private string State;               //Needs to be added to DB  --ALSO--> Update in Stored Procedure
        private string ZipCode;
        private DateTime StartDate;
        //private DateTime EndDate;         //Not included in Page at the moment, possible addition?
        private DateTime ExpDate;
        private string WeeklyHours;
        private string TrainingLength;       //Needs to be added to DB  --ALSO--> Update in Stored Procedure
        private string ContactFN;
        private string ContactLN;
        private string Email;
        private string PhoneNumber;
        private string Link;
        private string Description;
        private string OtherReqs;

        public string resourceTypeID
        {
            get { return ResourceTypeID; }
            set { ResourceTypeID = value; }
        }

        public string resourceTitle
        {
            get { return ResourceTitle; }
            set { ResourceTitle = value; }
        }

        public string company
        {
            get { return Company; }
            set { Company = value; }
        }

        public string addressLine1
        {
            get { return AddressLine1; }
            set { AddressLine1 = value; }
        }

        public string addressLine2
        {
            get { return AddressLine2; }
            set { AddressLine2 = value; }
        }

        public string city
        {
            get { return City; }
            set { City = value; }
        }

        public string state
        {
            get { return State; }
            set { State = value; }
        }

        public string zipCode
        {
            get { return ZipCode; }
            set { ZipCode = value; }
        }

        public DateTime startDate
        {
            get { return StartDate; }
            set { StartDate = value; }
        }

        /*public DateTime endDate
        {
            get { return EndDate; }
            set { EndDate = value; }
        }*/

        public DateTime expDate
        {
            get { return ExpDate; }
            set { ExpDate = value; }
        }

        public string contactFN
        {
            get { return ContactFN; }
            set { ContactFN = value; }
        }

        public string contactLN
        {
            get { return ContactLN; }
            set { ContactLN = value; }
        }

        public string email
        {
            get { return Email; }
            set { Email = value; }
        }

        public string phoneNumber
        {
            get { return PhoneNumber; }
            set { PhoneNumber = value; }
        }

        public string weeklyHours
        {
            get { return WeeklyHours; }
            set { WeeklyHours = value; }
        }

        public string trainingLength
        {
            get { return TrainingLength; }
            set { TrainingLength = value; }
        }

        public string link
        {
            get { return Link; }
            set { Link = value; }
        }

        public string description
        {
            get { return Description; }
            set { Description = value; }
        }

        public string otherReqs
        {
            get { return OtherReqs; }
            set { OtherReqs = value; }
        }

    }
}
