using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Utilities;





namespace CTS_ResourcePortal
{
    public partial class ManageR : System.Web.UI.Page
    {
        //Master master = (Master)Page.Master.Master;
        //string con = master.getConnectionString();

        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {


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
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SelectResourceTypes";

                ddlResources.DataSource = db.GetDataSetUsingCmdObj(cmd);
                ddlResources.DataTextField = "ResourceTypeDescription";
                ddlResources.DataValueField = "ResourceTypeDescription";
                ListItem listItem = new ListItem(lblDDLResources.Text);
                ddlResources.Items.Add(new ListItem(lblDDLResources.Text));
                ddlResources.DataBind();




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
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Do Nothing

        }

        public void Bind(int resourcenum)
        {
            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectResourceByTypeID";

            SqlParameter id = new SqlParameter("@id", resourcenum);
            id.Direction = ParameterDirection.Input;
            id.SqlDbType = SqlDbType.Int;
            id.Size = 4;
            cmd.Parameters.Add(id);

            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);

            rptManageR.DataSource = dataSet;
            rptManageR.DataBind();

        }
        public void BindAll()
        {
            cmd.Parameters.Clear();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectResources";

            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);

            rptManageR.DataSource = dataSet;
            rptManageR.DataBind();
        }

        protected void btnAllResources_Click(object sender, EventArgs e)
        {
            BindAll();
        }

        protected void btnViewR_Click(object sender, EventArgs e)
        {
            int resourcenum = 0;
            if (ddlResources.Text == "Job")
            {
                resourcenum = 1;
                Bind(resourcenum);
            }
            else if (ddlResources.Text == "Event")
            {
                resourcenum = 2;
                Bind(resourcenum);
            }
            else if (ddlResources.Text == "Training Opportunity")
            {
                resourcenum = 3;
                Bind(resourcenum);
            }
            else if (ddlResources.Text == "All Resources")
            {
                BindAll();
            }
        }

        protected void btnActivate_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem item in rptManageR.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("chkRow");
                if (cb.Checked)
                {
                    Label label = (Label)item.FindControl("lblResID");
                    Resource resource = new Resource();

                    string lblID = label.Text;

                    resource.resourceID = lblID;
                    resource.active = "Active";

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "InactivateOrActivateResource";
                    cmd.Parameters.AddWithValue("@resourceID", resource.resourceID);
                    cmd.Parameters.AddWithValue("@active", resource.active);

                    db.DoUpdateUsingCmdObj(cmd);
                    cmd.Parameters.Clear();

                }
            }
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            BindAll();
        }

        protected void btnInactivate_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem item in rptManageR.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("chkRow");
                if (cb.Checked)
                {
                    Label label = (Label)item.FindControl("lblResID");
                    Resource resource = new Resource();

                    string lblID = label.Text;

                    resource.resourceID = lblID;
                    resource.active = "Inactive";

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "InactivateOrActivateResource";
                    cmd.Parameters.AddWithValue("@resourceID", resource.resourceID);
                    cmd.Parameters.AddWithValue("@active", resource.active);

                    db.DoUpdateUsingCmdObj(cmd);
                    cmd.Parameters.Clear();
                }
            }
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup1();", true);
            BindAll();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            HtmlInputCheckBox chkRow;
            int count = 0;
            foreach (RepeaterItem item in rptManageR.Items)
            {
                chkRow = (HtmlInputCheckBox)item.FindControl("chkRow");
                if (chkRow.Checked)
                {
                    count++;
                }
            }

            if (count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup2();", true);
            }
            else if (count > 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup3();", true);
            }
            else
            {
               // Label label = (Label)item.FindControl("lblResID");
                //Label labelTypeID = (Label)item.FindControl("lblResTypeID");

                //int typeID = Convert.ToInt32(labelTypeID);
                
               // if(typeID == 1)
                {

                }
               // else if (typeID == 2)
                {

                }
                else
                {

                }
            }
        }


    }
}