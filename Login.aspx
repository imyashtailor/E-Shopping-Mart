<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_shopping_Website.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <meta charset =" utf-8" />
    <meta name ="viewport" content ="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content ="IE-edge" />
    <link href="css/Styling.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <%--Automatic Voice Command Assitance--%>
    <script>
        function speak(text) {
            var speech = new SpeechSynthesisUtterance();
            speech.text = text;
            speech.lang = "en-US"; // Language
            speech.volume = 1; // Volume (0 to 1)
            speech.rate = 1; // Speed (1 is normal)
            speech.pitch = 1; // Pitch (0 to 2)
            window.speechSynthesis.speak(speech);
        }

        // Automatically speak when the page loads
        window.onload = function () {
            setTimeout(function () {
                speak("Welcome to Login Form.");
            }, 1000);
        };

        document.addEventListener("DOMContentLoaded", function () {
            var loginButton = document.getElementById("txtloginup");
            var usernameInput = document.getElementById("txtusername");
            var passwordInput = document.getElementById("txtPass");
            var forgotPasswordLink = document.getElementById("HyForgotPass");

            // Speak when clicking the username textbox
            if (usernameInput) {
                usernameInput.addEventListener("focus", function () {
                    speak("Enter your username.");
                });
            }

            // Speak when clicking the password textbox
            if (passwordInput) {
                passwordInput.addEventListener("focus", function () {
                    speak("Enter your password.");
                });
            }

            // Speak when the login button is clicked
            if (loginButton) {
                loginButton.addEventListener("click", function (event) {
                    if (usernameInput.value.trim() === "" || passwordInput.value.trim() === "") {
                        event.preventDefault(); // Prevent form submission
                    } else {
                        speak("Welcome, " + usernameInput.value + "!");

                        // Simulating login validation
                        setTimeout(function () {
                            var errorLabel = document.getElementById("lblError");
                            if (errorLabel && errorLabel.innerText.trim() !== "") {
                                speak("Invalid username or password. Please try again or click Forgot Password.");
                            } else {
                                speak("Welcome, " + usernameInput.value + "!");
                            }
                        }, 2000);
                    }
                });
            }

            // If login fails, prompt to click Forgot Password
            setTimeout(function () {
                var errorLabel = document.getElementById("lblError");
                if (errorLabel && errorLabel.innerText.trim() !== "") {
                    speak("If you forgot your password, please click the Forgot Password button.");
                }
            }, 3000);
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <div>
            <div class ="navbar navbar-default navbar-fixed-top" role ="navigation">
                <div class ="container">
                    <div class ="navbar-header">
                        <button type ="button" class ="navbar-toggle" data-toggle ="collapse" data-target=".navbar-collapse">
                            <span class ="sr-only">Toggle Navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class ="navbar-brand" href ="Default.aspx"><span><img src="Images/e-shopping images.png" alt ="E-shopping" height ="30"/></span>E-Shopping Mart</a>
                    </div>   
                    <div class="navbar-collapse collapse navbar-right">
                        <ul class="nav navbar-nav navbar-right">
                            <li class=""><a href="#">Home</a></li>
                            <li><a href="About.aspx">About</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Blog</a></li>
                           
                            <!-----Dropdownlist menu---->

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle"data-toggle="dropdown">Products<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-header ">Men</li>
                                    <li role="separator" class="divider "></li>
                                    <li><a href="#">Shirts</a></li>
                                     <li><a href="#">Pants</a></li>
                                     <li><a href="#">Denims</a></li>
                                     <li><a href="#">Sweat-Shirts</a></li>
                                     <li><a href="#">Animated T-shirts</a></li>
                                    <li role="separator" class="divider "></li>
                                     <li class="dropdown-header ">Women</li>
                                     <li><a href="#">Top</a></li>
                                     <li><a href="#">Leggings</a></li>
                                     <li><a href="#">Sweat-Shirts</a></li>
                                     <li><a href="#">Kurti</a></li>
                                     <li><a href="#">saree</a></li>
                                </ul>
                            </li>
                            <li><a href="SignUp.aspx">SignUp</a></li>
                            <li class="active"><a href="Login.aspx">SignIn</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

        <!--------SignIn Page Start---------->
      <div class="centter-page">
          <div class="use">
              <img class="img-circle" src="Image Slider/user.png" alt="thumb" width="50" height="50"/>
          </div> 

            <label class="col-xs-11">Username:</label>
            <div class="col-xs-11">
                <asp:TextBox ID="txtusername" runat="server" Class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Username" ControlToValidate="txtusername" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>

        <label class="col-xs-11">Password:</label>
        <div class="col-xs-11">
                <asp:TextBox ID="txtPass" TextMode="Password" runat="server" Class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Valid Password" ControlToValidate="txtPass" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        </div>
        
        <label class="col-xs-11"></label>
        <div class="col-xs-11">
        </div>
        <div class="col-md-15">
             <label class="col-xs-11">
            <asp:CheckBox ID="CheckBox1" runat="server" />
        &nbsp;Rememeber me</label>
        </div>

        <label class="col-xs-11"></label>
        <label class="col-xs-11"></label>
        <div class="col-xs-11">
            <asp:Button ID="txtloginup" Class="btn btn-success" runat="server" Text="Login" style="margin-left:40%" OnClick="txtloginup_Click" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx">SignUp</asp:HyperLink>
            <br />
        </div>
        
        <!--------forget password ---------->
        <label class="col-xs-11"></label>
        <div class="col-xs-11" style="text-align:center">
            <asp:HyperLink ID="HyForgotPass" runat="server" NavigateUrl="~/ForgetPassword.aspx">Forgot Password</asp:HyperLink>
        </div>

        <!--------forget password end---------->


        <div class="col-xs-11">
            <asp:Label ID="lblError" CssClass="text-danger" runat="server" ForeColor="#FF3300" ></asp:Label>
        </div>
      </div>
        <!--------SignIn Page End---------->

        <!-----Footer content start---->
        <hr />

        <footer class="footer-pos">
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;2025 EShopping.in &middot; <a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot; <a href="#">Products</a> </p>
            </div>
            </footer>
        <!-----Footer Content end---->
    </form>
</body>
</html>
