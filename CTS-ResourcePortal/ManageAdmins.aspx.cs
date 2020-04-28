using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class ManageAdmins : System.Web.UI.Page
    {
        private DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        private DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindActive();
                bindInactive();
            }
        }

        protected void bindActive()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.CommandText = "SelectActiveAdmins";
            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
            dt = dataSet.Tables[0];
            admins.DataSource = dt;
            admins.DataBind();
        }

        protected void bindInactive()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.CommandText = "SelectInactiveAdmins";
            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
            dt = dataSet.Tables[0];
            inactiveAdmins.DataSource = dt;
            inactiveAdmins.DataBind();
        }

        protected void admins_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int rowIndex = e.Item.ItemIndex;
            HiddenField hf = admins.Items[rowIndex].FindControl("adminID") as HiddenField;
            int id = int.Parse(hf.Value);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InactivateAdmin";
            cmd.Parameters.Add(new SqlParameter("@id", id));
            int c = db.DoUpdateUsingCmdObj(cmd);
            if (c > 0)
            {
                bindActive();
                bindInactive();
                lblModalTXT.Text = "Admin has been inactivated.";
                ClientScript.RegisterStartupScript(this.GetType(), "infom", "infom();", true);
            }
        }

        protected void btnCreateNewAdmin_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "newAdmin", "newAdmin();", true);
        }

        protected void btnCreation_Click(object sender, EventArgs e)
        {
            lblModalTXT.Text = "";
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string pw = txtPassword.Text;
            string cpw = txtCPassword.Text;

            if (firstName != "" && lastName != "" && email != "" && phoneNumber != "" && pw != "" && cpw != "")
            {
                if (!CheckIfEmailExist(email))
                {
                    if (txtPassword.Text != txtCPassword.Text)
                    {
                        //lblModalTXT.Text = "Passwords do not match";
                        //ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                    }
                    else
                    {
                        byte[] salt;
                        new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
                        var pbkdf2 = new Rfc2898DeriveBytes(txtPassword.Text, salt, 10000);
                        byte[] hash = pbkdf2.GetBytes(20);
                        byte[] hashBytes = new byte[36];
                        Array.Copy(salt, 0, hashBytes, 0, 16);
                        Array.Copy(hash, 0, hashBytes, 16, 20);
                        string savedPasswordHash = Convert.ToBase64String(hashBytes);

                        SqlCommand objCommand = new SqlCommand();
                        objCommand.CommandType = CommandType.StoredProcedure;
                        objCommand.CommandText = "CreateAdmin";
                        SqlParameter inputParameter = new SqlParameter("@FirstName", firstName);
                        objCommand.Parameters.Add(inputParameter);
                        inputParameter = new SqlParameter("@LastName", lastName);
                        objCommand.Parameters.Add(inputParameter);
                        inputParameter = new SqlParameter("@Email", email);
                        objCommand.Parameters.Add(inputParameter);
                        inputParameter = new SqlParameter("@PhoneNumber", phoneNumber);
                        objCommand.Parameters.Add(inputParameter);
                        inputParameter = new SqlParameter("@Password", savedPasswordHash);
                        objCommand.Parameters.Add(inputParameter);

                        int c = db.DoUpdateUsingCmdObj(objCommand);
                        if (c > 0)
                        {
                            bindActive();
                            bindInactive();
                            lblModalTXT.Text = "A new administrator account has been created.";
                            ClientScript.RegisterStartupScript(this.GetType(), "infom", "infom();", true);
                        }
                    }
                }
                else
                {
                    lblModalTXT.Text = "Email already used for existing account.";
                    ClientScript.RegisterStartupScript(this.GetType(), "infom", "infom();", true);
                }
            }
            else
            {
                lblModalTXT.Text = "Please fill out all the textboxes.";
                ClientScript.RegisterStartupScript(this.GetType(), "infom", "infom();", true);
            }
        }

        public Boolean CheckIfEmailExist(String Email)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "CheckIfAdminExists";
            SqlParameter inputParameter = new SqlParameter("@Email", Email);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.NVarChar;
            objCommand.Parameters.Add(inputParameter);

            DataSet EmailDataSet = db.GetDataSetUsingCmdObj(objCommand);
            if (EmailDataSet.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        protected void inactiveAdmins_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int rowIndex = e.Item.ItemIndex;
            HiddenField hf = inactiveAdmins.Items[rowIndex].FindControl("iadminID") as HiddenField;
            int id = int.Parse(hf.Value);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ActivateAdmin";
            cmd.Parameters.Add(new SqlParameter("@id", id));
            int c = db.DoUpdateUsingCmdObj(cmd);
            if (c > 0)
            {
                bindActive();
                bindInactive();
                lblModalTXT.Text = "Admin has been activated.";
                ClientScript.RegisterStartupScript(this.GetType(), "infom", "infom();", true);
            }
        }

        protected void btnChangePW_Click(object sender, EventArgs e)
        {
            if (true) //validpw
            {
                string user = Session["adminEmail"].ToString();

                byte[] salt;
                new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
                var pbkdf2 = new Rfc2898DeriveBytes(txtCNewPassword.Text, salt, 10000);
                byte[] hash = pbkdf2.GetBytes(20);
                byte[] hashBytes = new byte[36];
                Array.Copy(salt, 0, hashBytes, 0, 16);
                Array.Copy(hash, 0, hashBytes, 16, 20);
                string savedPasswordHash = Convert.ToBase64String(hashBytes);

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandText = "UpdateAdminPassword";
                cmd.Parameters.Add(new SqlParameter("@email", user));
                cmd.Parameters.Add(new SqlParameter("@password", savedPasswordHash));
                int o = db.DoUpdateUsingCmdObj(cmd);
                if (o > 0)
                {
                    lblModalTXT.Text = "Password successfully changed.";
                    ClientScript.RegisterStartupScript(this.GetType(), "infom", "infom();", true);
                }
                else
                {

                    lblModalTXT.Text = "Password change was unsuccessful. Please try again.";
                    ClientScript.RegisterStartupScript(this.GetType(), "infom", "infom();", true);
                }

            }
            else
            {
                lblModalTXT.Text = "Not a valid PW";
                ClientScript.RegisterStartupScript(this.GetType(), "infom", "infom();", true);
            }
        }

        protected void btnUpdatePhone_Click(object sender, EventArgs e)
        {
            string user = Session["adminEmail"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateAdminPhone";

            cmd.Parameters.Add(new SqlParameter("@email", user));
            cmd.Parameters.Add(new SqlParameter("@phone", txtChangePhone.Text));
            int o = db.DoUpdateUsingCmdObj(cmd);
            if (o > 0)
            {
                lblModalTXT.Text = "Phone number successfully updated.";
                ClientScript.RegisterStartupScript(this.GetType(), "infom", "infom();", true);
            }
            else
            {
                lblModalTXT.Text = "Phone number was NOT updated. Please try again.";
                ClientScript.RegisterStartupScript(this.GetType(), "infom", "infom();", true);
            }
        }
    }
}