using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
            GetNewItem();
            GetCategoryList();
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

        [WebMethod]
        public static string GetCategory()
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("select * from category order by category_name");
            string data = ConvertDsToJson(cdb.ds);
            return data;
        }

        protected  void GetNewItem()
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("select Id from category where category_name = 'New'");
            if (cdb.ds.Tables[0].Rows.Count > 0)
            {


                string category_id = cdb.ds.Tables[0].Rows[0]["Id"].ToString();
                cdb.Sqlquery("select * from products where category_id=" + category_id + "");

                DataTable products = cdb.ds.Tables[0];


                if (products != null && products.Rows.Count > 0 )
                {

                    foreach (DataRow row in products.Rows)
                    {

                        if (row["product_image"] != DBNull.Value && row["product_name"] != DBNull.Value && row["price"] != DBNull.Value)
                        {
                            string img = row["product_image"].ToString();
                            string name = row["product_name"].ToString().Substring(0,15);
                            string price = row["price"].ToString();
                            string Id = row["Id"].ToString();
                            string product_id= row["product_id"].ToString();
                            string cart = CheckCartList(Id, product_id);
                            string wish = checkWishList(product_id);
                            string html = $@"
                                <div class=""product__item"" >
                                                      <a href=""ProductView.aspx?id={product_id}"">
                                    <div class=""product__item__pic set-bg"" data-setbg=""../Assets/productImgs/{img}"">
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


                            newProducts.InnerHtml += html;  
                        }
                    }
                }
            }
            else
            {
                newProducts.InnerText = "There are no any categry";
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

        protected void GetCategoryList()
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("select * from category where category_name <> 'New' order by category_name");

            if (cdb.ds.Tables[0].Rows.Count > 0)
            {
                DataTable category = cdb.ds.Tables[0];

                foreach (DataRow row in category.Rows)
                {
                    string name = row["category_name"].ToString();
                    string img = row["img"].ToString();
                    string id = row["Id"].ToString();
                    string html = $@"<a href=""Category.aspx?id={id}"">
                        <div class=""category"">
                            <img src=""../Assets/categoryImg/{img}"" alt="""">
                            <span>{name}</span>
                        </div>
                    </a>";
                    categoryList.InnerHtml += html;
                }
            }

        }
    }
}