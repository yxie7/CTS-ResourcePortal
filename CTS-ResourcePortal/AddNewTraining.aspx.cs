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
    public partial class AddNewTraining : System.Web.UI.Page
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

            Training training = new Training();
            training.resourceTypeID = "Training Opportunity";
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
            SqlParameter param = new SqlParameter("@resourceID", training.resourceTypeID);
            SqlParameter param1 = new SqlParameter("@title", training.resourceTitle);
            SqlParameter param2 = new SqlParameter("@company", training.company);
            SqlParameter param21 = new SqlParameter("@addLine1", training.addressLine1);
            SqlParameter param22 = new SqlParameter("@addLine2", training.addressLine2);
            SqlParameter param23 = new SqlParameter("@city", training.city);
            SqlParameter param24 = new SqlParameter("@state", training.state);
            SqlParameter param25 = new SqlParameter("@zip", training.zipCode);
            SqlParameter param3 = new SqlParameter("@startDate", training.startDate);
            SqlParameter param4 = new SqlParameter("@expDate", training.expDate);
            SqlParameter param5 = new SqlParameter("@weeklyHrs", training.weeklyHours);
            SqlParameter param6 = new SqlParameter("@trainLength", training.trainingLength);
            SqlParameter param7 = new SqlParameter("@firstName", training.contactFN);
            SqlParameter param8 = new SqlParameter("@lastName", training.contactLN);
            SqlParameter param9 = new SqlParameter("@phoneNumber", training.phoneNumber);
            SqlParameter param91 = new SqlParameter("@email", training.email);
            SqlParameter param92 = new SqlParameter("@otherReqs", training.otherReqs);
            SqlParameter param93 = new SqlParameter("@link", training.link);
            SqlParameter param94 = new SqlParameter("@description", training.description);


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

            dBConnect.DoUpdateUsingCmdObj(bigCommand);
            bigCommand.Parameters.Clear();


            //Response.Redirect("AdminHomePage.aspx");
        }
    }
}