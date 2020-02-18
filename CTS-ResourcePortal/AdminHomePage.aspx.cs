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
        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
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
        
        public void JobVisibilityControls()
        {
            lblExpired.Visible = true;
            lblExpiration.Visible = true;
            lblCompaniesName.Visible = true;
            lblOtherReqs.Visible = true;
            lblOtherRequirements.Visible = true;
            lblHostedBy.Visible = false;
            lblStartEndTime.Visible = false;
            lblStartEnd.Visible = false;
            lblAttire.Visible = false;
            lblAttire1.Visible = false;
            lblStartDt.Visible = false;
        }
        

        protected void btnJob_Command(object sender, CommandEventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            string id = e.CommandArgument.ToString();


            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectResourceByID";
            cmd.Parameters.AddWithValue("@id", id);

            DataSet JobDs = db.GetDataSetUsingCmdObj(cmd);


            myHeader.InnerHtml = (string)db.GetField("ResourceName", 0);
            lblCompanyName.Text = (string)db.GetField("Company", 0);
            lblResponsibilities.Text = (string)db.GetField("Description", 0);
            lblHours.Text = (string)db.GetField("WeeklyHours", 0);
            //lblLength.Text = (string)db.GetField("Length", 0);

            string addressLine1 = (string)db.GetField("AddressLine", 0);
            string city = (string)db.GetField("LocationCity", 0);
            string zipCode = (string)db.GetField("LocationZip", 0);
            string state = (string)db.GetField("State", 0);

            lblLocation.Text = addressLine1 + ", " + city + ", " + zipCode + ", " + state;

            lblContact.Text = (string)db.GetField("ContactEmail", 0);


            var dateValue = db.GetField("StartDate", 0);
            lblPosted.Text = Convert.ToDateTime(dateValue).ToString("MM-dd-yyyy");


            var dateValue2 = db.GetField("RegistrationDeadline", 0);
            lblExpired.Text = Convert.ToDateTime(dateValue2).ToString("MM-dd-yyyy");

            //lblAttire.Text = (string)db.GetField("Attire", 0);

            lblOtherRequirements.Text = (string)db.GetField("Requirements", 0);

            JobVisibilityControls();

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            cmd.Parameters.Clear();

        }
    }
}