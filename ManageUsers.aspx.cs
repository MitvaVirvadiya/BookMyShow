using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyShow
{
    public partial class ManageUsers : System.Web.UI.Page
    {

        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                fnBindGrid();
                String email = Session["email"].ToString();
            }
            else
            {
                Response.Redirect("~/Welcome.aspx");
            }
        }

        protected void fnBindGrid()
        {
            DataSet ds;
            try
            {
                fnConnection();
                string qry = "SELECT* FROM tblUser";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                ds = new DataSet();
                sda.Fill(ds);
                dgvUser.DataSource = ds;
                dgvUser.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
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

    }
}