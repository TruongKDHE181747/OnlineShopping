<%-- 
    Document   : orderHistoryDetail
    Created on : Oct 25, 2024, 1:36:00 PM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <jsp:include page="../common/css.jsp" />

        <style>
            body {
                background-color: #f8f9fa;
            }
            .card {
                border: none;
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            }
            .card-header {
                background-color: #f8f9fa;
                border-bottom: 1px solid #e9ecef;
            }
            .badge-success {
                background-color: #28a745;
            }
            .badge-pink {
                background-color: #fce4ec;
                color: #d81b60;
            }
            .table-gray {
                background-color: lightgrey;
            }
            .btn-outline-primary {
                color: #007bff;
                border-color: #007bff;
            }
            .btn-outline-primary:hover {
                background-color: #007bff;
                color: white;
            }
            .card-header{
                background: black;

            }
        </style>
    </head>
    <body>
        <%@include file="../common/header.jsp" %>

        <div class="container mt-5">
            <button class="btn btn-dark" onclick="goBack()">
                <i class="fa fa-arrow-left me-2"></i> Back
            </button>
        </div>
        <div class="container mt-5" style="margin-bottom: 70px">

            <h2 class="mb-4">Chi tiết đơn hàng</h2>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0 text-white">Thông tin đơn hàng</h5>
                        </div>
                        <div class="card-body">     
                            <p><strong>Ngày đặt hàng:</strong> ${order.orderedDate} </p>
                            <p><strong>Ngày nhận hàng:</strong> ${order.receiveDate != null ? order.receiveDate: '<span class="text-muted">Không có</span>'}</p>
                            <p><strong>Phương thức thanh toán:</strong> ${order.paymentMethodName}</p>
                            <p><strong>Trạng thái thanh toán:</strong> ${order.paymentStatusName}</p>
                            <p ><strong>Mã giao dịch VNPAY:</strong> ${order.vnpTxnRef != null ? order.vnpTxnRef: '<span class="text-muted">Không có</span>'}</p>
                            <p ><strong>Mã vận đơn:</strong> ${order.shippingCode != null ? order.shippingCode: '<span class="text-muted">Không có</span>'} </p>
                            <p><strong>Tổng tiền:</strong> <span class="badge badge-pink"><fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫" groupingUsed="true" /></span></p>
                            <p><strong>Trạng thái đơn hàng:</strong> <span <c:if test="${order.orderStatusId == 1}">class="badge-warning badge font-weight-bold"</c:if>
                                                                            <c:if test="${order.orderStatusId == 2}">class="badge-primary badge font-weight-bold"</c:if>
                                                                            <c:if test="${order.orderStatusId == 3}">class="badge-info badge font-weight-bold"</c:if>
                                                                            <c:if test="${order.orderStatusId == 4}">class="badge-success badge font-weight-bold"</c:if>
                                                                            <c:if test="${order.orderStatusId == 5}">class="badge-danger badge font-weight-bold"</c:if>                            
                                                                           >${order.orderStatusName}</span></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0 text-white">Thông tin khách hàng</h5>
                        </div>
                        <div class="card-body">
                            <p><strong>Tên người nhận:</strong> ${order.receiverName}</p>
                            <p><strong>Số điện thoại:</strong> ${order.phone}</p>
                            <p><strong>Email:</strong> ${order.email}</p>
                            <p><strong>Địa chỉ:</strong> ${order.address}, ${order.wardName}, ${order.districtName}, ${order.provinceName}</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mt-4">
                <div class="card-header">
                    <h5 class="mb-0 text-white">Sản phẩm</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="table-gray">
                                <tr>
                                    <th class="text-center">STT</th>
                                    <th>Sản phẩm</th>
                                    <th class="text-center">Kích cỡ</th>
                                    <th class="text-center">Số lượng</th>
                                    <th>Giá</th>
                                    <th>Tổng tiền</th>
                                    <th>Đánh giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="subtotal" value="0"></c:set>
                                <c:forEach var="o" items="${orderDetails}" varStatus="status">
                                    <tr>
                                        <td class="text-center">${status.index + 1}</td>
                                        <td>
                                            <img src="${o.thumbnail}" alt="Sản phẩm" class="img-thumbnail me-2" style="width: 50px;height: 50px">
                                            ${o.productName}
                                        </td>
                                        <td class="text-center">${o.sizeName}</td>
                                        <td class="text-center">${o.quantity}</td>
                                        <td><fmt:formatNumber value="${o.unitPrice}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                        <td><fmt:formatNumber value="${o.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                        <td><a href="#" class="btn btn-sm btn-outline-primary">Xem đánh giá</a></td>

                                        <c:set var="subtotal" value="${subtotal + o.totalPrice}"/>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="5" class="text-end"><strong>Tạm tính</strong></td>
                                    <td colspan="4"><fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                </tr>

                                <tr>
                                    <td colspan="5" class="text-end"><strong>Sử dụng voucher</strong></td>
                                    <td colspan="4" class="text-danger">-<fmt:formatNumber value="${subtotal*o.voucherPercent/100}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                </tr>
                                <tr>
                                    <td colspan="5" class="text-end"><strong>Phí vận chuyển</strong></td>
                                    <td colspan="4"><fmt:formatNumber value="${order.shippingFee}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                </tr>

                                <tr>
                                    <td colspan="5" class="text-end"><strong>Thành tiền</strong></td>
                                    <td colspan="4" class="text-success"><fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->

        <jsp:include page="../common/js.jsp" />

        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>
</html>