using System;
using System.Web;
using System.Web.Services;

namespace Craftglow.User
{
    public partial class Login : System.Web.UI.Page
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
        public static string LoginUser(string Email, string Password)
        {
            try
            {
                // Validate the user credentials against the database
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("select * from [user] where email = '" + Email + "' ");

                if (cdb.ds.Tables[0].Rows.Count > 0)
                {

                    string hashPassword = cdb.ds.Tables[0].Rows[0]["pass"].ToString();
                    if (BCrypt.Net.BCrypt.Verify(Password, hashPassword))
                    {


                        // Login successful
                        // You can store user details in session if needed
                        HttpContext.Current.Session["UserName"] = cdb.ds.Tables[0].Rows[0]["name"].ToString();
                        HttpContext.Current.Session["UserEmail"] = cdb.ds.Tables[0].Rows[0]["email"].ToString();

                        return "success";
                    }
                    else
                    {
                       return "Invalid password";
                    }
                }
                else
                {
                    // Invalid credentials
                    return "Invalid email";
                }
            }
            catch (Exception ex)
            {
                // Log the exception or return an appropriate error message
                return "An error occurred during login. " + ex.Message;
            }
        }
    }
}
