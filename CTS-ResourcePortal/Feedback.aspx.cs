using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using Utilities;
using System.Text.RegularExpressions;

namespace CTS_ResourcePortal
{
    public partial class MobileFeedback : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        SqlCommand objCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (string.IsNullOrEmpty(Session["userEmail"] as string))
            {
                Response.Redirect("Login.aspx");

            }
            if (Request.QueryString["resource"] != null)
            {
                txtResourceTitle.Text = (Request.QueryString["resource"]).ToString();

                lblResourceID.Text = (Request.QueryString["ID"]).ToString();
            }

            objCommand.Parameters.Clear();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetAllCitizensByEmail";

            objCommand.Parameters.AddWithValue("@Email", Session["userEmail"].ToString());
            DataSet CitizenInfo = objDB.GetDataSetUsingCmdObj(objCommand);

            string fn = (string)objDB.GetField("FirstName", 0);
            string ln = (string)objDB.GetField("LastName", 0);
            int citiID = (Int32)objDB.GetField("CitizenID", 0);

            lblCitizenID.Text = citiID.ToString();

            txtCitizen.Text = fn +" "+ ln;

            //objCommand.Parameters.Clear();
            //objCommand.CommandType = CommandType.StoredProcedure;
            //objCommand.CommandText = "GetResourceIdByName";

            //objCommand.Parameters.AddWithValue("@ResourceName", txtResourceTitle.Text.ToString());
            //DataSet ResourceID = objDB.GetDataSetUsingCmdObj(objCommand);
            //int resID = (Int32)objDB.GetField("ResourcesId", 0);
            //lblResourceID.Text = resID.ToString();


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtFeedback.Text != ""){
                objCommand.Parameters.Clear();
                objCommand.CommandText = "AddFeedback";


                objCommand.Parameters.AddWithValue("@CitizenID", lblCitizenID.Text.ToString());

                objCommand.Parameters.AddWithValue("@FeedbackText", txtFeedback.Text.ToString());

                objCommand.Parameters.AddWithValue("@ResourceID", lblResourceID.Text.ToString());

                objCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString("M/d/yyyy"));

                var ResponseReceived = objDB.DoUpdateUsingCmdObj(objCommand);

                if (ResponseReceived == 1)
                {

                    lblConfirm.Text = "Thank you for submitting feedback!";
                    lblConfirm.Visible = true;
                }
                else

                    lblConfirm.Text = "Failed";
                lblConfirm.Visible = true;
            }
            else
            {
                lblConfirm.Text = "Please enter Feedback text";
                lblConfirm.Visible = true;
            }
        }
    }
}