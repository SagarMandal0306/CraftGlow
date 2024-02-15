<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Addtocart.aspx.cs" Inherits="Craftglow.User.Addtocart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/addtocart.css">
    <script src="./javascript/addtocart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart mt-5">
        <h1 class="text-center">Shopping Cart</h1>
        <div class="row p-5">
            <div class="col-md-8">
               <div class="cart-box">
                <div class="left">
                    <img src="../Assets/user/products/dsc02497_1.jpg" alt="">
                    <div class="text">
                        <h1>Old-Shool-Charpahi-Style-Tray</h1>
                        <p><i class="fa-solid fa-indian-rupee-sign"></i>8000</p>
                    </div>
                </div>
                <div class="right">
                    <i class="fa-solid fa-xmark"></i>
                    <div class="qty">
                        <!-- <span style="font-size: 20px;">Qty</span> -->
                        <div class="box">
                            <span>-</span>
                            <span>0</span>
                            <span>+</span>
                        </div>
                    </div>
                   
                </div>
               </div>
              
            </div>
            <div class="col-md-4">
                <div class="box">
                    <h1>Cart Subtotal</h1>
                    <div class="contain">
                        <div>
                            <p>Subtotal</p>
                            <p><i class="fa-solid fa-indian-rupee-sign"></i>8000</p>
                        </div>
                        <div>
                            <p>Discount</p>
                            <p><i class="fa-solid fa-indian-rupee-sign"></i>8000</p>
                        </div>
                        <div>
                            <p>Tax</p>
                            <p><i class="fa-solid fa-indian-rupee-sign"></i>8000</p>
                        </div>
                        <div>
                            <p>Order Total Incl. Tax</p>
                            <p><i class="fa-solid fa-indian-rupee-sign"></i>8000</p>
                        </div>
                        <div>
                            <p>Order Total Excl. Tax</p>
                            <p><i class="fa-solid fa-indian-rupee-sign"></i>8000</p>
                        </div>
                    </div>
                </div>
                <button class="btn-proceed">Proceed Payment</button>
            </div>
        </div>
    </div>
</asp:Content>
