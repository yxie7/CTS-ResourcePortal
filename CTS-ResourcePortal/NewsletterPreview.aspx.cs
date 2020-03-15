using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class NewsletterPreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NewsletterSelections"] != null)
            {
                List<NewsletterItem> selectionList = Session["NewsletterSelections"] as List<NewsletterItem>;
                if (selectionList.Count > 0)
                {
                    DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
                    DataTable dt = new DataTable();
                    foreach (NewsletterItem ni in selectionList)
                    {
                        int id = ni.ResourceID;
                        string comment = ni.Comment;
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "GetResourceType";
                        //DataSet ds = db.GetDataSetUsingCmdObj(cmd);
                        //int resourceTypeID = int.Parse(db.GetField("ResourceTypeID", 0).ToString());

                        cmd.CommandText = "SelectResourceByID";
                        cmd.Parameters.AddWithValue("@id", id);
                        DataTable dte = db.GetDataSetUsingCmdObj(cmd).Tables[0];
                        DataColumn dc = dte.Columns.Add("Comments", typeof(string));
                        dc.AllowDBNull = true;
                        if (comment == "")
                        {
                            dte.Rows[0]["Comments"] = DBNull.Value;
                        }
                        else
                        {
                            dte.Rows[0]["Comments"] = comment;
                        }
                        dte.Merge(dt);
                        dt = dte.Copy();
                    }

                    rptSummary.DataSource = dt;
                    rptSummary.DataBind();
                    rptNL.DataSource = dt;
                    rptNL.DataBind();
                }
                else
                {
                    Response.Redirect("NewsletterCreate.aspx");
                }
            }
            else
            {
                Response.Redirect("NewsletterCreate.aspx");
            }
        }

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    JavaScriptSerializer js = new JavaScriptSerializer();
        //    if (Request.QueryString["nl"] != null)
        //    {
        //        Dictionary<string, string> selections = js.Deserialize<Dictionary<string, string>>(System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(Request.QueryString["nl"])));

        //        //<string,string> selections = js.Deserialize<Dictionary<string,string>>(Server.UrlDecode(Request.QueryString["nl"]));

        //        h2Date.InnerText = DateTime.Now.ToShortDateString() + " Newsletter";

        //        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        //        DataTable dt = new DataTable();
        //        foreach (KeyValuePair<string, string> selection in selections)
        //        {
        //            string id = selection.Key;
        //            string comment = selection.Value;

        //            SqlCommand cmd = new SqlCommand();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = "GetResourceType";
        //            //DataSet ds = db.GetDataSetUsingCmdObj(cmd);
        //            //int resourceTypeID = int.Parse(db.GetField("ResourceTypeID", 0).ToString());

        //            cmd.CommandText = "SelectResourceByID";
        //            cmd.Parameters.AddWithValue("@id", int.Parse(id));
        //            DataTable dte = db.GetDataSetUsingCmdObj(cmd).Tables[0];
        //            dte.Columns.Add("Comments", typeof(string));
        //            dte.Rows[0]["Comments"] = comment;
        //            dte.Merge(dt);
        //            dt = dte.Copy();
        //        }

        //        rptSummary.DataSource = dt;
        //        rptSummary.DataBind();
        //        rptNL.DataSource = dt;
        //        rptNL.DataBind();
        //    }
        //    else
        //    {
        //        Response.Redirect("NewsletterCreate.aspx");
        //    }
        //}

        protected void btnSend_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Script", "sendModal();", true);
        }

        protected void sendNL()
        {
            var sb = new StringBuilder();
            newsletterPreview.RenderControl(new HtmlTextWriter(new StringWriter(sb)));
            string hnl = sb.ToString();

            DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectSubscribedCitizens";
            DataSet ds = db.GetDataSetUsingCmdObj(cmd);
            int count = ds.Tables[0].Rows.Count;

            using (MailMessage mm = new MailMessage())
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
            }
        }
        protected void rptNL_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                (e.Item.FindControl("preDescription") as System.Web.UI.WebControls.Label).Font.Bold = true;
                (e.Item.FindControl("preRequirements") as System.Web.UI.WebControls.Label).Font.Bold = true;
                (e.Item.FindControl("preComments") as System.Web.UI.WebControls.Label).Font.Bold = true;
            }
        }

        protected void btnNoSend_Click(object sender, EventArgs e)
        {

        }

        protected void btnYesSend_Click(object sender, EventArgs e)
        {
            sendNL();
        }
    }
}