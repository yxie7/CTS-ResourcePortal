using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Collections;
using Utilities;


namespace CTS_ResourcePortal
{
    public partial class Signup : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        
        ArrayList UserRegistrationError = new ArrayList();
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void finishSignUp_Click(object sender, EventArgs e)
        {
            string fileExtension, resumeType, resumeName, resumeTitle, strSQL;
            int result = 0, resumeSize;

            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;
            string address = txtAddress.Text;
            string city = txtCity.Text;
            string state = txtState.Text;
            string zip = txtZip.Text;
            string cellphone = txtCellPhone.Text;
            string subscribe = rdoSubscribe.SelectedValue.ToString(); 

            String plainTextPassword = txtPassword.Text;  

            byte[] salt;
            new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
            var pbkdf2 = new Rfc2898DeriveBytes(plainTextPassword, salt, 10000);
            byte[] hash = pbkdf2.GetBytes(20);
            byte[] hashBytes = new byte[36];
            Array.Copy(salt, 0, hashBytes, 0, 16);
            Array.Copy(hash, 0, hashBytes, 16, 20);
            string savedPasswordHash = Convert.ToBase64String(hashBytes);

            if (UserRegistrationError.Count == 0)
            {
                //Check if email already exist
                String UserEmail = txtEmail.Text;
                if (CheckIfEmailExist(UserEmail) == true)
                {
                    lblThanks.Text = "That email is already being used on our system. Please choose another.";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                }
                else
                {
                    //Register 

                    Citizens newCitizen = new Citizens
                    {

                        FirstName = firstName,
                        LastName = lastName,
                        Email = email,
                        Password = savedPasswordHash,
                        Address = address,
                        City = city,
                        State = state,
                        Zip = zip,
                        Cellphone = cellphone,
                        Subscribe = subscribe
                    };


                    var ResponseReceived = newCitizen.AddNewCitizen();
                    if (ResponseReceived == true)
                    {
                        //User Registered 
                        //Save UserEmail in Session Called UserEmail
                        Session.Add("userEmail", txtEmail.Text.ToString());
                        lblThanks.Text = "Thank you for signing up!";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                    }
                    else
                    {
                        
                        lblThanks.Text = "There was an error, please try again";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                    }

                }
            }
            else
            {
                for (int i = 0; i < UserRegistrationError.Count; i++)
                {
                    Response.Write(UserRegistrationError[i] + "<br/>");
                }
            }

            try

            {

                // Use the FileUpload control to get the uploaded data

                if (FileUpload1.HasFile)

                {

                    resumeSize = FileUpload1.PostedFile.ContentLength;

                    byte[] resumeData = new byte[resumeSize];



                    FileUpload1.PostedFile.InputStream.Read(resumeData, 0, resumeSize);

                    resumeName = FileUpload1.PostedFile.FileName;

                    resumeType = FileUpload1.PostedFile.ContentType;

                    resumeTitle = resumeName.Split('.')[0];

                    fileExtension = resumeName.Substring(resumeName.LastIndexOf(".")).ToLower();


                    if (fileExtension == ".docx" || fileExtension == ".pdf" || fileExtension == ".doc")

                    {
                        //this stored procedure will eventually become part of the citizen creation proceudre
                        //with an if statement on whether the citizen uploaded a resume file or not
                        

                        strSQL = "StoreResume";

                        cmd.CommandText = strSQL;

                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ResumeTitle", resumeName);

                        cmd.Parameters.AddWithValue("@ResumeType", resumeType);

                        cmd.Parameters.AddWithValue("@ResumeData", resumeData);

                        cmd.Parameters.AddWithValue("@Email", email);

                        result = objDB.DoUpdateUsingCmdObj(cmd);

                        if (result == 1)
                        {
                            lblStatus.Text = "Resume was successully uploaded.";
                            
                        }
                        else
                        {
                            lblStatus.Text = "Hmm something went wrong, please try again";
                        }
                        

                    }

                    else

                    {

                        lblStatus.Text = "Only docx, pdf, and doc file formats supported.";

                    }

                }

            }

            catch (Exception ex)

            {

                lblStatus.Text = "Error ocurred: [" + ex.Message + "] cmd=" + result;

            }
      
        }
        public Boolean CheckIfEmailExist(String Email)
        {
            
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "CheckIfCitizenExists";
            SqlParameter inputParameter = new SqlParameter("@Email", Email);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.NVarChar;
            objCommand.Parameters.Add(inputParameter); 

            DataSet EmailDataSet = objDB.GetDataSetUsingCmdObj(objCommand);
            if (EmailDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        /*void ValidateUserRegistration()
        {
            if (txtFirstName.Text == "")
            {
                UserRegistrationError.Add("Enter First Name");

            }
            if (txtLastName.Text == "")
            {
                UserRegistrationError.Add("Enter Last Name");
            }
            if (txtEmail.Text == "")
            {
                UserRegistrationError.Add("Enter Email");
            }
            if (txtPassword.Text == "" && txtCPassword.Text == "")
            {
                UserRegistrationError.Add("Enter Password");
            }
            if (txtPassword.Text != txtCPassword.Text)
            {
                UserRegistrationError.Add("Passwords Do not Match");
            }

        }*/
    }
}