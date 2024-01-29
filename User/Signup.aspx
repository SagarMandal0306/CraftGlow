﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Craftglow.User.Signup" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>CraftGlow</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" type="image/svg+xml" href="../Assets/user/logo.png" />
        <link rel="stylesheet" href="css/Login.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>

    <body>
        <form id="form1" runat="server">
            <nav>
                <img src="../Assets/user/logo.png" alt="">
            </nav>
            <div class="content">
                <div class="form">
                    <h1>Sign up</h1>
                    <p>Already have an account?<a href="Login.aspx">Sign In</a></p>
                    <div class="mb-3">
                        <p class="text-danger error"></p>
                        <label for="">Name*</label>
                        <asp:TextBox runat="server" ID="Name" Placeholder="Enter your name.." CssClass="input-box" />
                    </div>
                    <div class="mb-3">
                        <div class="wrapp">
                            <div style="width: 60%;margin-right:20px ;">
                                <label for="">Email*</label>
                                <asp:TextBox runat="server" ID="Email" Placeholder="Enter your email id.."
                                    CssClass="input-box" />
                            </div>
                            <div style="width: 40%;">
                                <label for="">Password*</label>
                                <asp:TextBox runat="server" ID="Password" Placeholder="Enter your Password"
                                    CssClass="input-box" TextMode="Password" />
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="wrapp">
                            <div style="width: 60%;margin-right:20px ;">
                                <label for="">Contact*</label>
                                <div class="wrapp">
                                    <input type="text" class="input-box " value="+91" readonly style="width: 15%;margin-right: 3px;">
                                <asp:TextBox runat="server" ID="Contact" Placeholder="Enter Contact Number.."
                                    CssClass="input-box" />
                                </div>
                            </div>
                            <div style="width: 40%;">
                                <label for="">DOB*</label>
                                <asp:TextBox runat="server" ID="DOB" CssClass="input-box datepicker"
                                    Placeholder="dd/mm/yyyy" onblur="validateDate(this.value)" />
                            </div>
                        </div>
                    </div>
                    <asp:Button runat="server" ID="Signin" Text="Signup" CssClass="button" />
                </div>
            </div>
        </form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>

        <script>
            $(function () {
                $(".datepicker").datepicker({
                    dateFormat: "dd/mm/yy",
                    showOtherMonths: true,
                    selectOtherMonths: true
                });
            });
        </script>

        <script>
            let btn = document.querySelector("#Signin");
            let Name = document.querySelector("#Name");
            let email = document.querySelector("#Email");
            let pass = document.querySelector("#Password");
            let con = document.querySelector("#Contact");
            let dob = document.querySelector("#DOB");
            let error = document.querySelector(".error")

            function validateDate(input) {
                var regex = /^\d{2}\/\d{2}\/\d{4}$/;

                if (!regex.test(input)) {
                    // alert("Invalid date format. Please enter date in DD/MM/YYYY format.");
                    error.innerText = "Invalid date format. Please enter date in DD/MM/YYYY format.";
                    return;
                }

                var parts = input.split('/');
                var day = parseInt(parts[0], 10);
                var month = parseInt(parts[1], 10);
                var year = parseInt(parts[2], 10);

                // Check if month is in the valid range (1 to 12)
                if (month < 1 || month > 12) {
                    // alert("Invalid month. Please enter a valid month.");
                    error.innerText = "Invalid month. Please enter a valid month.";
                    return;
                }

                // Check if day is in the valid range for the given month
                var daysInMonth = new Date(year, month, 0).getDate();
                if (day < 1 || day > daysInMonth) {
                    // alert("Invalid day. Please enter a valid day for the selected month.");

                    error.innerText = "Invalid day. Please enter a valid day for the selected month.";
                    return;
                }

                error.style.display="none"

                // You can also add additional checks for the year if needed
                // For example, check if the year is within a specific range
            }


            btn.onclick = (e) => {
                e.preventDefault();

                if(Name == "" || email=="" || pass=="" || con=="" || dob==""){
                    error.inerText="Compulsory to fill all the filds";

                }

            }
        </script>


    </body>

    </html>