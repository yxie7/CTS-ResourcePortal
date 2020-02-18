using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            generateResources();
        }

        protected void btnUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminUserPage.aspx");
        }

        private void generateResources()
        {
            DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "JobSelect";
            DataTable dtj = db.GetDataSetUsingCmdObj(cmd).Tables[0];
            rptJob.DataSource = dtj;
            rptJob.DataBind();
        }
    }
}