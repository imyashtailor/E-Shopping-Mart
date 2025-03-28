<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite1.master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Dashboard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        /* General Layout */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        /* Sidebar */
        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #34495e;
            padding-top: 20px;
            transition: all 0.3s ease;
        }

        .sidebar a {
            padding: 15px 25px;
            text-decoration: none;
            font-size: 18px;
            color: #fff;
            display: block;
            transition: all 0.3s ease;
            margin-bottom: 10px;
        }

        .sidebar a:hover {
            background-color: #2c3e50;
            border-radius: 5px;
        }

        /* Page content */
        .content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s ease;
        }

        /* Jumbotron (Dashboard Header) */
        .jumbotron {
            background: linear-gradient(135deg, #f4511e, #f06d06);
            color: white;
            padding: 100px 20px;
            text-align: center;
            border-radius: 10px;
            animation: fadeInUp 2s ease-in-out;
        }

        .jumbotron h1 {
            font-size: 3em;
            font-weight: bold;
        }

        .jumbotron p {
            font-size: 1.3em;
        }

        /* Hover effects for icons */
        .logo-small {
            color: #f4511e;
            font-size: 50px;
            transition: all 0.3s ease-in-out;
        }

        .logo-small:hover {
            color: #fff;
            transform: scale(1.3);
        }

        .logo {
            color: #f4511e;
            font-size: 200px;
            transition: all 0.3s ease-in-out;
        }

        .logo:hover {
            color: #fff;
            transform: scale(1.3);
        }

        /* Dashboard Cards */
        .dashboard-card {
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
        }

        .dashboard-card h3 {
            font-size: 1.6em;
            margin-bottom: 15px;
            color: #2c3e50;
        }

        .dashboard-card p {
            font-size: 1.2em;
            color: #f4511e;
        }

        .dashboard-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        /* Service Section */
        .service {
            text-align: center;
            padding: 50px 20px;
            transition: all 0.3s ease;
            border-radius: 8px;
        }

        .service:hover {
            transform: scale(1.05);
            background-color: #ecf0f1;
        }

        .service span {
            font-size: 70px;
            color: #f4511e;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .service span:hover {
            color: #34495e;
            transform: scale(1.2);
        }

        .service h4 {
            font-size: 1.5em;
            margin-bottom: 15px;
        }

        .service p {
            color: #7f8c8d;
            font-size: 1.1em;
        }

        /* Footer */
        footer {
            background-color: #2c3e50;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 1.1em;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        /* Animations */
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }

        /* Charts Styling */
        .chart-container {
            position: relative;
            height: 300px;
            margin-bottom: 30px;
            border-radius: 10px;
            background: linear-gradient(135deg, #f06d06, #f4511e);
            padding: 20px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .content {
                margin-left: 0;
            }

            .dashboard-card {
                margin-bottom: 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Dashboard Jumbotron -->
    <div class="jumbotron text-center">
        <h1>Admin Dashboard</h1>
        <p>Welcome to the Admin Dashboard!</p>
    </div>

    <!-- Dashboard Statistics -->
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="dashboard-card">
                    <h3>Orders</h3>
                    <p>120</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="dashboard-card">
                    <h3>Products</h3>
                    <p>200</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="dashboard-card">
                    <h3>Customers</h3>
                    <p>350</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="dashboard-card">
                    <h3>Revenue</h3>
                    <p>₹5,000</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Dashboard Charts Section -->
    <div class="container">
        <div class="row">
            <!-- Line Chart for Revenue Growth -->
            <div class="col-md-6">
                <div class="dashboard-card">
                    <h3>Revenue Growth</h3>
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>

            <!-- Bar Chart for Orders vs Products -->
            <div class="col-md-6">
                <div class="dashboard-card">
                    <h3>Orders vs Products</h3>
                    <canvas id="ordersProductsChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Admin Services Section -->
    <div class="container-fluid text-center">
        <h2>SERVICES</h2>
        <div class="row">
            <div class="col-sm-4 service">
                <span class="glyphicon glyphicon-stats logo-small"></span>
                <h4>Analytics</h4>
                <p>Real-time statistics to track and optimize business performance.</p>
            </div>
            <div class="col-sm-4 service">
                <span class="glyphicon glyphicon-wrench logo-small"></span>
                <h4>Settings</h4>
                <p>Manage user settings, configurations, and preferences.</p>
            </div>
            <div class="col-sm-4 service">
                <span class="glyphicon glyphicon-credit-card logo-small"></span>
                <h4>Payments</h4>
                <p>Monitor and manage payment transactions and methods.</p>
            </div>
        </div>
    </div>

   <!---Footer COntents Start here---->
        <hr />
        <footer>
            <div class ="container ">
                <p>iamytailor.com</p>
                <%--<p class ="pull-right "><a href ="#">Back to top</a></p>--%>
                <p>&copy;2025 EShopping.in &middot; <a href ="Default.aspx">Home</a>&middot;<a href ="About.aspx">About</a>&middot;<a href ="ContactUs.aspx">Contact</a>&middot;<a href ="ProductView.aspx">Products</a> </p>
            </div>

        </footer>

         <!---Footer COntents End---->

    <!-- Chart.js Script -->
    <script>
        // Revenue Growth Line Chart
        var ctx1 = document.getElementById('revenueChart').getContext('2d');
        var revenueChart = new Chart(ctx1, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June','July','August','September','October','November','December'],
                datasets: [{
                    label: 'Revenue (₹)',
                    data: [5000, 7000, 6000, 8000, 9000, 12000, 14000, 16000, 18000, 20000, 22000, 25000],
                    borderColor: 'rgba(255, 99, 132, 1)',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    fill: true,
                    tension: 0.1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: { beginAtZero: true },
                    y: { beginAtZero: true }
                }
            }
        });

        // Orders vs Products Bar Chart
        var ctx2 = document.getElementById('ordersProductsChart').getContext('2d');
        var ordersProductsChart = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['Orders', 'Products', 'Selling'],
                datasets: [{
                    label: 'Counts',
                    data: [120, 200, 360],
                    backgroundColor: ['rgba(54, 162, 235, 0.2)', 'rgba(75, 192, 192, 0.2)'],
                    borderColor: ['rgba(54, 162, 235, 1)', 'rgba(75, 192, 192, 1)'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: { y: { beginAtZero: true } }
            }
        });
    </script>
</asp:Content>
