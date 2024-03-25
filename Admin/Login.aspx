<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Craftglow.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>CraftGlow Admin | LOGIN</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description"/>

    
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"/>

    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet"/>
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <link href="css/bootstrap.min.css" rel="stylesheet"/>

    <link href="css/style.css" rel="stylesheet"/>
    <link href="css/Login.css" rel="stylesheet" />
</head>
<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center flex-column">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
            <span>Please Wait...</span>
        </div>
        <!-- Spinner End -->


        <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <form runat="server" class="bg-light rounded p-4 p-sm-5 my-4 mx-3" id="login_form">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="index.html" class="">
                                <h5 class="text-primary"><i class="fa fa-hashtag me-2"></i>ADMIN</h5>
                            </a>
                            <h5>LOGIN</h5>
                        </div>
                        <span class="error"></span>
                        <asp:Label ID="error_text" runat="server" CssClass="error" Text=""></asp:Label>
                        <div class="mb-3">
                            <asp:TextBox ID="username" runat="server" CssClass="form-control" PlaceHolder="Username"></asp:TextBox>
                        </div>
                        <div class="mb-4">
                            <asp:TextBox ID="password" runat="server" CssClass="form-control" PlaceHolder="Password"></asp:TextBox>
                        </div>
                        <asp:Button ID="submit" CssClass="btn btn-primary w-100 mb-4" runat="server" Text="LOGIN" OnClick="submit_Click" />
                    </form>
                </div>
            </div>
        </div>
        <!-- Sign In End -->
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/main.js"></script>
  
</body>
</html>
