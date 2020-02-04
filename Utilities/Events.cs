using System;

namespace Utilities
{
    public class Events
    {
        private string ResourceID;
        private string ResourceTypeID;
        private string ResourceTitle;
        private string Company;
        private string AddressLine1;        //Possibly renamed in DB?
        private string AddressLine2;        //Possibly renamed in DB?
        private string City;
        private string State;               //Needs to be added to DB --ALSO-->  Update in Store Procedure****
        private string ZipCode;
        private DateTime EventDate;
        private DateTime ExpDate;
        private DateTime StartTime;
        private DateTime EndTime;
        private string ContactFN;
        private string ContactLN;
        private string Email;
        private string PhoneNumber;
        private string Attire;
        private string Link;
        private string Description;

        public string resourceID
        {
            get { return ResourceID; }
            set { ResourceID = value; }
        }
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

        public DateTime eventDate
        {
            get { return EventDate; }
            set { EventDate = value; }
        }

        public DateTime expDate
        {
            get { return ExpDate; }
            set { ExpDate = value; }
        }

        public DateTime startTime
        {
            get { return StartTime; }
            set { StartTime = value; }
        }

        public DateTime endTime
        {
            get { return EndTime; }
            set { EndTime = value; }
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

        public string attire
        {
            get { return Attire; }
            set { Attire = value; }
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

        /*
        public string ResourceTypeID { get; set; }
        public string ResourceTitle { get; set; }
        public string Host { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public DateTime EventDate { get; set; }
        public DateTime RegDate { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public string ContactFirstName { get; set; }
        public string ContactLastName { get; set; }
        public string ContactPhoneNumber { get; set; }
        public string ContactEmail { get; set; }
        public string Attire { get; set; }
        public string Link { get; set; }
        */

        //public bool AddResources()
        //{
        //    bool added = true;

        //    DBConnect objDB = new DBConnect();

        //    SqlCommand objCommand = new SqlCommand();
        //    objCommand.CommandType = CommandType.StoredProcedure;

        //    objCommand.CommandText = "AddResources";

        //    objCommand.Parameters.AddWithValue("@Email", Email);
        //    objCommand.Parameters.AddWithValue("@Password", Password);
        //    objCommand.Parameters.AddWithValue("@FirstName", FirstName);
        //    objCommand.Parameters.AddWithValue("@LastName", LastName);
        //    objCommand.Parameters.AddWithValue("@Cuisine", Cuisine);
        //    objCommand.Parameters.AddWithValue("@RestaurantName", RestaurantName);
        //    objCommand.Parameters.AddWithValue("@Location", Location);
        //    objCommand.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
        //    objCommand.Parameters.AddWithValue("@SecurityQuestion", SecurityQuestion);
        //    objCommand.Parameters.AddWithValue("@SecurityAnswer", SecurityAnswer);
        //    objCommand.Parameters.AddWithValue("@ImgURL", ImgURL);
        //    objCommand.Parameters.AddWithValue("@VWID", VWID);

        //    var result = objDB.DoUpdateUsingCmdObj(objCommand);

        //    if (result == -1)
        //        added = false;
        //    return added;
        //}
    }
}