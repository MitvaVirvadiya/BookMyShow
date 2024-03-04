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
    }
}