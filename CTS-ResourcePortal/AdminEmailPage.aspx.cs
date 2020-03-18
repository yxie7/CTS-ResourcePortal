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
    public partial class AdminEmailPage : System.Web.UI.Page
    {
        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void DdlMonths_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlMonths.SelectedItem.Value == "1")
            {
                //txtComment.Text = "Hello, welcome to Called to Serve, we are happy that you could join us!";
            }
            if (DdlMonths.SelectedItem.Value == "2")
            {
                //txtComment.Text = "Hello, welcome to Called to Serve, we hope you can join us at a later date!";
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string text = txtComment.Text;
            string subject = txtSubject.Text;
            string typeEmail = DdlMonths.SelectedItem.Text;
            string title = "";
            string body = "";

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateEmail";
            cmd.Parameters.AddWithValue("@bodyText", text);
            cmd.Parameters.AddWithValue("@subject", subject);
            cmd.Parameters.AddWithValue("@templateType", typeEmail);
            int result = db.DoUpdateUsingCmdObj(cmd);
            cmd.Parameters.Clear();

            if(result == 1)
            {
                body = "Update Successful";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }
            else
            {
                body = "Something went wrong, please try again";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }
        }
    }
}