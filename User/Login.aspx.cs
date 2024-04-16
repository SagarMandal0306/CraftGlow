using System;
using System.Web;
using System.Web.Services;
namespace Craftglow.User
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                string userName =Session["UserName"].ToString();
                // Now you have the username and can use it as needed
                Response.Redirect("Home.aspx");
            }
        }


       

        protected void Signin_Click(object sender, EventArgs e)
        {
            string email = Email.Text;
            string pass = Password.Text;
            if (email != "" && pass != "")
            {
                try
                {
                    Connectiondb cdb = new Connectiondb();
                    cdb.Sqlquery("Select * from [user] where email ='" + email + "'");
                    if (cdb.ds.Tables[0].Rows.Count > 0)
                    {
                        string dbpass = cdb.ds.Tables[0].Rows[0]["pass"].ToString();
                        if(BCrypt.Net.BCrypt.Verify(pass, dbpass))
                        {
                            error_text.CssClass = "success";
                            error_text.Text = "Login Success";
                            Session["Username"] = cdb.ds.Tables[0].Rows[0]["name"].ToString();
                            Session["Useremail"] = email;
                            Session["userid"] = cdb.ds.Tables[0].Rows[0]["userid"].ToString();
                            Response.Redirect("~/User/Home.aspx");
                        }
                        else
                        {
                            error_text.Text = "Wrong Password";
                            return;
                        }
                    }
                    else
                    {
                        error_text.Text = "Invalid Email ! Not Exist";
                        return;
                    }

                }
                catch (Exception ex)
                {

                    error_text.Text = "An error occurred while processing your request. Please try again later.";
                    return;
                }

            }
            else
            {
                error_text.Text = "Please fill all the details";
                return;
            }

        }
    }
}
