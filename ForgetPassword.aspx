<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="E_shopping_Website.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ForgetPassword</title>
    <meta name ="viewport" content ="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content ="IE-edge" />
    <link href="css/Styling.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                            <li><a href="#">About</a></li>
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
                            <li><a href="Login.aspx">SignIn</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            
        </div>
        <div class="container">
            <div class="form-horizontal">
                <h2>Recover Password</h2>
                <hr />
                <h3>Please Enter Your Email Address, we will send you the recovery link for your password!.</h3>
                <br />
                <div class="form-group">
                    <asp:Label ID="lblEmail" CssClass="col-md-2" runat="server" Text="Your Email Address"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtEmailID" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="Enter Your Email" ControlToValidate="txtEmailID" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>

                    <div class="col-md-6">
                        <asp:Button ID="btnResetPass" CssClass="btn btn-default" runat="server" Text="Send" OnClick="btnResetPass_Click" />
                        <br />
                        <br />
                        <asp:Label ID="lblResetPassMsg" CssClass="text-success" runat="server" ></asp:Label>
                    </div>
                </div>

            </div>
        </div>
    </form>
     <!-----Footer content start---->
        <hr />

        <footer class="footer-pos">
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;2025 EShopping.in &middot; <a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot; <a href="#">Products</a> </p>
            </div>
            </footer>
        <!-----Footer Content end---->
</body>
</html>
