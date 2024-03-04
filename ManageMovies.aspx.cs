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
    public partial class ManageMovies : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            fnBindGrid();

            //if (Session["email"] != null)
            //{
            //    String email = Session["email"].ToString();
            //    fnConnection();
            //}
            //else
            //{
            //    Response.Redirect("~/Welcome.aspx");
            //}
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
            String image = "~/assets/" + imageUpload.FileName;
            try
            {
                fnConnection();
                String qry = "INSERT INTO tblMovie(MovieName,Description,ReleaseDate,image,Duration,Genre,Language,Rating) VALUES(@MovieName,@Description,@ReleaseDate,@image,@Duration,@Genre,@Language,@Rating)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("MovieName", movieNameTxt.Text);
                cmd.Parameters.AddWithValue("Description", descriptionTxt.Text);
                cmd.Parameters.AddWithValue("ReleaseDate", releaseDateTxt.Text);
                cmd.Parameters.AddWithValue("image", image);
                cmd.Parameters.AddWithValue("Duration", durationTxt.Text);
                cmd.Parameters.AddWithValue("Genre", genreRadioList.SelectedValue);
                cmd.Parameters.AddWithValue("Language", languageRadioList.SelectedValue);
                cmd.Parameters.AddWithValue("Rating", ratingRadioList.SelectedValue);

                int res = cmd.ExecuteNonQuery();
                imageUpload.SaveAs(Server.MapPath(image));
                if (res > 0)
                {
                    successLB.Text = "Movie is added successfully";
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

        protected void fnBindGrid()
        {
            DataSet ds;
            try
            {
                fnConnection();
                string qry = "SELECT MovieID, MovieName, Description, ReleaseDate, image, Duration, Genre, Language, Rating FROM tblMovie";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                ds = new DataSet();
                sda.Fill(ds);
                dgvMovies.DataSource = ds;
                dgvMovies.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void dgvMovies_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = dgvMovies.SelectedRow;
            movieNameTxt.Text = rw.Cells[3].Text;
            descriptionTxt.Text = rw.Cells[4].Text;
            releaseDateTxt.Text = rw.Cells[5].Text;
            durationTxt.Text = rw.Cells[7].Text;
            for (int i = 0; i < genreRadioList.Items.Count; i++)
            {
                if (genreRadioList.Items[i].Text == rw.Cells[8].Text.Trim())
                {
                    genreRadioList.SelectedIndex = i;
                }
            }

            id = Convert.ToInt32(rw.Cells[2].Text);
            for (int i = 0; i < languageRadioList.Items.Count; i++)
            {
                if (languageRadioList.Items[i].Text == rw.Cells[9].Text.Trim())
                {
                    languageRadioList.SelectedIndex = i;
                }
            }
            for (int i = 0; i < ratingRadioList.Items.Count; i++)
            {
                if (ratingRadioList.Items[i].Text == rw.Cells[10].Text.Trim())
                {
                    ratingRadioList.SelectedIndex = i;
                }
            }
        }

        protected void dgvMovies_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow rw = dgvMovies.Rows[e.RowIndex];
            int delid = Convert.ToInt32(rw.Cells[2].Text);
            try
            {
                fnConnection();
                String qry = "DELETE FROM tblMovie WHERE MovieID=@delid";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("delid", delid);
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    successLB.Text = "Movie is deleted successfully";
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
            string image = "~/assets/" + imageUpload.FileName;
            try
            {
                fnConnection();
                String qry = "UPDATE tblMovie SET MovieName=@MovieName, Description=@Description, ReleaseDate=@ReleaseDate, image=@image, Duration=@Duration, Genre=@Genre, Language=@Language, Rating=@Rating WHERE MovieID=@id";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("MovieName", movieNameTxt.Text);
                cmd.Parameters.AddWithValue("Description", descriptionTxt.Text);
                cmd.Parameters.AddWithValue("ReleaseDate", releaseDateTxt.Text);
                cmd.Parameters.AddWithValue("image", image);
                cmd.Parameters.AddWithValue("Duration", durationTxt.Text);
                cmd.Parameters.AddWithValue("Genre", genreRadioList.SelectedValue);
                cmd.Parameters.AddWithValue("Language", languageRadioList.SelectedValue);
                cmd.Parameters.AddWithValue("Rating", ratingRadioList.SelectedValue);

                cmd.Parameters.AddWithValue("id", id);
                int res = cmd.ExecuteNonQuery();
                imageUpload.SaveAs(Server.MapPath(image));
                if (res > 0)
                {
                    successLB.Text = "Movie is updated successfully";
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

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            movieNameTxt.Text = string.Empty;
            descriptionTxt.Text = string.Empty;
            releaseDateTxt.Text = string.Empty;
            durationTxt.Text = string.Empty;
            foreach (ListItem item in genreRadioList.Items)
            {
                item.Selected = false;
            }

            foreach (ListItem item in languageRadioList.Items)
            {
                item.Selected = false;
            }

            foreach (ListItem item in ratingRadioList.Items)
            {
                item.Selected = false;
            }

        }
    }
}