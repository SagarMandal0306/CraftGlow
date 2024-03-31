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
                            string html = $@"
    <div class=""product__item"" >
                          <a href=""ProductView.aspx?id={Id}"">
        <div class=""product__item__pic set-bg"" data-setbg=""../Assets/productImgs/{img}"">
            
            <ul class=""product__hover"">
                <li><i class=""fa-regular fa-heart""></i></li>
            </ul>
        </div>
</a>
        
        <div class=""product__item__text"">
            <h6>{name}...</h6>
            <a href=""#"" class=""add-cart"">+ Add To Cart</a>
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
                            string html = $@"
    <div class=""product__item"" >
                          <a href=""ProductView.aspx?id={Id}"">
        <div class=""product__item__pic set-bg"" data-setbg=""../Assets/productImgs/{img}"">
            
            <ul class=""product__hover"">
                <li><i class=""fa-regular fa-heart""></i></li>
            </ul>
        </div>
</a>
        
        <div class=""product__item__text"">
            <h6>{name}...</h6>
            <a href=""#"" class=""add-cart"">+ Add To Cart</a>
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
            categoryName.InnerText = "Search Product";
            if (Request.QueryString["query"] != null)
            {
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
                            string img = row["product_image"].ToString();
                            string name = row["product_name"].ToString().Substring(0, 10);
                            string price = row["price"].ToString();
                            string Id = row["Id"].ToString();
                            string html = $@"
    <div class=""product__item"" >
                          <a href=""ProductView.aspx?id={Id}"">
        <div class=""product__item__pic set-bg"" data-setbg=""../Assets/productImgs/{img}"">
            
            <ul class=""product__hover"">
                <li><i class=""fa-regular fa-heart""></i></li>
            </ul>
        </div>
</a>
        
        <div class=""product__item__text"">
            <h6>{name}...</h6>
            <a href=""#"" class=""add-cart"">+ Add To Cart</a>
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


                            categoryProducts.InnerHtml += html;
                        }
                    }
                }
            }
           
        }
        }
      
    }
    
