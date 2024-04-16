<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Craftglow.User.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/wishlist.css">
    <script src="./javascript/wishlist.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 runat="server" id="head" class="text-center mt-2" ></h1>
   <div runat="server" class="wishlist" id="WishlistProduct">
    
    </div>
    <div class="btn-div">
    <asp:Button runat="server" ID="Remove" CssClass="btn" Text="Remove All" OnClick="Remove_Click"/>
    </div>
   
</asp:Content>
