using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Utilities;
using System.Data;

namespace CTS_ResourcePortal
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void finishSignUp_Click(object sender, EventArgs e)
        {
            DBConnect db = new DBConnect(ConfigurationManager.ConnectionStrings["CTSConnectionString"].ConnectionString);

            SqlCommand cmd = new SqlCommand();

            string fileExtension, resumeType, resumeName, resumeTitle, strSQL;

            int result = 0, resumeSize;

            try

            {

                // Use the FileUpload control to get the uploaded data

                if (FileUpload1.HasFile)

                {

                    resumeSize = FileUpload1.PostedFile.ContentLength;

                    byte[] resumeData = new byte[resumeSize];



                    FileUpload1.PostedFile.InputStream.Read(resumeData, 0, resumeSize);

                    resumeName = FileUpload1.PostedFile.FileName;

                    resumeType = FileUpload1.PostedFile.ContentType;

                    resumeTitle = resumeName.Split('.')[0];

                    fileExtension = resumeName.Substring(resumeName.LastIndexOf(".")).ToLower();


                    if (fileExtension == ".docx" || fileExtension == ".pdf" || fileExtension == ".doc")

                    {
                        //this stored procedure will eventually become part of the citizen creation proceudre
                        //with an if statement on whether the citizen uploaded a resume file or not
                        

                        strSQL = "StoreResume";

                        cmd.CommandText = strSQL;

                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ResumeTitle", resumeTitle);

                        cmd.Parameters.AddWithValue("@ResumeType", resumeType);

                        cmd.Parameters.AddWithValue("@ResumeData", resumeData);

                        result = db.DoUpdateUsingCmdObj(cmd);



                        lblStatus.Text = "Resume was successully uploaded.";

                    }

                    else

                    {

                        lblStatus.Text = "Only docx, pdf, and doc file formats supported.";

                    }

                }

            }

            catch (Exception ex)

            {

                lblStatus.Text = "Error ocurred: [" + ex.Message + "] cmd=" + result;

            }
        }
    }
}