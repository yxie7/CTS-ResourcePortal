using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
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
                    j.email = db.GetField("ContactEmail", i).ToString();

                    j.addressLine1 = db.GetField("AddressLine", i).ToString();
                    j.city = db.GetField("LocationCity", i).ToString();
                    j.zipCode = db.GetField("LocationZip", i).ToString();
                    j.state = db.GetField("State", i).ToString();

                    //j.datePosted = db.GetField("StartDate", i).ToString();
                    //j.expDate = db.GetField("EndDate", i).ToString();

                    var dateValue = db.GetField("StartDate", i);
                    j.datePosted = (Convert.ToDateTime("dateValue"));
                    
                    
                    var dateValue2 = db.GetField("EndDate", i);
                    j.expDate = (Convert.ToDateTime("dateValue2"));

                    jl.Add(j);
                }
            }
            gvJob.DataSource = jl;
            gvJob.DataBind();
        }
    

        protected void btnJob_Click(object sender, EventArgs e)
        {
            Response.Redirect("Job.aspx");
        }

        protected void btnEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("Event.aspx");
        }

        protected void btnTraining_Click(object sender, EventArgs e)
        {
            Response.Redirect("Training.aspx");
        }
    }
}