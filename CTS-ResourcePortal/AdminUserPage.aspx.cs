using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class AdminUserPage : System.Web.UI.Page
    {
        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindAll();
                bindPending();
            }
                
        }

        private void bindAll()
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

        /*protected void Accept1_Click(object sender, EventArgs e)
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
        }*/

        //to download resume
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

        protected void btnAccept_Click(object sender, EventArgs e)
        {

            string title = "";
            string body = "";

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
                        title = "";
                        body = "Citizen Accepted!";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
                    }
                    else
                    {
                        title = "";
                        body = "Something went wrong, please try again";
                        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
                    }
                   
                }


            }

            /*using (MailMessage mm = new MailMessage())
            {
                for (int i = 0; i < count; i++)
                {
                    //mm.To.Add(db.GetField("Email", i).ToString());
                    mm.Bcc.Add(db.GetField("Email", i).ToString());
                }
                mm.From = new MailAddress(ConfigurationManager.AppSettings["SMTPuser"]);
                mm.Subject = DateTime.Now.ToShortDateString() + " Newsletter"; //TODO subject date to either current date or take user input.
                mm.Body = hnl;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSSL"]);
                NetworkCredential nc = new NetworkCredential(ConfigurationManager.AppSettings["SMTPuser"], ConfigurationManager.AppSettings["SMTPpassword"]);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = nc;
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mm);
            }*/

            bindPending();
            bindAll();
            //ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            string title = "";
            string body = "";

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
                        title = "";
                        body = "Citizen Rejected";
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

            /*using (MailMessage mm = new MailMessage())
            {
                for (int i = 0; i < count; i++)
                {
                    //mm.To.Add(db.GetField("Email", i).ToString());
                    mm.Bcc.Add(db.GetField("Email", i).ToString());
                }
                mm.From = new MailAddress(ConfigurationManager.AppSettings["SMTPuser"]);
                mm.Subject = DateTime.Now.ToShortDateString() + " Newsletter"; //TODO subject date to either current date or take user input.
                mm.Body = hnl;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSSL"]);
                NetworkCredential nc = new NetworkCredential(ConfigurationManager.AppSettings["SMTPuser"], ConfigurationManager.AppSettings["SMTPpassword"]);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = nc;
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mm);
            }*/

            bindPending();
            bindAll();
        }
    }

    /*for (int i = 0; i < grdAllAccounts.Rows.Count; i++)
           {
               CheckBox cboxResume = (CheckBox)grdAllAccounts.Rows[i].FindControl("chkHeader");

               if (cboxResume.Checked)
               {

                   RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
                   string email = (item.FindControl("lblName") as Label).Text;
                   byte[] bytes;
                   string fileName, contentType; 

                       using (SqlCommand cmd = new SqlCommand())
                       {
                           cmd.CommandText = "select ResumeName, ResumeData, ResumeType from Citizen where Email=@email";
                           cmd.Parameters.AddWithValue("@Id", email);
                           cmd.Connection = con;
                           con.Open();
                           using (SqlDataReader sdr = cmd.ExecuteReader())
                           {
                               sdr.Read();
                               bytes = (byte[])sdr["Data"];
                               contentType = sdr["ContentType"].ToString();
                               fileName = sdr["Name"].ToString();
                           }
                           con.Close();
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


                   /*string email = grdAllAccounts.Rows[i].Cells[5].Text;
                   SqlCommand cmd = new SqlCommand("SELECT ResumeTitle, ResumeType, ResumeData FROM Citizen WHERE Email = '" + email + "'", db.GetConnection());
                   db.GetConnection().Open();
                   SqlDataReader sqlDataReader = cmd.ExecuteReader();
                   while (sqlDataReader.Read())
                   {
                       Response.Clear();
                       Response.Buffer = true;
                       Response.ContentType = sqlDataReader["ResumeType"].ToString();
                       Response.AddHeader("content-disposition", "attachment;filename=" + sqlDataReader["ResumeTitle"].ToString()); // to open file prompt Box open or Save file  
                       Response.Charset = "";
                       Response.Cache.SetCacheability(HttpCacheability.NoCache);
                       Response.BinaryWrite((byte[])sqlDataReader["ResumeData"]);
                       byte[] b = (byte[])sqlDataReader["ResumeData"];
                       Response.OutputStream.Write(b, 0, b.Length);
                       Response.End();

                   }
                   //sqlDataReader.Close();
                   //db.CloseConnection();

               }

           }*/
}