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
        <title>Bảng điều khiển</title>
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

            <jsp:include page="../common/headermanage.jsp" />
            <jsp:include page="../management/admin_header.jsp" />

            <!-- END menu -->

            <div class="col-md-10" style="padding: 40px;">
                <div style="margin-left: 20px">
                <form id="filter-form" action="../admindashboardfilter" class="d-flex justify-content-start mb-3">
                    <label for="month-select" class="form-label me-2">Tháng:</label>
                    <select id="month-select" name="months" class="form-select form-select-sm me-3" style="width: auto;">
                        <c:forEach var="months" begin="1" end="12">
                            <option value="${months}" <c:if test="${months == month}">selected</c:if>>Tháng ${months}</option>
                        </c:forEach>

                    </select>

                    <label for="year-select" class="form-label me-2">Năm:</label>
                    <select id="year-select" name="years" class="form-select form-select-sm me-3" style="width: auto;">
                        <c:forEach var="years" begin="2020" end="2030">
                            <option value="${years}" <c:if test="${years == year}">selected</c:if>>${years}</option>
                        </c:forEach>
                    </select>

                    <button type="submit" class="btn btn-primary">Áp dụng</button>
                </form>
                </div>

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
                                        <h5 class="card-title">Trung bình đánh giá sản phẩm trong tháng</h5>
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
                                        <h5 class="card-title">Tổng số đơn hàng trong tháng: ${sessionScope.totalOrder}</h5>
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
                                        <h5 class="card-title">Tổng số sản phẩm theo nhãn hàng trong tháng</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart">
                                            <canvas id="chartjs-polar-area1"></canvas>
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
                                        min:0,
                                        maxTicksLimit:10,
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
                                label: "Đánh giá: ",
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
                        labels: [<c:forEach items="${sessionScope.monthStatus}" var="mb">"${mb.label}",</c:forEach>],
                                datasets: [{
                                label: "Model S",
                                        data: [<c:forEach items="${sessionScope.monthStatus}" var="mb">"${mb.value}",</c:forEach>, ],
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
                // Polar Area chart
                new Chart(document.getElementById("chartjs-polar-area1"), {
                type: "polarArea",
                        data: {
                        labels: [<c:forEach  items="${sessionScope.monthBrand}" var="mc" > "${mc.label}",</c:forEach>],
                                datasets: [{
                                label: "Model S",
                                        data: [<c:forEach  items="${sessionScope.monthBrand}" var="mc" > "${mc.value}",</c:forEach>, ],
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



    </body>
</html>
