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
    public partial class CitizenSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
        }

        protected void ResumeUpload_Click(object sender, EventArgs e)
        {
            DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

            SqlCommand cmd = new SqlCommand();

            string fileExtension, resumeType, resumeName, resumeTitle, strSQL;

            int result = 0, resumeSize;

            try

            {


                if (ResumeUploadSettings.HasFile)

                {

                    resumeSize = ResumeUploadSettings.PostedFile.ContentLength;

                    byte[] resumeData = new byte[resumeSize];



                    ResumeUploadSettings.PostedFile.InputStream.Read(resumeData, 0, resumeSize);

                    resumeName = ResumeUploadSettings.PostedFile.FileName;

                    resumeType = ResumeUploadSettings.PostedFile.ContentType;

                    resumeTitle = resumeName.Split('.')[0];

                    fileExtension = resumeName.Substring(resumeName.LastIndexOf(".")).ToLower();

                    //fileExtension = fileExtension.ToLower();



                    if (fileExtension == ".docx" || fileExtension == ".pdf" || fileExtension == ".doc")

                    {

                        strSQL = "StoreResume";

                        cmd.CommandText = strSQL;

                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ResumeTitle", resumeTitle);

                        cmd.Parameters.AddWithValue("@ResumeType", resumeType);

                        cmd.Parameters.AddWithValue("@ResumeData", resumeData);

                        result = db.DoUpdateUsingCmdObj(cmd);

                        lblStatus.Visible = true;

                        lblStatus.Text = "Resume was successully uploaded.";

                    }

                    else

                    {
                        lblStatus.Visible = true;
                        lblStatus.Text = "Only docx, pdf, and doc file formats supported.";

                    }

                }

            }

            catch (Exception ex)

            {
                lblStatus.Visible = true;
                lblStatus.Text = "Error ocurred: [" + ex.Message + "] cmd=" + result;

            }
        }
    }
}