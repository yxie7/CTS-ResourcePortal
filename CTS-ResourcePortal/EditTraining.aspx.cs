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
    public partial class EditTraining : System.Web.UI.Page
    {

        DBConnect dBConnect = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        SqlCommand bigCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Training train = new Training();
                string resourceIDS = (string)Session["ResourceIDS"];
                train.resourceID = resourceIDS;

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
                string length = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[7]);
                string attire = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[8]);
                string firstName = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[9]);
                string lastName = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[10]);
                string phoneNo = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[11]);
                string email = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[12]);
                DateTime startDate = Convert.ToDateTime(ds.Tables[0].Rows[0].ItemArray[13]);
                DateTime endDate = Convert.ToDateTime(ds.Tables[0].Rows[0].ItemArray[14]);
                //string startTime = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[15]);
                //string endTime = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[16]);
                //string applyReg = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[17]);
                //DateTime expDate = Convert.ToDateTime(ds.Tables[0].Rows[0].ItemArray[18]);
                string link = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[19]);
                string addLine1 = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[20]);
                string addLine2 = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[21]);
                string city = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[22]);
                string zip = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[23]);
                string state = Convert.ToString(ds.Tables[0].Rows[0].ItemArray[24]);

                txtTitle.Value = title;
                txtHost.Value = company;
                txtAddLine1.Value = addLine1;
                txtAddLine2.Value = addLine2;
                txtCity.Value = city;
                ddlState.SelectedValue = state;
                txtZip.Value = zip;
                dateStart.Value = startDate.ToString("yyyy-MM-dd");
                dateRegDeadline.Value = endDate.ToString("yyyy-MM-dd");
                txtHours.Value = weekhrs;
                txtLength.Value = length;
                txtFn.Value = firstName;
                txtLn.Value = lastName;
                txtContPhone.Value = phoneNo;
                txtContEmail.Value = email;
                txtSignUp.Value = link;
                txtDesc.Value = primResp;
                txtSkills.Value = skills;

                bigCommand.Parameters.Clear();
            }

            
        }
        protected void btnSubmit_click(object sender, EventArgs e)
        {

                string resourceIDS = (string)Session["ResourceIDS"];

                string title = txtTitle.Value;
                string company = txtHost.Value;
                string addressLine1 = txtAddLine1.Value;
                string addressLine2 = txtAddLine2.Value;
                string city = txtCity.Value;
                string state = ddlState.Text;
                string zip = txtZip.Value;
                string hours = txtHours.Value;
                string length = txtLength.Value;
                string fn = txtFn.Value;
                string ln = txtLn.Value;
                string phone = txtContPhone.Value;
                string email = txtContEmail.Value;
                string otherReqs = txtSkills.Value;
                string link = txtSignUp.Value;
                string desc = txtDesc.Value;
                DateTime startDate = Convert.ToDateTime(dateStart.Value);
                DateTime expDate = Convert.ToDateTime(dateRegDeadline.Value);


                bigCommand.CommandType = CommandType.StoredProcedure;
                bigCommand.CommandText = "EditTraining";
                bigCommand.Parameters.AddWithValue("@id", resourceIDS);
                bigCommand.Parameters.AddWithValue("@title", title);
                bigCommand.Parameters.AddWithValue("@company", company);
                bigCommand.Parameters.AddWithValue("@addLine1", addressLine1);
                bigCommand.Parameters.AddWithValue("@addLine2", addressLine2);
                bigCommand.Parameters.AddWithValue("@city", city);
                bigCommand.Parameters.AddWithValue("@state", state);
                bigCommand.Parameters.AddWithValue("@zip", zip);
                bigCommand.Parameters.AddWithValue("@startDate", startDate);
                bigCommand.Parameters.AddWithValue("@endDate", expDate);
                bigCommand.Parameters.AddWithValue("@weeklyHrs", hours);
                bigCommand.Parameters.AddWithValue("@trainLength", length);
                bigCommand.Parameters.AddWithValue("@firstName", fn);
                bigCommand.Parameters.AddWithValue("@lastName", ln);
                bigCommand.Parameters.AddWithValue("@phoneNumber", phone);
                bigCommand.Parameters.AddWithValue("@email", email);
                bigCommand.Parameters.AddWithValue("@link", link);
                bigCommand.Parameters.AddWithValue("@description", desc);
                bigCommand.Parameters.AddWithValue("@otherReqs", otherReqs);

                dBConnect.DoUpdateUsingCmdObj(bigCommand);
                bigCommand.Parameters.Clear();

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                "setTimeout(function() { window.location.replace('ManageR.aspx') }, 3000);", true);
        }
    }
}