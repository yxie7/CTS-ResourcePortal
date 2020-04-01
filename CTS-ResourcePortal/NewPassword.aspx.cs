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
        //private Byte[] key = { 250, 101, 18, 76, 45, 135, 207, 118, 4, 171, 3, 168, 202, 241, 37, 199 };
        //private Byte[] vector = { 146, 64, 191, 111, 23, 3, 113, 119, 231, 121, 252, 112, 79, 32, 114, 156 };

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

                byte[] salt;
                new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
                var pbkdf2 = new Rfc2898DeriveBytes(plainTextPassword, salt, 10000);
                byte[] hash = pbkdf2.GetBytes(20);
                byte[] hashBytes = new byte[36];
                Array.Copy(salt, 0, hashBytes, 0, 16);
                Array.Copy(hash, 0, hashBytes, 16, 20);
                string savedPasswordHash = Convert.ToBase64String(hashBytes);

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