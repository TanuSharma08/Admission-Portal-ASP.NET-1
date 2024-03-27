using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class user_admission : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        othercourse.DataSource = SqlDataSource1;
        othercourse.DataBind();
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        string str = WebConfigurationManager.ConnectionStrings["cn"].ToString();

        string check = "SELECT adhaarno FROM admission WHERE adhaarno=@adhaarno";
        string query = "INSERT INTO admission(fnm,lnm,fathernm,dob,gender,adhaarno,photo,parentprof,codept,designation,address,whatsappno,email,studmno,pmno,lastexam,yrofpassing,instnm,pr,std,schoolnm,course,sem,collegenm,othercourse,status) VALUES(@fnm,@lnm,@fathernm,@dob,@gender,@adhaarno,@photo,@parentprof,@codept,@designation,@address,@whatsappno,@email,@studmno,@pmno,@lastexam,@yrofpassing,@instnm,@pr,@std,@schoolnm,@course,@sem,@collegenm,@othercourse,'pending')";

        using (SqlConnection cn = new SqlConnection(str))
        {
            using (SqlCommand sqlcmd = new SqlCommand(check, cn))
            {
                sqlcmd.Parameters.AddWithValue("@adhaarno", adhaarno.Text);

                cn.Open();

                using (SqlDataReader dr = sqlcmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        Response.Write("<script>alert('The adhaarn no. already exists')</script>");
                    }
                    else
                    {
                        dr.Close();

                        using (SqlCommand cmd = new SqlCommand(query, cn))
                        {
                            cmd.Parameters.AddWithValue("@fnm", fnm.Text);
                            cmd.Parameters.AddWithValue("@lnm", lnm.Text);
                            cmd.Parameters.AddWithValue("@fathernm", fathernm.Text);
                            cmd.Parameters.AddWithValue("@dob", dob.Text);
                            cmd.Parameters.AddWithValue("@gender", gender.SelectedValue);
                            cmd.Parameters.AddWithValue("@adhaarno", adhaarno.Text);
                            cmd.Parameters.AddWithValue("@photo", Path.GetFileName(photo.PostedFile.FileName));
                            cmd.Parameters.AddWithValue("@parentprof", parentprof.Text);
                            cmd.Parameters.AddWithValue("@codept", codept.Text);
                            cmd.Parameters.AddWithValue("@designation", designation.Text);
                            cmd.Parameters.AddWithValue("@address", address.Text);
                            cmd.Parameters.AddWithValue("@whatsappno", whatsappno.Text);
                            cmd.Parameters.AddWithValue("@email", email.Text);
                            cmd.Parameters.AddWithValue("@studmno", studmno.Text);
                            cmd.Parameters.AddWithValue("@pmno", pmno.Text);
                            cmd.Parameters.AddWithValue("@lastexam", lastexam.Text);
                            cmd.Parameters.AddWithValue("@yrofpassing", yrofpassing.Text);
                            cmd.Parameters.AddWithValue("@instnm", instnm.Text);
                            cmd.Parameters.AddWithValue("@pr", pr.Text);
                            cmd.Parameters.AddWithValue("@std", std.Text);
                            cmd.Parameters.AddWithValue("@schoolnm", schoolnm.Text);
                            cmd.Parameters.AddWithValue("@course", course.SelectedValue);
                            cmd.Parameters.AddWithValue("@sem", sem.SelectedValue);
                            cmd.Parameters.AddWithValue("@collegenm", collegenm.Text);
                            cmd.Parameters.AddWithValue("@othercourse", othercourse.SelectedValue);

                            cmd.ExecuteNonQuery();

                            string filePath = Server.MapPath("/images/") + Path.GetFileName(photo.PostedFile.FileName);
                            photo.SaveAs(filePath);

                            Response.Write("<script>alert('Applied for admission successfully...')</script>");
                            Response.Write("<script>window.location='messages.aspx'</script>");
                        }
                    }
                }
                cn.Close();
            }
        }
    }
}