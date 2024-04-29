 using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.User
{
    public partial class Addtocart : System.Web.UI.Page
    {
        protected List<Product> Products { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userid"] != null)
            {
                allcartdata();
                if (!IsPostBack)
                {
                    addProduct();
                    deleteCart();
                    updateqty();
                    SetAddress();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
}

        protected void addProduct()
        {
            if (Request.QueryString["id"] != null )
            {
                string id = Request.QueryString["id"];
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("select * from products where product_id='" + id + "'");
                string name = cdb.ds.Tables[0].Rows[0]["product_name"].ToString();
                int price =Convert.ToInt32( cdb.ds.Tables[0].Rows[0]["price"]);
                
                Connectiondb db = new Connectiondb();
                db.Sqlquery("select * from addtocart where product_id='" + id + "' and userid='" + Session["userid"].ToString() + "'");
                if (db.ds.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Addtocart.aspx");
                }
                else
                {

                DateTime dt =  DateTime.Now;
                int qty = Request.QueryString["qty"]!=null ? Convert.ToInt32(Request.QueryString["qty"]) :1;

                    int totalPrice = price * qty;
                
                string date = dt.ToString("yyyy-MM-dd HH-mm-ss");

                cdb.Sqlquery("Insert into addtocart (product_id,userid,qty,date,price) values('" + id + "','" + HttpContext.Current.Session["userid"].ToString() +"','"+qty+"','"+date+"','"+totalPrice+"')");
                Response.Redirect("Addtocart.aspx");
                }
            }
        }

        
        protected void allcartdata()
        {

            string userid = HttpContext.Current.Session["userid"]?.ToString(); // Handle potential null session variable

        Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("select * from addtocart where userid='"+userid+"'");

            if (cdb.ds.Tables[0].Rows.Count > 0)
            {
                cartContainer.InnerHtml = "";

                DataTable cart = cdb.ds.Tables[0];

                decimal totalPrice = 0;

                Products = new List<Product>();
                foreach (DataRow row in cart.Rows)
                {
                    string product_id = row["product_id"].ToString();
                    string qty = row["qty"].ToString();
                    string id = row["Id"].ToString();
                    decimal price = Convert.ToDecimal(row["price"]);
                    Connectiondb cd = new Connectiondb();
                    cd.Sqlquery("select * from products where product_id='" + product_id + "'");
                    string pid = cd.ds.Tables[0].Rows[0]["Id"].ToString();
                    string name = cd.ds.Tables[0].Rows[0]["product_name"].ToString();
                    string img = cd.ds.Tables[0].Rows[0]["product_image"].ToString();
                    decimal eachProductFinalPrice = ((price - (price * 0.2m)) + ((price * 0.2m) * 0.3m));
                    Products.Add(new Product
                    {
                        ProductId = product_id,
                        FinalPrice = eachProductFinalPrice,
                        Quantity = Convert.ToInt32(qty),
                    });

                    string html = $@"<div class=""cart-box"">
                        <div class=""left"">
                        <a href=""ProductView.aspx?id={product_id}"">
                            <img src=""../Assets/productImgs/{img}"" alt="""">
                        </a>
                            <div class=""text"">
                                <h1>{name}</h1>
                                <p><i class=""fa-solid fa-indian-rupee-sign""></i>{price}</p>
                            </div>
                        </div>
                        <div class=""right"">
                            
                            <a href=""Addtocart.aspx?cartid={id}""><i class=""fa-solid fa-xmark""></i></a>
                            <div class=""qty"">
                                <div class=""box"">
                                    <span>-</span>
                                    <input type=""text"" value=""{qty}"" class=""qt"" data-id=""{id}""/>
                                    <span>+</span>
                                </div>
                            </div>
                        </div>
                    </div>
                <asp:HiddenField ID=""eachProductFinalPrice"" Text=""{eachProductFinalPrice}"" runat=""server"" />

                ";
                    

                    cartContainer.InnerHtml += html; // Set HTML content once after loop

                    totalPrice += price;


                }

                Subtotal.InnerText = totalPrice.ToString();
                Discount.InnerText = (totalPrice * 0.2m).ToString();
                Tax.InnerText = ((totalPrice * 0.2m) * 0.3m).ToString();
                IncTax.InnerText = ((totalPrice - (totalPrice * 0.2m)) + ((totalPrice * 0.2m) * 0.3m)).ToString();
                ExcTax.InnerText = (totalPrice - (totalPrice * 0.2m)).ToString();
                payamount.InnerText= ((totalPrice - (totalPrice * 0.2m)) + ((totalPrice * 0.2m) * 0.3m)).ToString();

            }
            else
            {
                cartContainer.InnerHtml = $@" <img src=""../Assets/gif/empty_cart.gif"" alt=""empty-cart""/>";
                subtotal_box.Visible = false;
            }

        }

        protected void deleteCart()
        {
            if (Request.QueryString["cartid"] != null)
            {
                string cartid = Request.QueryString["cartid"];

                Connectiondb cdb=new Connectiondb();
                cdb.Sqlquery("delete from addtocart where Id=" + cartid + "");
                Response.Redirect("Addtocart.aspx");
            }
        }

        protected void updateqty()
        {
            if (Request.QueryString["qty"] != null && Request.QueryString["cid"] != null)
            {
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("select * from products where product_id=(select product_id from addtocart where Id='" + Request.QueryString["cid"] + "')");
                int price =Convert.ToInt32( cdb.ds.Tables[0].Rows[0]["price"]);

                int totalprice = Convert.ToInt32(Request.QueryString["qty"])*price;
                cdb.Sqlquery("update addtocart set qty=" + Request.QueryString["qty"] + " ,price='"+totalprice+"' where Id=" + Request.QueryString["cid"] + "");
                Response.Redirect("Addtocart.aspx");
            }
        }

        protected void SetAddress()
        {
            Connectiondb cdb = new Connectiondb();
            string userid = HttpContext.Current.Session["userid"].ToString();
            cdb.Sqlquery("Select * from address where userid = '" + userid + "'");
            if (cdb.ds.Tables[0].Rows.Count > 0)
            {
                txtState.Text = cdb.ds.Tables[0].Rows[0]["state"].ToString();
                txtCity.Text = cdb.ds.Tables[0].Rows[0]["city"].ToString();
                txtDistrict.Text = cdb.ds.Tables[0].Rows[0]["district"].ToString();
                txtPin.Text = cdb.ds.Tables[0].Rows[0]["pincode"].ToString();
                txtLandMark.Text = cdb.ds.Tables[0].Rows[0]["landmark"].ToString();
                txtVlg.Text = cdb.ds.Tables[0].Rows[0]["village"].ToString();
            }

        }

        public class Product
        {
            public string ProductId { get; set; }
            public decimal FinalPrice { get; set; }
            public int Quantity { get; set; }
            public string OrderID { get; set; }
        }


        protected void PlaceOrderBtn_Click(object sender, EventArgs e)
        {

            Connectiondb cdb = new Connectiondb();
            string userid = HttpContext.Current.Session["userid"].ToString();
            cdb.Sqlquery("Select * from address where userid = '"+userid+"'");
            if (cdb.ds.Tables[0].Rows.Count == 0)
            {
                cdb.Sqlquery("Insert into address (state,city,district,village,landmark,pincode,userid) values('"+txtState.Text+"','"+txtCity.Text+"','"+txtDistrict.Text+"','"+txtVlg.Text+"','"+txtLandMark.Text+"','"+txtPin.Text+"','"+userid+"')");
            }
            PlaceTheOrder();
            Response.Redirect("~/User/OrderPlaced.aspx");
        }

        protected void PlaceTheOrder()
        {
            Connectiondb cdb = new Connectiondb();
            string userid = HttpContext.Current.Session["userid"].ToString();
            foreach (var product in Products)
            {
                string productId = product.ProductId;
                decimal productPrice = product.FinalPrice;
                int productQuantity = product.Quantity;
                string currentDateTime = DateTime.Now.ToString();
                string payMode = "Pay on Delivery";
                string orderid =GenerateUniqueOrderId();
                cdb.Sqlquery("insert into orders (orderid,product_id,userid,purches_quantity,purches_price,payment_mode,datetime) values('"+orderid+"','"+productId+"','"+userid+"','"+productQuantity+"','"+productPrice+"','"+payMode+"','"+currentDateTime+"')");
                cdb.Sqlquery("delete from addtocart where product_id='" + productId + "'");
            }
        }

        private string GenerateUniqueOrderId()
        {
            // Implement logic to generate a unique order ID (e.g., using a GUID or a sequence)
            return "OID-" + Guid.NewGuid().ToString().Substring(0, 8); // Example: "OID-abcdef12"
        }
    }
}