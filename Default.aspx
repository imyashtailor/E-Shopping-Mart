<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_shopping_Website.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Shopping Website</title>
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous">

    </script>
    <meta charset =" utf-8" />
    <meta name ="viewport" content ="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content ="IE-edge" />
    <link href="css/Styling.css" rel="stylesheet" />

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script>

        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "/AddCart.aspx";
            });
        });

        // Function for Text-to-Speech (TTS)
        function speakText(text) {
            var speech = new SpeechSynthesisUtterance();
            speech.text = text;
            speech.volume = 1; // Loudness (0 to 1)
            speech.rate = 1; // Speed (0.1 to 10)
            speech.pitch = 1; // Pitch (0 to 2)
            window.speechSynthesis.speak(speech);
        }

        // Function for Speech Recognition (STT)
        function startListening() {
            var recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
            recognition.lang = 'en-US';
            recognition.start();

            recognition.onresult = function (event) {
                var command = event.results[0][0].transcript.toLowerCase();
                console.log("User said: ", command);
                if (command.includes("cart")) {
                    speakText("Opening Cart");
                    window.location.href = "AddCart.aspx";
                } else if (command.includes("products")) {
                    speakText("Opening Products Page");
                    window.location.href = "ProductsView.aspx";
                } else if (command.includes("sign in")) {
                    speakText("Redirecting to Sign In page");
                    window.location.href = "Login.aspx";
                } else if (command.includes("sign up")) {
                    speakText("Redirecting to Sign Up page");
                    window.location.href = "SignUp.aspx";
                } else {
                    speakText("Sorry, I didn't understand that. Please try again.");
                }
            };
        }

        // Welcome voice message on page load
        $(document).ready(function () {
            speakText("Hello, Welcome to the E-Shopping Mart Website.");
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-----Navbar---->
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
                            <li class="active"><a href="Default.aspx">Home</a></li>
                            <li><a href="About.aspx">About</a></li>
                            <li><a href="ContactUs.aspx">Contact Us</a></li>
                            <li><a href="Blog.aspx">Blog</a></li>
                            <li><a href="AdminDashboard.aspx">Dashboard</a></li>
                           
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
                                Cart <span class="badge " id="pCount" runat="server"></span>
                            </button>

                             <!-- Voice Assistance Button -->
                            <button class="btn btn-primary navbar-btn" onclick="startListening()" type="button">
                                🎤 Voice Assistant
                            </button>
                        </li>
                            <li id="btnSignUp" runat="server"><a href="SignUp.aspx">SignUp</a></li>
                            <li id="btnLogin" runat="server"><a href="Login.aspx">SignIn</a></li>
                            <li>
                                <asp:Button ID="btnlogout" CssClass="btn btn-default navbar-btn" runat="server" Text="Signout" OnClick="btnlogout_Click" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!----Image Slider--->
            <div class="container">
  <h2></h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Slider Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item active">
         <img src="Image Slider/img44.jpg" alt="Men Shopping" style="width:100%; height:450px;">

         <div class="carousel-caption">
        <h3 style="color:red">Mens Shopping</h3>
        <p style="color:red">Get the 50% SALE Hurry UP!!</p>
        <button class="btn" style="background-color:darkgrey">Shop Now</button>
      </div>
      </div>
      <div class="item">
        <img src="Image Slider/img22.jpg" alt="Women Shopping" style="width:100%; height:450px;">
        <div class="carousel-caption">
        <h3 style="color:red">Women Shopping</h3>
        <p style="color:red">MEGA SALE UP TO 70% Hurry UP!!</p>
        <button class="btn" style="background-color:darkgrey">Shop Now</button>
      </div>
      </div>
    
      <div class="item">
        <img src="Image Slider/img33.jpg" alt="Brand Cloths" style="width:100%; height:450px;">
        <div class="carousel-caption">
        <h3 style="color:red">Stylish Brand Cloths</h3>
        <p style="color:red">Get the Offer 30%</p>
        <button class="btn" style="background-color:darkgrey">Shop Now</button>
      </div>
      </div>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


            <!----Image Slider end--->

        </div>

        <!-----Middle Content start (product details)---->
        <hr />
        <div class="container">
            <div class="row-center">
                <div class="col-lg-4">
                    <img class="img-circle" src="Mobiles image/mobiles.jpg" alt="thumb" width="150" height="140"/>
                    <h2>Mobiles</h2>
                    <p>The iPhone is a flagship product from Apple that,
                       combines cutting-edge technology, 
                       with sleek design and seamless integration,
                       into the Apple ecosystem. 
                       The frame is made from materials like glass and aluminum, 
                       giving the phone a modern and elegant feel. 
                    </p>
                    <p><a class ="btn btn-default" href="#" role="button">View More &raquo;</a></p>
                </div>

                <div class="col-lg-4">
                    <img class="img-circle" src="clothsfoot image/clothing2.jpg" alt="cloths" width="150" height="140" />
                    <h2>Clothing</h2>
                    <p>Clothing is much more than just something we wear for warmth or protection—it's a form of expression, culture, and individuality. 
                       Over time, clothing has evolved to reflect societal norms, technological advancements, and personal style. 
                    </p>
                    <p><a class ="btn btn-default" href="#" role="button">View More &raquo;</a></p>
                </div>

                <div class="col-lg-4">
                    <img class="img-circle" src="clothsfoot image/footwear2.jpg" alt="footware" width="150" height="140" />
                    <h2>Footwear</h2>
                    <p>Footwear is an essential part of our daily lives, 
                        serving multiple functions such as protection, comfort, and style. Shoes, boots, sandals 
                        and other types of footwear have evolved over time, 
                        adapting to meet the needs of different environments, activities, and fashion trends. 
                    </p>
                    <p><a class ="btn btn-default" href="#" role="button">View More &raquo;</a></p>
                </div>
             </div>
        </div>
        
        <!-----Middle Content end---->

        <!-----Footer content start---->
        <footer>
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;2025 EShopping.in &middot; <a href="Default.aspx">Home</a>&middot;<a href="About.aspx">About</a>&middot;<a href="ContactUs.aspx">Contact</a>&middot; <a href="ProductView.aspx">Products</a> </p>
            </div>
        </footer>


        <!-----Footer Content end---->


    </form>
</body>
</html>
</nav>
