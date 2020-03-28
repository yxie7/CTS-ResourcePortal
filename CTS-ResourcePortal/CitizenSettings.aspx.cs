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

namespace CTS_ResourcePortal
{
    public partial class CitizenSettings : System.Web.UI.Page
    {
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

        protected void Delete_Click(object sender, EventArgs e)
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

                    lblStatus.Text = "You have deactivated your account.";
                    lblStatus.Visible = true;
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                }
                else

                    lblStatus.Text = "Failed";
                lblStatus.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            }
            if (txtConfirmDeactivate.Text != "yes")
            {
                lblStatus.Text = "Please type "+"Yes"+" into the textbox if you would like to deactivate your account.";
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
    }
    
}