using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.User
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PasswordBox.Visible=false;
                OtpBox.Visible=false;
            }
        }

        protected bool IsValidEmail(string email)
        {
            string pattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(email);
        }

        protected void sendOtp_Click(object sender, EventArgs e)
        {

            if (IsValidEmail(txtEmail.Text.Trim()))
            {
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("Select * from [user] where email='"+txtEmail.Text.Trim()+"'");
                if (cdb.ds.Tables[0].Rows.Count > 0)
                {
                    string otp = GenerateOTP();
                    SendMailOTP(otp);
                    cdb.Sqlquery("update [user] set last_otp='"+otp+"' where email='"+txtEmail.Text.Trim()+"'");
                    error_text.CssClass = "text-success error";
                    error_text.Text = "Otp Sent to Your Email";
                    OtpBox.Visible = true;
                    sendOtp.Text = "Resend Otp";
                    txtEmail.ReadOnly = true;
                }
                else
                {
                    error_text.Text = "This Email is not Registered !";
                }
            }
            else
            {
                error_text.Text = "Enter a Valid Email !";
            }
        }

        private string GenerateOTP()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString();
        }

        protected void SendMailOTP(string otp)
        {
            string senderEmail = "sahoosubrat419@gmail.com"; 
            string senderPassword = "wxnnjarqjjvciugr"; 
            string receiverEmail = txtEmail.Text;
            string senderDisplayName = "CraftGlow";
            MailAddress senderAddress = new MailAddress(senderEmail, senderDisplayName);

            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.Port = 587; 
            smtp.Credentials = new NetworkCredential(senderEmail, senderPassword);
            smtp.EnableSsl = true;

            MailMessage mail = new MailMessage(senderAddress, new MailAddress(receiverEmail));
            mail.Subject = "OTP for Password Reset";
            mail.Body = $"Your OTP for password reset is: {otp}";

            smtp.Send(mail);
        }


        protected void VerifyOtp_Click(object sender, EventArgs e)
        {
            error_text.CssClass = "text-danger error";
            error_text.Text = "";
            if(!string.IsNullOrEmpty(txtOtp.Text))
            {
                if(txtOtp.Text.Length == 6)
                {
                    Connectiondb cdb = new Connectiondb();
                    cdb.Sqlquery("select last_otp from [user] where email='"+txtEmail.Text+"'");
                    if (txtOtp.Text == cdb.ds.Tables[0].Rows[0]["last_otp"].ToString())
                    {
                        OtpBox.Visible = false;
                        sendOtp.Visible = false;
                        PasswordBox.Visible = true;
                        error_text.CssClass = "text-success error";
                        error_text.Text = "Otp Verified";
                    }
                    else
                    {
                        error_text.Text = "Wrong Otp";
                    }
                }
                else
                {
                    error_text.Text = "Enter Valid Otp";
                }
            }
            else
            {
                error_text.Text = "Enter the Otp";
            }
        }

        protected void ResetPasswordBtn_Click(object sender, EventArgs e)
        {
            error_text.CssClass = "text-danger error";
            error_text.Text = "";
            if(!string.IsNullOrEmpty(txtNewPassword.Text) && !string.IsNullOrEmpty(txtConfirmPassword.Text))
            {
                if(txtNewPassword.Text == txtConfirmPassword.Text)
                {
                    if(txtNewPassword.Text.Length >= 6)
                    {
                        string HashPassword = BCrypt.Net.BCrypt.HashPassword(txtNewPassword.Text, BCrypt.Net.BCrypt.GenerateSalt());
                        Connectiondb cdb = new Connectiondb();
                        cdb.Sqlquery("update [user] set pass = '"+HashPassword+"' where email='"+txtEmail.Text+"'");
                        PasswordBox.Visible = false;
                        error_text.CssClass = "text-success error";
                        error_text.Text = "Password Reset Success";
                    }
                    else
                    {
                        error_text.Text = "Password must be greater than 6 characters";
                    }
                }
                else
                {
                    error_text.Text = "Password Not Match With Confirm Password";
                }
            }
            else
            {
                error_text.Text = "Please fill all the filed";
            }
        }
    }
}