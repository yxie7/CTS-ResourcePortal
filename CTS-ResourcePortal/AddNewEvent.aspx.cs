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
            if (txtTitle.Text == string.Empty || txtHost.Text == string.Empty || txtAddLine1.Text == string.Empty || txtCity.Text == string.Empty ||
                txtZip.Text == string.Empty || txtStartTime.Text == string.Empty || txtEndTime.Text == string.Empty || txtFn.Text == string.Empty ||
                txtLn.Text == string.Empty || txtContEmail.Text == string.Empty || txtContPhone.Text == string.Empty || txtLink.Text == string.Empty
                || txtDesc.Text == string.Empty)
            {
                lblError.Visible = true;
            }
            else
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

                dBConnect.DoUpdateUsingCmdObj(bigCommand);
                bigCommand.Parameters.Clear();

                txtTitle.Text = string.Empty;
                txtHost.Text = string.Empty;
                txtAddLine1.Text = string.Empty;
                txtAddLine2.Text = string.Empty;
                txtCity.Text = string.Empty;
                txtZip.Text = string.Empty;
                txtStartTime.Text = string.Empty;
                txtEndTime.Text = string.Empty;
                txtFn.Text = string.Empty;
                txtLn.Text = string.Empty;
                txtContEmail.Text = string.Empty;
                txtContPhone.Text = string.Empty;
                txtAtire.Text = string.Empty;
                txtLink.Text = string.Empty;
                txtDesc.Text = string.Empty;

                lblError.Visible = false;
            }
            
        }

       /* public bool IsValid()
        {
            if (txtTitle.Text == string.Empty)
            {
                lblTitleError.Visible = true;
                return false;
            }

            if (txtHost.Text == string.Empty)
            {
                lblHostError.Visible = true;
                return false;
            }

            else if (txtAddLine1.Text == string.Empty)
            {
                lblAdd1Error.Visible = true;
                return false;
            }

            if (txtCity.Text == string.Empty)
            {
                lblCityError.Visible = true;
                return false;
            }

            if (txtZip.Text == string.Empty)
            {
                lblZipError.Visible = true;
                return false;
            }

            if (txtStartTime.Text == string.Empty)
            {
                lblStartError.Visible = true;
                return false;
            }

            if (txtEndTime.Text == string.Empty)
            {
                lblEndError.Visible = true;
                return false;
            }

            if (txtFn.Text == string.Empty)
            {
                lblFNError.Visible = true;
                return false;
            }

            if (txtLn.Text == string.Empty)
            {
                lblLNError.Visible = true;
                return false;
            }

            if (txtContEmail.Text == string.Empty)
            {
                lblEmailError.Visible = true;
                return false;
            }

            if (txtContPhone.Text == string.Empty)
            {
                lblPhoneError.Visible = true;
                return false;
            }

            if (txtLink.Text == string.Empty)
            {
                lblLinkError.Visible = true;
                return false;
            }

            if (txtDesc.Text == string.Empty)
            {
                lblDescError.Visible = true;
                return false;
            }
            else
            {
                return true;
            }
        }*/
    }
}