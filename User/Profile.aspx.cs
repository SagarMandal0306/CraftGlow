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
            else
            {
                string email = HttpContext.Current.Session["Useremail"].ToString();
                GetDetails(email);
            }
        }


        protected void logout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Session["UserName"] = null;
            HttpContext.Current.Session["UserEmail"] = null;
            Response.Redirect("~/User/Login.aspx");
        }

        protected void GetDetails(string email)
        {
           
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("select * from [user] where email='" + email + "'");
            Email.InnerText = cdb.ds.Tables[0].Rows[0]["email"].ToString();
            Phone.InnerText = cdb.ds.Tables[0].Rows[0]["contact"].ToString();
            char[] name = cdb.ds.Tables[0].Rows[0]["name"].ToString().ToCharArray();
            FirstL.InnerText = name[0].ToString().ToUpper();

        }
    }
}