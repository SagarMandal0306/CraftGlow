using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Craftglow.Admin
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label adminName = (Label)Master.FindControl("adminName");
                adminName.Text = "Welcome " + Session["Admin"].ToString();
                if (!IsPostBack)
                {
                   ReloadCategory();
                    if (Request.QueryString["id"] != null && Request.QueryString["action"] != null)
                    {
                        if (Request.QueryString["action"] == "edit")
                        {
                            int id = int.Parse(Request.QueryString["id"]);
                            SetEditData(id);
                        }
                    }
                }
            }
        }


        protected void ReloadCategory()
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("Select * from category");
            category_grid.DataSource = cdb.ds;
            category_grid.DataBind();
        }

        protected void CategorySubmit_Click(object sender, EventArgs e)
        {
            string categoryName = CategoryName.Text;
            if(categoryName != "")
            {
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("Select * from category where category_name='"+categoryName+"'");
                if (cdb.ds.Tables[0].Rows.Count > 0)
                {
                    cat_error.CssClass = "text-danger error";
                    cat_error.Text = "Category already exist!";
                    return;
                }
                else
                {
                    cdb.Sqlquery("insert into category (category_name) values('"+categoryName+"')");
                    cat_error.CssClass = "text-success error";
                    cat_error.Text = "Category added";
                   // cat_error.CssClass = "text-danger error";
                    CategoryName.Text = "";
                    ReloadCategory();
                    return;
                }
            }
            else
            {
                cat_error.CssClass = "text-danger error";
                cat_error.Text = "Please write the category name";
                return;
            }
        }


        protected void DeleteCategory(int id)
        {
            Connectiondb cdb = new Connectiondb();

            // Check if the ID exists before attempting to delete
            cdb.Sqlquery("SELECT COUNT(*) FROM category WHERE id='" + id + "'");
            int count = Convert.ToInt32(cdb.ds.Tables[0].Rows[0][0]);

            if (count > 0)
            {
                // ID exists, proceed with the delete operation
                cdb.Sqlquery("DELETE FROM category WHERE id='" + id + "'");
                ReloadCategory();
            }
            else
            {
                // ID doesn't exist
                cat_error.CssClass = "text-danger error";
                cat_error.Text = "Category with ID " + id + " does not exist.";
            }
        }



        protected void SetEditData(int id)
        {
            Connectiondb cdb = new Connectiondb();
            cdb.Sqlquery("Select * from category where id='"+id+"'");
            if (cdb.ds.Tables[0].Rows.Count > 0)
            {
                string cat_name = cdb.ds.Tables[0].Rows[0]["category_name"].ToString();
                CategoryName.Text = cat_name;
            }
            else
            {
                cat_error.CssClass = "text-danger error";
                cat_error.Text = "Invalid Category ID";
            }
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            LinkButton editButton = (LinkButton)sender;
            int categoryId = Convert.ToInt32(editButton.CommandArgument);

            // Redirect to the edit page with the category ID
            Response.Redirect("~/Admin/AddCategory.aspx?action=edit&id=" + categoryId);
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            LinkButton deleteButton = (LinkButton)sender;
            int categoryId = Convert.ToInt32(deleteButton.CommandArgument);

            // Perform delete action with the category ID
            DeleteCategory(categoryId);
        }

        protected void UpdateCategory_Click(object sender, EventArgs e)
        {
            if(CategoryName.Text != "")
            {

                int id = Convert.ToInt32(Request.QueryString["id"]);
                Connectiondb cdb = new Connectiondb();
                cdb.Sqlquery("Update category set category_name='"+CategoryName.Text+"' where id = '"+id+"'");
                cat_error.CssClass = "text-success error";
                cat_error.Text = "Category Updated";
                ReloadCategory();
                return;
            }
            else
            {
                cat_error.CssClass = "text-danger error";
                cat_error.Text = "Write Category Name";
                return;
            }

        }
    }
}