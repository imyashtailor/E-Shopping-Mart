<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite1.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<title>Blog - Post Title</title>
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
    .blog-post {
        padding: 30px;
        background-color: #fff;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
    }
    .blog-post h2 {
        font-size: 36px;
        color: #f4511e;
    }
    .blog-post p {
        font-size: 18px;
        line-height: 1.6;
    }
    .sidebar {
        padding: 30px;
        background-color: #f9f9f9;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        margin-top: 30px;
    }
    .sidebar h3 {
        color: #f4511e;
    }
    .comments-section {
        margin-top: 30px;
    }
    .comment-box {
        margin-bottom: 20px;
        padding: 15px;
        background-color: #f1f1f1;
        border-radius: 5px;
    }
    .comment-box h4 {
        color: #f4511e;
    }
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<br />

<div class="jumbotron text-center">
    <h1>Blog Title: How to Build a Website</h1>
    <p>By Yash Tailor | March 1, 2025</p>
</div>

<!-- Container (Blog Content Section) -->
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <div class="blog-post">
                <h2>How to Build a Website from Scratch</h2>
                <p>
                    In this blog post, I will walk you through the steps involved in creating a website from scratch, covering the essential tools and technologies needed. Whether you’re looking to create a personal blog or a fully-fledged e-commerce website, these steps will guide you through the process.<br><br>

                    First, you need to decide what type of website you want to create. Are you building a simple informational website, a blog, or a complex e-commerce platform? Once you’ve determined the type of website, you can start planning the layout and content.<br><br>

                    Next, you’ll want to select a domain name and web hosting service. Many hosting providers also offer domain registration services, making it easy to get everything you need in one place.<br><br>

                    After that, it’s time to dive into website development. You’ll need to choose your tech stack (HTML, CSS, JavaScript, etc.) and decide if you want to build the website from scratch or use a content management system (CMS) like WordPress.<br><br>

                    Once the development is complete, it’s time for testing and optimization. Make sure your website is mobile-friendly, fast, and functional across all browsers.<br><br>

                    Finally, launch your website and promote it across social media channels, email newsletters, and other platforms to drive traffic.
                </p>
            </div>

            <!-- Comments Section -->
            <div class="comments-section">
                <h3>Leave a Comment</h3>
                <form>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter your name" name="name">
                    </div>
                    <div class="form-group">
                        <label for="comment">Comment:</label>
                        <textarea class="form-control" id="comment" placeholder="Enter your comment" name="comment" rows="4"></textarea>
                    </div>
                    <asp:Button class="btn btn-default btn-lg" ID="btnBlog" runat="server" Text="Submit" OnClick="btnBlog_Click" />
                </form>

                <h3>Recent Comments</h3>
                <div class="comment-box">
                    <h4>Yash Gandhi</h4>
                    <p>This is a great article! I learned a lot about web development. Thanks for sharing!</p>
                </div>
                <div class="comment-box">
                    <h4>Parth Gamit</h4>
                    <p>I found the section on choosing a hosting provider very helpful. Looking forward to reading more posts!</p>
                </div>
                <div class="comment-box">
                    <h4>Harsh Lakdiwala</h4>
                    <p>I read this article of blog post very helpfull to me. I learn a lot more about web development.
                       Looking forward to reading more posts!</p>
                </div>
            </div>
        </div>

        <!-- Sidebar with Recent Posts -->
        <div class="col-sm-4">
            <div class="sidebar">
                <h3>Recent Blog Posts</h3>
                <ul>
                    <li><a href="#">How to Optimize Your Website for SEO</a></li>
                    <li><a href="#">The Importance of Web Security</a></li>
                    <li><a href="#">Building Responsive Websites with Bootstrap</a></li>
                    <li><a href="#">Top JavaScript Frameworks You Should Learn in 2025</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<footer class="container-fluid text-center">
    <a href="#myPage" title="To Top">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </a>
    <p> iamytailor </p>
</footer>

</asp:Content>
