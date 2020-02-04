using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            bind();
        }

        private void bind()
        {
            if (Session["tab"] == null)
            {
                DataTable table = new DataTable();
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
                Session["tab"] = table;

            }
            else
            {

            }

            this.grdAllAccounts.DataSource = Session["tab"] as DataTable;
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
            for (int i=0; i < grdAllAccounts.Rows.Count; i++) {
                CheckBox cboxResume = (CheckBox)grdAllAccounts.Rows[i].FindControl("chkRow");

                if (cboxResume.Checked)
                {
                    DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

                    string email = grdAllAccounts.Rows[i].Cells[5].Text;

                    SqlCommand cmd = new SqlCommand();

                    string resumeName = "";
                    string resumeType = "";
                    byte[] bytes = null;

                    string strSQL = "GetResumeFile";
                    SqlParameter emailID = cmd.Parameters.AddWithValue("@Email", email);


                    cmd.CommandText = strSQL;

                    cmd.CommandType = CommandType.StoredProcedure;

                    //this needs to fetch the id of the resume that the administrator wants

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            resumeName = dr["ResumeName"].ToString();
                            resumeType = dr["ResumeType"].ToString();
                            bytes = Convert.FromBase64String(Convert.ToString(dr["ResumeData"].ToString()));
                        }
                    }

                    Response.Clear();
                    Response.ClearHeaders();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = resumeType;
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + resumeName);
                    Response.BinaryWrite(bytes); //
                                                 //Response.BufferOutput = true;
                                                 //Response.OutputStream.Write(bytes, 0, bytes.Length);
                    Response.Flush();
                    Response.End();
                }
            }
            

            //need to grab id of resume to a specific citizen
        }
    }
}