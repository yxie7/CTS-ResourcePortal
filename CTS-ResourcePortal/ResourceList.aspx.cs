using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CTS_ResourcePortal
{
    public partial class ResourceList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnJob_Click(object sender, EventArgs e)
        {
            Response.Redirect("MobileJob.aspx");
        }

        protected void btnEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("MobileEvent.aspx");
        }

        protected void btnTraining_Click(object sender, EventArgs e)
        {
            Response.Redirect("MobileTraining.aspx");
        }
    }
}