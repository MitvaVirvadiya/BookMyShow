using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyShow
{
    public partial class Register : System.Web.UI.Page
    {

        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnection();
           
        }

        protected void fnConnection()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                conn = new SqlConnection(conStr);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                }
                else
                    Response.Write("Connection Failed");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }


        protected void registerBtn_Click(object sender, EventArgs e)
        {
            String image = "~/assets/" + FileUpload1.FileName;
            try
            {
                fnConnection();
                String qry = "INSERT INTO tblUser(Username,Email,Password,image,Location) VALUES(@Username,@Email,@Password,@image,@Location)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("Username", usernameTxt.Text);
                cmd.Parameters.AddWithValue("Email", emailTxt.Text);
                cmd.Parameters.AddWithValue("Password", passwordTxt.Text);
                cmd.Parameters.AddWithValue("image", image);
                cmd.Parameters.AddWithValue("Location", locationDDL.SelectedValue);
        
                int res = cmd.ExecuteNonQuery();
                FileUpload1.SaveAs(Server.MapPath(image));
                if (res > 0)
                {
                    successLB.Text = "Movie is added successfully";
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    errorLB.Text = "Insertion failed";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                errorLB.Text = "Error: " + ex;
            }
        }
    }
}