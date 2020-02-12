using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class NewsletterPreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            if (Request.QueryString["nl"] != "")
            {
                Dictionary<string, string> selections = js.Deserialize<Dictionary<string, string>>(System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(Request.QueryString["nl"])));

                //<string,string> selections = js.Deserialize<Dictionary<string,string>>(Server.UrlDecode(Request.QueryString["nl"]));

                DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
                DataTable dt = new DataTable();
                foreach (KeyValuePair<string, string> selection in selections)
                {
                    string id = selection.Key;
                    string comment = selection.Value;

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetResourceType";
                    //DataSet ds = db.GetDataSetUsingCmdObj(cmd);
                    //int resourceTypeID = int.Parse(db.GetField("ResourceTypeID", 0).ToString());

                    cmd.CommandText = "SelectResourceByID";
                    cmd.Parameters.AddWithValue("@id", int.Parse(id));
                    DataTable dte = db.GetDataSetUsingCmdObj(cmd).Tables[0];
                    dte.Columns.Add("Comments", typeof(string));
                    dte.Rows[0]["Comments"] = comment;
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

        protected void btnSend_Click(object sender, EventArgs e)
        {
            var sb = new StringBuilder();
            newsletterPreview.RenderControl(new HtmlTextWriter(new StringWriter(sb)));
            string hnl = sb.ToString();

            using (MailMessage mm = new MailMessage())
            {
                mm.From = new MailAddress(ConfigurationManager.AppSettings["SMTPuser"]);
                DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SelectCitizens";
                DataSet ds = db.GetDataSetUsingCmdObj(cmd);
                int count = ds.Tables[0].Rows.Count;
                for (int i = 0; i < count; i++)
                {
                    mm.To.Add(db.GetField("Email", i).ToString());
                }
                mm.Subject = "xx/xx/xx Newsletter";
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
    }
}