using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void login_Click(object sender, EventArgs e)
    {
        string str = WebConfigurationManager.ConnectionStrings["cn"].ToString();

        using (SqlConnection cn = new SqlConnection(str))
        {
            string query = "select * from user_login where mno = @mno and password = @password";

            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.AddWithValue("@mno", mno.Text);
                cmd.Parameters.AddWithValue("@password", password.Text);

                cn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        reader.Read();

                        if (reader["usertype"].ToString() == "admin")
                        {
                            Session["admin"] = mno.Text;
                            Response.Redirect("admin/Default.aspx");
                        }
                        else if (reader["usertype"].ToString() == "user")
                        {
                            Session["user"] = mno.Text;
                            Response.Redirect("user/Default.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Please enter a valid mobile no. or password')</script>");
                    }
                }

                cn.Close();
            }
        }
    }

}