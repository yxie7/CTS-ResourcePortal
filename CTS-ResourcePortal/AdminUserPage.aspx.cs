using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class AdminUserPage : System.Web.UI.Page
    {
        ArrayList arrProducts = new ArrayList();
        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
                bindPending();
            }

        }

        private void bind()
        {

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetAllCitizens";
            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
            rptManageR.DataSource = dataSet;
            rptManageR.DataBind();

        }

        private void bindPending()
        {

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetNewCitizens";
            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
            rptNewCitizen.DataSource = dataSet;
            rptNewCitizen.DataBind();

        }

        protected void Accept1_Click(object sender, EventArgs e)
        {
            string title = "";
            string body = "Citizen Accepted!";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }

        protected void Reject1_Click(object sender, EventArgs e)
        {
            string title = "";
            string body = "Citizen Rejected";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }

        protected void lnkView_Click(object sender, EventArgs e)
        {
            //Reference the Repeater Item using Button.
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;

            //Reference the Label and TextBox.
            string email = (item.FindControl("lblEmail") as Label).Text;
            byte[] bytes;
            string fileName, contentType;

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT ResumeTitle, ResumeType, ResumeData FROM Citizen WHERE Email = '" + email + "'";
                cmd.Connection = db.GetConnection();
                db.GetConnection().Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["ResumeData"];
                    contentType = sdr["ResumeType"].ToString();
                    fileName = sdr["ResumeTitle"].ToString();
                }
                db.GetConnection().Close();
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

        //confirmation of acceptance
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            int count = 0;
            string title = "";
            string body = "";


            foreach (RepeaterItem item in rptNewCitizen.Items)
            {
                CheckBox chkRow = item.FindControl("chkRow") as CheckBox;

                if (chkRow.Checked)
                {
                    count++;

                }
            }

            if (count == 1)
            {
                title = "";
                no.Visible = true;
                yesAccept.Visible = true;
                close.Visible = false;
                yes.Visible = false;
                no.Text = "No";
                yesAccept.Text = "Yes";
                body = "Do you want to accept this account?";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);

            }

            if (count >= 2)
            {
                title = "";
                no.Visible = true;
                yesAccept.Visible = true;
                close.Visible = false;
                yes.Visible = false;
                no.Text = "No";
                yesAccept.Text = "Yes";
                body = "Do you want to accept these accounts?";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);

            }

            if (count == 0)
            {

                title = "";
                yes.Visible = false;
                yesAccept.Visible = false;
                no.Visible = false;
                close.Visible = true;
                close.Text = "Close";
                body = "Please select a account";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }


        }


        //if you click yes to accept account
        protected void yesAccept_Click(object sender, EventArgs e)
        {
            yes.Visible = false;
            yesAccept.Visible = false;
            no.Visible = false;
            close.Visible = true;
            close.Text = "Close";
            string title = "";
            string body = "";
            //string typeEmail = "";
            string subject = "";
            string text = "";
            string accepted = "Accept Citizen";

            foreach (RepeaterItem item in rptNewCitizen.Items)
            {
                CheckBox chkRow = item.FindControl("chkRow") as CheckBox;
                string email = (item.FindControl("lblEmail") as Label).Text;


                if (chkRow.Checked)
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "AcceptCitizen";
                    cmd.Parameters.AddWithValue("@email", email);
                    int result = db.DoUpdateUsingCmdObj(cmd);
                    cmd.Parameters.Clear();
                    if (result == 1)
                    {

                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "GetEmail";
                            cmd.Parameters.AddWithValue("@typeEmail", accepted);
                            cmd.Connection = db.GetConnection();
                            db.GetConnection().Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                sdr.Read();
                                subject = sdr["SubjectText"].ToString();
                                text = sdr["BodyText"].ToString();
                            }
                            cmd.Parameters.Clear();
                            db.GetConnection().Close();
                        }

                        using (MailMessage mm = new MailMessage())
                        {
                            
                            mm.Bcc.Add(email);
                            mm.From = new MailAddress(ConfigurationManager.AppSettings["SMTPuser"]);
                            mm.Subject = subject; //TODO subject date to either current date or take user input.
                            mm.Body = text;
                            mm.IsBodyHtml = true;
                            SmtpClient smtp = new SmtpClient();
                            smtp.Host = ConfigurationManager.AppSettings["Host"];
                            smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSSL"]);
                            NetworkCredential nc = new NetworkCredential(ConfigurationManager.AppSettings["SMTPuser"], ConfigurationManager.AppSettings["SMTPpassword"]);
                            smtp.UseDefaultCredentials = true;
                            smtp.Credentials = nc;
                            smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                            smtp.Send(mm);
                        }

                        title = "";
                        body = "Citizen(s) Accepted!";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);

                    }
                    else
                    {
                        title = "";
                        yes.Visible = false;
                        yesAccept.Visible = false;
                        no.Visible = false;
                        body = "Something went wrong, please try again";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
                    }
                }
            }

            bindPending();
            bind();

        }

        //confirmation of rejection
        protected void btnReject_Click(object sender, EventArgs e)
        {
            int count = 0;
            string title = "";
            string body = "";

            foreach (RepeaterItem item in rptNewCitizen.Items)
            {
                CheckBox chkRow = item.FindControl("chkRow") as CheckBox;

                if (chkRow.Checked)
                {
                    count++;
                }
            }

            if (count == 0)
            {

                title = "";
                close.Visible = true;
                close.Text = "Close";
                yesAccept.Visible = false;
                yes.Visible = false;
                no.Visible = false;
                body = "Please select a account";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }

            if (count >= 2)
            {
                close.Visible = false;
                yesAccept.Visible = false;
                yes.Visible = true;
                no.Visible = true;
                title = "";
                body = "Do you want to reject these accounts?";
                yes.Text = "Yes";
                no.Text = "No";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }
            if (count == 1)
            {
                close.Visible = false;
                yesAccept.Visible = false;
                yes.Visible = true;
                no.Visible = true;
                title = "";
                body = "Do you want to reject this account?";
                yes.Text = "Yes";
                no.Text = "No";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }

        }

        //reject account
        protected void yes_Click(object sender, EventArgs e)
        {
            yes.Visible = false;
            no.Visible = false;
            yesAccept.Visible = false;
            close.Visible = true;
            close.Text = "Close";
            string title = "";
            string body = "";
            string subject = "";
            string text = "";
            string accepted = "Reject Citizen";

            foreach (RepeaterItem item in rptNewCitizen.Items)
            {
                CheckBox chkRow = item.FindControl("chkRow") as CheckBox;
                string email = (item.FindControl("lblEmail") as Label).Text;

                if (chkRow.Checked)
                {
                    //send email to citizen before deleting it
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "RejectCitizen";
                    cmd.Parameters.AddWithValue("@email", email);
                    int result = db.DoUpdateUsingCmdObj(cmd);
                    cmd.Parameters.Clear();
                    if (result == 1)
                    {

                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "GetEmail";
                            cmd.Parameters.AddWithValue("@typeEmail", accepted);
                            cmd.Connection = db.GetConnection();
                            db.GetConnection().Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                sdr.Read();
                                subject = sdr["SubjectText"].ToString();
                                text = sdr["BodyText"].ToString();
                            }
                            cmd.Parameters.Clear();
                            db.GetConnection().Close();
                        }

                        using (MailMessage mm = new MailMessage())
                        {

                            mm.Bcc.Add(email);
                            mm.From = new MailAddress(ConfigurationManager.AppSettings["SMTPuser"]);
                            mm.Subject = subject; //TODO subject date to either current date or take user input.
                            mm.Body = text;
                            mm.IsBodyHtml = true;
                            SmtpClient smtp = new SmtpClient();
                            smtp.Host = ConfigurationManager.AppSettings["Host"];
                            smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSSL"]);
                            NetworkCredential nc = new NetworkCredential(ConfigurationManager.AppSettings["SMTPuser"], ConfigurationManager.AppSettings["SMTPpassword"]);
                            smtp.UseDefaultCredentials = true;
                            smtp.Credentials = nc;
                            smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                            smtp.Send(mm);
                        }

                        title = "";
                        body = "Citizen(s) Rejected";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
                    }
                    else
                    {
                        title = "";
                        body = "Something went wrong";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);

                    }
                }
            }

            bindPending();
            bind();
        }


        protected void no_Click(object sender, EventArgs e)
        {
            //do nothing
        }
    }


}
