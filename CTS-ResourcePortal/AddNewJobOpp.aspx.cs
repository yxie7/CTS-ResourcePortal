using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Utilities;

using System.Data;
using System.Data.SqlClient;

namespace CTS_ResourcePortal
{
    public partial class AddNewJobOpp : System.Web.UI.Page
    {
        DBConnect dBConnect = new DBConnect();
        SqlCommand bigCommand = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {

            Job job = new Job();
            job.resourceTypeID = "Job";
            job.resourceTitle = txtTitle.Text;
            job.company = txtCompany.Text;
            job.addressLine1 = txtAddLine1.Text;
            job.addressLine2 = txtAddLine2.Text;
            job.city = txtCity.Text;
            job.state = ddlState.Text;
            job.zipCode = txtZip.Text;
            job.datePosted = CalendarPostedDate.SelectedDate;
            job.expDate = CalendarExpDate.SelectedDate;
            job.weeklyHours = txtHours.Text;
            job.contactFN = txtFn.Text;
            job.contactLN = txtLn.Text;
            job.phoneNumber = txtContPhone.Text;
            job.email = txtContEmail.Text;
            job.link = txtLink.Text;
            job.responsibilities = txtPrimResp.Text;
            job.otherReqs = txtSkills.Text;

            bigCommand.CommandType = CommandType.StoredProcedure;
            bigCommand.CommandText = "AddNewJob";
            SqlParameter param = new SqlParameter("@resourceID", job.resourceTypeID);
            SqlParameter param1 = new SqlParameter("@title", job.resourceTitle);
            SqlParameter param2 = new SqlParameter("@company", job.company);
            SqlParameter param21 = new SqlParameter("@addLine1", job.addressLine1);
            SqlParameter param22 = new SqlParameter("@addLine2", job.addressLine2);
            SqlParameter param23 = new SqlParameter("@city", job.city);
            SqlParameter param24 = new SqlParameter("@state", job.state);
            SqlParameter param25 = new SqlParameter("@zip", job.zipCode);
            SqlParameter param3 = new SqlParameter("@startDate", job.datePosted);
            SqlParameter param4 = new SqlParameter("@expDate", job.expDate);
            SqlParameter param5 = new SqlParameter("@weeklyHrs", job.weeklyHours);
            SqlParameter param7 = new SqlParameter("@firstName", job.contactFN);
            SqlParameter param8 = new SqlParameter("@lastName", job.contactLN);
            SqlParameter param9 = new SqlParameter("@phoneNumber", job.phoneNumber);
            SqlParameter param91 = new SqlParameter("@email", job.email);
            SqlParameter param92 = new SqlParameter("@otherReqs", job.otherReqs);
            SqlParameter param93 = new SqlParameter("@link", job.link);
            SqlParameter param94 = new SqlParameter("@primResp", job.responsibilities);     //Not in DB*** Used Description field in Stored Procedure


            param.Direction = ParameterDirection.Input;
            param1.Direction = ParameterDirection.Input;
            param2.Direction = ParameterDirection.Input;
            param21.Direction = ParameterDirection.Input;
            param22.Direction = ParameterDirection.Input;
            param23.Direction = ParameterDirection.Input;
            param24.Direction = ParameterDirection.Input;
            param25.Direction = ParameterDirection.Input;
            param3.Direction = ParameterDirection.Input;
            param4.Direction = ParameterDirection.Input;
            param5.Direction = ParameterDirection.Input;
            param7.Direction = ParameterDirection.Input;
            param8.Direction = ParameterDirection.Input;
            param9.Direction = ParameterDirection.Input;
            param91.Direction = ParameterDirection.Input;
            param92.Direction = ParameterDirection.Input;
            param93.Direction = ParameterDirection.Input;
            param94.Direction = ParameterDirection.Input;


            bigCommand.Parameters.Add(param);
            bigCommand.Parameters.Add(param1);
            bigCommand.Parameters.Add(param2);
            bigCommand.Parameters.Add(param21);
            bigCommand.Parameters.Add(param22);
            bigCommand.Parameters.Add(param23);
            bigCommand.Parameters.Add(param24);
            bigCommand.Parameters.Add(param25);
            bigCommand.Parameters.Add(param3);
            bigCommand.Parameters.Add(param4);
            bigCommand.Parameters.Add(param5);
            bigCommand.Parameters.Add(param7);
            bigCommand.Parameters.Add(param8);
            bigCommand.Parameters.Add(param9);
            bigCommand.Parameters.Add(param91);
            bigCommand.Parameters.Add(param92);
            bigCommand.Parameters.Add(param93);
            bigCommand.Parameters.Add(param94);
            dBConnect.DoUpdateUsingCmdObj(bigCommand);
            bigCommand.Parameters.Clear();

            //Response.Redirect("AdminHomePage.aspx");
        }
    }
}