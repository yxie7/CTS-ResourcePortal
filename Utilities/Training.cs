using System;

namespace Utilities
{
    public class Training
    {
        private string ResourceID;
        private int ResourceTypeID;
        private string ResourceTitle;
        private string Company;
        private string AddressLine1;
        private string AddressLine2;
        private string City;
        private string State;
        private string ZipCode;
        private string StartDate;
        private string ExpDate;
        private string WeeklyHours;
        private string TrainingLength;
        private string ContactFN;
        private string ContactLN;
        private string Email;
        private string PhoneNumber;
        private string Link;
        private string Description;
        private string OtherReqs;
        private string Active;

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

        public string startDate
        {
            get { return StartDate; }
            set { StartDate = value; }
        }

        /*public DateTime endDate
        {
            get { return EndDate; }
            set { EndDate = value; }
        }*/

        public string expDate
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

        public string active
        {
            get { return Active; }
            set { Active = value; }
        }
    }
}