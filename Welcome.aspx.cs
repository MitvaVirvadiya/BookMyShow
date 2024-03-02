using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace BookMyShow
{
    public partial class Welcome : System.Web.UI.Page
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
                    //Response.Write("Connection Successfull");
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


        protected void adminLogBtn_Click(object sender, EventArgs e)
        {
            fnConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("select count(*) from tblAdmin where Email=@email and Password=@pass", conn);
                cmd.Parameters.AddWithValue("email", emailTxt.Text);
                cmd.Parameters.AddWithValue("pass", passwordTxt.Text);
                int row = (int)cmd.ExecuteScalar();

                if (row > 0)
                {
                    Session["email"] = emailTxt.Text;
                    Response.Redirect("~/AdminPanel.aspx");
                }
                else
                {
                    msgLB.Text = "Incorrect Email or password";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}