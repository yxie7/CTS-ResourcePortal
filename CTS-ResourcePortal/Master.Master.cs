using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CTS_ResourcePortal
{
    public partial class Master : System.Web.UI.MasterPage
    {
        private String strcon;

        protected void Page_Load(object sender, EventArgs e)
        {
            //strcon = ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString;
            ////create new sqlconnection and connection to database by using connection string from web.config file
            //SqlConnection con = new SqlConnection(strcon);
            //con.Open();
        }

        public string getConnectionString()
        {
            return strcon;
        }
    }
}