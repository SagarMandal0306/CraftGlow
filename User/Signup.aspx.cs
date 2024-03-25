using System;
using System.Globalization;
using System.Web;
using System.Web.Services;
using System.Xml.Linq;
using BCrypt.Net;

namespace Craftglow.User
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                string userName = Session["UserName"].ToString();

               Response.Redirect("Home.aspx");
            }
            
        }
        protected bool IsValidDate(string dateString)
        {
            return DateTime.TryParseExact(dateString, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out _);
        }

        protected bool IsValidYear(string dateString)
        {
            if (DateTime.TryParseExact(dateString, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime date))
            {
                int year = date.Year;
                int currentYear = DateTime.Now.Year;

                return year >= 1900 && year <= currentYear;
            }

            return false;
        }

        protected void ClearForm()
        {
            Name.Text = "";
            Email.Text = "";
            Password.Text = "";
            Contact.Text = "";
            DOB.Text = "";
        }

        protected void Signin_Click(object sender, EventArgs e)
        {
            string Name = this.Name.Text;
            string Email = this.Email.Text;
            string Password = this.Password.Text;
            string Contact = this.Contact.Text;
            string DOB = this.DOB.Text;

            // Server-side validation
            if (string.IsNullOrEmpty(Name) || string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(Password) || string.IsNullOrEmpty(Contact) || string.IsNullOrEmpty(DOB))
            {
                error_text.Text = "Compulsory to fill all the fields";
                return;
            }

            if (Password.Length < 6)
            {
                error_text.Text = "Your password must be 6 digits or greater.";
                return;
            }

            if (Contact.Length != 10)
            {
                error_text.Text = "Your contact number must be 10 digits.";
                return;
            }

            if (!IsValidDate(DOB))
            {
                error_text.Text = "Invalid date of birth. Please enter a valid date.";
                return;
            }

            if (!IsValidYear(DOB))
            {
                error_text.Text = "Invalid year in the date of birth. Please enter a valid year.";
                return;
            }

            try
            {
                // Continue with the registration process
                string HashPassword = BCrypt.Net.BCrypt.HashPassword(Password, BCrypt.Net.BCrypt.GenerateSalt());

                // Check if the email already exists 
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("select * from [user] where email = '" + Email + "'");
                if (cdb.ds.Tables[0].Rows.Count > 0)
                {
                    error_text.Text = "Email is already exist";
                    return;
                }

                // Generate a unique user ID
                string userid = "user" + new Random().Next(11111, 99999);
                string date = DateTime.Now.ToString();

                // Insert user data into the database
                cdb.Sqlquery("INSERT INTO [user] (name, email, pass, contact, dob, userid, dnt) VALUES('" + Name + "','" + Email + "','" + HashPassword + "','+91" + Contact + "','" + DOB + "','" + userid + "','" + date + "')");

                // Registration successful
                error_text.CssClass = "text-success";
                error_text.Text = "Registration successful";
                ClearForm();
                return;
            }
            catch (Exception ex)
            {
                // Log the exception or return an appropriate error message
                error_text.Text = "An error occurred during registration. " + ex.Message;
            }
        }
    }
}
