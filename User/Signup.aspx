<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Craftglow.User.Signup" %>

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
        <form id="form1" runat="server" >
            <nav>
                <img src="../Assets/user/logo.png" alt=""/>
            </nav>
            <div class="content">
                <div class="form">
                    <h1>Sign up</h1>
                    <p>Already have an account?<a href="Login.aspx">Sign In</a></p>
                    <div class="mb-3">
                        <p runat="server" class="text-danger error" id="Err"></p>
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
                                    <input type="text" class="input-box " value="+91" readonly="true"
                                        style="width: 15%;margin-right: 3px;" />
                                    <asp:TextBox runat="server" ID="Contact" Placeholder="Enter Contact Number.."
                                        CssClass="input-box" TextMode="Number"/>
                                </div>
                            </div>
                            <div style="width: 40%;">
                                <label for="">DOB*</label>
                                <asp:TextBox runat="server" ID="DOB" CssClass="input-box datepicker"
                                    Placeholder="dd/mm/yyyy" />
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

     <!-- Add the following script at the end of your <body> tag in signup.aspx -->
        <script>
            $(function () {
                $("#Signin").on("click", function (e) {
                    e.preventDefault();

                    let Name = $("#Name").val();
                    let email = $("#Email").val();
                    let pass = $("#Password").val();
                    let con = $("#Contact").val();
                    let dob = $("#DOB").val();

                    if (Name === "" || email === "" || pass === "" || con === "" || dob === "") {
                        $(".error").text("Compulsory to fill all the fields");
                    } else {
                        if (pass.length < 6) {
                            $(".error").text("Your password must be 6 digits or greater.");
                        } else {
                            if (con.length !== 10 || con<0) {
                                $(".error").text("Your contact number must be 10 digits.");
                            } else {
                               if (!isValidDate(dob)) {
                                    $(".error").text("Invalid date of birth. Please enter a valid date.");
                                } else {
                                    if (!isValidYear(dob)) {
                                        $(".error").text("Invalid year in the date of birth. Please enter a valid year.");
                                    } else {
                                        // Call the server-side method to handle registration
                                        registerUser(Name, email, pass, con, dob);
                                    }
                                }
                            }
                        }
                    }
                });

                function isValidDate(dateString) {
                    // Validate the date format (dd/mm/yyyy)
                    var regex = /^\d{2}\/\d{2}\/\d{4}$/;
                    if (!regex.test(dateString)) {
                        return false;
                    }

                    // Validate the date using JavaScript Date object
                    var parts = dateString.split("/");
                    var day = parseInt(parts[0], 10);
                    var month = parseInt(parts[1], 10);
                    var year = parseInt(parts[2], 10);

                    var dateObject = new Date(year, month - 1, day);

                    return (
                        dateObject.getDate() === day &&
                        dateObject.getMonth() === month - 1 &&
                        dateObject.getFullYear() === year
                    );
                  }


                  function isValidYear(dateString) {
                    var parts = dateString.split("/");
                    var year = parseInt(parts[2], 10);

                    // Define an acceptable range of years (e.g., from 1900 to the current year)
                    var minYear = 1900;
                    var maxYear = new Date().getFullYear();

                    return year >= minYear && year <= maxYear;
                  }

                function registerUser(Name, email, pass, con, dob) {
                    $.ajax({
                        type: "POST",
                        url: "signup.aspx/RegisterUser", // Specify the correct path to your server-side method
                        data: JSON.stringify({ Name: Name, Email: email, Password: pass, Contact: con, DOB: dob }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                                console.log(response);
                            if (response.d === "success") {
                                // Registration successful, perform any necessary actions
                                console.log("Registration successful");
                                window.location.href="Login.aspx";
                            } else {
                                $(".error").text(response.d);
                            }
                        },
                        error: function (error) {
                            $(".error").text("An error occurred during registration.");
                            console.log(error);
                        }
                    });
                }
            });




        </script>



    </body>

    </html>