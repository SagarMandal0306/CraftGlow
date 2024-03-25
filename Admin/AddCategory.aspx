<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="Craftglow.Admin.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row m-2">
         <div class="col-sm-12 col-xl-6">
            <div class="bg-light rounded h-100 p-4">
                <h6 class="mb-4">Category Form</h6>
                <div>
                    <asp:Label ID="cat_error" CssClass="text-danger error"  runat="server" Text=""></asp:Label>
                    <div class="mb-3">
                        <asp:TextBox ID="CategoryName" PlaceHolder="Category Name" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>
                   
                         <% if(Request.QueryString["action"] == "edit")
                        {
                        %>
                                    <asp:Button ID="UpdateCategory" CssClass="btn update_btn" runat="server" Text="Update Category" OnClick="UpdateCategory_Click"/>
                        <%
                        }
                        else
                        {
                        %>
                                    <asp:Button ID="CategorySubmit" CssClass="btn btn-primary" runat="server" Text="Add Category" OnClick="CategorySubmit_Click" />
                        <%
                        }
                        %>

                </div>

            </div>
        </div>
         <div class="col-sm-12 col-xl-6">
            <div class="bg-light rounded h-100 p-4">
                <h6 class="mb-4">Categories List</h6>
                                 
                <asp:GridView ID="category_grid" runat="server" AllowPaging="True" AutoGenerateColumns="False" HeaderStyle-CssClass="category_header" RowStyle-CssClass="category_row" DataKeyNames="id">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id"></asp:BoundField>
                        <asp:BoundField DataField="category_name" HeaderText="Category Name"></asp:BoundField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="Edit_cat" CssClass="btn btn-warning" runat="server" Text="Edit" OnClick="EditButton_Click" CommandArgument='<%# Eval("id") %>' />
                                <asp:LinkButton ID="Delete_cat" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="DeleteButton_Click" CommandArgument='<%# Eval("id") %>' />
                            </ItemTemplate>

                        </asp:TemplateField>
                        </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>
