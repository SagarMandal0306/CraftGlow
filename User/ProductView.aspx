<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true"
    CodeBehind="ProductView.aspx.cs" Inherits="Craftglow.User.ProductView" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="./css/view.css">
        <script src="./javascript/view.js"></script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="pview">
            <div class="row">
                <div runat="server" class="col-md-6 left mt-2" id="productImage">
                </div>
                <div class="col-md-6 right mt-2">
                    <div class="head">
                        <h1 runat="server" id="productName"></h1>
                        <asp:LinkButton runat="server" ID="Heart" OnClick="Heart_Click"><i runat="server" id="HeartLike"
                                class="fa-solid fa-heart"></i></asp:LinkButton>
                    </div>
                    <p class="instock">In Stock</p>
                   
                    <h2><i class="fa-solid fa-indian-rupee-sign mx-2"></i><strong runat="server" id="price"></strong>
                    </h2>
                    <hr>
                    <div class="qty">
                        <span style="font-size: 20px;">Qty</span>
                        <div class="box">
                            <span>-</span>
                            <asp:TextBox runat="server" ID="TextQt" Text="1" CssClass="qt"></asp:TextBox>
                                <span>+</span>
                        </div>
                        <span runat="server" id="err" class="err"></span>
                    </div>
                    <div class="btns">
                        <asp:Button runat="server" ID="AddToCart" Text="Add To Cart" CssClass="button"
                            OnClick="AddToCart_Click" />
                        <asp:Button runat="server" ID="BuyNow" Text="BuyNow" CssClass="button" OnClick="AddToCart_Click" />
                       
                    </div>
                    <hr>
                    <div class="work">
                        <div class="contain">
                            <div class="icon"><i class="fa-solid fa-box-open"></i></div>
                            <div class="text">
                                <span>Delivery</span>
                                <p>2-8 days</p>
                            </div>
                        </div>
                        <div class="contain">
                            <div class="icon"><i class="fa-solid fa-indian-rupee-sign"></i></div>
                            <div class="text">
                                <span>COD</span>
                                <p>Available</p>
                            </div>
                        </div>
                        <div class="contain">
                            <div class="icon"><i class="fa-solid fa-truck"></i></div>
                            <div class="text">
                                <span>Free</span>
                                <p>Shipping Access India</p>
                            </div>
                        </div>
                        <div class="contain">
                            <div class="icon"><i class="fa-solid fa-plane-departure"></i></div>
                            <div class="text">
                                <span>Eligible</span>
                                <p>For International Shipping</p>
                            </div>
                        </div>
                        <div class="contain">
                            <div class="icon"><i class="fa-solid fa-right-left"></i></div>
                            <div class="text">
                                <span>Exchange & Return</span>
                                <p>in 10 days</p>
                            </div>
                        </div>

                    </div>

                    <div class="desc">
                        <h3>Description:</h3>
                        <p runat="server" id="proDesc"></p>
                    </div>
                </div>
            </div>



            <div class="recomend">
                <h1 class="text-center">Recomendation</h1>
                <div runat="server" class="wrapper" id="productRecommend">
                </div>



            </div>
        </div>

    </asp:Content>