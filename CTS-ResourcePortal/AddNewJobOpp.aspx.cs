﻿using System;
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
           /* if (txtTitle.Text == string.Empty || txtCompany.Text == string.Empty || txtAddLine1.Text == string.Empty || txtCity.Text == string.Empty ||
                txtZip.Text == string.Empty || txtHours.Text == string.Empty || txtFn.Text == string.Empty || txtLn.Text == string.Empty
                || txtContEmail.Text == string.Empty || txtContPhone.Text == string.Empty || txtLink.Text == string.Empty ||
                 txtPrimResp.Text == string.Empty || txtSkills.Text == string.Empty)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup2();", true);
            }
            else
            {
                */
                Job job = new Job();
                /*job.resourceTypeID = 1;
                job.resourceTitle = txtTitle.Value;
                job.company = txtCompany.Value;
                job.addressLine1 = txtAddLine1.Value;
                job.addressLine2 = txtAddLine2.Value;
                job.city = txtCity.Value;
                job.state = ddlState.Text;
                job.zipCode = txtZip.Text;
                //job.datePosted = Convert.ToDateTime(datePosted.Value);
                //job.expDate = Convert.ToDateTime(dateExp.Value);
                job.weeklyHours = txtHours.Text;
                job.contactFN = txtFn.Text;
                job.contactLN = txtLn.Text;
                job.phoneNumber = txtContPhone.Text;
                job.email = txtContEmail.Text;
                job.link = txtLink.Text;
                job.responsibilities = txtPrimResp.Text;
                job.otherReqs = txtSkills.Text;
                job.active = "Active";*/

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
                bigCommand.Parameters.AddWithValue("@startDate", Convert.ToDateTime(job.datePosted));
                bigCommand.Parameters.AddWithValue("@endDate", Convert.ToDateTime(job.expDate));
                bigCommand.Parameters.AddWithValue("@weeklyHrs", job.weeklyHours);
                bigCommand.Parameters.AddWithValue("@firstName", job.contactFN);
                bigCommand.Parameters.AddWithValue("@lastName", job.contactLN);
                bigCommand.Parameters.AddWithValue("@phoneNumber", job.phoneNumber);
                bigCommand.Parameters.AddWithValue("@email", job.email);
                bigCommand.Parameters.AddWithValue("@otherReqs", job.otherReqs);
                bigCommand.Parameters.AddWithValue("@link", job.link);
                bigCommand.Parameters.AddWithValue("@primResp", job.responsibilities);
                bigCommand.Parameters.AddWithValue("@active", job.active);


                dBConnect.DoUpdateUsingCmdObj(bigCommand);
                bigCommand.Parameters.Clear();

                txtTitle.Value = string.Empty;
                txtCompany.Value = string.Empty;
                txtAddLine1.Value = string.Empty;
                txtAddLine2.Value = string.Empty;
                txtCity.Value = string.Empty;
                txtZip.Value = string.Empty;
                txtHours.Value = string.Empty;
                txtFn.Value = string.Empty;
                txtLn.Value = string.Empty;
                txtContEmail.Value = string.Empty;
                txtContPhone.Value = string.Empty;
                txtPrimResp.Value = string.Empty;
                txtLink.Value = string.Empty;
                txtSkills.Value = string.Empty;

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
           // }

        }
    }
}