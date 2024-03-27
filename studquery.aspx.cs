using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class user_studquery : System.Web.UI.Page
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

            string q = "INSERT INTO studquery (name,email,mno,query,reply) VALUES (@name,@email,@mno,@query,'')";

            using (SqlCommand command = new SqlCommand(q, connection))
            {
                command.Parameters.AddWithValue("@name", ((TextBox)r1.Items[0].FindControl("name")).Text);
                command.Parameters.AddWithValue("@email", ((TextBox)r1.Items[0].FindControl("email")).Text);
                command.Parameters.AddWithValue("@mno", ((TextBox)r1.Items[0].FindControl("mno")).Text);
                command.Parameters.AddWithValue("@query", query.Text);


                command.ExecuteNonQuery();
            }


            Response.Write("<script>alert('Query Sent...')</script>");
        }

        Response.Redirect(Request.Url.AbsoluteUri);
    }
}