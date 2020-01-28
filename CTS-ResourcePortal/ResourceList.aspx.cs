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
    public partial class ResourceList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Job> jl = new List<Job>();
            DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "JobSelect";

            DataSet ds = db.GetDataSetUsingCmdObj(cmd);
            int count = ds.Tables[0].Rows.Count;
            if (count > 0)
            {
                for (int i = 0; i < count; i++)
                {
                    Job j = new Job();
                    j.resourceID = db.GetField("ResourcesID", i).ToString();
                    j.resourceTitle = db.GetField("ResourceName", i).ToString();
                    jl.Add(j);
                }
            }
            gvJob.DataSource = jl;
            gvJob.DataBind();
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