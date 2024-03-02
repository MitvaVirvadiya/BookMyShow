using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyShow
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["email"] != null)
            {
                String email = Session["email"].ToString();
                emailTxt.Text = email;
            } else
            {
                Response.Redirect("~/Welcome.aspx");
            }
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session.Clear(); 
            Response.Redirect("~/Welcome.aspx");
        }

    }
}