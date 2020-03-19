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

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string text = txtComment.Text;
            string subject = txtSubject.Text;
            string typeEmail = DdlEmail.SelectedItem.Text;
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

        protected void DdlEmail_SelectedIndexChanged(object sender, EventArgs e)
        {
            string title = "";
            string body = "";
            try
            {
                string typeofEmail = DdlEmail.SelectedItem.Text;
                //txtComment.Text = "Hello, welcome to Called to Serve, we are happy that you could join us!";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetEmail";
                    cmd.Parameters.AddWithValue("@typeEmail", typeofEmail);
                    cmd.Connection = db.GetConnection();
                    db.GetConnection().Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        txtSubject.Text = sdr["SubjectText"].ToString();
                        txtComment.Text = sdr["BodyText"].ToString();
                    }
                    cmd.Parameters.Clear();
                    db.GetConnection().Close();
                }
            }
            catch
            {
                body = "Please select a email type";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }
        }
    }
}