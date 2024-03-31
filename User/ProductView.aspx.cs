using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.User
{
    public partial class ProductView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connectiondb cdb = new Connectiondb();
            if (Request.QueryString["Id"] != null)
            {
                string id = Request.QueryString["Id"].ToString();
                
                cdb.Sqlquery("select * from products where Id="+id+"");
                if (cdb.ds.Tables[0].Rows.Count > 0)
                {
                string category_id= cdb.ds.Tables[0].Rows[0]["category_id"].ToString();
                    productName.InnerText = cdb.ds.Tables[0].Rows[0]["product_name"].ToString();
                    price.InnerText= cdb.ds.Tables[0].Rows[0]["price"].ToString();
                    proDesc.InnerText= cdb.ds.Tables[0].Rows[0]["description"].ToString();
                    string img= cdb.ds.Tables[0].Rows[0]["product_image"].ToString();
                    string imghtml = $@"<img src=""../Assets/productImgs/{img}"" alt="""">";
                    productImage.InnerHtml = imghtml;
                    cdb.Sqlquery("select top 5 * from products where category_id='" + category_id + "' and Id<>'"+id+"'");
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
                                    string name = row["product_name"].ToString();
                                    string price = row["price"].ToString();
                                    string Id = row["Id"].ToString();
                                    string html = $@"
                                <div class=""product__item"" >
                                                      <a href=""ProductView.aspx?id={Id}"">
                                    <div class=""product__item__pic set-bg"" data-setbg=""../Assets/productImgs/{Pimg}"">
                                        <span class=""label"">New</span>
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

           


        }
    }
