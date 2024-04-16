<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Addtocart.aspx.cs" Inherits="Craftglow.User.Addtocart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/addtocart.css">
    <script src="./javascript/addtocart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart mt-5">
        <h1 class="text-center">Shopping Cart</h1>
        <div class="row p-5">
            <div runat="server" class="col-md-8 cartContainer " id="cartContainer"  >
               
            </div>
            <div class="col-md-4">
                <div class="box">
                    <h1>Cart Subtotal</h1>
                    <div class="contain">
                        <div>
                            <p>Subtotal</p>
                            <p><i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server" id="Subtotal">0</strong></p>
                        </div>
                        <div>
                            <p>Discount</p>
                            <p><i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server" id="Discount">0</strong></p>
                        </div>
                        <div>
                            <p>Tax</p>
                            <p><i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server" id="Tax">0</strong></p>
                        </div>
                        <div>
                            <p>Order Total Incl. Tax</p>
                            <p><i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server" id="IncTax">0</strong></p>
                        </div>
                        <div>
                            <p>Order Total Excl. Tax</p>
                            <p><i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server" id="ExcTax">0</strong></p>
                        </div>
                    </div>
                </div>
                
                <button class="btn-proceed">Place Order</button>
            </div>
        </div>
    </div>
</asp:Content>
