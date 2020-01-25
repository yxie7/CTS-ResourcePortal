using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    class Resources
    {
        public int ResourceTypeID { get; set; }
        public string ResourceName { get; set; }
        public string Company { get; set; }
        public string Description { get; set; }
        public string Requirements { get; set; }
        public string WeeklyHours { get; set; }
        public string Attire { get; set; }
        public string ContactFirstName { get; set; }
        public string ContactLastName { get; set; }
        public string ContactPhoneNumber { get; set; }
        public string ContactEmail { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public string HowToApplyOrRegister { get; set; }
        public DateTime RegistrationDeadline { get; set; }
        public string Link { get; set; }
        public string LocationStreet { get; set; }
        public string LocationStreet2 { get; set; }
        public string LocationCity { get; set; }
        public string LocationZip { get; set; }

        public Resources()
        {

        }



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
