using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Drawing;
using System.Reflection;

namespace BookMyShow
{
    public partial class ManageTheatre : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                locationDDL.Items.Insert(0, new ListItem("Select Location"));
                if (Session["email"] != null)
                {
                    String email = Session["email"].ToString();
                    fnConnection();
                    fnBindGrid();
                }
                else
                {
                    Response.Redirect("~/Welcome.aspx");
                }
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

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            try
            {
                fnConnection();
                String qry = "INSERT INTO tblTheatre(TheatreName,Location,TotalSeats) VALUES(@TheatreName,@Location,@TotalSeats)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("TheatreName", theatreNameTxt.Text);
                cmd.Parameters.AddWithValue("Location", locationDDL.SelectedValue);
                cmd.Parameters.AddWithValue("TotalSeats", totalSeatsTxt.Text);

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

        protected void fnBindGrid()
        {
            DataSet ds;
            try
            {
                fnConnection();
                string qry = "SELECT TheatreID, TheatreName, Location, TotalSeats FROM tblTheatre";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                ds = new DataSet();
                sda.Fill(ds);
                dgvTheatre.DataSource = ds;
                dgvTheatre.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            theatreNameTxt.Text = string.Empty;
            locationDDL.ClearSelection();
            totalSeatsTxt.Text = string.Empty;
        }

        protected void dgvTheatre_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = dgvTheatre.SelectedRow;
            theatreNameTxt.Text = rw.Cells[2].Text;
            totalSeatsTxt.Text = rw.Cells[4].Text;
            id = Convert.ToInt32(rw.Cells[1].Text);
            for (int i = 0; i < locationDDL.Items.Count; i++)
            {
                if (locationDDL.Items[i].Text == rw.Cells[3].Text.Trim())
                {
                    locationDDL.SelectedIndex = i;
                }
            }

        }

        protected void dgvTheatre_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow rw = dgvTheatre.Rows[e.RowIndex];
            int delid = Convert.ToInt32(rw.Cells[1].Text);
            try
            {
                fnConnection();
                String qry = "DELETE FROM tblTheatre WHERE TheatreID=@delid";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("delid", delid);
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    successLB.Text = "Theatre is deleted successfully";
                }
                else
                {
                    errorLB.Text = "Deletion failed";
                    //conn.Close();
                }
                fnBindGrid();
            }
            catch (Exception ex)
            {
                errorLB.Text = "Error: " + ex;
            }
        }

        protected void editBtn_Click(object sender, EventArgs e)
        {
            try
            {
                fnConnection();
                String qry = "UPDATE tblTheatre SET TheatreName = @TheatreName, Location = @Location, TotalSeats = @TotalSeats WHERE TheatreID = @id";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("TheatreName", theatreNameTxt.Text);
                cmd.Parameters.AddWithValue("Location", locationDDL.SelectedValue);
                cmd.Parameters.AddWithValue("TotalSeats", totalSeatsTxt.Text);
                cmd.Parameters.AddWithValue("id", id);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    successLB.Text = "Theatre is updated successfully";
                }
                else
                {
                    errorLB.Text = "Updation failed";
                }
                fnBindGrid();
            }
            catch (Exception ex)
            {
                errorLB.Text = "Error: " + ex;
            }
        }
    }
}