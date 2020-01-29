using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace CTS_ResourcePortal
{
    public partial class NewsletterPreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            Dictionary<string, string> selections = js.Deserialize<Dictionary<string, string>>(System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(Request.QueryString["nl"])));

            //<string,string> selections = js.Deserialize<Dictionary<string,string>>(Server.UrlDecode(Request.QueryString["nl"]));

            foreach(KeyValuePair<string,string> selection in selections)
            {
                string id = selection.Key;
                string comment = selection.Value;
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {

        }
    }
}