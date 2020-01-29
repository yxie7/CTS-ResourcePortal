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
    public partial class AddNewEvent : System.Web.UI.Page
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

            Events eventt = new Events();
            eventt.resourceTypeID = 2;
            eventt.resourceTitle = txtTitle.Text;
            eventt.company = txtHost.Text;
            eventt.addressLine1 = txtAddLine1.Text;
            eventt.addressLine2 = txtAddLine2.Text;
            eventt.city = txtCity.Text;
            eventt.state = ddlState.Text;
            eventt.zipCode = txtZip.Text;
            eventt.eventDate = CalanderDate.SelectedDate;
            eventt.expDate = CalendarReg.SelectedDate;
            eventt.startTime = Convert.ToDateTime(txtStartTime.Text);
            eventt.endTime = Convert.ToDateTime(txtEndTime.Text);
            eventt.contactFN = txtFn.Text;
            eventt.contactLN = txtLn.Text;
            eventt.phoneNumber = txtContPhone.Text;
            eventt.email = txtContEmail.Text;
            eventt.attire = txtAtire.Text;
            eventt.link = txtLink.Text;
            eventt.description = txtDesc.Text;

            bigCommand.CommandType = CommandType.StoredProcedure;
            bigCommand.CommandText = "AddNewEvent";
            bigCommand.Parameters.AddWithValue("@resourceID", eventt.resourceTypeID);
            bigCommand.Parameters.AddWithValue("@title", eventt.resourceTitle);
            bigCommand.Parameters.AddWithValue("@company", eventt.company);
            bigCommand.Parameters.AddWithValue("@addLine1", eventt.addressLine1);
            bigCommand.Parameters.AddWithValue("@addLine2", eventt.addressLine2);
            bigCommand.Parameters.AddWithValue("@city", eventt.city);
            bigCommand.Parameters.AddWithValue("@state", eventt.state);
            bigCommand.Parameters.AddWithValue("@zip", eventt.zipCode);
            bigCommand.Parameters.AddWithValue("@eventDate", eventt.eventDate);
            bigCommand.Parameters.AddWithValue("@regDate", eventt.expDate);
            bigCommand.Parameters.AddWithValue("@startTime", eventt.startTime);
            bigCommand.Parameters.AddWithValue("@endTime", eventt.endTime);
            bigCommand.Parameters.AddWithValue("@firstName", eventt.contactFN);
            bigCommand.Parameters.AddWithValue("@lastName", eventt.contactLN);
            bigCommand.Parameters.AddWithValue("@phoneNumber", eventt.phoneNumber);
            bigCommand.Parameters.AddWithValue("@email", eventt.email);
            bigCommand.Parameters.AddWithValue("@attire", eventt.attire);
            bigCommand.Parameters.AddWithValue("@link", eventt.link);
            bigCommand.Parameters.AddWithValue("@description", eventt.description);

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