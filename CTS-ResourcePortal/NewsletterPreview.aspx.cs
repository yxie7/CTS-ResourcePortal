using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class NewsletterPreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
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

        protected void btnSend_Click(object sender, EventArgs e)
        {
        }

        protected void rptNL_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                (e.Item.FindControl("preDescription") as Label).Font.Bold = true;
                (e.Item.FindControl("preRequirements") as Label).Font.Bold = true;
                (e.Item.FindControl("preComments") as Label).Font.Bold = true;
                switch (int.Parse(((HiddenField)e.Item.FindControl("id")).Value))
                {
                    case 1:
                        (e.Item.FindControl("preStartDate") as Label).Text = "Date Posted: ";
                        (e.Item.FindControl("preEndDate") as Label).Text = "Expiration Date: ";
                        (e.Item.FindControl("preDescription") as Label).Text = "Primary Responsibilites: ";
                        break;

                    case 2:
                        (e.Item.FindControl("preStartDate") as Label).Text = "Event Date: ";
                        (e.Item.FindControl("preEndDate") as Label).Text = "Registration Deadline: ";
                        (e.Item.FindControl("preDescription") as Label).Text = "Event Description: ";
                        break;

                    case 3:
                        (e.Item.FindControl("preStartDate") as Label).Text = "Event Date: ";
                        (e.Item.FindControl("preEndDate") as Label).Text = "Registration Deadline: ";
                        (e.Item.FindControl("preDescription") as Label).Text = "Training Description: ";
                        break;
                }
            }
        }
    }
}