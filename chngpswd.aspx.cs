using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class user_chngpswd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        string str = WebConfigurationManager.ConnectionStrings["cn"].ToString();
        
        string confirmpassword = this.newpassword.Text;

        using (SqlConnection cn = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = cn;
                cmd.CommandType = CommandType.Text;

                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Close();

                    using (SqlCommand cmd2 = new SqlCommand())
                    {
                        cmd2.Connection = cn;
                        cmd2.CommandType = CommandType.Text;

                        cmd2.CommandText = "update user_login set password = @newpassword where mno = @mno";
                        cmd2.Parameters.AddWithValue("@newpassword", this.newpassword.Text);
                      
                        cmd2.ExecuteNonQuery();
                    }

                    Response.Write("<script>alert('Your Password Updated Successfully...')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Please enter a valid email or mobile no. or password')</script>");
                }

                cn.Close();
            }
        }
    }
}