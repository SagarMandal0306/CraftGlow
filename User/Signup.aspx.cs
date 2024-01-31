using System;
using System.Web;
using System.Web.Services;
using System.Xml.Linq;

namespace Craftglow.User
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["UserName"] != null)
            {
                string userName = HttpContext.Current.Session["UserName"].ToString();
                // Now you have the username and can use it as needed

                HttpContext.Current.Response.Redirect("Home.aspx");
            }
            
        }

        [WebMethod]
        public static string RegisterUser(string Name, string Email, string Password, string Contact, string DOB)
        {
            try
            {
                //Check if the email already exists(uncomment the code if needed)
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("select * from [user] where email = '" + Email + "'");
                if (cdb.ds.Tables[0].Rows.Count > 0)
                {
                    return "Email is already exist";
                }

                // Generate a unique user ID
                string userid = "user" + new Random().Next(11111, 99999);
                string date = DateTime.Now.ToString();

                // Insert user data into the database
                cdb.Sqlquery("INSERT INTO [user] (name, email, pass, contact, dob, userid, dnt) VALUES('" + Name + "','" + Email + "','" + Password + "','+91" + Contact + "','" + DOB + "','" + userid + "','" + date + "')");
                // Store user name and email in session
                HttpContext.Current.Session["UserName"] = Name;
                HttpContext.Current.Session["UserEmail"] = Email;

                // You can use HttpContext.Current.Response.Redirect instead of Response.Redirect
                HttpContext.Current.Response.Redirect("Home.aspx",true);
                return "success";
            }
            catch (Exception ex)
            {
                // Log the exception or return an appropriate error message
                return "An error occurred during registration. "+ex;
            }
        }
    }
}
