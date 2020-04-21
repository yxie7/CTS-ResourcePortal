using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Globalization;
using Utilities;
using System.Threading;

namespace CTS_ResourcePortal
{
    public partial class ViewFeedback : System.Web.UI.Page
    {
        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand();

        public static int FeedbackID;
        public static int CitizenID;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SelectAllFeedback";

                DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
               

                rptViewR.DataSource = dataSet;
                rptViewR.DataBind();
                
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SelectResourceTypes";

                ddlResources.DataSource = db.GetDataSetUsingCmdObj(cmd);
                ddlResources.DataTextField = "ResourceTypeDescription";
                ddlResources.DataValueField = "ResourceTypeDescription";
                ListItem listItem = new ListItem(lblDDLResources.Text);
                ddlResources.Items.Add(new ListItem(lblDDLResources.Text));
                ddlResources.DataBind();

            }
        }


        //Used to Bind the Datatable to the Database based on the type of Resource Type Selected in the dropdown list that are active


        public void Bind(int resourcenum)
        {
            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectFeedbackByID";

            SqlParameter id = new SqlParameter("@id", resourcenum);
            id.Direction = ParameterDirection.Input;
            id.SqlDbType = SqlDbType.Int;
            id.Size = 4;
            cmd.Parameters.Add(id);

            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
            
           
                
            rptViewR.DataSource = dataSet;
            rptViewR.DataBind();

        }


        //Used to Bind the Datatable to the Database showing all the resources together that are active

        public void BindAll()
        {
            cmd.Parameters.Clear();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectAllFeedback";

            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
           
           

            rptViewR.DataSource = dataSet;
            rptViewR.DataBind();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            //Response.Write(@"<script language='javascript'>alert('Feedback Removed!')</script>");
            string title = "";
            string body = "Feedback Removed!";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            BindAll();
        }

        //Used to set the type of resource selected from the dropdownlist and sending that type to the bind method

        protected void btnViewR_Click(object sender, EventArgs e)
        {
            int resourcenum = 0;
            if (ddlResources.Text == "Job")
            {
                resourcenum = 1;
                Bind(resourcenum);
            }
            else if (ddlResources.Text == "Event")
            {
                resourcenum = 2;
                Bind(resourcenum);
            }
            else if (ddlResources.Text == "Training Opportunity")
            {
                resourcenum = 3;
                Bind(resourcenum);
            }
            else if (ddlResources.Text == "All Resources")
            {
                BindAll();
            }
        }

        protected void btnAllResources_Click(object sender, EventArgs e)
        {
            BindAll();
        }


        
        //Used to search the Datatable for any checkboxes that are checked and based on that row, it sets the feedback status to “Inactive” thereby removing it from the table, and displaying a modal indicating that feedback has been removed



        protected void btnSelect_Click(object sender, EventArgs e)
        {
            int removed = 0;
            foreach (RepeaterItem item in rptViewR.Items)
            {
                CheckBox checkBox = (CheckBox)item.FindControl("chkRow");
                //HtmlInputCheckBox chkRow = (HtmlInputCheckBox)item.FindControl("chkRow");
                if (checkBox.Checked)
                {
                    Label label = (Label)item.FindControl("lblFeedbackText");

                    string feedbacktext = label.Text;
                    cmd.Parameters.Clear();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetFeedbackIDByText";
                    SqlParameter text = new SqlParameter("@FeedbackText", feedbacktext);
                    text.Direction = ParameterDirection.Input;
                    text.SqlDbType = SqlDbType.VarChar;

                    cmd.Parameters.Add(text);
                    DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
                    FeedbackID = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[0]);
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        cmd.Parameters.Clear();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "InactivateFeedback";
                        //int FeedbacksID = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[0]);
                        SqlParameter id = new SqlParameter("@Feedbackid", FeedbackID);
                        id.Direction = ParameterDirection.Input;
                        id.SqlDbType = SqlDbType.Int;
                        id.Size = 4;
                        cmd.Parameters.Add(id);
                        int check = db.DoUpdateUsingCmdObj(cmd);
                        if (check > -1)
                        {
                            removed++;
                        }
                    }
                }
            }

            if(removed !=0)
            {
                string title = "";
                string body = "Feedback Removed!";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup2('" + title + "', '" + body + "');", true);
                BindAll();
            }
            else
            {
                string title = "";
                string body = "You need to select one or more checkboxes to remove a feedback!";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup2('" + title + "', '" + body + "');", true);
                BindAll();
            }
        }

        protected void btnReply_Click(object sender, EventArgs e)
        {
            
        }

        
        //This method builds the email body from the reply modal and uses the CitizenID gathered earlier to retrieve the Citizen’s email address from the database.Using this email address, we use SMTP server to send an email using the email body from before


        protected void btnReplySubmit_Click(object sender, EventArgs e)
        {
            DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetCitizenByID";
            SqlParameter id = new SqlParameter("@CitizenID", CitizenID);
            id.Direction = ParameterDirection.Input;
            id.SqlDbType = SqlDbType.Int;
            cmd.Parameters.Add(id);
            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
        

            using (MailMessage mm = new MailMessage())
            {
                mm.Bcc.Add(db.GetField("Email", 0).ToString());
                mm.From = new MailAddress("ctsemailtest0@gmail.com", "Called To Serve CDC");
                mm.Subject = DateTime.Now.ToShortDateString() + " Feedback Reply";
                mm.Body = txtReply.InnerText;
                mm.IsBodyHtml = true;

                using (var client = new System.Net.Mail.SmtpClient(ConfigurationManager.AppSettings["Host"], int.Parse(ConfigurationManager.AppSettings["Port"])))
                {
                    // Pass SMTP credentials
                    client.Credentials =
                        new NetworkCredential(ConfigurationManager.AppSettings["SMTPuser"], ConfigurationManager.AppSettings["SMTPpassword"]);

                    // Enable SSL encryption
                    client.EnableSsl = true;

                    // Try to send the message. Show status in console.
                    try
                    {
                        Console.WriteLine("Attempting to send email...");
                        client.Send(mm);
                        Console.WriteLine("Email sent!");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("The email was not sent.");
                        Console.WriteLine("Error message: " + ex.Message);
                    }
                }

                //SmtpClient smtp = new SmtpClient();
                //smtp.Host = ConfigurationManager.AppSettings["Host"];
                //smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSSL"]);
                //NetworkCredential nc = new NetworkCredential(ConfigurationManager.AppSettings["SMTPuser"], ConfigurationManager.AppSettings["SMTPpassword"]);
                //smtp.UseDefaultCredentials = false;
                //smtp.Credentials = nc;
                //smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                //smtp.Send(mm);
            }
        }

        
        //Used to locate the FeedbackID and the CitizenID in the database by Feedback text and simultaneously open a modal for replying to Citizen Feedback


        protected void rptViewR_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int rowindex = e.Item.ItemIndex;

            Label label = rptViewR.Items[rowindex].FindControl("lblFeedbackText") as Label;
            string feedbacktext = label.Text;

            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetFeedbackByText";
            SqlParameter text = new SqlParameter("@FeedbackText", feedbacktext);
            text.Direction = ParameterDirection.Input;
            text.SqlDbType = SqlDbType.VarChar;

            cmd.Parameters.Add(text);
            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
            FeedbackID = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[0]);
            CitizenID = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[1]);
            if (dataSet.Tables[0].Rows.Count > 0)
            {
                string title = "Reply to Feedback";
                string body = "This message will send an email to the citizen who left this feedback";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }
            
        }
    }


}