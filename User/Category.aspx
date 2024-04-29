<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Craftglow.User.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/category.css">
    <script src="./javascript/category.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="category">
        <div runat="server" class="banner" id="Banner">
            
        </div>
        <div class="body">
            <p class="text-secondary">Categories / <strong><u runat="server" id="categoryName"></u></strong></p>
            <hr>
            <div runat="server" class="wrapper" id="categoryProducts">
            </div>
        </div>
    </div>
</asp:Content>
