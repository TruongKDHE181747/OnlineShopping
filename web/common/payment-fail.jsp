<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Failed</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-body text-center">
                            <div class="display-1 text-danger mb-4">
                                <i class="bi bi-x-circle"></i>
                            </div>
                            <h2 class="card-title mb-4">Payment Failed</h2>
                            <p class="card-text">We're sorry, but your payment could not be processed at this time. Please review the details below and try again.</p>
                            <hr>
                            <div class="transaction-details mt-4">
                                <h4 class="mb-3">Transaction Details</h4>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span>Transaction ID:</span>
                                        <span class="badge bg-secondary rounded-pill">${vnp_TxnRef}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span>Amount:</span>
                                        <span class="badge bg-danger rounded-pill"><fmt:formatNumber value="${vnp_Amount}" type="currency" currencySymbol="₫" groupingUsed="true" /></span>
                                    </li>
                                    <%
                                 
                                        String vnpPayDateStr = request.getAttribute("vnp_PayDate").toString();
                                        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                                        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                        Date date = inputFormat.parse(vnpPayDateStr);
                                        String formattedDate = outputFormat.format(date);
                                    %>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span>Date:</span>
                                        <span class="badge bg-secondary rounded-pill"><%=formattedDate%></span>
                                    </li>
                                </ul>
                            </div>

                            <a href="orderstatus?status=fail" class="btn btn-primary btn-lg mt-4">
                                <i class="bi bi-cart me-2"></i>Return to Home
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>