using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class AdminUserPage : System.Web.UI.Page
    {
        ArrayList arrProducts = new ArrayList();
        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bind();
        }

        private void bind()
        {

            /*DataTable table = new DataTable();
            table.Columns.Add("firstname");
            table.Columns.Add("lastname");
            table.Columns.Add("username");
            table.Columns.Add("address");
            table.Columns.Add("email");
            table.Columns.Add("phone");
            DataRow dr = table.NewRow();
            dr["firstname"] = "Isabella";
            dr["lastname"] = "Christensen";
            dr["username"] = "IsabellaC";
            dr["address"] = "2244 N Glenwood ST, Philadelphia, PA, 19133";
            dr["email"] = "isabella@gmail.com";
            dr["phone"] = "(171) 555 - 2222";
            table.Rows.Add(dr);
            Session["tab"] = table;*/

            Citizens objProduct;

            objProduct = new Citizens();

            objProduct.Firstname = "Isabella";

            objProduct.Lastname = "Chrsitensen";

            objProduct.Username = "IsabellaC";

            objProduct.Address = "2244 N Glenwood ST, Philadelphia, PA, 19133";

            objProduct.Email = "isabella@gmail.com";

            objProduct.Phone = "(171) 555 - 2222";

            arrProducts.Add(objProduct);

            this.grdAllAccounts.DataSource = arrProducts;
            grdAllAccounts.DataBind();

        }

        protected void Accept1_Click(object sender, EventArgs e)
        {
            string title = "";
            string body = "Citizen Accepted!";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }

        protected void Reject1_Click(object sender, EventArgs e)
        {
            string title = "";
            string body = "Citizen Rejected";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }

        protected void lnkView_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < grdAllAccounts.Rows.Count; i++)
            {
                CheckBox cboxResume = (CheckBox)grdAllAccounts.Rows[i].FindControl("chkRow");

                if (cboxResume.Checked)
                {
                    string email = grdAllAccounts.Rows[i].Cells[5].Text;
                    SqlCommand cmd = new SqlCommand("SELECT ResumeTitle, ResumeType, ResumeData FROM Citizen WHERE Email = '" + email + "'", db.GetConnection());
                    db.GetConnection().Open();
                    SqlDataReader sqlDataReader = cmd.ExecuteReader();
                    while (sqlDataReader.Read())
                    {
                        Response.Clear();
                        Response.Buffer = true;
                        Response.ContentType = sqlDataReader["ResumeType"].ToString();
                        Response.AddHeader("content-disposition", "attachment;filename=" + sqlDataReader["ResumeTitle"].ToString()); // to open file prompt Box open or Save file  
                        Response.Charset = "";
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.BinaryWrite((byte[])sqlDataReader["ResumeData"]);
                        Response.End();

                    }
                    sqlDataReader.Close();
                    db.CloseConnection();

                }

            }
        }
    }

}