<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Craftglow.User.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/profile.css">
    <script src="./javascript/profile.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="profile">
    <div class="row">
        <div class="col-md-3 left">
            <div class="box">
                <ul>
                    <li><i class="fa-solid fa-user"></i>My Profile</li>
                    <li><i class="fa-solid fa-clock-rotate-left"></i>Order History</li>
                    <li>
                        <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click"> <i class="fa-solid fa-right-from-bracket"></i>
Logout</asp:LinkButton>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-8 right">
            <div class="box">
                <div class="logo">
                    <h1>S</h1>
                </div>
                <div class="text">
                    <p><i class="fa-solid fa-envelope"></i>- <span>sagarmandal4000@gmail.com</span></p>
                    <p><i class="fa-solid fa-phone"></i>- <span>9099086775</span></p>
                    <p><i class="fa-solid fa-location-dot"></i>- <span>jajpur,India</span></p>
                </div>
            </div>
        </div>
    </div>
   </div>
</asp:Content>
