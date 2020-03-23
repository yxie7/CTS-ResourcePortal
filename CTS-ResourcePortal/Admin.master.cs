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
            if(Session["userName"] == null)
            {
                lblAdminName.Text = "Admin Name";
            }
            else
            {
                lblAdminName.Text = (string)Session["userName"];
            }
        }
    }
}