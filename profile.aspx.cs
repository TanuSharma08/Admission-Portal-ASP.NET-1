using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class user_profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void upd_Click(object sender, EventArgs e)
    {
        string str = WebConfigurationManager.ConnectionStrings["cn"].ToString();
        string name = ((TextBox)profile.Items[0].FindControl("name")).Text;
        string email = ((TextBox)profile.Items[0].FindControl("email")).Text;

        string query = "UPDATE user_login SET name=@name, email=@email WHERE mno=@mno";

        using (SqlConnection cn = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@mno", Session["user"].ToString());

                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }
        Response.Write("<script>alert('Profile Updated Successfully....')</script>");
        profile.DataBind();
    }
}