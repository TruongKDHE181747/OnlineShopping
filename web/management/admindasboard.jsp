<%-- 
    Document   : admin
    Created on : May 28, 2024, 9:07:04 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="icon" href="img/webLogo.jpg" type="image/x-icon" />
        <!-- CSS Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <!-- Script Link Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <jsp:include page="../common/css.jsp" />
        <!-- Font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="preconnect" href="https://fonts.gstatic.com">

        <link rel="canonical" href="charts-chartjs.html" />

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&amp;display=swap" rel="stylesheet">
        <link class="js-stylesheet" href="css/light.css" rel="stylesheet">

        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-120946860-10"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-120946860-10', {'anonymize_ip': true});
        </script>
        <style>
            .criteria{
                border: 1px solid #bb9797;
                border-radius: 6px;
                padding: 10px;
                box-shadow: 1px 1px 1px 1px #eeafaf;
            }

            .icon{
                justify-content: left;
                display: flex;
                align-items: center;
                font-size: 30px;

            }

            .content{
                text-align: right;
                padding: 0;
            }

            .content p{
                margin: 0;
            }

            .list2{
                margin-bottom: 22px;
            }

            .products{
                
            }

            .edit{
                display: inline-block;
                background-color: yellow;
                padding: 6px 8px;
                border-radius: 4px;
                cursor: pointer;
                box-shadow: 1px 1px 6px gray;
            }

            .remove{
                color: white;
                display: inline-block;
                background-color: red;
                padding: 6px 8px;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 12px;
                box-shadow: 1px 1px 6px gray;
            }

            .edit:hover,.remove:hover,.add:hover{
                opacity: 0.8;
            }

            .add{
                background-color: #c5c511;
                padding: 8px 10px;
                border-radius: 4px;
                color: white;
                cursor: pointer;
                box-shadow: 1px 1px 6px gray;
            }

            .product-img{
                width: 40%;
            }

            .product-img img{
                width: 60%;
            }

            .dropdown-toggle::after{
                color: white;
            }

            label{
                color: #8e7c7c;
            }

            select{
                padding: 16px;

            }

            .input{
                margin: 10px 0;
            }

            .search{
                width: 100%;
                margin-top: 10px;
                padding: 16px 0;
            }
        </style>
    </head>
    <body>
        <div class="row">
            <!-- START HEADER -->

            <jsp:include page="../common/header.jsp" />
            <jsp:include page="../management/admin_header.jsp" />

            <!-- END menu -->

            <div class="col-md-10" style="padding: 40px;">



                <!-- START products -->
                <div class="contract">
                    <div class="container products" >
                        <div class="row">
                            <div class="col-12 col-lg-6">
                                <div class="card flex-fill w-100">
                                    <div class="card-header">
                                        <h5 class="card-title">Line Chart</h5>
                                        <h6 class="card-subtitle text-muted">A line chart is a way of plotting data points on a line.</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart">
                                            <canvas id="chartjs-line"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-lg-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Bar Chart</h5>
                                        <h6 class="card-subtitle text-muted">A bar chart provides a way of showing data values represented as vertical bars.</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart">
                                            <canvas id="chartjs-bar"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            




                        </div>
                    </div>
                </div>
                <!-- END products -->


            </div>
        </div>
        <script src="js/app.js"></script>


        <script src="js/scripts.js"></script>
        <script>

            document.addEventListener("DOMContentLoaded", function () {
                // Line chart
                new Chart(document.getElementById("chartjs-line"), {
                    type: "line",
                    data: {
                        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        datasets: [{
                                label: "Sales ($)",
                                fill: true,
                                backgroundColor: "transparent",
                                borderColor: window.theme.primary,
                                     data: [<c:forEach  items="${dataList}" var="integer" > "${integer}",</c:forEach>]
                            }, {
                                label: "Orders",
                                fill: true,
                                backgroundColor: "transparent",
                                borderColor: "#adb5bd",
                                borderDash: [4, 4],
                                data: [958, 724, 629, 883, 915, 1214, 1476, 1212, 1554, 2128, 1466, 1827]
                            }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        legend: {
                            display: false
                        },
                        tooltips: {
                            intersect: false
                        },
                        hover: {
                            intersect: true
                        },
                        plugins: {
                            filler: {
                                propagate: false
                            }
                        },
                        scales: {
                            xAxes: [{
                                    reverse: true,
                                    gridLines: {
                                        color: "rgba(0,0,0,0.05)"
                                    }
                                }],
                            yAxes: [{
                                    ticks: {
                                        stepSize: 500
                                    },
                                    display: true,
                                    borderDash: [5, 5],
                                    gridLines: {
                                        color: "rgba(0,0,0,0)",
                                        fontColor: "#fff"
                                    }
                                }]
                        }
                    }
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Bar chart
                new Chart(document.getElementById("chartjs-bar"), {
                    type: "bar",
                    data: {
                        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        datasets: [{
                                label: "Last year",
                                backgroundColor: window.theme.primary,
                                borderColor: window.theme.primary,
                                hoverBackgroundColor: window.theme.primary,
                                hoverBorderColor: window.theme.primary,
                                data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
                                barPercentage: .75,
                                categoryPercentage: .5
                            }, {
                                label: "This year",
                                backgroundColor: "#dee2e6",
                                borderColor: "#dee2e6",
                                hoverBackgroundColor: "#dee2e6",
                                hoverBorderColor: "#dee2e6",
                                data: [69, 66, 24, 48, 52, 51, 44, 53, 62, 79, 51, 68],
                                barPercentage: .75,
                                categoryPercentage: .5
                            }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        legend: {
                            display: false
                        },
                        scales: {
                            yAxes: [{
                                    gridLines: {
                                        display: false
                                    },
                                    stacked: false,
                                    ticks: {
                                        stepSize: 20
                                    }
                                }],
                            xAxes: [{
                                    stacked: false,
                                    gridLines: {
                                        color: "transparent"
                                    }
                                }]
                        }
                    }
                });
            });
        </script>
        

    </body>
</html>
