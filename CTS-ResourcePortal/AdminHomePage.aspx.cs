using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        private DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        private SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                cmd.CommandType = CommandType.StoredProcedure;

                List<Job> jl = new List<Job>();
                cmd.CommandText = "JobSelect";

                DataSet ds = db.GetDataSetUsingCmdObj(cmd);
                int count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    for (int i = 0; i < count; i++)
                    {
                        Job j = new Job();

                        j.resourceID = db.GetField("ResourcesID", i).ToString();
                        j.resourceTitle = db.GetField("ResourceName", i).ToString();
                        j.email = db.GetField("ContactEmail", i).ToString();

                        if (!(String.IsNullOrEmpty(db.GetField("StartDate", i).ToString())))
                        {
                            /*var dateValue = db.GetField("StartDate", i);
                            string date1 = Convert.ToDateTime(dateValue).ToString("MM-dd-yyyy");
                            //j.datePosted = Convert.ToDateTime(date1);*/

                            var dateValueStart = db.GetField("StartDate", i);
                            DateTime dateTimeStart = Convert.ToDateTime(dateValueStart).Date;
                            string dateStart = dateTimeStart.ToString("MM-dd-yyyy");
                            j.datePosted = dateStart;
                        }

                        if (!(String.IsNullOrEmpty(db.GetField("EndDate", i).ToString())))
                        {
                            /*var dateValue2 = db.GetField("EndDate", i);
                            string date2 = Convert.ToDateTime(dateValue2).ToString("MM-dd-yyyy");
                            //j.expDate = Convert.ToDateTime(date2);*/

                            var dateValueEnd = db.GetField("EndDate", i);
                            DateTime dateTimeEnd = Convert.ToDateTime(dateValueEnd).Date;
                            string dateEnd = dateTimeEnd.ToString("MM-dd-yyyy");
                            j.expDate = dateEnd;
                        }



                        j.addressLine1 = db.GetField("AddressLine", i).ToString();
                        j.city = db.GetField("LocationCity", i).ToString();
                        j.zipCode = db.GetField("LocationZip", i).ToString();
                        j.state = db.GetField("State", i).ToString();

                        j.addressLine2 = j.addressLine1 + ", " + j.city + ", " + j.zipCode + ", " + j.state;

                        jl.Add(j);
                    }

                    gvJob.DataSource = jl;
                    gvJob.DataBind();
                    cmd.Parameters.Clear();



                }

                List<Events> el = new List<Events>();
                cmd.CommandText = "EventSelect";

                DataSet eventsDS = db.GetDataSetUsingCmdObj(cmd);
                int count1 = eventsDS.Tables[0].Rows.Count;
                if (count1 > 0)
                {
                    for (int i = 0; i < count1; i++)
                    {
                        Events E = new Events();
                        E.resourceID = db.GetField("ResourcesID", i).ToString();
                        E.resourceTitle = db.GetField("ResourceName", i).ToString();
                        E.email = db.GetField("ContactEmail", i).ToString();


                        if (!(String.IsNullOrEmpty(db.GetField("StartDate", i).ToString())))
                        {
                            /*var dateValue = db.GetField("StartDate", i);
                            string date1 = Convert.ToDateTime(dateValue).ToString("MM-dd-yyyy");
                            //E.eventDate = Convert.ToDateTime(date1);*/

                            var dateValueStart = db.GetField("StartDate", i);
                            DateTime dateTimeStart = Convert.ToDateTime(dateValueStart).Date;
                            string dateStart = dateTimeStart.ToString("MM-dd-yyyy");
                            E.eventDate = dateStart;
                        }

                        if (!(String.IsNullOrEmpty(db.GetField("EndDate", i).ToString())))
                        {
                            /*var dateValue2 = db.GetField("EndDate", i);
                            string date2 = Convert.ToDateTime(dateValue2).ToString("MM-dd-yyyy");
                            //E.expDate = Convert.ToDateTime(date2);*/

                            var dateValueEnd = db.GetField("EndDate", i);
                            DateTime dateTimeEnd = Convert.ToDateTime(dateValueEnd).Date;
                            string dateEnd = dateTimeEnd.ToString("MM-dd-yyyy");
                            E.expDate = dateEnd;

                        }



                        E.addressLine1 = db.GetField("AddressLine", i).ToString();
                        E.city = db.GetField("LocationCity", i).ToString();
                        E.zipCode = db.GetField("LocationZip", i).ToString();
                        E.state = db.GetField("State", i).ToString();

                        E.addressLine2 = E.addressLine1 + ", " + E.city + ", " + E.zipCode + ", " + E.state;

                        el.Add(E);


                    }
                    gvEvent.DataSource = el;
                    gvEvent.DataBind();
                    cmd.Parameters.Clear();
                }

                List<Training> tr = new List<Training>();
                cmd.CommandText = "TrainingSelect";

                DataSet trainingsDS = db.GetDataSetUsingCmdObj(cmd);
                int count2 = trainingsDS.Tables[0].Rows.Count;
                if (count2 > 0)
                {
                    for (int i = 0; i < count2; i++)
                    {
                        Training T = new Training();
                        T.resourceID = db.GetField("ResourcesID", i).ToString();
                        T.resourceTitle = db.GetField("ResourceName", i).ToString();
                        T.email = db.GetField("ContactEmail", i).ToString();


                        if (!(String.IsNullOrEmpty(db.GetField("StartDate", i).ToString())))
                        {
                            /*var dateValue = db.GetField("StartDate", i);
                            string date1 = Convert.ToDateTime(dateValue).ToString("MM-dd-yyyy");
                            //T.startDate = Convert.ToDateTime(date1);*/

                            var dateValueStart = db.GetField("StartDate", i);
                            DateTime dateTimeStart = Convert.ToDateTime(dateValueStart).Date;
                            string dateStart = dateTimeStart.ToString("MM-dd-yyyy");
                            T.startDate = dateStart;
                        }

                        if (!(String.IsNullOrEmpty(db.GetField("EndDate", i).ToString())))
                        {
                            /*var dateValue2 = db.GetField("EndDate", i);
                            string date2 = Convert.ToDateTime(dateValue2).ToString("MM-dd-yyyy");
                            //T.expDate = Convert.ToDateTime(date2);*/

                            var dateValueEnd = db.GetField("EndDate", i);
                            DateTime dateTimeEnd = Convert.ToDateTime(dateValueEnd).Date;
                            string dateEnd = dateTimeEnd.ToString("MM-dd-yyyy");
                            T.expDate = dateEnd;
                        }


                        T.addressLine1 = db.GetField("AddressLine", i).ToString();
                        T.city = db.GetField("LocationCity", i).ToString();
                        T.zipCode = db.GetField("LocationZip", i).ToString();
                        T.state = db.GetField("State", i).ToString();

                        T.addressLine2 = T.addressLine1 + ", " + T.city + ", " + T.zipCode + ", " + T.state;

                        tr.Add(T);

                    }

                    gvTraining.DataSource = tr;
                    gvTraining.DataBind();
                }
            }
         }

        protected void btnJob_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            Button btn = (Button)sender;


            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            //Fetch value of ResourceID
            string id = gvJob.DataKeys[gvr.RowIndex].Value.ToString();


            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectResourceByID";
            cmd.Parameters.AddWithValue("@id", id);

            DataSet JobDs = db.GetDataSetUsingCmdObj(cmd);


            myHeader.InnerHtml = (string)db.GetField("ResourceName", 0);
            lblCompanyName.Text = (string)db.GetField("Company", 0);
            lblResponsibilities.Text = (string)db.GetField("Description", 0);
            lblHours.Text = (string)db.GetField("WeeklyHours", 0);
            //lblLength.Text = (string)db.GetField("Length", 0);

            string addressLine1 = (string)db.GetField("AddressLine", 0);
            string city = (string)db.GetField("LocationCity", 0);
            string zipCode = (string)db.GetField("LocationZip", 0);
            string state = (string)db.GetField("State", 0);

            lblLocation.Text = addressLine1 + ", " + city + ", " + zipCode + ", " + state;

            lblContact.Text = (string)db.GetField("ContactEmail", 0);


            var dateValue = db.GetField("StartDate", 0);
            lblPosted.Text = Convert.ToDateTime(dateValue).ToString("MM-dd-yyyy");


            var dateValue2 = db.GetField("EndDate", 0);
            lblExpired.Text = Convert.ToDateTime(dateValue2).ToString("MM-dd-yyyy");

            //lblAttire.Text = (string)db.GetField("Attire", 0);

            lblOtherRequirements.Text = (string)db.GetField("Requirements", 0);

            btnFeedback.CommandArgument = db.GetField("ResourcesId", 0).ToString();

            JobVisibilityControls();

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            cmd.Parameters.Clear();
        }

        protected void btnEvent_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            Button btn = (Button)sender;


            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            //Fetch value of ResourceID
            string id = gvEvent.DataKeys[gvr.RowIndex].Value.ToString();


            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectResourceByID";
            cmd.Parameters.AddWithValue("@id", id);

            DataSet EventDs = db.GetDataSetUsingCmdObj(cmd);


            myHeader.InnerHtml = (string)db.GetField("ResourceName", 0);
            lblCompanyName.Text = (string)db.GetField("Company", 0);
            lblResponsibilities.Text = (string)db.GetField("Description", 0);


            //lblLength.Text = (string)db.GetField("Length", 0);

            string addressLine1 = (string)db.GetField("AddressLine", 0);
            string city = (string)db.GetField("LocationCity", 0);
            string zipCode = (string)db.GetField("LocationZip", 0);
            string state = (string)db.GetField("State", 0);

            lblLocation.Text = addressLine1 + ", " + city + ", " + zipCode + ", " + state;

            lblContact.Text = (string)db.GetField("ContactEmail", 0);


            var dateValue = db.GetField("StartDate", 0);
            lblPosted.Text = Convert.ToDateTime(dateValue).ToString("MM-dd-yyyy");


            var dateValue2 = db.GetField("StartTime", 0);
            string starttime = dateValue2.ToString();

            var dateValue3 = db.GetField("EndTime", 0);
            string endtime = dateValue3.ToString();

            lblStartEnd.Text = "From: " + starttime + " To: " + endtime;

            lblAttire1.Text = (string)db.GetField("Attire", 0);

            btnFeedback.CommandArgument = db.GetField("ResourcesId", 0).ToString();

            EventVisibilityControls();

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            cmd.Parameters.Clear();
        }

        protected void btnTraining_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            Button btn = (Button)sender;


            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            //Fetch value of ResourceID
            string id = gvTraining.DataKeys[gvr.RowIndex].Value.ToString();


            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectResourceByID";
            cmd.Parameters.AddWithValue("@id", id);

            DataSet TrainingDs = db.GetDataSetUsingCmdObj(cmd);


            myHeader.InnerHtml = (string)db.GetField("ResourceName", 0);
            lblCompanyName.Text = (string)db.GetField("Company", 0);
            lblResponsibilities.Text = (string)db.GetField("Description", 0);
            lblHours.Text = (string)db.GetField("WeeklyHours", 0);
            lblLength.Text = (string)db.GetField("Length", 0);

            string addressLine1 = (string)db.GetField("AddressLine", 0);
            string city = (string)db.GetField("LocationCity", 0);
            string zipCode = (string)db.GetField("LocationZip", 0);
            string state = (string)db.GetField("State", 0);

            lblLocation.Text = addressLine1 + ", " + city + ", " + zipCode + ", " + state;

            lblContact.Text = (string)db.GetField("ContactEmail", 0);


            var dateValue = db.GetField("StartDate", 0);
            lblPosted.Text = Convert.ToDateTime(dateValue).ToString("MM-dd-yyyy");


            var dateValue2 = db.GetField("EndDate", 0);
            lblExpired.Text = Convert.ToDateTime(dateValue2).ToString("MM-dd-yyyy");

            var dateValue3 = db.GetField("StartTime", 0);
            string starttime = dateValue3.ToString();

            var dateValue4 = db.GetField("EndTime", 0);
            string endtime = dateValue4.ToString();

            lblStartEnd.Text = "From: " + starttime + " To: " + endtime;


            lblOtherRequirements.Text = (string)db.GetField("Requirements", 0);


            btnFeedback.CommandArgument = db.GetField("ResourcesId", 0).ToString();

            TrainingVisibilityControls();

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

            cmd.Parameters.Clear();
        }

        public void JobVisibilityControls()
        {
            lblExpired.Visible = true;
            lblExpiration.Visible = true;
            lblCompaniesName.Visible = true;
            lblOtherReqs.Visible = true;
            lblOtherRequirements.Visible = true;
            lblHostedBy.Visible = false;
            lblStartEndTime.Visible = false;
            lblStartEnd.Visible = false;
            lblAttire.Visible = false;
            lblAttire1.Visible = false;
            lblStartDt.Visible = false;
        }
        public void EventVisibilityControls()
        {
            StartEndTime.Visible = true;
            lblDtPosted.Visible = false;
            lblExpired.Visible = false;
            lblExpiration.Visible = false;
            lblCompaniesName.Visible = false;
            lblHostedBy.Visible = true;
            lblStartEndTime.Visible = true;
            lblStartEnd.Visible = true;
            lblOtherReqs.Visible = false;
            lblOtherRequirements.Visible = false;
            lblAttire.Visible = true;
            lblAttire1.Visible = true;
        }
        public void TrainingVisibilityControls()
        {
            StartEndTime.Visible = true;

            lblDtPosted.Visible = false;
            lblStartDt.Visible = true;
            lblExpired.Visible = true;
            lblExpiration.Visible = true;
            lblCompaniesName.Visible = false;
            lblHostedBy.Visible = true;
            lblStartEndTime.Visible = true;
            lblStartEnd.Visible = true;
            lblOtherReqs.Visible = true;
            lblOtherRequirements.Visible = true;
            lblAttire.Visible = false;
            lblAttire1.Visible = false;

        }

        protected void btnFeedback_Click(object sender, EventArgs e)
        {
            // Append data using key-value pairs to the URL

            // After the Full URL, absolute path to a file, or relative path to a file and a Filename,

            // the ? symbol and key-value pair list must follow the filename.

            // Each key-value pair must be separated by the & symbol

            // Format: ?Key1=value1&Key2=value2&KeyN=valueN

            Response.Redirect("Feedback.aspx?resource=" + myHeader.InnerHtml + "&ID=" + btnFeedback.CommandArgument);


        }

        protected void txtTitleSearch_TextChanged(object sender, EventArgs e)
        {
            //generateTables(txtTitleSearch.Text);
        }

        protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                cell[0].Attributes.Add("data-header", "Title");
                cell[1].Attributes.Add("data-header", "Contact");
                cell[2].Attributes.Add("data-header", "Location");
                cell[3].Attributes.Add("data-header", "Date Posted");
                cell[4].Attributes.Add("data-header", "Date Expire");
            }
        }
       
    }
}