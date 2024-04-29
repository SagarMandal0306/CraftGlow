using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.User
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userid"] != null)
            {
                if (!IsPostBack)
                {
                    GetOrdersHistory();
                }
            }
            else
            {
                Response.Redirect("~/User/Login.aspx");
            }
        }

        protected void GetOrdersHistory()
        {
            string userid = HttpContext.Current.Session["userid"].ToString();
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("Select o.orderid,o.purches_price,o.purches_quantity,o.payment_mode,o.datetime,o.status,p.product_name,p.product_image from orders o inner join products p on p.product_id=o.product_id  where o.userid='" + userid + "' order by o.id desc");
            DataTable orders = cdb.ds.Tables[0];
            foreach (DataRow order in orders.Rows)
            {
                string productname = order["product_name"].ToString();
                string productImg = order["product_image"].ToString();
                string productQty = order["purches_quantity"].ToString();
                string productprice = order["purches_price"].ToString();
                string orderID = order["orderid"].ToString();
                string paymode = order["payment_mode"].ToString();
                string status = order["status"].ToString();
                DateTime orderDateTime = Convert.ToDateTime(order["datetime"]);
                string statusHtml = "";
                if (status == "Pending")
                {
                     statusHtml = $@"<span class=""text-danger"">Order Pending</span>";
                }else if(status=="On The Way")
                {
                     statusHtml = $@"<span class=""text-secondary"">On The Way</span>";
                }else if(status== "Delivered")
                {
                     statusHtml = $@"<span class=""text-success"">Order Delivered</span>";
                }
                string html =
                    $@"<div class=""order-box"">
                    <div class=""left"">
                        <img src=""../Assets/productImgs/{productImg}"" />
                        <div class=""product-info"">
                            <h3>{productname}</h3>
                            <span>Quantity: <span>{productQty}</span></span>
                            <span>Order Placed On: {orderDateTime}</span>
                            <span>Order ID #{orderID}</span>
                        </div>
                    </div>
                    <div class=""mid"">
                        <span>₹ {productprice}</span>
                        <span>{paymode}</span>
                    </div>
                    <div class=""right"">
                        {statusHtml}
                    </div>
                </div>";
                ordersContainer.InnerHtml += html;
            }
        }

    }
}