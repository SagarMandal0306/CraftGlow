using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.User
{
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["userid"] != null)
                {
                    addProduct();
                    allProduct();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
           
        }

        protected void addProduct()
        {
            if (Request.QueryString["id"] != null)
            {
                string product_id= Request.QueryString["id"].ToString();
                string userid = Session["userid"].ToString();
                DateTime dt = DateTime.Now;
                string date = dt.ToString("yyyy-MM-dd HH-mm-ss");
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("select * from wishlist where product_id='" + product_id + "' and userid='" + userid + "'");
                if (cdb.ds.Tables[0].Rows.Count > 0)
                {
                    return;
                }
                else
                {

                cdb.Sqlquery("insert into wishlist (product_id,userid,date) values('" + product_id + "','" + userid + "','" + date + "')");
                }

            }
        }

        protected void allProduct()
        {
            WishlistProduct.InnerHtml = "";
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("select * from wishlist where userid='" + Session["userid"] + "'");
            string total = cdb.ds.Tables[0].Rows.Count.ToString();
            head.InnerText = "Your Wishlist(" + total + ")";

            if (cdb.ds.Tables[0].Rows.Count > 0)
            {


                DataTable list = cdb.ds.Tables[0];

                foreach (DataRow row in list.Rows)
                {
                    string product_id = row["product_id"].ToString();
                    Connectiondb cd = new Connectiondb();
                    cd.Sqlquery("select * from products where product_id='" + product_id + "'");
                    string name = cd.ds.Tables[0].Rows[0]["product_name"].ToString().Substring(0, 10);
                    string Pimg = cd.ds.Tables[0].Rows[0]["product_image"].ToString();
                    string Id = cd.ds.Tables[0].Rows[0]["Id"].ToString();
                    string price = cd.ds.Tables[0].Rows[0]["price"].ToString();
                    string wish = checkWishList(product_id);
                    string cart = CheckCartList(Id, product_id);
                    string html = $@"
                                <div class=""product__item"" >
                                                      <a href=""ProductView.aspx?id={product_id}"">
                                    <div class=""product__item__pic set-bg"" data-setbg=""../Assets/productImgs/{Pimg}"">
                                        <span class=""label"">New</span>
                                        <ul class=""product__hover"">
                                            {wish}
                                        </ul>
                                    </div>
                            </a>
        
                                    <div class=""product__item__text"">
                                        <h6>{name}...</h6>
                                        {cart}
                                        
                                        <h5><i class=""fa-solid fa-indian-rupee-sign""></i>{price}</h5>
                                    </div>
                                </div>


                            ";
                    WishlistProduct.InnerHtml += html;
                }

            }
            else
            {
                WishlistProduct.InnerHtml = $@"<img src=""../Assets/gif/image_processing20210802-2754-uc47v2.gif"" class=""img""/>";
            }
        }

        protected string checkWishList(string product_id)
        {
            if (Session["userid"] != null)
            {
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("select * from wishlist where product_id='" + product_id + "' and userid='" + Session["userid"] + "'");
                if (cdb.ds.Tables[0].Rows.Count > 0)
                {
                    return $@"<li><i class=""fa-solid fa-heart"" style=""color:red"" ></i></li>";
                }
                else
                {
                    return $@"<li><i class=""fa-regular fa-heart""></i></li>";
                }
            }

            return $@"<li><i class=""fa-regular fa-heart""></i></li>";

        }

        protected string CheckCartList(string id, string product_id)
        {
            Connectiondb db = new Connectiondb();
            if (HttpContext.Current.Session["userid"] != null)
            {
                db.Sqlquery("select * from addtocart where product_id='" + product_id + "' and userid='" + HttpContext.Current.Session["userid"] + "'");
                if (db.ds.Tables[0].Rows.Count > 0)
                {
                    return $@"<a href=""Addtocart.aspx"" class=""add-cart"">Go To Cart</a>";
                }
            }

            return $@"<a href=""Addtocart.aspx?id={product_id}"" class=""add-cart cart-add""  >+ Add To Cart</a>";


        }

        protected void Remove_Click(object sender, EventArgs e)
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("truncate table wishlist");
            Response.Redirect("Wishlist.aspx");
        }
    }
}