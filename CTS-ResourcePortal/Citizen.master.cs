using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CTS_ResourcePortal
{
    public partial class Citizen : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                lblCitizenName.Visible = false;
                //lblCitizenName.Text = "Admin Name";
                lnkAccountSettings.Visible = false;
                lnkSignOut.Visible = false;
                lnkLogin.Visible = true;
                lnkSignup.Visible = true;
            }
            else
            {
                lblCitizenName.Text = (string)Session["userName"];
                lnkAccountSettings.Visible = true;
                lnkSignOut.Visible = true;
                lnkLogin.Visible = false;
                lnkSignup.Visible = false;
            }
        }

        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            Session["userName"] = null;
            lblCitizenName.Visible = false;
            //lblCitizenName.Text = "Admin Name";
            lnkAccountSettings.Visible = false;
            lnkSignOut.Visible = false;
            lnkLogin.Visible = true;
            lnkSignup.Visible = true;
            Response.Redirect("Login.aspx");
        }
    }
}