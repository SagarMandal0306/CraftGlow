<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AllProducts.aspx.cs" Inherits="Craftglow.Admin.AllProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row m-2 d-flex justify-content-center">
        <div class="col-sm-12 col-xl-12">
            <div class="bg-light rounded h-100 p-4">
                <h6 class="mb-4">Products List</h6>
                <asp:GridView ID="productlist_grid" CssClass="productList" runat="server" AllowPaging="True" AutoGenerateColumns="False" HeaderStyle-CssClass="category_header" RowStyle-CssClass="category_row" DataKeyNames="product_id" OnPageIndexChanging="productlist_grid_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="product_id" HeaderText="Product ID"></asp:BoundField>
                        <asp:BoundField DataField="product_name" HeaderText="Product Name"></asp:BoundField>
                        <asp:BoundField DataField="price" HeaderText="Product Price"></asp:BoundField>
                        <asp:ImageField DataImageUrlField="product_image_url" ItemStyle-CssClass="productimg" HeaderText="Product Image"></asp:ImageField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditProduct" CssClass="btn btn-warning" runat="server" Text="Edit" OnClick="EditProduct_Click" CommandArgument='<%# Eval("product_id") %>' />
                                <asp:LinkButton ID="DeleteProduct" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="DeleteProduct_Click" CommandArgument='<%# Eval("product_id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
