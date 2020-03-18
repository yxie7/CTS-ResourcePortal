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
    public partial class ViewFeedback : System.Web.UI.Page
    {
        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SelectAllFeedback";

                DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
                rptViewR.DataSource = dataSet;
                rptViewR.DataBind();
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SelectResourceTypes";

                ddlResources.DataSource = db.GetDataSetUsingCmdObj(cmd);
                ddlResources.DataTextField = "ResourceTypeDescription";
                ddlResources.DataValueField = "ResourceTypeDescription";
                ListItem listItem = new ListItem(lblDDLResources.Text);
                ddlResources.Items.Add(new ListItem(lblDDLResources.Text));
                ddlResources.DataBind();

            }
        }

        public void Bind(int resourcenum)
        {
            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectFeedbackByID";

            SqlParameter id = new SqlParameter("@id", resourcenum);
            id.Direction = ParameterDirection.Input;
            id.SqlDbType = SqlDbType.Int;
            id.Size = 4;
            cmd.Parameters.Add(id);

            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);

            rptViewR.DataSource = dataSet;
            rptViewR.DataBind();

        }
        public void BindAll()
        {
            cmd.Parameters.Clear();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectAllFeedback";

            DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);

            rptViewR.DataSource = dataSet;
            rptViewR.DataBind();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            //Response.Write(@"<script language='javascript'>alert('Feedback Removed!')</script>");
            string title = "";
            string body = "Feedback Removed!";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            BindAll();
        }

        protected void btnViewR_Click(object sender, EventArgs e)
        {
            int resourcenum = 0;
            if (ddlResources.Text == "Job")
            {
                resourcenum = 1;
                Bind(resourcenum);
            }
            else if (ddlResources.Text == "Event")
            {
                resourcenum = 2;
                Bind(resourcenum);
            }
            else if (ddlResources.Text == "Training Opportunity")
            {
                resourcenum = 3;
                Bind(resourcenum);
            }
            else if (ddlResources.Text == "All Resources")
            {
                BindAll();
            }
        }

        protected void btnAllResources_Click(object sender, EventArgs e)
        {
            BindAll();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            int removed = 0;
            foreach (RepeaterItem item in rptViewR.Items)
            {
                CheckBox checkBox = (CheckBox)item.FindControl("chkRow");
                //HtmlInputCheckBox chkRow = (HtmlInputCheckBox)item.FindControl("chkRow");
                if (checkBox.Checked)
                {
                    Label label = (Label)item.FindControl("lblFeedbackText");

                    string feedbacktext = label.Text;
                    cmd.Parameters.Clear();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetFeedbackIDByText";
                    SqlParameter text = new SqlParameter("@FeedbackText", feedbacktext);
                    text.Direction = ParameterDirection.Input;
                    text.SqlDbType = SqlDbType.VarChar;

                    cmd.Parameters.Add(text);
                    DataSet dataSet = db.GetDataSetUsingCmdObj(cmd);
                    if (dataSet.Tables[0].Rows.Count > 0)
                    {
                        cmd.Parameters.Clear();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "InactivateFeedback";
                        int FeedbackID = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[0]);
                        SqlParameter id = new SqlParameter("@Feedbackid", FeedbackID);
                        id.Direction = ParameterDirection.Input;
                        id.SqlDbType = SqlDbType.Int;
                        id.Size = 4;
                        cmd.Parameters.Add(id);
                        int check = db.DoUpdateUsingCmdObj(cmd);
                        if (check > -1)
                        {
                            removed++;
                        }
                    }
                }
            }

            string title = "";
            string body = "Feedback Removed!";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            BindAll();
        }

    }


}