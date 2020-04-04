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
    public partial class EditEvent : System.Web.UI.Page
    {
        DBConnect dBConnect = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        SqlCommand bigCommand = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Events ev = new Events();
                string resourceIDS = (string)Session["ResourceIDS"];
                ev.resourceID = resourceIDS;

                bigCommand.CommandType = CommandType.StoredProcedure;
                bigCommand.CommandText = "SelectResourceByID";
                SqlParameter id = new SqlParameter("@id", resourceIDS);
                id.Direction = ParameterDirection.Input;
                bigCommand.Parameters.Add(id);
                DataSet ds = dBConnect.GetDataSetUsingCmdObj(bigCommand);

                string title = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[2]);
                string company = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[3]);
                string primResp = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[4]);
                string skills = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[5]);
                string weekhrs = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[6]);
                //string length = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[7]);
                string attire = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[8]);
                string firstName = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[9]);
                string lastName = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[10]);
                string phoneNo = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[11]);
                string email = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[12]);
                //string postedDate = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[13]);
                //string expDate = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[14]);
                string startTime = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[15]);
                string endTime = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[16]);
                //string applyReg = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[17]);
                //string regDeadline = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[18]);
                string link = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[19]);
                string addLine1 = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[20]);
                string addLine2 = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[21]);
                string city = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[22]);
                string zip = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[23]);
                string state = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[24]);

                txtTitle.Text = title;
                txtHost.Text = company;
                txtAddLine1.Text = addLine1;
                txtAddLine2.Text = addLine2;
                txtCity.Text = city;
                ddlState.SelectedValue = state;
                txtZip.Text = zip;
                //CalendarPostedDate.SelectedDate =    event date
                //CalendarExpDate.SelectedDate = 
                txtStartTime.Text = startTime;
                txtEndTime.Text = endTime;
                txtFn.Text = firstName;
                txtLn.Text = lastName;
                txtContPhone.Text = phoneNo;
                txtContEmail.Text = email;
                txtLink.Text = link;
                txtDesc.Text = primResp;
                txtAtire.Text = attire;
            }
        }
        protected void btnSubmit_click(object sender, EventArgs e)
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
                string resourceIDS = (string)Session["ResourceIDS"];


                string title = txtTitle.Text;
                //int typeID = 2;
                string company = txtHost.Text;
                string addressLine1 = txtAddLine1.Text;
                string addressLine2 = txtAddLine2.Text;
                string city = txtCity.Text;
                string state = ddlState.Text;
                string zip = txtZip.Text;
                string start = txtStartTime.Text;
                string end = txtEndTime.Text;
                string fn = txtFn.Text;
                string ln = txtLn.Text;
                string phone = txtContPhone.Text;
                string email = txtContEmail.Text;
                string attire = txtAtire.Text;
                string link = txtLink.Text;
                string desc = txtDesc.Text;


                //Still need to add dates!!!!!!!!!!!!!!!!!!!!


                bigCommand.CommandType = CommandType.StoredProcedure;
                bigCommand.CommandText = "EditEvent";
                bigCommand.Parameters.AddWithValue("@id", resourceIDS);
                //bigCommand.Parameters.AddWithValue("@resourceID", eventt.resourceTypeID);
                bigCommand.Parameters.AddWithValue("@title", title);
                bigCommand.Parameters.AddWithValue("@company", company);
                bigCommand.Parameters.AddWithValue("@addLine1", addressLine1);
                bigCommand.Parameters.AddWithValue("@addLine2", addressLine2);
                bigCommand.Parameters.AddWithValue("@city", city);
                bigCommand.Parameters.AddWithValue("@state", state);
                bigCommand.Parameters.AddWithValue("@zip", zip);
                //bigCommand.Parameters.AddWithValue("@eventDate", eventDate);
                //bigCommand.Parameters.AddWithValue("@regDate", expDate);
                bigCommand.Parameters.AddWithValue("@startTime", start);
                bigCommand.Parameters.AddWithValue("@endTime", end);
                bigCommand.Parameters.AddWithValue("@firstName", fn);
                bigCommand.Parameters.AddWithValue("@lastName", ln);
                bigCommand.Parameters.AddWithValue("@phoneNumber", phone);
                bigCommand.Parameters.AddWithValue("@email", email);
                bigCommand.Parameters.AddWithValue("@attire", attire);
                bigCommand.Parameters.AddWithValue("@link", link);
                bigCommand.Parameters.AddWithValue("@description", desc);

                dBConnect.DoUpdateUsingCmdObj(bigCommand);
                bigCommand.Parameters.Clear();

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                "setTimeout(function() { window.location.replace('ManageR.aspx') }, 3000);", true);

                //Server.Transfer("ManageR.aspx");
                //Response.Redirect("ManageR.aspx");
            }
        }
    }
}