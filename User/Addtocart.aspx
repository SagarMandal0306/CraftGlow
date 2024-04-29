<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true"
    CodeBehind="Addtocart.aspx.cs" Inherits="Craftglow.User.Addtocart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/addtocart.css">
    <script src="./javascript/addtocart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart mt-5">
        <h1 class="text-center">Shopping Cart</h1>
        <div class="row p-5">
            <div runat="server" class="col-md-8 cartContainer " id="cartContainer">
            </div>
            <div class="col-md-4" id="subtotal_box" runat="server">
                <div class="box">
                    <h1>Cart Subtotal</h1>
                    <div class="contain">
                        <div>
                            <p>Subtotal</p>
                            <p>
                                <i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server"
                                    id="Subtotal">0</strong>
                            </p>
                        </div>
                        <div>
                            <p>Discount</p>
                            <p>
                                <i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server"
                                    id="Discount">0</strong>
                            </p>
                        </div>
                        <div>
                            <p>Tax</p>
                            <p>
                                <i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server"
                                    id="Tax">0</strong>
                            </p>
                        </div>
                        <div>
                            <p>Order Total Excl. Tax</p>
                            <p>
                                <i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server"
                                    id="ExcTax">0</strong>
                            </p>
                        </div>
                        <div>
                            <p>Order Total Incl. Tax</p>
                            <p>
                                <i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server"
                                    id="IncTax">0</strong>
                            </p>
                        </div>
                        <div>
                            <p>Pay Amount :</p>
                            <p>
                                <i class="fa-solid fa-indian-rupee-sign"></i><strong runat="server"
                                    id="payamount">0</strong>
                            </p>
                        </div>

                    </div>
                </div>

                <button class="btn-proceed" type="button" data-bs-toggle="modal"
                    data-bs-target="#addressModal">
                    Next</button>
            </div>
        </div>
    </div>


    <!-- Address Modal -->
    <div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delivery Address</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body addressContainer">
                    <asp:TextBox ID="txtState" PlaceHolder="State Name" runat="server" ClientIDMode="Static">
                    </asp:TextBox>
                    <asp:TextBox ID="txtDistrict" PlaceHolder="District Name" runat="server" ClientIDMode="Static">
                    </asp:TextBox>
                    <asp:TextBox ID="txtCity" PlaceHolder="City Name" runat="server" ClientIDMode="Static">
                    </asp:TextBox>
                    <asp:TextBox ID="txtPin" PlaceHolder="PinCode" runat="server" ClientIDMode="Static">
                    </asp:TextBox>
                    <asp:TextBox ID="txtVlg" PlaceHolder="Village Name" runat="server" ClientIDMode="Static">
                    </asp:TextBox>
                    <asp:TextBox ID="txtLandMark" PlaceHolder="LandMark" runat="server" ClientIDMode="Static">
                    </asp:TextBox>
                    <asp:Label ID="addressMsg" CssClass="addressMsg" runat="server" Text=""></asp:Label>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="PlaceOrderBtn" type="button" runat="server" CssClass="btn-proceed"
                        Text="Place Order" OnClientClick="return ValidateAddress()" OnClick="PlaceOrderBtn_Click" />
                </div>
            </div>
        </div>
    </div>
    <script>
        function ValidateAddress() {
            var inputState = document.getElementById("txtState");
            var inputDistrict = document.getElementById("txtDistrict");
            var inputCity = document.getElementById("txtCity");
            var inputPin = document.getElementById("txtPin");
            var inputVlg = document.getElementById("txtVlg");
            var inputLandMark = document.getElementById("txtLandMark");

            // Check if any input field is empty
            if (inputState.value.trim().length === 0 ||
                inputDistrict.value.trim().length === 0 ||
                inputCity.value.trim().length === 0 ||
                inputPin.value.trim().length === 0 ||
                inputVlg.value.trim().length === 0 ||
                inputLandMark.value.trim().length === 0) {
                alert("All fields are required");
                return false;
            }

            // Check if pin code is a valid numeric value
            var pinRegex = /^\d+$/;
            if (!pinRegex.test(inputPin.value.trim())) {
                alert("Pin code must be a valid number");
                inputPin.focus();
                return false;
            }

            return true;
        }
    </script>
</asp:Content>
