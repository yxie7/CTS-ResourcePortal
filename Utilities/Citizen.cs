using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class Citizens
    {
        private String firstname;
        private string lastname;
        private string username;
        private string address;
        private string email;        //Possibly renamed in DB?
        private string phone;        //Possibly renamed in DB?                    

        public String Firstname
        {
            get { return firstname; }
            set { firstname = value; }
        }
        public string Lastname
        {
            get { return lastname; }
            set { lastname = value; }
        }
        public string Username
        {
            get { return username; }
            set { username = value; }
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
    }
}
