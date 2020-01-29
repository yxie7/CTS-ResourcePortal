using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Utilities;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CTS_ResourcePortal
{
    public partial class AddNewJobOpp : System.Web.UI.Page
    {
        DBConnect dBConnect = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
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
            job.resourceTypeID = 1;
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
            bigCommand.Parameters.AddWithValue("@resourceID", job.resourceTypeID);
            bigCommand.Parameters.AddWithValue("@title", job.resourceTitle);
            bigCommand.Parameters.AddWithValue("@company", job.company);
            bigCommand.Parameters.AddWithValue("@addLine1", job.addressLine1);
            bigCommand.Parameters.AddWithValue("@addLine2", job.addressLine2);
            bigCommand.Parameters.AddWithValue("@city", job.city);
            bigCommand.Parameters.AddWithValue("@state", job.state);
            bigCommand.Parameters.AddWithValue("@zip", job.zipCode);
            bigCommand.Parameters.AddWithValue("@startDate", job.datePosted);
            bigCommand.Parameters.AddWithValue("@expDate", job.expDate);
            bigCommand.Parameters.AddWithValue("@weeklyHrs", job.weeklyHours);
            bigCommand.Parameters.AddWithValue("@firstName", job.contactFN);
            bigCommand.Parameters.AddWithValue("@lastName", job.contactLN);
            bigCommand.Parameters.AddWithValue("@phoneNumber", job.phoneNumber);
            bigCommand.Parameters.AddWithValue("@email", job.email);
            bigCommand.Parameters.AddWithValue("@otherReqs", job.otherReqs);
            bigCommand.Parameters.AddWithValue("@link", job.link);
            bigCommand.Parameters.AddWithValue("@primResp", job.responsibilities);     

            /*
            param.Direction = ParameterDirection.Input;
            param1.Direction = ParameterDirection.Input;
            param2.Direction = ParameterDirection.Input;
            param3.Direction = ParameterDirection.Input;
            param4.Direction = ParameterDirection.Input;
            param5.Direction = ParameterDirection.Input;
            param6.Direction = ParameterDirection.Input;
            param7.Direction = ParameterDirection.Input;
            param8.Direction = ParameterDirection.Input;
            param9.Direction = ParameterDirection.Input;
            param10.Direction = ParameterDirection.Input;
            param11.Direction = ParameterDirection.Input;
            param12.Direction = ParameterDirection.Input;
            param13.Direction = ParameterDirection.Input;
            param14.Direction = ParameterDirection.Input;
            param15.Direction = ParameterDirection.Input;
            param16.Direction = ParameterDirection.Input;
            param17.Direction = ParameterDirection.Input;


            bigCommand.Parameters.Add(param);
            bigCommand.Parameters.Add(param1);
            bigCommand.Parameters.Add(param2);
            bigCommand.Parameters.Add(param3);
            bigCommand.Parameters.Add(param4);
            bigCommand.Parameters.Add(param5);
            bigCommand.Parameters.Add(param6);
            bigCommand.Parameters.Add(param7);
            bigCommand.Parameters.Add(param8);
            bigCommand.Parameters.Add(param9);
            bigCommand.Parameters.Add(param10);
            bigCommand.Parameters.Add(param11);
            bigCommand.Parameters.Add(param12);
            bigCommand.Parameters.Add(param13);
            bigCommand.Parameters.Add(param14);
            bigCommand.Parameters.Add(param15);
            bigCommand.Parameters.Add(param16);
            bigCommand.Parameters.Add(param17);
            */
            
            dBConnect.DoUpdateUsingCmdObj(bigCommand);
            bigCommand.Parameters.Clear();

            //Response.Redirect("AdminHomePage.aspx");
        }
    }
}