﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Craftglow.User.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CraftGlow</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="icon" type="image/svg+xml" href="../Assets/user/logo.png" />
    <link rel="stylesheet" href="css/Login.css" />
    <link href="css/Loader.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav>
            <img src="../Assets/user/logo.png" alt="" />
        </nav>
        <div class="content">
            <div class="form">
                <h1>Sign in</h1>
                <p>Don't have an account?<a href="Signup.aspx">Sign Up</a></p>
                <div class="mb-3">
                    <asp:Label ID="error_text" style="display: block;" CssClass="text-danger error" runat="server" Text=""></asp:Label>
                    <label for="">Email*</label>
                    <asp:TextBox runat="server" ID="Email" Placeholder="Enter your email id.." CssClass="input-box"/>
                </div>
                <div class="mb-3">
                    <label for="">Password*</label>
                    <asp:TextBox runat="server" ID="Password" Placeholder="Enter password.." CssClass="input-box" TextMode="Password"/>
                </div>
                <asp:Button runat="server" ID="Signin" Text="Login" CssClass="button" OnClick="Signin_Click" />
                <a href="#" class="for-pw">forget password?</a>
            </div>
        </div>
    </form>

    <div class="center-body loader">
    <div class="loader-circle-59"></div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> 
    <script>
        $(document).ready(function () {
            setTimeout(function () {
                $(".loader").hide();
            }, 500);
        });
    </script>

</body>
</html>
