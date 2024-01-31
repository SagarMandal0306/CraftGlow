using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Craftglow.User
{
    public partial class Signup : System.Web.UI.Page
    {
        Random rand = new Random();
        Connectiondb cdb = new Connectiondb();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {

            string name = Name.Text;
            string email = Email.Text;
            string pass = Password.Text;
            string con = Contact.Text;
            string dob = DOB.Text;
            string userid = "user" + rand.Next(11111, 99999);
            string date = DateTime.Now.ToString();

            if(name!="" || email != "" || pass != ""|| con !="" || dob != "")
            {
                //cdb.Sqlquery("select * from user where email = '" + email + "'");
                //if (cdb.ds.Tables[0].Rows.Count > 0)
                //{
                //    Err.InnerText = "Email is already exist";
                //}
                //else
                //{
                    if(con.Length==10 && pass.Length > 6)
                    {
                        cdb.Sqlquery("Insert into [user] (name,email,pass,contact,dob,userid,dnt) values('"+name+"','"+email+"','"+pass+"','+91"+con+"','"+dob+"','"+userid+"','"+date+"')");  
                    }
                //}
            }
        }
    }
}