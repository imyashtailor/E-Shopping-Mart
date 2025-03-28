<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="E_shopping_Website.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <meta charset =" utf-8" />
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
                            <li class=""><a href="Default.aspx">Home</a></li>
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
                            <li class="active"><a href="SignUp.aspx">SignUp</a></li>
                            <li><a href="Login.aspx">SignIn</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

        <!--------Signup Page Start---------->
        
      <div class="centter-page">
          <div class="use">
              <img class="img-circle" src="Image Slider/user.png" alt="thumb" width="50" height="50"/>
          </div> 

            <label class="col-xs-11">Name:</label>
            <div class="col-xs-11">
                <asp:TextBox ID="txtname" runat="server" Class="form-control" placeholder="Enter Your Name"></asp:TextBox>
            </div>

          <label class="col-xs-11">Username:</label>
            <div class="col-xs-11">
                <asp:TextBox ID="txtUsername" runat="server" Class="form-control" placeholder="Enter Your Username"></asp:TextBox>
            </div>
        
        <label class="col-xs-11">Email:</label>
        <div class="col-xs-11">
                <asp:TextBox ID="txtEmail" runat="server" Class="form-control" placeholder="Enter Your Email"></asp:TextBox>
        </div>

        <label class="col-xs-11">Password:</label>
        <div class="col-xs-11">
                <asp:TextBox ID="txtuPass" TextMode="Password" runat="server" Class="form-control" placeholder="Enter Your Password"></asp:TextBox>
        </div>

        <label class="col-xs-11">Confirm Password:</label>
        <div class="col-xs-11">
                <asp:TextBox ID="txtCPass" TextMode="Password" runat="server" Class="form-control" placeholder="Enter Your Confirm Password"></asp:TextBox>
        </div>

        <label class="col-xs-11"></label>
        <label class="col-xs-11"></label>  
        <div class="col-xs-11">
            <asp:Button ID="txtsignup" Class="btn btn-success" runat="server" Text="SignUp" style="margin-left:40%" OnClick="txtsignup_Click"/>
        &nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
      </div>
        <!--------Signup Page End---------->

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
