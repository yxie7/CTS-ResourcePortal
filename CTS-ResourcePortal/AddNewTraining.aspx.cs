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
            param18.Direction = ParameterDirection.Input;


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
            bigCommand.Parameters.Add(param18); */

            dBConnect.DoUpdateUsingCmdObj(bigCommand);
            bigCommand.Parameters.Clear();


            //Response.Redirect("AdminHomePage.aspx");
        }
    }
}