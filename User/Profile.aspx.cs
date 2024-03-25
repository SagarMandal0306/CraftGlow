using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Craftglow.User
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["UserName"] == null)
            {
                 Response.Redirect("~/User/Login.aspx");
            }
        }


        protected void logout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Session["UserName"] = null;
            HttpContext.Current.Session["UserEmail"] = null;
            Response.Redirect("~/User/Login.aspx");
        }
    }
}