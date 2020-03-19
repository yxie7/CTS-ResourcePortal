﻿using System;
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
        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        
        ArrayList UserRegistrationError = new ArrayList();
        private Byte[] key = { 250, 101, 18, 76, 45, 135, 207, 118, 4, 171, 3, 168, 202, 241, 37, 199 };
        private Byte[] vector = { 146, 64, 191, 111, 23, 3, 113, 119, 231, 121, 252, 112, 79, 32, 114, 156 };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void finishSignUp_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand();

            string fileExtension, resumeType, resumeName, resumeTitle, strSQL;

            int result = 0, resumeSize;



            //Validate
            ValidateUserRegistration();


            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;
            string address = txtAddress.Text;
            string city = txtCity.Text;
            string state = txtState.Text;
            string zip = txtZip.Text;
            string cellphone = txtCellPhone.Text;
            string subscribe = rdoSubscribe.SelectedValue.ToString(); 



            String plainTextEmail = txtEmail.Text;
            String plainTextPassword = txtPassword.Text;


            //String encryptedEmail;
            String encryptedPassword;


            System.Text.UTF8Encoding encoder = new UTF8Encoding();
            //Byte[] EmailBytes;
            Byte[] PasswordBytes;


            //EmailBytes = encoder.GetBytes(plainTextEmail);
            PasswordBytes = encoder.GetBytes(plainTextPassword);


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
            encryptedPassword = Convert.ToBase64String(encryptedPasswordBytes);

            //hashing password
            PasswordHash hash = new PasswordHash(encryptedPassword);

            if (UserRegistrationError.Count == 0)
            {
                //Check if email already exist
                String UserEmail = txtEmail.Text;
                Boolean flag = CheckIfEmailExist(UserEmail);
                if (flag == true)
                {
                    Response.Write("Email already exists");
                }
                else
                {
                    //Register 

                    Citizens newCitizen = new Citizens
                    {

                        FirstName = firstName,
                        LastName = lastName,
                        Email = email,
                        Password = encryptedPassword,
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
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                    }
                    else
                    {
                        Response.Write("Error Occured on the DATABASE");
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

                        result = db.DoUpdateUsingCmdObj(cmd);



                        lblStatus.Text = "Resume was successully uploaded.";

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

            DataSet EmailDataSet = db.GetDataSetUsingCmdObj(objCommand);
            if (EmailDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        void ValidateUserRegistration()
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

        }
    }
}