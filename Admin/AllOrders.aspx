<%@ Page Title="All Orders" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AllOrders.aspx.cs" Inherits="Craftglow.Admin.AllOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row m-2 d-flex justify-content-center">
        <div class="col-sm-12 col-xl-12">
            <div class="bg-light rounded h-100 p-4">
                <h6 class="mb-4">Orders List</h6>
                <asp:GridView ID="OrderListGrid" CssClass="productList" runat="server" AutoGenerateColumns="False" HeaderStyle-CssClass="category_header" RowStyle-CssClass="category_row" DataKeyNames="orderid">
                    <Columns>
                        <asp:BoundField DataField="orderid" HeaderText="ORDER ID"></asp:BoundField>
                        <asp:ImageField DataImageUrlField="product_image_url" ItemStyle-CssClass="productimg" HeaderText="Product Image"></asp:ImageField>
                        <asp:BoundField DataField="purches_quantity" HeaderText="QUANTITY"></asp:BoundField>
                        <asp:BoundField DataField="purches_price" HeaderText="PRODUCT PRICE"></asp:BoundField>
                        <asp:BoundField DataField="status" HeaderText="CURRENT STATUS"></asp:BoundField>
                        <asp:BoundField DataField="datetime" HeaderText="ORDERED ON"></asp:BoundField>
                        <asp:TemplateField HeaderText="UPDATE STATUS">
                            <ItemTemplate>
                                <asp:DropDownList ID="OrderStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="OrderStatus_SelectedIndexChanged">
                                    <asp:ListItem>Select Status</asp:ListItem>
                                    <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                    <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
                                    <asp:ListItem Value="On The Way">On The Way</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
