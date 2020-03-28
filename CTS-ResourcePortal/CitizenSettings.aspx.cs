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
using System.Threading.Tasks;

namespace CTS_ResourcePortal
{
    public partial class CitizenSettings : System.Web.UI.Page
    {
        private Byte[] key = { 250, 101, 18, 76, 45, 135, 207, 118, 4, 171, 3, 168, 202, 241, 37, 199 };
        private Byte[] vector = { 146, 64, 191, 111, 23, 3, 113, 119, 231, 121, 252, 112, 79, 32, 114, 156 };

        DBConnect objDB = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

        SqlCommand objCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["userEmail"] as string))
            {
                Response.Redirect("Login.aspx");

            }
            objCommand.Parameters.Clear();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetAllCitizensByEmail";

            objCommand.Parameters.AddWithValue("@Email", Session["userEmail"].ToString());
            DataSet CitizenInfo = objDB.GetDataSetUsingCmdObj(objCommand);

            string fn = (string)objDB.GetField("FirstName", 0);
            string ln = (string)objDB.GetField("LastName", 0);
            int citiID = (Int32)objDB.GetField("CitizenID", 0);

            lblCitizenID.Text = citiID.ToString();
        }


        protected void btnUpdateSubscribe_Click(object sender, EventArgs e)
        {
            string citiId = lblCitizenID.Text.ToString();
            int CitizenID = int.Parse(citiId);


            objCommand.Parameters.Clear();
            objCommand.CommandText = "UpdateSubscriberStatus";

            string subscribe = rdoSubscribe.SelectedValue.ToString();

            objCommand.Parameters.AddWithValue("@CitizenID", CitizenID);
            objCommand.Parameters.AddWithValue("@Subscribed", subscribe);

            var ResponseReceived = objDB.DoUpdateUsingCmdObj(objCommand);

            if (ResponseReceived == 1)
            {

                lblStatus.Text = "Thank you for updating your status!";
                lblStatus.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            }
            else

                lblStatus.Text = "Failed";
            lblStatus.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

        }

        protected void ResumeUpload_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand();

            string fileExtension, resumeType, resumeName, resumeTitle, strSQL;

            int result = 0, resumeSize;

            try

            {


                if (ResumeUploadSettings.HasFile)

                {

                    resumeSize = ResumeUploadSettings.PostedFile.ContentLength;

                    byte[] resumeData = new byte[resumeSize];



                    ResumeUploadSettings.PostedFile.InputStream.Read(resumeData, 0, resumeSize);

                    resumeName = ResumeUploadSettings.PostedFile.FileName;

                    resumeType = ResumeUploadSettings.PostedFile.ContentType;

                    resumeTitle = resumeName.Split('.')[0];

                    fileExtension = resumeName.Substring(resumeName.LastIndexOf(".")).ToLower();

                    //fileExtension = fileExtension.ToLower();



                    if (fileExtension == ".docx" || fileExtension == ".pdf" || fileExtension == ".doc")

                    {

                        strSQL = "StoreResume";

                        cmd.CommandText = strSQL;

                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ResumeTitle", resumeTitle);

                        cmd.Parameters.AddWithValue("@ResumeType", resumeType);

                        cmd.Parameters.AddWithValue("@ResumeData", resumeData);

                        result = objDB.DoUpdateUsingCmdObj(cmd);

                        lblStatus.Visible = true;

                        lblStatus.Text = "Resume was successully uploaded.";

                    }

                    else

                    {
                        lblStatus.Visible = true;
                        lblStatus.Text = "Only docx, pdf, and doc file formats supported.";

                    }

                }

            }

            catch (Exception ex)

            {
                lblStatus.Visible = true;
                lblStatus.Text = "Error ocurred: [" + ex.Message + "] cmd=" + result;

            }
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            string email = Session["userEmail"].ToString();
            string password = txtCurrentPassword.Text;


            if (GrabCitizenPassword(email) == true)
            {
                string encryptedPassword = (string)objDB.GetField("Password", 0);
                String encryptedPasswordLogin;
                System.Text.UTF8Encoding encoder = new UTF8Encoding();

                Byte[] PasswordBytes;



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


                encryptedPasswordLogin = Convert.ToBase64String(encryptedPasswordBytes);

                //hashing password
                PasswordHash hash = new PasswordHash(encryptedPasswordLogin);

                if (encryptedPassword == encryptedPasswordLogin)
                {
                    String plainTextPassword = txtConfirmPassword.Text;

                    String newEncryptedPassword;


                    System.Text.UTF8Encoding encoder2 = new UTF8Encoding();

                    Byte[] NewPasswordBytes;



                    NewPasswordBytes = encoder.GetBytes(plainTextPassword);


                    RijndaelManaged rmEncryption2 = new RijndaelManaged();
                    MemoryStream memStream2 = new MemoryStream();
                    CryptoStream NewEncryptionStream = new CryptoStream(memStream2, rmEncryption2.CreateEncryptor(key, vector), CryptoStreamMode.Write);

                    //NewPassword
                    memStream2 = new MemoryStream();
                    NewEncryptionStream = new CryptoStream(memStream2, rmEncryption2.CreateEncryptor(key, vector), CryptoStreamMode.Write);

                    NewEncryptionStream.Write(NewPasswordBytes, 0, NewPasswordBytes.Length);
                    NewEncryptionStream.FlushFinalBlock();

                    memStream2.Position = 0;
                    Byte[] newEncryptedPasswordBytes = new byte[memStream2.Length];
                    memStream2.Read(newEncryptedPasswordBytes, 0, newEncryptedPasswordBytes.Length);

                    NewEncryptionStream.Close();
                    memStream2.Close();



                    newEncryptedPassword = Convert.ToBase64String(newEncryptedPasswordBytes);

                    //hashing password
                    PasswordHash hash2 = new PasswordHash(newEncryptedPassword);

                    if (txtNewPassword.Text == txtConfirmPassword.Text)
                    {
                        string citiId = lblCitizenID.Text.ToString();
                        int CitizenID = int.Parse(citiId);


                            objCommand.Parameters.Clear();
                            objCommand.CommandText = "UpdatePassword";

                            objCommand.Parameters.AddWithValue("@CitizenID", CitizenID);
                            objCommand.Parameters.AddWithValue("@Password", newEncryptedPassword);

                        var ResponseReceived = objDB.DoUpdateUsingCmdObj(objCommand);

                            if (ResponseReceived == 1)
                            {

                                lblStatus.Text = "You have changed your password.";
                                lblStatus.Visible = true;
                                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                            }
                            else

                            lblStatus.Text = "Failed";
                            lblStatus.Visible = true;
                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                    }
                    else
                    {
                        lblStatus.Text = "Please confirm new password.";
                        lblStatus.Visible = true;
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                    }

                }
                else
                {
                    lblStatus.Text = "Current Password is incorrect.";
                    lblStatus.Visible = true;
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                }
            }
        }

        protected void btnDeactivate_Click(object sender, EventArgs e)
        {
            string citiId = lblCitizenID.Text.ToString();
            int CitizenID = int.Parse(citiId);

            if (txtConfirmDeactivate.Text == "yes")
            {
                objCommand.Parameters.Clear();
                objCommand.CommandText = "DeactivateAccount";

                objCommand.Parameters.AddWithValue("@CitizenID", CitizenID);

                var ResponseReceived = objDB.DoUpdateUsingCmdObj(objCommand);

                if (ResponseReceived == 1)
                {

                    lblStatus.Text = "You have deactivated your account. Returning you to login page.";
                    lblStatus.Visible = true;
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                    System.Threading.Thread.Sleep(2300);


                    Session["userName"] = null;
                    Session["userEmail"] = null;
                    Response.Redirect("Login.aspx");

                 
                }
                else

                    lblStatus.Text = "Failed";
                lblStatus.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            }
            if (txtConfirmDeactivate.Text != "yes")
            {
                lblStatus.Text = "Please type \"Yes\" into the textbox if you would like to deactivate your account.";
                lblStatus.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            }
        }

        protected void lnkBtnUpdateSubscriber_Click(object sender, EventArgs e)
        {
            UpdateSubscriber.Visible = true;
            UpdatePassword.Visible = false;
            UploadResume.Visible = false;
            deleteAccount.Visible = false;

        }

        protected void lnkBtnUpdatePassword_Click(object sender, EventArgs e)
        {
            UpdateSubscriber.Visible = false; ;
            UpdatePassword.Visible = true; ;
            UploadResume.Visible = false;
            deleteAccount.Visible = false;
        }

        protected void lnkBtnUploadResume_Click(object sender, EventArgs e)
        {
            UpdateSubscriber.Visible = false;
            UpdatePassword.Visible = false;
            UploadResume.Visible = true;
            deleteAccount.Visible = false;
        }

        protected void lnkBtnDeleteAccount_Click(object sender, EventArgs e)
        {
            UpdateSubscriber.Visible = false;
            UpdatePassword.Visible = false;
            UploadResume.Visible = false;
            deleteAccount.Visible = true;
        }

        public Boolean GrabCitizenPassword(String email)
        {
            //checks to see if email matches email in objDB
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

    }

}