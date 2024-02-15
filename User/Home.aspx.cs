using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Newtonsoft.Json;

namespace Craftglow.User
{
    public partial class Home : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (HttpContext.Current.Session["UserName"] == null)
            //{
            //    Response.Redirect("~/User/Login.aspx");
            //}
           
        }

        public static string ConvertDsToJson(DataSet ds)
        {
            string json = JsonConvert.SerializeObject(ds, Newtonsoft.Json.Formatting.Indented);
            return json;
        }

        [WebMethod]
        public static string GetBannerData()
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("select * from banner");
            string data = ConvertDsToJson(cdb.ds);
            return data ;
        }

       
    }
}