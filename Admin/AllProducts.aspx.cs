using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.Admin
{
    public partial class AllProducts : System.Web.UI.Page
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
                    ReloadProducts();
                }
            }
        }

        protected void ReloadProducts()
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("Select product_id,product_name,product_image,price from products");
            productlist_grid.DataSource = cdb.ds;
            productlist_grid.DataBind();
        }


        protected void EditProduct_Click(object sender, EventArgs e)
        {
            LinkButton edtbtn = (LinkButton)sender;
            string id = edtbtn.CommandArgument;
            Response.Redirect("~/Admin/AddProduct.aspx?action=edit&id="+id);
        }

        protected void DeleteProduct_Click(object sender, EventArgs e)
        {
            LinkButton dltbtn = (LinkButton)sender;
            string product_id = dltbtn.CommandArgument;
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("delete from products where product_id='" + product_id + "'");
            ReloadProducts();
        }

        protected void productlist_grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            productlist_grid.PageIndex = e.NewPageIndex;
            ReloadProducts();
        }
    }
}