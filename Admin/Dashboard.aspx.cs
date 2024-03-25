using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"]  == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label adminName = (Label)Master.FindControl("adminName");
                adminName.Text = "Welcome "+Session["Admin"].ToString();
            }
        }
    }
}