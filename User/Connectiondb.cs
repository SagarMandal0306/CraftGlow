using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Craftglow.User
{
    public class Connectiondb
    {
        SqlConnection conn = new SqlConnection("Data Source=craftglowdb.c3kie4mi2ufk.ap-south-1.rds.amazonaws.com;Initial Catalog=craftglowdb;Persist Security Info=True;User ID=admin;Password=craftglow;");

        public DataSet ds = new DataSet();
        public void Sqlquery(string query)
        {
            SqlDataAdapter adp = new SqlDataAdapter(query, conn);
            adp.Fill(ds);
        }

    }
}