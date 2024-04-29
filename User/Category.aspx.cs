using System;
using System.Collections.Generic;
using System.Data;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.User
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 

            GetProducts();
            GetBannerData();
            GetSearchedProducts();
            allProducts();

        }

        protected void allProducts()
        {
            if (Request.QueryString["type"] != null)
            {
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("select * from products");
                DataTable products = cdb.ds.Tables[0];


                if (products != null && products.Rows.Count > 0)
                {

                    foreach (DataRow row in products.Rows)
                    {

                        if (row["product_image"] != DBNull.Value && row["product_name"] != DBNull.Value && row["price"] != DBNull.Value)
                        {
                            string img = row["product_image"].ToString();
                            string name = row["product_name"].ToString().Substring(0, 10);
                            string price = row["price"].ToString();
                            string Id = row["Id"].ToString();
                            string product_id = row["product_id"].ToString();
                            string cart = CheckCartList(Id, product_id);
                            string wish = checkWishList(product_id);

                            string html = $@"
    <div class=""product__item"" >
                          <a href=""ProductView.aspx?id={product_id}"">
        <div class=""product__item__pic set-bg"" data-setbg=""../Assets/productImgs/{img}"">
            
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


                            categoryProducts.InnerHtml += html;
                        }
                    }
                }
            }

        }


        protected void GetProducts()
        {
            if (Request.QueryString["id"] != null)
            {
                string categry_id = Request.QueryString["id"].ToString();

                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("select * from category where Id='" + categry_id + "'");
                string category_name = cdb.ds.Tables[0].Rows[0]["category_name"].ToString();
                categoryName.InnerText = category_name;
                cdb.Sqlquery("select * from products where category_id='" + categry_id + "'");

                DataTable products = cdb.ds.Tables[0];


                if (products != null && products.Rows.Count > 0)
                {

                    foreach (DataRow row in products.Rows)
                    {

                        if (row["product_image"] != DBNull.Value && row["product_name"] != DBNull.Value && row["price"] != DBNull.Value)
                        {
                            string img = row["product_image"].ToString();
                            string name = row["product_name"].ToString().Substring(0, 10);
                            string price = row["price"].ToString();
                            string Id = row["Id"].ToString();
                            string product_id = row["product_id"].ToString();
                            string cart = CheckCartList(Id, product_id);
                            string wish = checkWishList(product_id);
                            string html = $@"
                                <div class=""product__item"" >
                                                      <a href=""ProductView.aspx?id={product_id}"">
                                    <div class=""product__item__pic set-bg"" data-setbg=""../Assets/productImgs/{img}"">
            
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


                            categoryProducts.InnerHtml += html;
                        }
                    }
                }


            }

        }

        protected void GetBannerData()
        {
            Random rand = new Random();
            Connectiondb cd = new Connectiondb();
            int randnum = rand.Next(1, 6);
            cd.Sqlquery("select  * from banner where Id='" + randnum + "'");
            string imgurl = cd.ds.Tables[0].Rows[0]["img"].ToString();
            string imghtml = $@"<img src=""../Assets/user/{imgurl}"" alt=""""/>";
            Banner.InnerHtml = imghtml;
        }
        protected void GetSearchedProducts()
        {
            if (Request.QueryString["query"] != null)
            {
                categoryName.InnerText = "Search Product";
                string query = Request.QueryString["query"].ToString();
                Connectiondb cds = new Connectiondb();
                cds.Sqlquery("select * from products where keywords like '%" + query + "%' ");
                DataTable products = cds.ds.Tables[0];


                if (products != null && products.Rows.Count > 0)
                {

                    foreach (DataRow row in products.Rows)
                    {

                        if (row["product_image"] != DBNull.Value && row["product_name"] != DBNull.Value && row["price"] != DBNull.Value)
                        {
                            string img = row["product_image"]
                                .ToString();
                            string name = row["product_name"].ToString().Substring(0, 10);
                            string price = row["price"].ToString();
                            string Id = row["Id"].ToString();
                            string product_id = row["product_id"].ToString();
                            string cart = CheckCartList(Id, product_id);
                            string wish = checkWishList(product_id);
                            string html = $@"
    <div class=""product__item"" >
                          <a href=""ProductView.aspx?id={product_id}"">
        <div class=""product__item__pic set-bg"" data-setbg=""../Assets/productImgs/{img}"">
               
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


                            categoryProducts.InnerHtml += html;
                        }
                    }
                }
            }

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
    }






}

