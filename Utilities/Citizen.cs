using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class Citizens
    {
        private string firstname;
        private string lastname;
        private string username;
        private string password;
        private string address;
        private string city;
        private string state;
        private string zip; 
        private string email;        //Possibly renamed in DB?
        private string cellphone;        //Possibly renamed in DB?     
        private string subscribe;

        public string FirstName
        {
            get { return firstname; }
            set { firstname = value; }
        }
        public string LastName
        {
            get { return lastname; }
            set { lastname = value; }
        }
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        public string City
        {
            get { return city; }
            set { city = value; }
        }
        public string State
        {
            get { return state; }
            set { state = value; }
        }
        public string Zip
        {
            get { return zip; }
            set { zip = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Cellphone
        {
            get { return cellphone; }
            set { cellphone = value; }
        }
        public string Subscribe
        {
            get { return subscribe; }
            set { subscribe = value; }
        }

        public bool AddNewCitizen()
        {

            bool added = true;

            DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);


            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;

            objCommand.CommandText = "AddCitizens";


            objCommand.Parameters.AddWithValue("@FirstName", FirstName);
            objCommand.Parameters.AddWithValue("@LastName", LastName);
            objCommand.Parameters.AddWithValue("@Email", Email);
            objCommand.Parameters.AddWithValue("@Password", Password);
            objCommand.Parameters.AddWithValue("@Address", Address);
            objCommand.Parameters.AddWithValue("@City", City);
            objCommand.Parameters.AddWithValue("@State", State);
            objCommand.Parameters.AddWithValue("@Zipcode", Zip);
            objCommand.Parameters.AddWithValue("@PhoneNumber", Cellphone);
            objCommand.Parameters.AddWithValue("@Subscribed", subscribe);



            var result = db.DoUpdateUsingCmdObj(objCommand);

            if (result == -1)
                added = false;
            return added;
        }



    }
}
