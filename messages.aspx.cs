using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class user_messages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null && Session["admin"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {
            Button button = (Button)sender;
            RepeaterItem item = (RepeaterItem)button.NamingContainer;
            Label pdf = (Label)item.FindControl("pdf");
            string fileName = pdf.Text;
            string connectionString = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
            string query = "SELECT path FROM pdf WHERE pdf = @pdf";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@pdf", fileName);
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        string filePath = result.ToString();
                        Response.ContentType = "application/pdf";
                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                        Response.TransmitFile(filePath);
                        Response.End();
                    }
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
            }
    }
}