using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class Job
    {
        private string ResourceTypeID;
        private string ResourceTitle;
        private string Company;
        private string AddressLine1;        //Possibly renamed in DB?
        private string AddressLine2;        //Possibly renamed in DB?
        private string City;
        private string State;              //Needs to be added to DB --ALSO-->  Update in Store Procedure****
        private string ZipCode;
        private DateTime DatePosted;
        private DateTime ExpDate;
        private string ContactFN;
        private string ContactLN;
        private string Email;
        private string PhoneNumber;
        private string WeeklyHours;
        private string Link;
        private string Responsibilities;
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

        public DateTime datePosted
        {
            get { return DatePosted; }
            set { DatePosted = value; }
        }

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

        public string link
        {
            get { return Link; }
            set { Link = value; }
        }

        public string responsibilities
        {
            get { return Responsibilities; }
            set { Responsibilities = value; }
        }

        public string otherReqs
        {
            get { return OtherReqs; }
            set { OtherReqs = value; }
        }

    }
}
