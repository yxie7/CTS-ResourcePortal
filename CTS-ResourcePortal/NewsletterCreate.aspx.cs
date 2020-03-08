using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class NewsletterCreate : System.Web.UI.Page
    {
        private DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            int n = 5;
            string ns = n.ToString();

            if (!IsPostBack)
            {
                //generateTables();
                generateAll();
            }
        }
        /*
        protected void btnPreview_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> selections = new Dictionary<string, string>();

            //Job
            foreach (GridViewRow gvr in gvJob.Rows)
            {
                CheckBox chk = (CheckBox)gvr.FindControl("chkSelect");
                if (chk.Checked == true)
                {
                    string id = gvJob.DataKeys[gvr.RowIndex].Value.ToString();
                    string comment = ((TextBox)gvr.FindControl("txtComment")).Text;
                    selections.Add(id, comment);
                }
            }
            //Event
            foreach (GridViewRow gvr in gvEvent.Rows)
            {
                CheckBox chk = (CheckBox)gvr.FindControl("chkSelect");
                if (chk.Checked == true)
                {
                    string id = gvEvent.DataKeys[gvr.RowIndex].Value.ToString();
                    string comment = ((TextBox)gvr.FindControl("txtComment")).Text;
                    selections.Add(id, comment);
                }
            }
            //Training
            foreach (GridViewRow gvr in gvTraining.Rows)
            {
                CheckBox chk = (CheckBox)gvr.FindControl("chkSelect");
                if (chk.Checked == true)
                {
                    string id = gvTraining.DataKeys[gvr.RowIndex].Value.ToString();
                    string comment = ((TextBox)gvr.FindControl("txtComment")).Text;
                    selections.Add(id, comment);
                }
            }

            if (selections.Count != 0)
            {
                JavaScriptSerializer js = new JavaScriptSerializer();
                var query = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(js.Serialize(selections)));
                Response.Redirect("NewsletterPreview.aspx?nl=" + query);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Script", "toasted();", true);

                //ClientScript.RegisterStartupScript(GetType(), "Toast", "toasted();", true);
            }
        }
        */
        protected void txtTitleSearch_TextChanged(object sender, EventArgs e)
        {
            //generateTables(txtTitleSearch.Text);
        }

        private void generateAll()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectResources";
            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
            rpt.DataSource = dataSet;
            rpt.DataBind();
        }

        private void generateJobs()
        {
            SqlCommand jcmd = new SqlCommand();
            jcmd.CommandType = CommandType.StoredProcedure;
            jcmd.CommandText = "JobSelect";
            DataSet jds = db.GetDataSetUsingCmdObj(jcmd);
            rpt.DataSource = jds;
            rpt.DataBind();
        }

        private void generateEvents()
        {
            SqlCommand ecmd = new SqlCommand();
            ecmd.CommandType = CommandType.StoredProcedure;
            ecmd.CommandText = "EventSelect";
            DataSet eds = db.GetDataSetUsingCmdObj(ecmd);
            rpt.DataSource = eds;
            rpt.DataBind();
        }

        private void generateTraining()
        {
            SqlCommand tcmd = new SqlCommand();
            tcmd.CommandType = CommandType.StoredProcedure;
            tcmd.CommandText = "TrainingSelect";
            DataSet tds = db.GetDataSetUsingCmdObj(tcmd);
            rpt.DataSource = tds;
            rpt.DataBind();
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            generateAll();
        }

        protected void btnJob_Click(object sender, EventArgs e)
        {
            generateJobs();
        }

        protected void btnEvent_Click(object sender, EventArgs e)
        {
            generateEvents();
        }

        protected void btnTraining_Click(object sender, EventArgs e)
        {
            generateTraining();
        }

        protected void btnAddSelection_Click(object sender, EventArgs e)
        {

        }

        protected void rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}