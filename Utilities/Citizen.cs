using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class Citizen
    {
        private string firstname;
        private string lastname;
        private string username;
        private string password;
        private string address;
        private string email;        //Possibly renamed in DB?
        private string phone;        //Possibly renamed in DB?                    

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
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }

        public bool AddNewCitizen()
        {

            bool added = true;

            DBConnect objDB = new DBConnect();

            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;

            objCommand.CommandText = "TPAddCitizens";


            objCommand.Parameters.AddWithValue("@FirstName", FirstName);
            objCommand.Parameters.AddWithValue("@LastName", LastName);
            objCommand.Parameters.AddWithValue("@Email", Email);
            objCommand.Parameters.AddWithValue("@Password", Password);



            var result = objDB.DoUpdateUsingCmdObj(objCommand);

            if (result == -1)
                added = false;
            return added;
        }



    }
}
