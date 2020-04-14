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
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["adminEmail"] == null)
            {
                //lblAdminName.Text = "Admin Name";
                Response.Write("You are not an Admin of this System!");
                
                System.Threading.Thread.Sleep(5000);
                Response.Redirect("Login.aspx");

            }
            else
            {
                lblAdminName.Text = (string)Session["userName"];
            }
        }


        protected void Signout_click(object sender, EventArgs e)
        {
            Session["adminEmail"] = null;
            Session["userName"] = null;
            Session["userEmail"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}