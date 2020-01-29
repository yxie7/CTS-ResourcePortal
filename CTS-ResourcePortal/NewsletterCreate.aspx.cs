﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class NewsletterCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                generateTables();
            }
        }

        private void generateTables()
        {
            List<Job> jl = new List<Job>();
            List<Events> el = new List<Events>();
            List<Training> tl = new List<Training>();

            DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

            //Job
            SqlCommand jcmd = new SqlCommand();
            jcmd.CommandType = CommandType.StoredProcedure;
            jcmd.CommandText = "JobSelect";

            DataSet jds = db.GetDataSetUsingCmdObj(jcmd);
            int count = jds.Tables[0].Rows.Count;
            if (count > 0)
            {
                for (int i = 0; i < count; i++)
                {
                    Job j = new Job();
                    j.resourceID = db.GetField("ResourcesID", i).ToString();
                    j.resourceTitle = db.GetField("ResourceName", i).ToString();
                    jl.Add(j);
                }
            }
            gvJob.DataSource = jl;
            gvJob.DataBind();

            //Event
            SqlCommand ecmd = new SqlCommand();
            ecmd.CommandType = CommandType.StoredProcedure;
            ecmd.CommandText = "EventSelect";

            DataSet eds = db.GetDataSetUsingCmdObj(ecmd);
            count = eds.Tables[0].Rows.Count;
            if (count > 0)
            {
                for (int i = 0; i < count; i++)
                {
                    Events ev = new Events();
                    ev.resourceID = db.GetField("ResourcesID", i).ToString();
                    ev.resourceTitle = db.GetField("ResourceName", i).ToString();
                    el.Add(ev);
                }
            }
            gvEvent.DataSource = el;
            gvEvent.DataBind();

            //Training
            SqlCommand tcmd = new SqlCommand();
            tcmd.CommandType = CommandType.StoredProcedure;
            tcmd.CommandText = "TrainingSelect";

            DataSet tds = db.GetDataSetUsingCmdObj(tcmd);
            count = tds.Tables[0].Rows.Count;
            if (count > 0)
            {
                for (int i = 0; i < count; i++)
                {
                    Training t = new Training();
                    t.resourceID = db.GetField("ResourcesID", i).ToString();
                    t.resourceTitle = db.GetField("ResourceName", i).ToString();
                    tl.Add(t);
                }
            }
            gvTraining.DataSource = tl;
            gvTraining.DataBind();
        }

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
            //Training

            JavaScriptSerializer js = new JavaScriptSerializer();
            var query = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(js.Serialize(selections)));
            Response.Redirect("NewsletterPreview.aspx?nl=" + query);

//            Response.Redirect("NewsletterPreview.aspx?nl=" + Server.UrlEncode(query));
        }
    }
}