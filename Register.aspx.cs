using System;
using System.Collections.Generic;
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
            Response.Write(usernameTxt.Text);
            Response.Write(emailTxt.Text);
            Response.Write(passwordTxt.Text);
            
            Response.Write(locationDDL.Text);
        }

        protected System.Void registerBtn_Click(System.Object sender, System.EventArgs e)
        {
            
            try
            {
                fnConnection();
                String qry = "INSERT INTO tblTheatre(Username,Email,Password,image,Location) VALUES(@Username,@Email,@Password,@image,@Location)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("Username", usernameTxt.Text);
                cmd.Parameters.AddWithValue("Email", emailTxt.SelectedValue);
                cmd.Parameters.AddWithValue("passwordTxt", totalSeatsTxt.Text);
                //cmd.Parameters.AddWithValue("image", totalSeatsTxt.Text);
                cmd.Parameters.AddWithValue("Location", locationDDL.selected);
                // hello vandan


                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    successLB.Text = "Theatre is added successfully";
                }
                else
                {
                    errorLB.Text = "Insertion failed";
                }
                conn.Close();
                fnBindGrid();
            }
            catch (Exception ex)
            {
                errorLB.Text = "Error: "+ ex;
            }
        }

        
      

    }
}