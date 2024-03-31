using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["username"] != null)
            {
                string[] arr = HttpContext.Current.Session["username"].ToString().Split(' ');
                user.InnerText= arr[0].ToUpper();
               
            }
        }





       
    }
}