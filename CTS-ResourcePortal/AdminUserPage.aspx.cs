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

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetAllCitizens";
            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
            rptManageR.DataSource = dataSet;
            rptManageR.DataBind();

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
            //Reference the Repeater Item using Button.
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;

            //Reference the Label and TextBox.
            string email = (item.FindControl("lblEmail") as Label).Text;
            byte[] bytes;
            string fileName, contentType;

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT ResumeTitle, ResumeType, ResumeData FROM Citizen WHERE Email = '" + email + "'";
                cmd.Connection = db.GetConnection();
                db.GetConnection().Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["ResumeData"];
                    contentType = sdr["ResumeType"].ToString();
                    fileName = sdr["ResumeTitle"].ToString();
                }
                db.GetConnection().Close();
            }

            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();

            /*for (int i = 0; i < grdAllAccounts.Rows.Count; i++)
            {
                CheckBox cboxResume = (CheckBox)grdAllAccounts.Rows[i].FindControl("chkHeader");

                if (cboxResume.Checked)
                {

                    RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
                    string email = (item.FindControl("lblName") as Label).Text;
                    byte[] bytes;
                    string fileName, contentType; 
                    
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.CommandText = "select ResumeName, ResumeData, ResumeType from Citizen where Email=@email";
                            cmd.Parameters.AddWithValue("@Id", email);
                            cmd.Connection = con;
                            con.Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                sdr.Read();
                                bytes = (byte[])sdr["Data"];
                                contentType = sdr["ContentType"].ToString();
                                fileName = sdr["Name"].ToString();
                            }
                            con.Close();
                        }
                    
                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = contentType;
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                    Response.BinaryWrite(bytes);
                    Response.Flush();
                    Response.End();


                    /*string email = grdAllAccounts.Rows[i].Cells[5].Text;
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
                        byte[] b = (byte[])sqlDataReader["ResumeData"];
                        Response.OutputStream.Write(b, 0, b.Length);
                        Response.End();

                    }
                    //sqlDataReader.Close();
                    //db.CloseConnection();

                }

            }*/
        }

    }

}