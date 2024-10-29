<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <title>Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&amp;display=swap" rel="stylesheet">
        <link class="js-stylesheet" href="css/light.css" rel="stylesheet">
        <!-- Font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>body { opacity: 0; }</style>
        <!-- END SETTINGS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <jsp:include page="../common/css.jsp" />
    </head>
    <jsp:include page="../common/header.jsp" />
    <body>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <div class="row">
            <jsp:include page="marketing_header.jsp"/>
            <div class="row col-md-10">
                <!-- Biểu đồ đầu tiên -->
                <div class="col-md-6">
                    <canvas id="totalPostchart"></canvas>
                </div>
                
                <!-- Biểu đồ thứ hai -->
                <div class="col-md-6">
                    <canvas id="totalPostchart2"></canvas>
                </div>
                
                <!-- Biểu đồ thứ ba -->
                <div class="col-md-6 mt-5">
                    <canvas id="totalPostchart3"></canvas>
                </div>
                
                <!-- Biểu đồ thứ tư -->
                <div class="col-md-6 mt-5">
                    <canvas id="totalPostchart4"></canvas>
                </div>
            </div>
        </div>
        
        <!-- Mã biểu đồ -->
        <script>
            const ctx1 = document.getElementById("totalPostchart").getContext('2d');
            const labels1 = ['January', 'February', 'March', 'April', 'May', 'June', 'July'];
            const data1 = {
                labels: labels1,
                datasets: [{
                    label: 'Dataset 1',
                    data: [65, 59, 80, 81, 56, 55, 40],
                    fill: false,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                }]
            };
            const config1 = {
                type: 'line',
                data: data1,
            };
            new Chart(ctx1, config1);
        </script>
        
        <script>
            const ctx2 = document.getElementById("totalPostchart2").getContext('2d');
            const labels2 = [<c:forEach items="${sessionScope.posteachday}" var="c"> '${c.label}',    </c:forEach>];
            const data2 = {
                labels: labels2,
                datasets: [{
                    label: 'Dataset 2',
                    data: [<c:forEach items="${sessionScope.posteachday}" var="c"> ${c.value},    </c:forEach>],
                    fill: false,
                    borderColor: 'rgb(153, 102, 255)',
                    tension: 0.1
                }]
            };
            const config2 = {
                type: 'line',
                data: data2,
                
                 options: {
            scales: {
                y: {
                    ticks: {
                        stepSize: 1 
                    }
                }
            }
        }
            };
            new Chart(ctx2, config2);
        </script>
 
        <script>
            const ctx3 = document.getElementById("totalPostchart3").getContext('2d');
            const labels3 = ['January', 'February', 'March', 'April', 'May', 'June', 'July'];
            const data3 = {
                labels: labels3,
                datasets: [{
                    label: 'Dataset 3',
                    data: [50, 60, 65, 80, 70, 75, 60],
                    fill: false,
                    borderColor: 'rgb(255, 99, 132)',
                    tension: 0.1
                }]
            };
            const config3 = {
                type: 'line',
                data: data3,
            };
            new Chart(ctx3, config3);
        </script>

        <script>
            const ctx4 = document.getElementById("totalPostchart4").getContext('2d');
            const labels4 = [<c:forEach items="${sessionScope.postchart}" var="c"> '${c.label}',    </c:forEach>];
            const data4 = {
                labels: labels4,
                datasets: [{
                    label: 'Dataset 4',
                    data: [<c:forEach items="${sessionScope.postchart}" var="c"> ${c.value},    </c:forEach>],
                    fill: false,
                    borderColor: 'rgb(54, 162, 235)',
                    tension: 0.1
                }]
            };
            const config4 = {
                type: 'line',
                data: data4,
            };
            new Chart(ctx4, config4);
        </script>
    </body>
</html>
