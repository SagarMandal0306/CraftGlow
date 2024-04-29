<%@ Page Title="Order Success" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="OrderPlaced.aspx.cs" Inherits="Craftglow.User.OrderPlaced" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/OrderPlaced.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="OrderPlacedContainer">
        <h2>Order Placed Successfully</h2>
        <asp:HyperLink ID="orderLink" CssClass="orderLink" NavigateUrl="~/User/Orders.aspx" runat="server">GoTo Orders</asp:HyperLink>
    </div>
</asp:Content>
