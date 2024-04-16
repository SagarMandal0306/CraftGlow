using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Craftglow.User
{
    public partial class ProductView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getData();
            if (Session["userid"] != null)
            {
                
                Connectiondb cdb = new Connectiondb();
                string id = Request.QueryString["Id"].ToString();
                cdb.Sqlquery("select * from addtocart where product_id='" + id + "' and userid='" + Session["userid"] + "'");
                if (cdb.ds.Tables[0].Rows.Count > 0)
                {
                    AddToCart.Text = "Go To Cart";
                }
                checkLike();
            }
            
            
        }



        

        protected void getData()
        {
            Connectiondb cdb = new Connectiondb();
            if (Request.QueryString["Id"] != null)
            {
                string id = Request.QueryString["Id"].ToString();

                cdb.Sqlquery("select * from products where product_id='" + id + "'");
                if (cdb.ds.Tables[0].Rows.Count > 0)
                {
                    string category_id = cdb.ds.Tables[0].Rows[0]["category_id"].ToString();
                    productName.InnerText = cdb.ds.Tables[0].Rows[0]["product_name"].ToString();
                    price.InnerText = cdb.ds.Tables[0].Rows[0]["price"].ToString();
                    proDesc.InnerText = cdb.ds.Tables[0].Rows[0]["description"].ToString();
                    string img = cdb.ds.Tables[0].Rows[0]["product_image"].ToString();
                    string imghtml = $@"<img src=""../Assets/productImgs/{img}"" alt="""">";
                    productImage.InnerHtml = imghtml;
                    cdb.Sqlquery("select top 5 * from products where category_id='" + category_id + "' and product_id<>'" + id + "'");
                    if (cdb.ds.Tables[0].Rows.Count > 0)
                    {
                        DataTable products = cdb.ds.Tables[0];
                        if (products != null && products.Rows.Count > 0)
                        {

                            foreach (DataRow row in products.Rows)
                            {

                                if (row["product_image"] != DBNull.Value && row["product_name"] != DBNull.Value && row["price"] != DBNull.Value)
                                {
                                    string Pimg = row["product_image"].ToString();
                                    string name = row["product_name"].ToString().Substring(0, 10);
                                    string price = row["price"].ToString();
                                    string product_id = row["product_id"].ToString();
                                    string Id = row["Id"].ToString();
                                    string wish = checkWishList(product_id);
                                    string cart = CheckCartList(Id,product_id);
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
                                        <div class=""rating"">
                                            <i class=""fa-regular fa-star""></i>
                                            <i class=""fa-regular fa-star""></i>
                                            <i class=""fa-regular fa-star""></i>
                                            <i class=""fa-regular fa-star""></i>
                                            <i class=""fa-regular fa-star""></i>
                                        </div>
                                        <h5><i class=""fa-solid fa-indian-rupee-sign""></i>{price}</h5>
                                    </div>
                                </div>


                            ";


                                    productRecommend.InnerHtml += html;
                                }
                            }
                        }
                    }
                    else
                    {
                        productRecommend.InnerText = "There are no any categry";
                    }


                }
            }
        }

        protected void checkLike()
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("select * from wishlist where product_id='" + Request.QueryString["id"] + "' and userid='" + Session["userid"] + "'");
            if (cdb.ds.Tables[0].Rows.Count > 0)
            {
                HtmlGenericControl heartIcon = Heart.FindControl("HeartLike") as HtmlGenericControl;
                heartIcon.Style["color"] = "red";
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userid"] != null)
            {
                string qty = TextQt.Text;
                if (qty == "0")
                {
                    err.InnerText = "*Quantity must be 1";
                }
                else
                {
                    string id = Request.QueryString["Id"].ToString();
                    Connectiondb cdb = new Connectiondb();
                    cdb.Sqlquery("select * from addtocart where product_id='" + id + "' and userid='" + HttpContext.Current.Session["userid"] + "'");
                    if (cdb.ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Redirect("Addtocart.aspx");
                    }
                    else
                    {
                        Response.Redirect("Addtocart.aspx?qty=" + qty + "&id=" + id + "");
                    }
                   
                }

               


            }
            else
            {
                Response.Redirect("Login.aspx");
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

        protected void Heart_Click(object sender, EventArgs e)
        {
            string product_id = Request.QueryString["id"].ToString();
            Response.Redirect("Wishlist.aspx?id=" + product_id);
        }
    }
    }
