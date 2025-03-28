<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite1.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<title>Contact Us</title>
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
    // JavaScript can be added here for form submission or any other functionality.
    // ]]>
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<br />

<div class="jumbotron text-center">
    <h1>Contact Us</h1>
    <p>We'd love to hear from you!</p>
</div>

<!-- Container (Contact Section) -->
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <h2>Contact Information</h2>
            <p>If you have any questions or inquiries, feel free to reach out to us. We would be happy to assist you.</p>
            <form action="yourformhandler.aspx" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter your name" name="name">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter your email" name="email">
                </div>
                <div class="form-group">
                    <label for="message">Message:</label>
                    <textarea class="form-control" id="message" placeholder="Enter your message" name="message" rows="4"></textarea>
                </div>
                <asp:Button class="btn btn-default btn-lg" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </form>
        </div>
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-map-marker logo"></span>
            <h3>Our Location</h3>
            <p>123 E-Shop Street, Online City, ECommerce Country, America</p>
            <h3>Call Us</h3>
            <p>+123 456 7890</p>
            <h3>Email</h3>
            <p>contact@E-Shopping.in</p>
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
            <p><strong>MISSION:</strong> Our mission is to provide a seamless, personalized, and secure online shopping experience by offering a diverse range of high-quality products at competitive prices. We are committed to delivering excellent customer service, ensuring convenience, and building trust with our customers, making their shopping journey enjoyable and hassle-free.</p>
            <p><strong>VISION:</strong> Our vision is to be the leading online shopping destination, recognized for innovation, customer-centricity, and an extensive product selection. We aspire to empower consumers with easy access to the latest trends, exceptional value, and outstanding customer support, all while fostering a sustainable and socially responsible business model.</p>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="container-fluid text-center">
    <a href="#myPage" title="To Top">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </a>
    <p>Made By Yash Tailor</p>
</footer>

</asp:Content>
