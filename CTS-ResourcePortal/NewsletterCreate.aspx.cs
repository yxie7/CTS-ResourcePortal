using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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
                generateAll();
                refreshTables();
            }
        }

        private void refreshTables()
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

            Selections.Columns[1].ItemStyle.Width = 50;
            Selections.Columns[1].ItemStyle.Wrap = true;
        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            List<NewsletterItem> selectionList = new List<NewsletterItem>();
            if (Session["NewsletterSelections"] != null)
            {
                selectionList = Session["NewsletterSelections"] as List<NewsletterItem>;
            }
            if (Selections.Rows.Count > 0)
            {
                Response.Redirect("NewsletterPreview.aspx");
            }
            else
            {
                //ScriptManager.RegisterStartupScript(this, GetType(), "Script", "toasted();", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "Toast", "toasted(\"No selections were made...<br> You can't continue!\");", true);
            }
        }

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

        // triggers from botton click of each row, adds row details to list and list to session
        protected void rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int rowIndex = e.Item.ItemIndex;

            HiddenField hf = rpt.Items[rowIndex].FindControl("hfID") as HiddenField;
            Label lbl = rpt.Items[rowIndex].FindControl("lblName") as Label;
            TextBox txt = rpt.Items[rowIndex].FindControl("txtComment") as TextBox;

            int selectionID = int.Parse(hf.Value);

            List<NewsletterItem> selectionList = new List<NewsletterItem>();
            if (Session["NewsletterSelections"] != null)
            {
                selectionList = Session["NewsletterSelections"] as List<NewsletterItem>;
            }
            //check if resource already added
            if (selectionList.Any(s => s.ResourceID == selectionID))
            { //resource already added
                ClientScript.RegisterStartupScript(GetType(), "Modal", "toasted(\"Resources cannot be added twice!<br>Delete the existing one in the table below before continuing...\");", true);
            }
            else //modal to add the resource pop ups with optional comment box
            {
                hiddenID.Value = hf.Value;
                hiddenName.Value = lbl.Text;

                nliName.InnerHtml = lbl.Text;
                ClientScript.RegisterStartupScript(GetType(), "comment", "commentModal();", true);
            }
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
                    Session["NewsletterSelections"] = selectionList;
                    //ClientScript.RegisterStartupScript(GetType(), "Reload", "reloadTables();", true);
                    break;
                }
            }
            refreshTables();
            ClientScript.RegisterStartupScript(GetType(), "Modal", "toasted(\"Resource has been removed\");", true);
            //Response.Redirect(Request.RawUrl);
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            int selectionID = int.Parse(hiddenID.Value);
            string selectionName = hiddenName.Value;
            selectionName = nliName.InnerText;
            string selectionComment = txtComment.Text;

            List<NewsletterItem> selectionList = new List<NewsletterItem>();
            if (Session["NewsletterSelections"] != null)
            {
                selectionList = Session["NewsletterSelections"] as List<NewsletterItem>;
            }
            //check if resource already added
            if (selectionList.Any(s => s.ResourceID == selectionID))
            { //resource already added
                ClientScript.RegisterStartupScript(GetType(), "Modal", "toasted(\"Resources cannot be added twice!<br>Delete the existing one in the table below before continuing...\");", true);
            }
            else
            { //resource NOT added
                selectionList.Add(new NewsletterItem(selectionID, selectionName, selectionComment));
                Session["NewsletterSelections"] = selectionList;
                refreshTables();
                ClientScript.RegisterStartupScript(GetType(), "Modal", "toasted(\"Resource has been added\");", true);

                hiddenID.Value = "";
                hiddenName.Value = "";
                txtComment.Text = "";
            }
        }
    }
}