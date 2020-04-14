using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Collections;
using Utilities;

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
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup2();", true);
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
                eventt.eventDate = Convert.ToDateTime(dateEventDate.Value);
                eventt.expDate = Convert.ToDateTime(dateRegDeadline.Value);
                eventt.startTime = Convert.ToDateTime(txtStartTime.Text);
                eventt.endTime = Convert.ToDateTime(txtEndTime.Text);
                eventt.contactFN = txtFn.Text;
                eventt.contactLN = txtLn.Text;
                eventt.phoneNumber = txtContPhone.Text;
                eventt.email = txtContEmail.Text;
                eventt.attire = txtAtire.Text;
                eventt.link = txtLink.Text;
                eventt.description = txtDesc.Text;
                eventt.active = "Active";

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
                bigCommand.Parameters.AddWithValue("@endDate", eventt.expDate);
                bigCommand.Parameters.AddWithValue("@startTime", eventt.startTime);
                bigCommand.Parameters.AddWithValue("@endTime", eventt.endTime);
                bigCommand.Parameters.AddWithValue("@firstName", eventt.contactFN);
                bigCommand.Parameters.AddWithValue("@lastName", eventt.contactLN);
                bigCommand.Parameters.AddWithValue("@phoneNumber", eventt.phoneNumber);
                bigCommand.Parameters.AddWithValue("@email", eventt.email);
                bigCommand.Parameters.AddWithValue("@attire", eventt.attire);
                bigCommand.Parameters.AddWithValue("@link", eventt.link);
                bigCommand.Parameters.AddWithValue("@description", eventt.description);
                bigCommand.Parameters.AddWithValue("@active", eventt.active);

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


                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            }

        }
    }
}