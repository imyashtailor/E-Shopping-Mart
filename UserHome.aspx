<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="E_shopping_Website.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UserHome Page</title>
    <script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>

    <meta charset =" utf-8" />
    <meta name ="viewport" content ="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content ="IE-edge" />
    <link href="css/Styling.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function myfunction(){
            $("#btnCart").Click(function myfunction(){
                window.location.href = "/Cart.aspx";
            });
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
                            <li class=""><a href="Default.aspx">Home</a></li>
                            <li><a href="About.aspx">About</a></li>
                            <li><a href="ContactUs.aspx">Contact Us</a></li>
                            <li><a href="Blog.aspx">Blog</a></li>
                                                   
                            <!-----Dropdownlist menu---->

                            <li class="drodown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b
                            class="caret"></b></a>
                            <ul class="dropdown-menu ">
                                <li><a href="ProductsView.aspx">All Products</a></li>
                                <li role="separator" class="divider "></li>
                                <li class="dropdown-header ">Men</li>
                                <li role="separator" class="divider "></li>
                                <li><a href="#">Shirts</a></li>
                                <li><a href="#">Pants</a></li>
                                <li><a href="#">Denims</a></li>
                                <li role="separator" class="divider "></li>
                                <li class="dropdown-header ">Women</li>
                                <li role="separator" class="divider "></li>
                                <li><a href="#">Top</a></li>
                                <li><a href="#">Leggings</a></li>
                                <li><a href="#">Saree</a></li>
                            </ul>
                        </li>
                           <li>
                            <button id="btnCart" class="btn btn-primary navbar-btn" type="button">
                                Cart<span class="badge" id="pCount" runat="server"></span>

                            </button>
                        </li>
                            <li>
                                <asp:Button ID="btnLogin" CssClass="btn btn-default navbar-btn" OnClick="btnLogin_Click" runat="server" Text="SignIn" />
                                <asp:Button ID="btnlogout" CssClass="btn btn-default navbar-btn" OnClick="btnlogout_Click" runat="server" Text="Signout" />
                            </li>
                           
                        </ul>
                    </div>
                </div>
        </div>
            </div>
        <br />
        <br />
        <br />
            <asp:Label ID="lblSuccess" runat="server" CssClass="text-success" ></asp:Label>
         <!-----Footer content start---->

        <footer class="footer-pos">
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;2025 EShopping.in &middot; <a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot; <a href="#">Products</a> </p>
            </div>
            </footer>
        <!-----Footer Content end---->
    </form>
        <hr />

        </body>
</html>
