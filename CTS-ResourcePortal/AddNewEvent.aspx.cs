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
    public partial class AddNewEvent : System.Web.UI.Page
    {
        
        DBConnect dBConnect = new DBConnect();
        SqlCommand bigCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            //Still need to add individual resource ID********

            Events eventt = new Events();
            eventt.resourceTypeID = "Event";
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
            SqlParameter param = new SqlParameter("@resourceID", eventt.resourceTypeID);
            SqlParameter param1 = new SqlParameter("@title", eventt.resourceTitle);
            SqlParameter param2 = new SqlParameter("@company", eventt.company);
            SqlParameter param21 = new SqlParameter("@addLine1", eventt.addressLine1);
            SqlParameter param22 = new SqlParameter("@addLine2", eventt.addressLine2);
            SqlParameter param23 = new SqlParameter("@city", eventt.city);
            SqlParameter param24 = new SqlParameter("@state", eventt.state);
            SqlParameter param25 = new SqlParameter("@zip", eventt.zipCode);
            SqlParameter param3 = new SqlParameter("@eventDate", eventt.eventDate);
            SqlParameter param4 = new SqlParameter("@regDate", eventt.expDate);
            SqlParameter param5 = new SqlParameter("@startTime", eventt.startTime);
            SqlParameter param6 = new SqlParameter("@endTime", eventt.endTime);
            SqlParameter param7 = new SqlParameter("@firstName", eventt.contactFN);
            SqlParameter param8 = new SqlParameter("@lastName", eventt.contactLN);
            SqlParameter param9 = new SqlParameter("@phoneNumber", eventt.phoneNumber);
            SqlParameter param91 = new SqlParameter("@email", eventt.email);
            SqlParameter param92 = new SqlParameter("@attire", eventt.attire);
            SqlParameter param93 = new SqlParameter("@link", eventt.link);
            SqlParameter param94 = new SqlParameter("@description", eventt.description);


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
            param6.Direction = ParameterDirection.Input;
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
            bigCommand.Parameters.Add(param6);
            bigCommand.Parameters.Add(param7);
            bigCommand.Parameters.Add(param8);
            bigCommand.Parameters.Add(param9);
            bigCommand.Parameters.Add(param91);
            bigCommand.Parameters.Add(param92);
            bigCommand.Parameters.Add(param93);
            bigCommand.Parameters.Add(param94);







            Response.Redirect("AdminHomePage.aspx");
        }
    }
}