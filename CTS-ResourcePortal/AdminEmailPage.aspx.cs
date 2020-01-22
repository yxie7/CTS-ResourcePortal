using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CTS_ResourcePortal
{
    public partial class AdminEmailPage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DdlMonths_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlMonths.SelectedItem.Value == "1")
            {
                txtComment.Text = "Hello, welcome to Called to Serve, we are happy that you could join us!";
            }
            if (DdlMonths.SelectedItem.Value == "2")
            {
                txtComment.Text = "Hello, welcome to Called to Serve, we hope you can join us at a later date!";
            }
        }
    }
}