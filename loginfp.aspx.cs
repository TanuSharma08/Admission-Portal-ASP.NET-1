using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class loginfp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void confirmpswd_Click(object sender, EventArgs e)
    {
        string str = WebConfigurationManager.ConnectionStrings["cn"].ToString();
        string mno = this.mno.Text;
        string email = this.email.Text;
        string password = this.password.Text;
        string confirmpassword = this.confirmpassword.Text;

        using (SqlConnection cn = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = cn;
                cmd.CommandType = CommandType.Text;

                cmd.CommandText = "select mno from user_login where email = @email and mno = @mno";
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@mno", mno);

                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Close();

                    cmd.CommandText = "update user_login set password = @password where mno = @mno";
                    cmd.Parameters.AddWithValue("@password", password);

                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Your Password Updated Successfully...')</script>");
                    Response.Write("<script>setTimeout(function() { window.location.href = 'login.aspx' }, 0000);</script>");
                }
                else
                {
                    Response.Write("<script>alert('Please enter a valid email or mobile no.')</script>");
                }

                cn.Close();
            }
        }
    }
}