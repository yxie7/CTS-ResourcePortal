using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;

namespace CTS_ResourcePortal
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            //NEEDS LINK TO NEW PASSWORD, THIS WILL NOT TAKE YOU TO THE NEW PASSWORD WEBPAGE YET
            string email = txtEmail.Text;
            string subject = "Password Reset";
            string text = "To reset your password, go to this link:" + "\r\n" +
                "(Insert Link Here)";
            try
            {
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

                
                lblStatus.Text = "An email has been sent to " + email + " with instructions on resetting your password";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + lblStatus.Text + "');", true);
            }
            catch(Exception ex)
            {
                
                lblStatus.Text = "Something went wrong, please try again";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + lblStatus.Text + "');", true);
            }
           
        }
    }
}