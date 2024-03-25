using System;
using System.Web;
using System.Web.UI.WebControls.WebParts;
namespace Craftglow.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Admin"] != null) {
                Response.Redirect("Dashboard.aspx");
            }
        }
        
        protected void submit_Click(object sender, EventArgs e)
        {
            string name = username.Text; 
            string pass = password.Text;
            if(name != "" && pass != "")
            {
                try
                {
                    Connectiondb cdb = new Connectiondb();
                    cdb.Sqlquery("Select * from admin where username ='"+name+"'");
                    if (cdb.ds.Tables[0].Rows.Count > 0)
                    {
                        string dbpass = cdb.ds.Tables[0].Rows[0]["password"].ToString();
                        if(dbpass == pass)
                        {
                            error_text.CssClass = "success";
                            error_text.Text = "Login Success";
                            Session["Admin"] = name;
                            Response.Redirect("~/Admin/Dashboard.aspx");
                        }
                        else
                        {
                            error_text.Text = "Wrong Password";
                            return;
                        }
                    }
                    else
                    {
                        error_text.Text = "Invalid Username ! Not Exist";
                        return;
                    }

                }
                catch (Exception ex)
                {
                    // Log the exception details (you can replace this with your logging mechanism)
                    System.Diagnostics.Trace.WriteLine($"Exception: {ex.GetType().FullName}\nMessage: {ex.Message}\nStack Trace: {ex.StackTrace}");

                    // Display a user-friendly error message
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