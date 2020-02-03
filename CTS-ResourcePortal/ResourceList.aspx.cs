using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using Utilities;

namespace CTS_ResourcePortal
{
    public partial class ResourceList : System.Web.UI.Page
    {
        DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
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


                        var dateValue = db.GetField("StartDate", i);
                        string date1 = Convert.ToDateTime(dateValue).ToString("MM-dd-yyyy");
                        j.datePosted = Convert.ToDateTime(date1);

                        var dateValue2 = db.GetField("EndDate", i);
                        string date2 = Convert.ToDateTime(dateValue2).ToString("MM-dd-yyyy");
                        j.expDate = Convert.ToDateTime(date2);


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


                        var dateValue = db.GetField("StartDate", i);
                        string date1 = Convert.ToDateTime(dateValue).ToString("MM-dd-yyyy");
                        E.eventDate = Convert.ToDateTime(date1);

                        var dateValue2 = db.GetField("EndDate", i);
                        string date2 = Convert.ToDateTime(dateValue2).ToString("MM-dd-yyyy");
                        E.expDate = Convert.ToDateTime(date2);


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


                        var dateValue = db.GetField("StartDate", i);
                        string date1 = Convert.ToDateTime(dateValue).ToString("MM-dd-yyyy");
                        T.startDate = Convert.ToDateTime(date1);

                        var dateValue2 = db.GetField("EndDate", i);
                        string date2 = Convert.ToDateTime(dateValue2).ToString("MM-dd-yyyy");
                        T.expDate = Convert.ToDateTime(date2);


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
            //Response.Redirect("Job.aspx");
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            Button btn = (Button)sender;


            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            //Fetch value of ResourceID
            string id = gvr.Cells[0].Text;


            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SelectResourceByID";
            cmd.Parameters.AddWithValue("@id", id);

            DataSet JobDs = db.GetDataSetUsingCmdObj(cmd);


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


            lblOtherRequirements.Text = (string)db.GetField("Requirements", 0);

            JobVisibilityControls();

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);


        }

        protected void btnEvent_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Event.aspx");
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
        }

        protected void btnTraining_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Training.aspx");
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
        }

        public void JobVisibilityControls()
        {

        }
        public void EventVisibilityControls()
        {

        }
        public void TrainingVisibilityControls()
        {


        }
    }
}