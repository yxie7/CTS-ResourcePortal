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
           /* if (txtTitle.Text == string.Empty || txtHost.Text == string.Empty || txtAddLine1.Text == string.Empty || txtCity.Text == string.Empty ||
                txtZip.Text == string.Empty || txtHours.Text == string.Empty || txtLength.Text == string.Empty || txtFn.Text == string.Empty ||
                txtLn.Text == string.Empty || txtContEmail.Text == string.Empty || txtContPhone.Text == string.Empty || txtSignUp.Text == string.Empty
                || txtDesc.Text == string.Empty || txtSkills.Text == string.Empty)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup2();", true);
            }
            else
            {*/

                Training training = new Training();
                training.resourceTypeID = 3;
                training.resourceTitle = txtTitle.Value;
                training.company = txtHost.Value;
                training.addressLine1 = txtAddLine1.Value;
                training.addressLine2 = txtAddLine2.Value;
                training.city = txtCity.Value;
                training.state = ddlState.Text;
                training.zipCode = txtZip.Value;
                training.startDate = dateStart.Value;
                training.expDate = dateRegDeadline.Value;
                //training.startDate = Convert.ToDateTime(dateStart.Value);
                //training.expDate = Convert.ToDateTime(dateRegDeadline.Value);
                training.weeklyHours = txtHours.Value;
                training.trainingLength = txtLength.Value;
                training.contactFN = txtFn.Value;
                training.contactLN = txtLn.Value;
                training.phoneNumber = txtContPhone.Value;
                training.email = txtContEmail.Value;
                training.link = txtSignUp.Value;
                training.description = txtDesc.Value;
                training.otherReqs = txtSkills.Value;
                training.active = "Active";


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
                bigCommand.Parameters.AddWithValue("@startDate", Convert.ToDateTime(training.startDate));
                bigCommand.Parameters.AddWithValue("@endDate", Convert.ToDateTime(training.expDate));
                bigCommand.Parameters.AddWithValue("@weeklyHrs", training.weeklyHours);
                bigCommand.Parameters.AddWithValue("@trainLength", training.trainingLength);
                bigCommand.Parameters.AddWithValue("@firstName", training.contactFN);
                bigCommand.Parameters.AddWithValue("@lastName", training.contactLN);
                bigCommand.Parameters.AddWithValue("@phoneNumber", training.phoneNumber);
                bigCommand.Parameters.AddWithValue("@email", training.email);
                bigCommand.Parameters.AddWithValue("@otherReqs", training.otherReqs);
                bigCommand.Parameters.AddWithValue("@link", training.link);
                bigCommand.Parameters.AddWithValue("@description", training.description);
                bigCommand.Parameters.AddWithValue("@active", training.active);

                dBConnect.DoUpdateUsingCmdObj(bigCommand);
                bigCommand.Parameters.Clear();

                txtTitle.Value = string.Empty;
                txtHost.Value = string.Empty;
                txtAddLine1.Value = string.Empty;
                txtAddLine2.Value = string.Empty;
                txtCity.Value = string.Empty;
                txtZip.Value = string.Empty;
                txtHours.Value = string.Empty;
                txtLength.Value = string.Empty;
                txtFn.Value = string.Empty;
                txtLn.Value = string.Empty;
                txtContEmail.Value = string.Empty;
                txtContPhone.Value = string.Empty;
                txtDesc.Value = string.Empty;
                txtSignUp.Value = string.Empty;
                txtSkills.Value = string.Empty;


                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
           // }

        }
    }
}