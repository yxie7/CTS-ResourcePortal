using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class WebForm2 : System.Web.UI.Page
    {     

        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }


        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;

            if (txtNewPassword.Text == txtSamePassword.Text)
            {
                String plainTextPassword = txtNewPassword.Text;

                PasswordHash hashedPassword = new PasswordHash();
                string savedPasswordHash = hashedPassword.HashPassword(plainTextPassword);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "UpdatePasswordPage";
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", savedPasswordHash);
                int result = db.DoUpdateUsingCmdObj(cmd);
                cmd.Parameters.Clear();
                if(result == 1)
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
                lblStatus.Text = "Passwords do not match";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + lblStatus.Text + "');", true);
            }
            
        }
    }
}