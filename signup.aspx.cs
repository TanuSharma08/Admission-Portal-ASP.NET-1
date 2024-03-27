using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void signin_Click(object sender, EventArgs e)
    {
        string str = WebConfigurationManager.ConnectionStrings["cn"].ToString();

        string check = "select mno from user_login where email = @email or mno = @mno or password = @password";
        string query = "insert into user_login (name, email, mno, password, usertype) values (@name, @email, @mno, @password, 'user')";

        using (SqlConnection cn = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand(check, cn))
            {
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@mno", mno.Text);
                cmd.Parameters.AddWithValue("@password", password.Text);

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        Response.Write("<script>alert('The user already exists')</script>");
                    }
                    else
                    {
                        dr.Close();

                        using (SqlCommand sqlcmd = new SqlCommand(query, cn))
                        {
                            sqlcmd.Parameters.AddWithValue("@name", name.Text);
                            sqlcmd.Parameters.AddWithValue("@email", email.Text);
                            sqlcmd.Parameters.AddWithValue("@mno", mno.Text);
                            sqlcmd.Parameters.AddWithValue("@password", password.Text);

                            sqlcmd.ExecuteNonQuery();
                            Response.Write("<script>alert('Registered as User...')</script>");
                            Response.Write("<script>setTimeout(function() { window.location.href = 'login.aspx' }, 0000);</script>");
                        }
                    }
                }

                cn.Close();
            }
        }

    }
}