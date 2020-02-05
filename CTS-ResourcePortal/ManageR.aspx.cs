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
    public partial class ManageR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master master = (Master)Page.Master.Master;
            string con = master.getConnectionString();

            DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

            SqlCommand cmd = new SqlCommand();

            if (!IsPostBack)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SelectResources";

                DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
                //DataTable dt = new DataTable();
                //dt.Columns.AddRange(new DataColumn[3] {
                //new DataColumn("EmpNumber", typeof(int)),
                //new DataColumn("Name", typeof(string)),
                //new DataColumn("Designation",typeof(string)) });
                //dt.Rows.Add(1, "John Hammond", "Developer");
                //dt.Rows.Add(2, "Mudassar Khan", "CEO");
                //dt.Rows.Add(3, "Suzanne Mathews", "Tester");
                //dt.Rows.Add(4, "Robert Schidner", "Manager");
                rptManageR.DataSource = dataSet;
                rptManageR.DataBind();
                //gvManageR.DataSource = dataSet;
                //gvManageR.DataBind();


            }

        }

        protected void myBtn_Click(object sender, EventArgs e)
        {

        }

        protected void myBtn_Click1(object sender, EventArgs e)
        {
            //Response.Write(@"<script language='javascript'>alert('Resource Inactivated!')</script>");
            string title = "";
            string body = "Resource Inactivated!";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }
        protected void EditJob(object sender, EventArgs e)
        {
            Response.Redirect("EditJob.aspx");
        }
        protected void EditEvent(object sender, EventArgs e)
        {
            Response.Redirect("EditEvent.aspx");
        }

        protected void EditTraining(object sender, EventArgs e)
        {
            Response.Redirect("EditTraining.aspx");
        }

        protected void gvManageR_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}