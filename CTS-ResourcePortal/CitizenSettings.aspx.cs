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
        //private Byte[] key = { 250, 101, 18, 76, 45, 135, 207, 118, 4, 171, 3, 168, 202, 241, 37, 199 };
        //private Byte[] vector = { 146, 64, 191, 111, 23, 3, 113, 119, 231, 121, 252, 112, 79, 32, 114, 156 };

        string email, password;

        DBConnect objDB = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

        SqlCommand objCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

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
            objCommand.Parameters.Clear();
            string fileExtension, resumeType, resumeName, resumeTitle, strSQL;
            string email = Session["userEmail"].ToString();
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
                    string accepted = "TRUE";
                    //fileExtension = fileExtension.ToLower();
                    
                    if(GrabResumeName(resumeName) == true)
                    {
                        lblStatus.Visible = true;
                        lblStatus.Text = "Name of resume already exist, please change the name of your file";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                        objCommand.Parameters.Clear();
                    }
                    else
                    {
                        objCommand.Parameters.Clear();
                        if (fileExtension == ".docx" || fileExtension == ".pdf" || fileExtension == ".doc")

                        {

                            strSQL = "StoreResume";
                            objCommand.CommandText = strSQL;
                            objCommand.CommandType = CommandType.StoredProcedure;
                            objCommand.Parameters.AddWithValue("@ResumeTitle", resumeName);
                            objCommand.Parameters.AddWithValue("@ResumeType", resumeType);
                            objCommand.Parameters.AddWithValue("@ResumeData", resumeData);
                            objCommand.Parameters.AddWithValue("@Email", email);
                            objCommand.Parameters.AddWithValue("@Accepted", accepted);

                            result = objDB.DoUpdateUsingCmdObj(objCommand);

                            if (result == 1)
                            {
                                lblStatus.Visible = true;
                                lblStatus.Text = "Resume was successully uploaded.";
                                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                            }
                            else
                            {
                                lblStatus.Visible = true;
                                lblStatus.Text = "Hmm something went wrong, please try again";
                                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                            }

                        }
                        else

                        {
                            lblStatus.Visible = true;
                            lblStatus.Text = "Only docx, pdf, and doc file formats supported.";
                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                        }
                    }                    

                }

            }

            catch (Exception ex)

            {
                lblStatus.Visible = true;
                lblStatus.Text = "Error ocurred: [" + ex.Message + "] cmd=" + result;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            }
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            objCommand.Parameters.Clear();
            email = Session["userEmail"].ToString();
            password = txtCurrentPassword.Text;

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
                    lblStatus.Text = "Current Password is incorrect";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                }
                else
                {
                    objCommand.Parameters.Clear();
                    if (txtNewPassword.Text == txtConfirmPassword.Text)
                    {
                        String plainTextPassword = txtNewPassword.Text;


                        byte[] saltNew;
                        new RNGCryptoServiceProvider().GetBytes(saltNew = new byte[16]);
                        var pbkdf2New = new Rfc2898DeriveBytes(plainTextPassword, saltNew, 10000);
                        byte[] hashNew = pbkdf2New.GetBytes(20);
                        byte[] hashBytesNew = new byte[36];
                        Array.Copy(saltNew, 0, hashBytesNew, 0, 16);
                        Array.Copy(hashNew, 0, hashBytesNew, 16, 20);
                        string savedPasswordHashNew = Convert.ToBase64String(hashBytesNew);

                        objCommand.CommandType = CommandType.StoredProcedure;
                        objCommand.CommandText = "UpdatePasswordPage";
                        objCommand.Parameters.AddWithValue("@email", email);
                        objCommand.Parameters.AddWithValue("@password", savedPasswordHashNew);
                        int resultNew = objDB.DoUpdateUsingCmdObj(objCommand);
                        if (resultNew == 1)
                        {
                            lblStatus.Text = "Password has been changed successfully";
                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + lblStatus.Text + "');", true);
                        }
                        else
                        {
                            lblStatus.Text = "Something went wrong, please try again";
                            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + lblStatus.Text + "');", true);
                        }
                    }
                    else
                    {
                        lblStatus.Text = "New passwords do not match";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                    }
                }
            }
            else
            {
                lblStatus.Text = "There was an error please try again";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
            }
      }
        

        protected void btnDeactivate_Click(object sender, EventArgs e)
        {
            
            string citiId = lblCitizenID.Text.ToString();
            int CitizenID = int.Parse(citiId);
            email = Session["userEmail"].ToString();

            if (txtConfirmDeactivate.Text == "yes")
            {
                objCommand.Parameters.Clear();
                objCommand.CommandText = "DeactivateAccount";

                objCommand.Parameters.AddWithValue("@CitizenID", CitizenID);

                var ResponseReceived = objDB.DoUpdateUsingCmdObj(objCommand);

                if (ResponseReceived == 1)
                {
                    objCommand.Parameters.Clear();

                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "DeleteResumes";
                    objCommand.Parameters.AddWithValue("@email", email);
                    int resultResume = objDB.DoUpdateUsingCmdObj(objCommand);
                    objCommand.Parameters.Clear();
                    if (resultResume > 0)
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
                    {
                        lblStatus.Text = "Failed";
                        lblStatus.Visible = true;
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                    }
     
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
            rptResumes.Visible = false;
            UpdateSubscriber.Visible = true;
            UpdatePassword.Visible = false;
            UploadResume.Visible = false;
            deleteAccount.Visible = false;

        }

        protected void lnkBtnUpdatePassword_Click(object sender, EventArgs e)
        {
            rptResumes.Visible = false;
            UpdateSubscriber.Visible = false; ;
            UpdatePassword.Visible = true; ;
            UploadResume.Visible = false;
            deleteAccount.Visible = false;
        }

        protected void lnkBtnUploadResume_Click(object sender, EventArgs e)
        {
            rptResumes.Visible = false;
            UpdateSubscriber.Visible = false;
            UpdatePassword.Visible = false;
            UploadResume.Visible = true;
            deleteAccount.Visible = false;
        }

        protected void lnkBtnDeleteAccount_Click(object sender, EventArgs e)
        {
            rptResumes.Visible = false;
            UpdateSubscriber.Visible = false;
            UpdatePassword.Visible = false;
            UploadResume.Visible = false;
            deleteAccount.Visible = true;
        }

        //grabs password from database
        public Boolean GrabCitizenPassword(String email)
        {
            
            objCommand = new SqlCommand("GetPassword", objDB.GetConnection());
            objCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter inputParameterName = new SqlParameter("@Email", email);
            inputParameterName.Direction = ParameterDirection.Input;
            inputParameterName.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParameterName);
            DataSet PasswordDataSet = objDB.GetDataSetUsingCmdObj(objCommand);
            if (PasswordDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public Boolean GrabResumeName(string resumeTitle)
        {

            objCommand = new SqlCommand("CompareResumeTitle", objDB.GetConnection());
            objCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter inputParameterName = new SqlParameter("@resumeTitle", resumeTitle);
            inputParameterName.Direction = ParameterDirection.Input;
            inputParameterName.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParameterName);
            DataSet resumeSet = objDB.GetDataSetUsingCmdObj(objCommand);
            if (resumeSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }


        protected void lnkView_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;

            //Reference the Label and TextBox.
            string email = Session["userEmail"].ToString();
            byte[] bytes;
            string fileName, contentType;
            string resumeTitle = (item.FindControl("lblName") as Label).Text;

            using (SqlCommand objCommand = new SqlCommand())
            {

                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "GetResumeFile";
                objCommand.Parameters.AddWithValue("@Email", email);
                objCommand.Parameters.AddWithValue("@ResumeTitle", resumeTitle);
                objCommand.Connection = objDB.GetConnection();
                objDB.GetConnection().Open();
                using (SqlDataReader sdr = objCommand.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["ResumeData"];
                    contentType = sdr["ResumeType"].ToString();
                    fileName = sdr["ResumeTitle"].ToString();
                }
                objDB.GetConnection().Close();
                objCommand.Parameters.Clear();
            }

            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
            
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            objCommand.Parameters.Clear();
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            string resumeTitle = (item.FindControl("lblName") as Label).Text;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "DeleteResume";
            objCommand.Parameters.AddWithValue("@ResumeTitle", resumeTitle);
            int result = objDB.DoUpdateUsingCmdObj(objCommand);
            if(result == 1)
            {
                lblStatus.Text = "Delete Successful";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                
            }
            else
            {
                lblStatus.Text = "Something went wrong, please try again";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
            }

            objCommand.Parameters.Clear();

            if (createResumeTable() == true)
            {
                rptResumes.Visible = true;
            }
            
        }

        protected void ResumeTable_Click(object sender, EventArgs e)
        {
            if (createResumeTable() == false)
            {
                lblStatus.Text = "You do not have any resumes uploaded, please upload a resume";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
            }
            else
            {
                rptResumes.Visible = true;
            }
        }

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

        public Boolean createResumeTable()
        {
            bool tableCreated = false;
            objCommand.Parameters.Clear();
            //RepeaterItem item = (sender as Label).NamingContainer as RepeaterItem;
            string email = Session["userEmail"].ToString();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetResumeName";
            objCommand.Parameters.AddWithValue("@Email", email);
            DataSet dataSet = objDB.GetDataSetUsingCmdObj(objCommand);
            rptResumes.DataSource = dataSet;
            rptResumes.DataBind();

            try
            {
                if (dataSet.Tables[0].Rows[0].IsNull("ResumeTitle"))
                {
                    objCommand.Parameters.Clear();
                    return tableCreated;
                }
                else
                {
                    objCommand.Parameters.Clear();
                    return tableCreated = true;
                }
            }
            catch
            {
                return tableCreated;
            }
            
        }
    }
 }
