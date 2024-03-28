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
    public partial class Home : System.Web.UI.Page
    {

        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static string email = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                email = Session["email"].ToString();
                fnFetchuserDetails();
                DisplayMovieDtlFn();
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
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


        public void fnFetchuserDetails()
        {
            try
            {
                fnConnection();
                string qry = "SELECT * FROM tblUser WHERE Email=@email";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@email", email);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    emailTxt.Text = dr["Email"].ToString();
                    profileControl.ImageUrl = dr["image"].ToString();
                }
                dr.Close();
            }
            catch (Exception e)
            {
                Response.Write("Error: " + e.ToString());
            }
        }

        public void DisplayMovieDtlFn()
        {
            try
            {
                fnConnection();
                DataSet ds = new DataSet(); 
                string qry = "SELECT MovieName, Description, image FROM tblMovie";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);        
                DisMovieDtl.DataSource = ds;
                DisMovieDtl.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}