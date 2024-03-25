using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

namespace Craftglow.Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Label adminName = (Label)Master.FindControl("adminName");
                    adminName.Text = "Welcome " + Session["Admin"].ToString();
                    product_error.CssClass = "text-danger error";
                    BindCategory();
                    if (Request.QueryString["id"] != null && Request.QueryString["action"] != null)
                    {
                        if (Request.QueryString["action"] == "edit")
                        {
                            string id = Request.QueryString["id"].ToString();
                            SetEditData(id);
                        }
                    }
                }
            }
        }


        protected void BindCategory()
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("Select * from category");
            ProductCategory.Items.Clear();
            ProductCategory.Items.Add(new ListItem("Select Category",""));
            foreach(DataRow row in cdb.ds.Tables[0].Rows)
            {
                string id = row["id"].ToString();
                string catName = row["category_name"].ToString();

                ProductCategory.Items.Add(new ListItem(catName,id));
            }
        }


        protected void ProductSubmit_Click(object sender, EventArgs e)
        {
            string productName = ProductName.Text;
            string productDesc = ProductDesc.Text;
            string productKw = ProductKeyWords.Text;
            string productCat = ProductCategory.SelectedValue;
            string productPrice = ProductPrice.Text;
            if (string.IsNullOrEmpty(productName))
            {
                product_error.Text = "Please fill Product Name";
                return;
            }
            if (string.IsNullOrEmpty(productDesc)) 
            {
                product_error.Text = "Please fill Product Description";
                return;
            }
            if (string.IsNullOrEmpty(productKw)) 
            {
                product_error.Text = "Please fill Product Keywords";
                return;
            }
            if (string.IsNullOrEmpty(productPrice)) 
            {
                product_error.Text = "Please fill Product Price";
                return;
            }
            if (!ProductImg.HasFile)
            {
                product_error.Text = "Upload a Product Image!";
                return;
            }
            if (string.IsNullOrEmpty(productCat)) 
            {
                product_error.Text = "Please Select Product Category";
                return;
            }
            decimal checkedPrice;
            if (!decimal.TryParse(productPrice, out checkedPrice) || checkedPrice <= 0 || checkedPrice > 10000)
            {
                product_error.Text = "Enter a valid price for the product (1 - 10,000)";
                return;
            }

            string imgType = Path.GetExtension(ProductImg.FileName).ToLower();
            string[] supportedImgType = { ".jpg", ".jpeg", ".png" };
            if(!supportedImgType.Contains(imgType))
            {
                product_error.Text = "Only JPG, JPEG, and PNG file formats are supported.";
                return;
            }

            if (ProductImg.PostedFile.ContentLength > (4*1048576))
            {
                product_error.Text = "Image size should be less than 4MB ! ";
                return;
            }

            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("Select product_name from products where product_name = '"+productName+"'");
            if (cdb.ds.Tables[0].Rows.Count > 0)
            {
                product_error.Text = "This product Name already Exist!";
                return;
            }

            string imgName = ProductImg.FileName;
            imgName = imgName.Replace(" ", "_");
            string imgSavePath = Server.MapPath("~/Assets/productImgs/") + imgName;
            string productId = "P00"+GenerateRandomID(4);
            cdb.Sqlquery("insert into products (product_id,category_id,product_name,product_image,description,price,keywords) values('"+productId+"','"+productCat+"','"+productName+ "','~/Assets/productImgs/"+imgName+"','" + productDesc+"','"+checkedPrice+"','"+productKw+"')");
            ProductImg.SaveAs(imgSavePath);
            product_error.CssClass = "error text-success";
            product_error.Text = "Product Inserted";
            Response.Redirect("~/Admin/AllProducts.aspx");
            return;

        }


        protected void SetEditData(string productId)
        {
            if (!string.IsNullOrEmpty(productId))
            {
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("Select * from products where product_id = '" + productId + "'");
                if (cdb.ds.Tables[0].Rows.Count > 0)
                {
                    ProductName.Text = cdb.ds.Tables[0].Rows[0]["product_name"].ToString();
                    ProductDesc.Text = cdb.ds.Tables[0].Rows[0]["description"].ToString();
                    ProductKeyWords.Text = cdb.ds.Tables[0].Rows[0]["keywords"].ToString();
                    ProductPrice.Text = cdb.ds.Tables[0].Rows[0]["price"].ToString();
                    ProductCategory.SelectedValue = cdb.ds.Tables[0].Rows[0]["category_id"].ToString();
                    SelectedProductImage.ImageUrl= cdb.ds.Tables[0].Rows[0]["product_image"].ToString();
                    HiddenID.Value = productId;
                }
                else
                {
                    Response.Redirect("~/Admin/AllProducts.aspx");
                }
            }
        }

        static string GenerateRandomID(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            var result = new StringBuilder(length);
            for (int i = 0; i < length; i++)
            {
                result.Append(chars[random.Next(chars.Length)]);
            }
            return result.ToString();
        }

        protected void ProductUpdate_Click(object sender, EventArgs e)
        {
            string productId = HiddenID.Value;
            string productName=ProductName.Text;
            string productPrice = ProductPrice.Text;
            string productDesc = ProductDesc.Text;
            string productKw = ProductKeyWords.Text;
            string productCat = ProductCategory.SelectedValue;

            if (string.IsNullOrEmpty(productName))
            {
                product_error.Text = "Please fill Product Name";
                return;
            }
            if (string.IsNullOrEmpty(productDesc))
            {
                product_error.Text = "Please fill Product Description";
                return;
            }
            if (string.IsNullOrEmpty(productKw))
            {
                product_error.Text = "Please fill Product Keywords";
                return;
            }
            if (string.IsNullOrEmpty(productPrice))
            {
                product_error.Text = "Please fill Product Price";
                return;
            }
            if (string.IsNullOrEmpty(productCat))
            {
                product_error.Text = "Please Select Product Category";
                return;
            }
            decimal checkedPrice;
            if (!decimal.TryParse(productPrice, out checkedPrice) || checkedPrice <= 0 || checkedPrice > 10000)
            {
                product_error.Text = "Enter a valid price for the product (1 - 10,000)";
                return;
            }

            Connectiondb cdb = new Connectiondb();


            if (ProductImg.HasFile)
            {
                string imgType = Path.GetExtension(ProductImg.FileName).ToLower();
                string[] supportedImgType = { ".jpg", ".jpeg", ".png" };
                if (!supportedImgType.Contains(imgType))
                {
                    product_error.Text = "Only JPG, JPEG, and PNG file formats are supported.";
                    return;
                }

                if (ProductImg.PostedFile.ContentLength > (4 * 1048576))
                {
                    product_error.Text = "Image size should be less than 4MB ! ";
                    return;
                }
                string imgName = ProductImg.FileName;
                imgName = imgName.Replace(" ", "_");
                string imgSavePath = Server.MapPath("~/Assets/productImgs/") + imgName;
                cdb.Sqlquery("update products set product_name='" + productName + "',category_id='" + productCat + "',description='" + productDesc + "',price='" + productPrice + "',keywords='" + productKw + "',product_image='~/Assets/productImgs/"+imgName+"' where product_id='" + productId + "'");
                ProductImg.SaveAs(imgSavePath);
            }
            else
            {
                cdb.Sqlquery("update products set product_name='"+productName+"',category_id='"+productCat+"',description='"+productDesc+"',price='"+productPrice+"',keywords='"+productKw+"' where product_id='"+productId+"'");
            }
            Response.Redirect("~/Admin/AllProducts.aspx");

        }
    }
}