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
    public partial class AddNewTraining : System.Web.UI.Page
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

            Training training = new Training();
            training.resourceTypeID = 3;
            training.resourceTitle = txtTitle.Text;
            training.company = txtHost.Text;
            training.addressLine1 = txtAddLine1.Text;
            training.addressLine2 = txtAddLine2.Text;
            training.city = txtCity.Text;
            training.state = ddlState.Text;
            training.zipCode = txtZip.Text;
            training.startDate = CalanderStartDate.SelectedDate;
            training.expDate = CalendarRegDead.SelectedDate;
            training.weeklyHours = txtHours.Text;
            training.trainingLength = txtLength.Text;
            training.contactFN = txtFn.Text;
            training.contactLN = txtLn.Text;
            training.phoneNumber = txtContPhone.Text;
            training.email = txtContEmail.Text;      
            training.link = txtSignUp.Text;
            training.description = txtDesc.Text;
            training.otherReqs = txtSkills.Text;




            bigCommand.CommandType = CommandType.StoredProcedure;
            bigCommand.CommandText = "AddNewTraining";
            bigCommand.Parameters.AddWithValue("@resourceID", training.resourceTypeID);
            bigCommand.Parameters.AddWithValue("@title", training.resourceTitle);
            bigCommand.Parameters.AddWithValue("@company", training.company);
            bigCommand.Parameters.AddWithValue("@addLine1", training.addressLine1);
            bigCommand.Parameters.AddWithValue("@addLine2", training.addressLine2);
            bigCommand.Parameters.AddWithValue("@city", training.city);
            bigCommand.Parameters.AddWithValue("@state", training.state);
            bigCommand.Parameters.AddWithValue("@zip", training.zipCode);
            bigCommand.Parameters.AddWithValue("@startDate", training.startDate);
            bigCommand.Parameters.AddWithValue("@expDate", training.expDate);
            bigCommand.Parameters.AddWithValue("@weeklyHrs", training.weeklyHours);
            bigCommand.Parameters.AddWithValue("@trainLength", training.trainingLength);
            bigCommand.Parameters.AddWithValue("@firstName", training.contactFN);
            bigCommand.Parameters.AddWithValue("@lastName", training.contactLN);
            bigCommand.Parameters.AddWithValue("@phoneNumber", training.phoneNumber);
            bigCommand.Parameters.AddWithValue("@email", training.email);
            bigCommand.Parameters.AddWithValue("@otherReqs", training.otherReqs);
            bigCommand.Parameters.AddWithValue("@link", training.link);
            bigCommand.Parameters.AddWithValue("@description", training.description);

            dBConnect.DoUpdateUsingCmdObj(bigCommand);
            bigCommand.Parameters.Clear();

            txtTitle.Text = string.Empty;
            txtHost.Text = string.Empty;
            txtAddLine1.Text = string.Empty;
            txtAddLine2.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtZip.Text = string.Empty;
            txtHours.Text = string.Empty;
            txtLength.Text = string.Empty;
            txtFn.Text = string.Empty;
            txtLn.Text = string.Empty;
            txtContEmail.Text = string.Empty;
            txtContPhone.Text = string.Empty;
            txtDesc.Text = string.Empty;
            txtSignUp.Text = string.Empty;
            txtSkills.Text = string.Empty;


            //Response.Redirect("AdminHomePage.aspx");
        }
    }
}