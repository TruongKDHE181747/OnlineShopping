<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Thành Công</title>
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
                        <div class="display-1 text-success mb-4">
                            <i class="bi bi-check-circle"></i>
                        </div>
                        <h2 class="card-title mb-4">Thanh Toán Thành Công!</h2>
                        <p class="card-text">Cảm ơn bạn đã mua hàng. Giao dịch của bạn đã được hoàn tất thành công.</p>
                        <hr>
                        <div class="transaction-details mt-4">
                            <h4 class="mb-3">Chi Tiết Giao Dịch</h4>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>Mã Giao Dịch:</span>
                                    <span class="badge bg-primary rounded-pill">${vnp_TxnRef}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>Số Tiền:</span>
                                    <span class="badge bg-success rounded-pill"><fmt:formatNumber value="${vnp_Amount}" type="currency" currencySymbol="₫" groupingUsed="true" /></span>
                                </li>
                                
                                <%
                                    String vnpPayDateStr = request.getAttribute("vnp_PayDate").toString();
                                    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                                    SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                    Date date = inputFormat.parse(vnpPayDateStr);
                                    String formattedDate = outputFormat.format(date);
                                %>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>Ngày:</span>
                                    <span class="badge bg-secondary rounded-pill"><%=formattedDate%></span>
                                </li>
                            </ul>
                        </div>
                        <a href="orderstatus?status=success" class="btn btn-primary btn-lg mt-4">
                            <i class="bi bi-house-door me-2"></i>Trở Về Trang Chủ
                        </a>
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
