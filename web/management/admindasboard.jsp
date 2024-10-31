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
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <title>Admin Page</title>
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
                                        <h5 class="card-title">Doanh thu theo tháng</h5>
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
                                        <h5 class="card-title">Đơn hàng theo tháng</h5>
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
                                        <h5 class="card-title">Tổng số đơn hàng trong tháng ${sessionScope.month}/${sessionScope.year}: ${sessionScope.totalOrder}</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart">
                                            <canvas id="chartjs-polar-area"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="card flex-fill w-100">
                                    <div class="card-header">
                                        <h5 class="card-title">Doanh thu theo nhãn hàng</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart">
                                            <canvas id="chartjs-line1"></canvas>
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
                    labels: [<c:forEach  items="${sessionScope.monthChart}" var="mc" > "${mc.label}",</c:forEach>],
                            datasets: [{
                            label: "Doanh thu (VND)",
                                    fill: true,
                                    backgroundColor: "transparent",
                                    borderColor: window.theme.primary,
                                    data: [<c:forEach  items="${sessionScope.monthChart}" var="mc" > "${mc.value}",</c:forEach>]
                            }, ]
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
                        labels: [<c:forEach items="${sessionScope.monthOrder}" var="mo">"${mo.label}",</c:forEach>],
                                datasets: [{
                                label: "Số lượng đơn hàng",
                                        backgroundColor: window.theme.primary,
                                        borderColor: window.theme.primary,
                                        hoverBackgroundColor: window.theme.primary,
                                        hoverBorderColor: window.theme.primary,
                                        data: [<c:forEach items="${sessionScope.monthOrder}" var="mo">"${mo.value}",</c:forEach>],
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
                // Polar Area chart
                new Chart(document.getElementById("chartjs-polar-area"), {
                type: "polarArea",
                        data: {
                        labels: [<c:forEach items="${sessionScope.monthStatus}" var="ms">"${ms.label}",</c:forEach>],
                                datasets: [{
                                label: "Model S",
                                        data: [<c:forEach items="${sessionScope.monthStatus}" var="ms">"${ms.value}",</c:forEach>, ],
                                        backgroundColor: [
                                                window.theme.primary,
                                                window.theme.success,
                                                window.theme.warning,
                                                window.theme.danger,
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
                document.addEventListener("DOMContentLoaded", function () {
                // Line chart for multiple brands
                new Chart(document.getElementById("chartjs-line1"), {
                type: "line",
                        data: {
                        // Labels for each month, assuming month labels are consistent across brands
                        labels: [
            <c:forEach items="${sessionScope.monthBrand}" var="mb" varStatus="status">
                    "${mb.label}"<c:if test="${!status.last}">,</c:if>
            </c:forEach>
                        ],
                                datasets: [
                                        // Loop through each unique brand to create a dataset
            <c:forEach items="${sessionScope.monthBrand}" var="brandData" varStatus="status">
                                {
                                label: "${brandData.brand}", // Brand name as line label
                                        fill: false, // Lines without fill
                                        backgroundColor: "transparent",
                                        borderColor: getRandomColor(), // Assign a random color for each line
                                        data: [
                <c:forEach items="${sessionScope.monthBrand}" var="dataPoint">
                    <c:if test="${dataPoint.brand == brandData.brand}">${dataPoint.value},</c:if>
                </c:forEach>
                                        ]
                                }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
                                ]
                        },
                        options: {
                        maintainAspectRatio: false,
                                plugins: {
                                legend: {
                                display: true,
                                        position: 'top'
                                },
                                        tooltip: {
                                        intersect: false
                                        }
                                },
                                scales: {
                                x: {
                                grid: {
                                color: "rgba(0, 0, 0, 0.05)"
                                }
                                },
                                        y: {
                                        ticks: {
                                        stepSize: 500
                                        },
                                                grid: {
                                                color: "rgba(0, 0, 0, 0.1)"
                                                }
                                        }
                                }
                        }
                });
                // Helper function to generate a random color for each brand line
                function getRandomColor() {
                const letters = '0123456789ABCDEF';
                let color = '#';
                for (let i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
                }
                return color;
                }
                });
        </script>




    </body>
</html>
