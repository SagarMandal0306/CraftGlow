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
                        <li><i class="fa-solid fa-user"></i>
                            <asp:HyperLink ID="HyperLink2" runat="server">My Profile</asp:HyperLink>
                        </li>
                        <li>
                            <i class="fa-solid fa-clock-rotate-left"></i>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/User/Orders.aspx">Order History</asp:HyperLink>
                        </li>
                        <li>
                            <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click"> <i class="fa-solid fa-right-from-bracket"></i>Logout</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-8 right">
                <div class="box">
                    <div class="logo">
                        <h1 runat="server" id="FirstL"></h1>
                    </div>
                    <div class="text">
                        <p><i class="fa-solid fa-envelope"></i>- <span runat="server" id="Email"></span></p>
                        <p><i class="fa-solid fa-phone"></i>- <span runat="server" id="Phone"></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
