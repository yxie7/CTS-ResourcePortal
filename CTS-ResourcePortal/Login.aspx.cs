using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;
using System.Security.Cryptography;
using System.IO;
using System.Text;

namespace CTS_ResourcePortal
{
    public partial class MobileLogin : System.Web.UI.Page
    {

        DBConnect objDB = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

        SqlCommand objCommand = new SqlCommand();

        string email, password;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSubmitLogin_Click(object sender, EventArgs e)
        {
            objCommand.Parameters.Clear();
            email = txtEmail.Text;
            password = txtPassword.Text;
            if (CheckIfAdminEmailExist(email) == true)
                {
                    if (GrabAdminPassword(email) == true)
                    {
                        //string encryptedPassword = (string)objDB.GetField("Password", 0);

                        string savedPasswordHash = (string)objDB.GetField("Password", 0);
                        byte[] hashBytes = Convert.FromBase64String(savedPasswordHash);
                        byte[] salt = new byte[16];
                        Array.Copy(hashBytes, 0, salt, 0, 16);
                        
                        var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000);
                        byte[] hash = pbkdf2.GetBytes(20);

                        if (comparePasswords(hashBytes, hash) == false)
                        {
                            lblError.Text = "Current Password is incorrect";
                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                        }
                        else
                        {
                        SqlCommand cmd = new SqlCommand("GetAdminName", objDB.GetConnection());
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter inputParameterName = new SqlParameter("@Adminemail", txtEmail.Text);
                        inputParameterName.Direction = ParameterDirection.Input;
                        inputParameterName.SqlDbType = SqlDbType.VarChar;
                        cmd.Parameters.Add(inputParameterName);
                        DataSet EmailDataSet = objDB.GetDataSetUsingCmdObj(cmd);
                        string fullname = EmailDataSet.Tables[0].Rows[0].ItemArray[0] + " " + EmailDataSet.Tables[0].Rows[0].ItemArray[1];

                        Session.Add("userEmail", txtEmail.Text);
                        Session.Add("userName", fullname);
                        Response.Redirect("AdminHomePage.aspx");
                    }
                                                  
                    }
                    else
                    {
                        lblError.Text = "There was an error. Plase try again.";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                    }
                }//if the person logging in is a citizen
                if (CheckIfAdminEmailExist(email) == false)
                {
                    
                    if (CheckIfCitizenEmailExist(email) == true)
                    {
                        //check password

                        if (GrabCitizenPassword(email) == true)
                        {
                            string savedPasswordHash = (string)objDB.GetField("Password", 0);
                            byte[] hashBytes = Convert.FromBase64String(savedPasswordHash);
                            byte[] salt = new byte[16];
                            Array.Copy(hashBytes, 0, salt, 0, 16);

                            var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000);
                            byte[] hash = pbkdf2.GetBytes(20);


                        if (comparePasswords(hashBytes, hash) == false)
                        {
                            lblError.Text = "Current Password is incorrect";
                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                        }
                        else
                        {
                            if (IfCitizenIsAccepted(email) == true)
                            {
                                string accepted = (string)objDB.GetField("Accepted", 0);

                                if (accepted == "FALSE")
                                {
                                    lblError.Text = "This account has not been approved by the administrator";
                                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                                }

                                if (accepted == "TRUE")
                                {

                                    SqlCommand cmd = new SqlCommand("GetCitizenName", objDB.GetConnection());
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    SqlParameter inputParameterName = new SqlParameter("@Email", txtEmail.Text);
                                    inputParameterName.Direction = ParameterDirection.Input;
                                    inputParameterName.SqlDbType = SqlDbType.VarChar;
                                    cmd.Parameters.Add(inputParameterName);
                                    DataSet EmailDataSet = objDB.GetDataSetUsingCmdObj(cmd);
                                    string fullname = EmailDataSet.Tables[0].Rows[0].ItemArray[0] + " " + EmailDataSet.Tables[0].Rows[0].ItemArray[1];

                                    Session.Add("userEmail", txtEmail.Text);
                                    Session.Add("userName", fullname);
                                    Response.Redirect("ResourceList.aspx");


                                }
                            }
                        }

                    }
                    else
                    {
                        lblError.Text = "There was an error. Please log in again.";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                    }


                 }
                else
                {
                    lblError.Text = "Login credentials inccorect. Make sure your email is correct";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                }

                }

        }//end of btnSubmit

        //grabs administrator password from database
        private bool GrabAdminPassword(string Email)
        {
            SqlCommand cmd = new SqlCommand("GrabPasswordAdmin", objDB.GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter inputParameterName = new SqlParameter("@Email", Email);
            inputParameterName.Direction = ParameterDirection.Input;
            inputParameterName.SqlDbType = SqlDbType.VarChar;
            cmd.Parameters.Add(inputParameterName);
            DataSet EmailDataSet = objDB.GetDataSetUsingCmdObj(cmd);
            if (EmailDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //checks if email entered at login is an administrator
        public Boolean CheckIfAdminEmailExist(String Email)
        {
            //checks to see if email matches email in objDB
            SqlCommand cmd = new SqlCommand("GrabAdminEmail", objDB.GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter inputParameterName = new SqlParameter("@Email", Email);
            inputParameterName.Direction = ParameterDirection.Input;
            inputParameterName.SqlDbType = SqlDbType.VarChar;
            cmd.Parameters.Add(inputParameterName);
            DataSet EmailDataSet = objDB.GetDataSetUsingCmdObj(cmd);
            if (EmailDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //check if email entered at login is in database
        public Boolean CheckIfCitizenEmailExist(String Email)
        {
            
            SqlCommand cmd = new SqlCommand("CheckIfCitizenExists", objDB.GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter inputParameterName = new SqlParameter("@Email", Email);
            inputParameterName.Direction = ParameterDirection.Input;
            inputParameterName.SqlDbType = SqlDbType.VarChar;
            cmd.Parameters.Add(inputParameterName);
            DataSet EmailDataSet = objDB.GetDataSetUsingCmdObj(cmd);
            if (EmailDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //grab citizen's password from database
        public Boolean GrabCitizenPassword(String email)
        {
            
            SqlCommand cmd = new SqlCommand("GetPassword", objDB.GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter inputParameterName = new SqlParameter("@Email", email);
            inputParameterName.Direction = ParameterDirection.Input;
            inputParameterName.SqlDbType = SqlDbType.VarChar;
            cmd.Parameters.Add(inputParameterName);
            DataSet PasswordDataSet = objDB.GetDataSetUsingCmdObj(cmd);
            if (PasswordDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //checks the citizen's account status
        public Boolean IfCitizenIsAccepted(String email)
        {
            //checks to see if email matches email in objDB
            SqlCommand cmd = new SqlCommand("SelectActive", objDB.GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter inputParameterName = new SqlParameter("@Email", email);
            inputParameterName.Direction = ParameterDirection.Input;
            inputParameterName.SqlDbType = SqlDbType.VarChar;
            cmd.Parameters.Add(inputParameterName);
            DataSet AcceptedDataSet = objDB.GetDataSetUsingCmdObj(cmd);
            if (AcceptedDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        protected void btnSignUpLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }

        //compares the password entered at login with the password in the database
        public Boolean comparePasswords(byte[] hashBytes, byte[] hash)
        {
            Boolean isCorrect = true;
            for (int i = 0; i < 20; i++)
            {
                if (hashBytes[i + 16] != hash[i])
                {
                    isCorrect = false;
                }
                else
                {
                    isCorrect = true;
                }
            }
            return isCorrect;
        }

    }
}