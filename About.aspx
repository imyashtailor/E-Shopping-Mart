<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite1.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<title>About My Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>

<style>
    .jumbotron {
        background-color: #f4511e;
        color: #fff;
        padding: 100px 25px;
    }
    .container-fluid {
        padding: 60px 50px;
    }
    .bg-grey {
        background-color: #f6f6f6;
    }
    .logo-small {
        color: #f4511e;
        font-size: 50px;
    }
    .logo {
        color: #f4511e;
        font-size: 200px;
    }
    @media screen and (max-width: 768px) {
        .col-sm-4 {
            text-align: center;
            margin: 25px 0;
        }
    }
</style>

<script language="javascript" type="text/javascript">
    // <![CDATA[
    // JavaScript can be added here
    // ]]>
</script>
<script>
    function speak(text) {
        var speech = new SpeechSynthesisUtterance();
        speech.text = text;
        speech.lang = "en-US";
        speech.volume = 1;
        speech.rate = 1;
        speech.pitch = 1;
        window.speechSynthesis.speak(speech);
    }

    // Welcome message when the page loads
    window.onload = function () {
        setTimeout(function () {
            speak("Welcome to the About Page of E-Shopping. Learn more about our services, values, and mission.");
        }, 1000);
    };

    document.addEventListener("DOMContentLoaded", function () {
        var getInTouchButton = document.getElementById("Button1");
        var serviceSections = document.querySelectorAll(".col-sm-4");

        // Speak when "Get in Touch" button is clicked
        if (getInTouchButton) {
            getInTouchButton.addEventListener("click", function () {
                speak("Thank you for reaching out! We will get back to you soon.");
            });
        }

        // Speak when hovering over services
        serviceSections.forEach(function (section) {
            section.addEventListener("mouseover", function () {
                var text = section.querySelector("h4") ? section.querySelector("h4").innerText : "";
                var desc = section.querySelector("p") ? section.querySelector("p").innerText : "";
                speak(text + ". " + desc);
            });
        });
    });
</script>

</asp:content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />

<div class="jumbotron text-center">
    <h1>About Us</h1>
    <p></p>
    <form class="form-inline">
        <div class="input-group">
            <!-- Input group code goes here if needed -->
        </div>
    </form>
</div>

<!-- Container (About Section) -->
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <h2>About My Page</h2>
            <h4>I am a Developer..</h4>
            <p>
                Hi, Hello, I’m Yash Tailor!

                Welcome to my personal website! I’m a passionate developer with a strong dedication to building creative, 
                innovative, and efficient software solutions. I thrive on solving complex problems and turning ideas into functional, 
                user-friendly products. My goal is to continuously improve and push the boundaries of technology, 
                embracing new challenges along the way.<br /><br />

                As a developer, I specialize in ASP.NET WEB DEVELOPER. I have hands-on experience working with a variety of languages and frameworks, 
                including Html, CSS, Javascript and ASP.NET Framework. My focus is always on delivering clean, maintainable, and scalable code that enhances the user experience 
                and brings real value to projects.<br /><br />

                My journey as a developer started when I realized my passion for technology and problem-solving at an early age. 
                Over the years, I have developed a strong foundation by working on diverse projects, ranging from building dynamic websites to creating web apps. 
                These experiences have provided me with a deeper understanding of the development process and have fueled my desire to continuously learn and grow.<br /><br />

                I created this website to showcase my work, share my experiences, and connect with other like-minded individuals in the tech world. 
                Whether you’re interested in checking out my portfolio, collaborating on a new project, or simply chatting about technology, 
                I’m always excited to connect and discuss innovative ideas.<br /><br />

                In my free time, I enjoy my Hobbies such as Playing cricket and travelling outside the home. 
                I’m always looking for new challenges and opportunities to push myself further in the world of development. 
                Currently, I’m diving deeper into ASP.NET Technology, AI and many other things.
            </p>
            <asp:Button class="btn btn-default btn-lg" ID="Button1" runat="server" Text="Get in Touch" OnClick="Button1_Click" />
        </div>
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-signal logo"></span>
        </div>
    </div>
</div>

<div class="container-fluid bg-grey">
    <div class="row">
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-globe logo"></span>
        </div>
        <div class="col-sm-8">
            <h2>Our Values</h2>
            <p><strong>MISSION:</strong> Our mission is to provide a seamless, 
                personalized, and secure online shopping experience by offering a diverse range of high-quality products at competitive prices. 
                We are committed to delivering excellent customer service, ensuring convenience, and building trust with our customers, 
                making their shopping journey enjoyable and hassle-free.</p>
            <p><strong>VISION:</strong> Our vision is to be the leading online shopping destination, recognized for innovation, customer-centricity, 
                and an extensive product selection.We aspire to empower consumers with easy access to the latest trends, exceptional value, 
                and outstanding customer support, all while fostering a sustainable and socially responsible business model.</p>
        </div>
    </div>
</div>

<!-- Container (Services Section) -->
<div class="container-fluid text-center">
    <h2>SERVICES</h2>
    <h4>What we offer</h4>
    <br />
    <div class="row">
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-phone logo-small"></span>
            <h4>100% Fully Responsive</h4>
            <p>These days Mobile is the handiest device to access internet. 
               Hence your website must be mobile accessible as compatibility.</p>
        </div>
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-globe logo-small"></span>
            <h4>Cross Browser Compatibility</h4>
            <p>Cross-browser means web application works with all versions of all browsers. 
               To claim cross-browser compatibility, the website is nowadays expected to support browsers.</p>
        </div>
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-user logo-small"></span>
            <h4>Dedicated support team</h4>
            <p>Our support team guarantees to respond you within 24 working hours. 
               We will process tickets and respond you to in the queue order.</p>
        </div>
    </div>
    <br><br>
    <div class="row">
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-thumbs-up logo-small"></span>
            <h4>High Quality Products</h4>
            <p>Website design can do wonders for your traffic. 
               Giving a fresh look to your website makes your visitors think that you care for them and are ready to change with time.</p>
        </div>
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-lock logo-small"></span>
            <h4>Security & Privacy You Can Trust</h4>
            <p>At E-Shopping Mart, we understand that your security and privacy are of paramount importance when shopping online. 
               We are committed to ensuring that your shopping experience is safe, secure, and trustworthy. 
            </p>
        </div>
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-shopping-cart logo-small"></span>
            <h4 style="color:#303030;">Shopping Cart Services</h4>
            <p>Allows adding/removing items, updating quantities, and applying discount codes.
               Automated emails or notifications to customers who abandon their cart before checkout.
            </p>
        </div>
    </div>
</div>

<footer class="container-fluid text-center">
    <a href="#myPage" title="To Top">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </a>
    <p> Made By Yash Tailor</a></p>
</footer>
</asp:Content>
