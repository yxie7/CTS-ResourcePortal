using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
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
            //Selections table
            if (!IsPostBack)
            {
                if (Request.QueryString["filter"] == "1")
                {
                    generateJobs();
                }
                else if (Request.QueryString["filter"] == "2")
                {
                    generateEvents();
                }
                else if (Request.QueryString["filter"] == "3")
                {
                    generateTraining();
                }
                else
                {
                    //generateTables();
                    generateAll();
                }
                loadSelections();
            }

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
            if (Selections.Rows.Count > 0)
            {
                Selections.UseAccessibleHeader = true;
                Selections.HeaderRow.TableSection = TableRowSection.TableHeader;
                Selections.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            if (Session["NewsletterSelections"] != null)
            {
                Response.Redirect("NewsletterPreview.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Script", "toasted();", true);

                //ClientScript.RegisterStartupScript(GetType(), "Toast", "toasted();", true);
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

        private DataTable updateResourceList(DataTable dt)
        {
            List<NewsletterItem> selectionList = new List<NewsletterItem>();
            if (Session["NewsletterSelections"] != null)
            {
                selectionList = Session["NewsletterSelections"] as List<NewsletterItem>;
            }
            foreach (NewsletterItem item in selectionList)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (int.Parse(row["ResourceID"].ToString()) == item.ResourceID)
                    {
                        row.Delete();
                    }
                }
            }
            dt.AcceptChanges();

            return dt;
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
            //generateAll();
            Response.Redirect("NewsletterCreate.aspx");

        }

        protected void btnJob_Click(object sender, EventArgs e)
        {
            //generateJobs();
            Response.Redirect("NewsletterCreate.aspx?filter=1");
        }

        protected void btnEvent_Click(object sender, EventArgs e)
        {
            //generateEvents();
            Response.Redirect("NewsletterCreate.aspx?filter=2");
        }

        protected void btnTraining_Click(object sender, EventArgs e)
        {
            //generateTraining();
            Response.Redirect("NewsletterCreate.aspx?filter=3");
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

            Response.Redirect(Request.RawUrl);

            //UpdatePanel.Update();
            //ScriptManager.RegisterStartupScript(this, GetType(), "bindDataTable", "bindDataTable();", true);
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            int rowIndex = ((sender as Button).NamingContainer as GridViewRow).RowIndex;
            List<NewsletterItem> selectionList = new List<NewsletterItem>();
            if (Session["NewsletterSelections"] != null)
            {
                selectionList = Session["NewsletterSelections"] as List<NewsletterItem>;
            }
            foreach (NewsletterItem item in selectionList)
            {
                if (item.ResourceID == int.Parse(Selections.DataKeys[rowIndex].Value.ToString()))
                {
                    selectionList.Remove(item);
                    break;
                }
            }
        }
    }
}