using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class NewsletterCreate : System.Web.UI.Page
    {
        private DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        private DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {          
            if (!IsPostBack)
            {
                //generateTables();
                generateAll();
            }

            //Selections table
            loadSelections();
        }

        private void loadSelections()
        {
            List<NewsletterItem> selectionList = new List<NewsletterItem>();
            if (Session["NewsletterSelections"] != null)
            {
                selectionList = Session["NewsletterSelections"] as List<NewsletterItem>;
            }
            Selections.DataSource = selectionList;
            Selections.DataBind();
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
            dt = dataSet.Tables[0];
            rpt.DataSource = dt;
            rpt.DataBind();
        }

        private void generateJobs()
        {
            SqlCommand jcmd = new SqlCommand();
            jcmd.CommandType = CommandType.StoredProcedure;
            jcmd.CommandText = "JobSelect";
            DataSet jds = db.GetDataSetUsingCmdObj(jcmd);
            dt = jds.Tables[0];
            rpt.DataSource = dt;
            rpt.DataBind();
        }

        private void generateEvents()
        {
            SqlCommand ecmd = new SqlCommand();
            ecmd.CommandType = CommandType.StoredProcedure;
            ecmd.CommandText = "EventSelect";
            DataSet eds = db.GetDataSetUsingCmdObj(ecmd);
            dt = eds.Tables[0];
            rpt.DataSource = dt;
            rpt.DataBind();
        }

        private void generateTraining()
        {
            SqlCommand tcmd = new SqlCommand();
            tcmd.CommandType = CommandType.StoredProcedure;
            tcmd.CommandText = "TrainingSelect";
            DataSet tds = db.GetDataSetUsingCmdObj(tcmd);
            dt = tds.Tables[0];
            rpt.DataSource = dt;
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


        // triggers from botton click of each row, adds row details to list and list to session
        protected void rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int rowIndex = e.Item.ItemIndex;

            HiddenField hf = rpt.Items[rowIndex].FindControl("hfID") as HiddenField;
            Label lbl = rpt.Items[rowIndex].FindControl("lblName") as Label;
            TextBox txt = rpt.Items[rowIndex].FindControl("txtComment") as TextBox;

            int selectionID = int.Parse(hf.Value);
            string selectionName = lbl.Text;
            string selectionComment = txt.Text;

            List<NewsletterItem> selectionList = new List<NewsletterItem>();
            if (Session["NewsletterSelections"] != null)
            {
                selectionList = Session["NewsletterSelections"] as List<NewsletterItem>;
            }
            selectionList.Add(new NewsletterItem(selectionID, selectionName, selectionComment));
            Session["NewsletterSelections"] = selectionList;
        }

        protected void Selections_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}