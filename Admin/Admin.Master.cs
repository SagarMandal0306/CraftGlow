using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.DataBind();
            }
        }

        protected void logoutAdmin_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                Session["Admin"] = null;
                Response.Redirect("Login.aspx");
            }
            else
            {
              
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected string IsActive(string pageName)
        {
            return Request.Path.IndexOf(pageName, StringComparison.OrdinalIgnoreCase) >= 0 ? "active" : "";
        }

    }
}