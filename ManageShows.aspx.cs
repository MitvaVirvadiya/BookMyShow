using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyShow
{
    public partial class ManageShows : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fnBindMovie();
                fnBindTheatre();
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

        protected void fnBindGrid()
        {
            DataSet ds;
            try
            {
                fnConnection();
                string qry = "SELECT S.ShowID, M.MovieID, M.MovieName, T.TheatreID, T.TheatreName, T.Location, S.ShowTime, s.Price\r\nFROM tblMovie M\r\n, tblTheatre T, tblShow S WHERE M.MovieID = S.MovieID\r\nAND T.TheatreID = S.TheatreID;\r\n";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                ds = new DataSet();
                sda.Fill(ds);
                dgvShows.DataSource = ds;
                dgvShows.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void fnBindMovie()
        {
            DataSet ds = new DataSet();
            try
            {
                fnConnection();
                string qry = "SELECT MovieID, MovieName FROM tblMovie";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                ds = new DataSet();
                sda.Fill(ds);
                movieDDL.DataSource = ds;
                movieDDL.DataTextField = "MovieName";
                movieDDL.DataValueField = "MovieID";
                movieDDL.DataBind();
                movieDDL.Items.Insert(0, new ListItem("Select Movie"));
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void fnBindTheatre()
        {
            DataSet ds = new DataSet();
            try
            {
                fnConnection();
                string qry = "SELECT TheatreID, TheatreName, Location FROM tblTheatre";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                ds = new DataSet();
                sda.Fill(ds);

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    row["TheatreName"] = $"{row["TheatreName"]} - {row["Location"]}";
                }

                theatreDDL.DataSource = ds;
                theatreDDL.DataTextField = "TheatreName"; 
                theatreDDL.DataValueField = "TheatreID";
                theatreDDL.DataBind();
                theatreDDL.Items.Insert(0, new ListItem("Select Theatre"));
                conn.Close();
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
                String qry = "INSERT INTO tblShow(MovieID,TheatreID,ShowTime,Price) VALUES(@MovieID,@TheatreID,@ShowTime,@Price)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("MovieID", movieDDL.SelectedValue);
                cmd.Parameters.AddWithValue("TheatreID", theatreDDL.SelectedValue);
                cmd.Parameters.AddWithValue("ShowTime", showTimeTxt.Text);
                cmd.Parameters.AddWithValue("Price", priceTxt.Text);
                
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    successLB.Text = "Show is added successfully";
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
                errorLB.Text = "Error: " + ex;
            }
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            movieDDL.ClearSelection();
            theatreDDL.ClearSelection();
            showTimeTxt.Text = string.Empty;
            priceTxt.Text = string.Empty;
        }

        protected void dgvShows_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = dgvShows.SelectedRow;
            id = Convert.ToInt32(rw.Cells[1].Text);
            for (int i = 0; i < movieDDL.Items.Count; i++)
            {
                if (movieDDL.Items[i].Text == rw.Cells[3].Text)
                {
                    movieDDL.SelectedIndex = i;
                }
            }
            for (int i = 0; i < theatreDDL.Items.Count; i++)
            {
                if (theatreDDL.Items[i].Text == (rw.Cells[5].Text + " - " + rw.Cells[6].Text))
                {
                    theatreDDL.SelectedIndex = i;
                }
            }
            showTimeTxt.Text = rw.Cells[7].Text;
            priceTxt.Text = rw.Cells[8].Text;
        }

        protected void editBtn_Click(object sender, EventArgs e)
        {
            try
            {
                fnConnection();
                String qry = "UPDATE tblShow SET MovieID = @MovieID, TheatreID = @TheatreID, ShowTime = @ShowTime, Price = @Price WHERE ShowID = @id";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("MovieID", movieDDL.SelectedValue);
                cmd.Parameters.AddWithValue("TheatreID", theatreDDL.SelectedValue);
                cmd.Parameters.AddWithValue("ShowTime", showTimeTxt.Text);
                cmd.Parameters.AddWithValue("Price", priceTxt.Text);

                cmd.Parameters.AddWithValue("id", id);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    successLB.Text = "Show is updated successfully";
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

        protected void dgvShows_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow rw = dgvShows.Rows[e.RowIndex];
            int delid = Convert.ToInt32(rw.Cells[1].Text);
            try
            {
                fnConnection();
                String qry = "DELETE FROM tblShow WHERE ShowID=@delid";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("delid", delid);
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    successLB.Text = "Show is deleted successfully";
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
    }
}