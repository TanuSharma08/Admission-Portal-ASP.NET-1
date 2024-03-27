using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class user_lv_app : System.Web.UI.Page
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

            string query = "INSERT INTO lv_app (name,email,mno,subject,from_dt,to_dt,lv_reason,status) VALUES (@name,@email,@mno,@subject,@from_dt,@to_dt,@lv_reason,'')";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@name", ((TextBox)r1.Items[0].FindControl("name")).Text);
                command.Parameters.AddWithValue("@email", ((TextBox)r1.Items[0].FindControl("email")).Text);
                command.Parameters.AddWithValue("@mno", ((TextBox)r1.Items[0].FindControl("mno")).Text);
                command.Parameters.AddWithValue("@subject", subject.Text);
                command.Parameters.AddWithValue("@from_dt", from_dt.Text);
                command.Parameters.AddWithValue("@to_dt", to_dt.Text);
                command.Parameters.AddWithValue("@lv_reason", lv_reason.Text);
                
                command.ExecuteNonQuery();
            }


            Response.Write("<script>alert('Applied For Leave...')</script>");
            // Response.Write("<script>setTimeout(function() { window.location.href = 'lv_app.aspx', 1000);</script>")
        }

        Response.Redirect(Request.Url.AbsoluteUri);
    }
}