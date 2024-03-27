using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class user_feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        string cn = WebConfigurationManager.ConnectionStrings["cn"].ToString();

        using (SqlConnection connection = new SqlConnection(cn))
        {
            connection.Open();

            string query = "INSERT INTO feedback (name,email,mno,feedback) VALUES (@name,@email,@mno,@feedback)";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@name", ((TextBox)r1.Items[0].FindControl("name")).Text);
                command.Parameters.AddWithValue("@email", ((TextBox)r1.Items[0].FindControl("email")).Text);
                command.Parameters.AddWithValue("@mno", ((TextBox)r1.Items[0].FindControl("mno")).Text);
                command.Parameters.AddWithValue("@feedback", feedback.Text.Trim());

                command.ExecuteNonQuery();
            }


            Response.Write("<script>alert('Thank you for your feedback...')</script>");
            // Response.Write("<script>setTimeout(function() { window.location.href = 'feedback.aspx', 1000);</script>")
        }

        Response.Redirect(Request.Url.AbsoluteUri);
    }
}