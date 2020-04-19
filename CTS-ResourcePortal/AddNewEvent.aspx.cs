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
          /*  if (txtTitle.Value == string.Empty || txtHost.Value == string.Empty || txtAddLine1.Value == string.Empty || txtCity.Value == string.Empty ||
                txtZip.Value == string.Empty || txtStartTime.Value == string.Empty || txtEndTime.Value == string.Empty || txtFn.Value == string.Empty ||
                txtLn.Value == string.Empty || txtContEmail.Value == string.Empty || txtContPhone.Value == string.Empty || txtLink.Value == string.Empty
                || txtDesc.Value == string.Empty)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup2();", true);
            }
            else
            {*/
                Events eventt = new Events();
                eventt.resourceTypeID = 2;
                eventt.resourceTitle = txtTitle.Value;
                eventt.company = txtHost.Value;
                eventt.addressLine1 = txtAddLine1.Value;
                eventt.addressLine2 = txtAddLine2.Value;
                eventt.city = txtCity.Value;
                eventt.state = ddlState.Text;
                eventt.zipCode = txtZip.Value;
                eventt.eventDate = dateEventDate.Value;
                eventt.expDate = dateRegDeadline.Value;
                eventt.startTime = Convert.ToDateTime(txtStartTime.Value);
                eventt.endTime = Convert.ToDateTime(txtEndTime.Value);
                eventt.contactFN = txtFn.Value;
                eventt.contactLN = txtLn.Value;
                eventt.phoneNumber = txtContPhone.Value;
                eventt.email = txtContEmail.Value;
                eventt.attire = txtAttire.Value;
                eventt.link = txtLink.Value;
                eventt.description = descripTEXT.Value;
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
                bigCommand.Parameters.AddWithValue("@eventDate", Convert.ToDateTime(eventt.eventDate));
                bigCommand.Parameters.AddWithValue("@endDate", Convert.ToDateTime(eventt.expDate));
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

                txtTitle.Value = string.Empty;
                txtHost.Value = string.Empty;
                txtAddLine1.Value = string.Empty;
                txtAddLine2.Value = string.Empty;
                txtCity.Value = string.Empty;
                txtZip.Value = string.Empty;
                txtStartTime.Value = string.Empty;
                txtEndTime.Value = string.Empty;
                txtFn.Value = string.Empty;
                txtLn.Value = string.Empty;
                txtContEmail.Value = string.Empty;
                txtContPhone.Value = string.Empty;
                txtAttire.Value = string.Empty;
                txtLink.Value = string.Empty;
                descripTEXT.Value = string.Empty;


                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

           // }

        }
    }
}