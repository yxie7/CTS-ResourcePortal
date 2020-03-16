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
        private Byte[] key = { 250, 101, 18, 76, 45, 135, 207, 118, 4, 171, 3, 168, 202, 241, 37, 199 };
        private Byte[] vector = { 146, 64, 191, 111, 23, 3, 113, 119, 231, 121, 252, 112, 79, 32, 114, 156 };

        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand();

        string email, password;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSubmitLogin_Click(object sender, EventArgs e)
        {
            email = txtEmail.Text;
            password = txtPassword.Text;
            if (ValidateUserRegistration() == true)
            {
                if(GrabAccepted(email) == true)
                {
                    string accepted = (string)db.GetField("Accepted", 0);
                    if(accepted == "FALSE")
                    {
                        UserRegistrationError.Text = "This account has not been accepted by the administrator";
                    }
                    if(accepted == "TRUE")
                    {
                        if (CheckIfEmailExist(email) == true)
                        {
                            if (GrabPassword(email) == true)
                            {
                                string encryptedPassword = (string)db.GetField("Password", 0);
                                String encryptedPasswordLogin;
                                System.Text.UTF8Encoding encoder = new UTF8Encoding();
                                Byte[] PasswordBytes;


                                //EmailBytes = encoder.GetBytes(plainTextEmail);
                                PasswordBytes = encoder.GetBytes(password);


                                RijndaelManaged rmEncryption = new RijndaelManaged();
                                MemoryStream memStream = new MemoryStream();
                                CryptoStream encryptionStream = new CryptoStream(memStream, rmEncryption.CreateEncryptor(key, vector), CryptoStreamMode.Write);
                                //password
                                memStream = new MemoryStream();
                                encryptionStream = new CryptoStream(memStream, rmEncryption.CreateEncryptor(key, vector), CryptoStreamMode.Write);

                                encryptionStream.Write(PasswordBytes, 0, PasswordBytes.Length);
                                encryptionStream.FlushFinalBlock();

                                memStream.Position = 0;
                                Byte[] encryptedPasswordBytes = new byte[memStream.Length];
                                memStream.Read(encryptedPasswordBytes, 0, encryptedPasswordBytes.Length);

                                encryptionStream.Close();
                                memStream.Close();


                                //encryptedEmail = Convert.ToBase64String(encryptedEmailBytes);
                                encryptedPasswordLogin = Convert.ToBase64String(encryptedPasswordBytes);

                                //hashing password
                                PasswordHash hash = new PasswordHash(encryptedPasswordLogin);

                                if (encryptedPassword == encryptedPasswordLogin)
                                {
                                    Session.Add("userEmail", txtEmail.Text);
                                    Response.Redirect("ResourceList.aspx");
                                }
                                else
                                {
                                    lblError.Text = "Password is not registered";
                                }


                            }
                            else
                            {
                                lblError.Text = "This password is not registered";
                            }
                        }
                        else
                        {
                            lblError.Text = "This email is not registered";
                        }
                    }
                }
                
            }

        }
        public Boolean CheckIfEmailExist(String Email)
        {
            //checks to see if email matches email in db
            SqlCommand cmd = new SqlCommand("CheckIfCitizenExists", db.GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter inputParameterName = new SqlParameter("@Email", Email);
            inputParameterName.Direction = ParameterDirection.Input;
            inputParameterName.SqlDbType = SqlDbType.VarChar;
            cmd.Parameters.Add(inputParameterName);
            DataSet EmailDataSet = db.GetDataSetUsingCmdObj(cmd);
            if (EmailDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public Boolean GrabPassword(String email)
        {
            //checks to see if email matches email in db
            SqlCommand cmd = new SqlCommand("GetPassword", db.GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter inputParameterName = new SqlParameter("@Email", email);
            inputParameterName.Direction = ParameterDirection.Input;
            inputParameterName.SqlDbType = SqlDbType.VarChar;
            cmd.Parameters.Add(inputParameterName);
            DataSet PasswordDataSet = db.GetDataSetUsingCmdObj(cmd);
            if (PasswordDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public Boolean GrabAccepted(String email)
        {
            //checks to see if email matches email in db
            SqlCommand cmd = new SqlCommand("SelectActive", db.GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter inputParameterName = new SqlParameter("@Email", email);
            inputParameterName.Direction = ParameterDirection.Input;
            inputParameterName.SqlDbType = SqlDbType.VarChar;
            cmd.Parameters.Add(inputParameterName);
            DataSet AcceptedDataSet = db.GetDataSetUsingCmdObj(cmd);
            if (AcceptedDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public Boolean ValidateUserRegistration()
        {
            if (txtEmail.Text == "")
            {
                UserRegistrationError.Text = "Enter First Name";
                return false;

            }
            if (txtPassword.Text == "")
            {
                UserRegistrationError.Text = "Enter Password";
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
            
        }
    }
}