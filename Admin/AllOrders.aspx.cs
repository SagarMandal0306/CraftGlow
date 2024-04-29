using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.Admin
{
    public partial class AllOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label adminName = (Label)Master.FindControl("adminName");
                adminName.Text = "Welcome " + Session["Admin"].ToString();
                if (!IsPostBack)
                {
                    ReloadOrders();
                }
            }
        }


        protected void ReloadOrders()
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("select o.orderid,o.purches_price,o.purches_quantity,o.payment_mode,o.datetime,o.status,p.product_name,p.product_image from orders o inner join products p on o.product_id=p.product_id");
            DataTable orderTable = cdb.ds.Tables[0];
            orderTable.Columns.Add("product_image_url", typeof(string));
            string imgPath = "~/Assets/productImgs/";
            foreach (DataRow row in orderTable.Rows)
            {
                string image_name = row["product_image"].ToString();
                row["product_image_url"] = imgPath + image_name;
                row["status"] = row["status"].ToString().ToUpper();
                row["purches_price"] = "₹ " + row["purches_price"];
            }
            OrderListGrid.DataSource = orderTable;
            OrderListGrid.DataBind();
        }

        protected void OrderStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlStatus = (DropDownList)sender;

            GridViewRow row = (GridViewRow)ddlStatus.NamingContainer;

            string orderId = OrderListGrid.DataKeys[row.RowIndex].Value.ToString();

            string status = ddlStatus.SelectedValue;

            if(!string.IsNullOrEmpty(status) )
            {
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("update orders set status='"+status+"' where orderid='"+orderId+"'");
            }
            ReloadOrders();
        }

    }
}