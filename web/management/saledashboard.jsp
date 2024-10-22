<%-- 
    Document   : MyChart
    Created on : Oct 20, 2024, 10:35:35 PM
    Author     : Dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">



        <title>Dashboard</title>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&amp;display=swap" rel="stylesheet">
        <link class="js-stylesheet" href="css/light.css" rel="stylesheet">
        <!-- Font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <style>body {
                opacity: 0;
            }
        </style>
        <!-- END SETTINGS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">

        <jsp:include page="../common/css.jsp" />



    </head>
    <jsp:include page="../common/header.jsp" />
    <body >
        <div class="row">
            <jsp:include page="marketing_header.jsp"/>

            <div class="col-md-10" style="padding: 40px;">

                <div class="wrapper">

                    <div class="main">
                        <main class="content">
                            <div class="container-fluid p-0">
                                <div class="row">

                                    <form action="">
                                        <div class="shop__product__option">
                                            <div class="row">

                                                <%
                                    String begin = session.getAttribute("pobegin")+"";
                                String end = session.getAttribute("poend")+"";

                                if(begin.equals("null")) begin = "";
                                if(end.equals("null")) end = "";
        
                                                %>
                                                <div class="col-lg-6 col-md-6 col-sm-6">

                                                    <div class="row" >
                                                        <div class="col-md-6">
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text" id="inputGroup-sizing-default">From</span>
                                                                <input value="<%=begin%>" name="begin" type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-1">
                                                            --
                                                        </div>
                                                        <div class="col-md-5">
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text" id="inputGroup-sizing-default">To</span>
                                                                <input value="<%=end%>" name="end" type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                                            </div>

                                                        </div>


                                                    </div>

                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6">
                                                    <div class="shop__product__option__right row">
                                                        <div class="col-md-3">
                                                            <button  style="width: 80%" type="submit" class="btn btn-outline-dark">Apply</button>
                                                        
                                                        </div>
                                                        <div class="col-md-6">
                                                            <!-- Example single danger button -->
                                                        <div class="btn-group" >
                                                            
                                                            <button type="button" class="btn btn-primary" data-bs-toggle="dropdown" aria-expanded="false">
                                                                All
                                                                <i style="margin-left: 5px;" class="fa-solid fa-caret-down"></i>
                                                            </button>
                                                            <ul class="dropdown-menu">
                                                                <li><a class="dropdown-item" href="#">All</a></li>
                                                                <li><a class="dropdown-item" href="#">Sale 1</a></li>
                                                                
                                                            </ul>
                                                        </div>
                                                        </div>

                                                        

                                                    </div>

                                                    <%
                                                    String loi = session.getAttribute("ploi")+"";
                                                    String postsql = session.getAttribute("postsql")+"";
                                                    if(loi.equals("null")) loi = "";
                                                    %>
                                                    <div style="color: red;">
                                                        <%=loi%>
                                                    </div>
                                                </div>

                                                <!--<%=postsql%>-->
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <h1 class="h3 mb-3">Order Statistic</h1>

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

                                    <div class="col-12 col-lg-6">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="card-title">Doughnut Chart</h5>
                                                <h6 class="card-subtitle text-muted">Doughnut charts are excellent at showing the relational proportions between data.</h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="chart chart-sm">
                                                    <canvas id="chartjs-doughnut"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-lg-6">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="card-title">Pie Chart</h5>
                                                <h6 class="card-subtitle text-muted">Pie charts are excellent at showing the relational proportions between data.</h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="chart chart-sm">
                                                    <canvas id="chartjs-pie"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-lg-6">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="card-title">Radar Chart</h5>
                                                <h6 class="card-subtitle text-muted">A radar chart is a way of showing multiple data points and the variation between them.
                                                </h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="chart">
                                                    <canvas id="chartjs-radar"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-lg-6">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="card-title">Polar Area Chart</h5>
                                                <h6 class="card-subtitle text-muted">Polar area charts are similar to pie charts, but each segment has the same angle.</h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="chart">
                                                    <canvas id="chartjs-polar-area"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </main>


                    </div>
                </div> 
            </div>
        </div>



        <script src="js/app.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <script src="js/scripts.js"></script>
        <!-- Line Chart -->
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
                                data: [1000, 2000, 3000, 4000, 5400]
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
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Doughnut chart
                new Chart(document.getElementById("chartjs-doughnut"), {
                    type: "doughnut",
                    data: {
                        labels: ["Social", "Search Engines", "Direct", "Other"],
                        datasets: [{
                                data: [260, 125, 54, 146],
                                backgroundColor: [
                                    window.theme.primary,
                                    window.theme.success,
                                    window.theme.warning,
                                    "#dee2e6"
                                ],
                                borderColor: "transparent"
                            }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        cutoutPercentage: 65,
                        legend: {
                            display: false
                        }
                    }
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Pie chart
                new Chart(document.getElementById("chartjs-pie"), {
                    type: "pie",
                    data: {
                        labels: ["Social", "Search Engines", "Direct", "Other"],
                        datasets: [{
                                data: [260, 125, 54, 146],
                                backgroundColor: [
                                    window.theme.primary,
                                    window.theme.warning,
                                    window.theme.danger,
                                    "#dee2e6"
                                ],
                                borderColor: "transparent"
                            }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        legend: {
                            display: false
                        }
                    }
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Radar chart
                new Chart(document.getElementById("chartjs-radar"), {
                    type: "radar",
                    data: {
                        labels: ["Speed", "Reliability", "Comfort", "Safety", "Efficiency"],
                        datasets: [{
                                label: "Model X",
                                backgroundColor: "rgba(0, 123, 255, 0.2)",
                                borderColor: window.theme.primary,
                                pointBackgroundColor: window.theme.primary,
                                pointBorderColor: "#fff",
                                pointHoverBackgroundColor: "#fff",
                                pointHoverBorderColor: window.theme.primary,
                                data: [70, 53, 82, 60, 33]
                            }, {
                                label: "Model S",
                                backgroundColor: "rgba(220, 53, 69, 0.2)",
                                borderColor: window.theme.danger,
                                pointBackgroundColor: window.theme.danger,
                                pointBorderColor: "#fff",
                                pointHoverBackgroundColor: "#fff",
                                pointHoverBorderColor: window.theme.danger,
                                data: [35, 38, 65, 85, 84]
                            }]
                    },
                    options: {
                        maintainAspectRatio: false
                    }
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Polar Area chart
                new Chart(document.getElementById("chartjs-polar-area"), {
                    type: "polarArea",
                    data: {
                        labels: ["Speed", "Reliability", "Comfort", "Safety", "Efficiency"],
                        datasets: [{
                                label: "Model S",
                                data: [35, 38, 65, 70, 24],
                                backgroundColor: [
                                    window.theme.primary,
                                    window.theme.success,
                                    window.theme.danger,
                                    window.theme.warning,
                                    window.theme.info
                                ]
                            }]
                    },
                    options: {
                        maintainAspectRatio: false
                    }
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function (event) {
                setTimeout(function () {
                    if (localStorage.getItem('popState') !== 'shown') {
                        window.notyf.open({
                            type: "success",
                            message: "Get access to all 500+ components and 45+ pages with AdminKit PRO. <u><a class=\"text-white\" href=\"https://adminkit.io/pricing\" target=\"_blank\">More info</a></u> 🚀",
                            duration: 10000,
                            ripple: true,
                            dismissible: false,
                            position: {
                                x: "left",
                                y: "bottom"
                            }
                        });

                        localStorage.setItem('popState', 'shown');
                    }
                }, 15000);
            });
        </script>

    </body>



</html>
