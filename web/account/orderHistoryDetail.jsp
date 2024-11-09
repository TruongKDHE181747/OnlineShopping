

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .table td, .table th {
                vertical-align: middle !important;
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
                        <div class="card-header" style="background-color: #000000;">
                            <h5 class="mb-0 text-white">Thông tin đơn hàng</h5>
                        </div>
                        <div class="card-body">     
                            <fmt:parseDate value="${order.orderedDate}" pattern="yyyy-MM-dd HH:mm:ss" var="orderDate" />
                            <p><strong>Ngày đặt hàng:</strong> <fmt:formatDate value="${orderDate}" pattern="dd/MM/yyyy HH:mm:ss" /> </p>
                            <fmt:parseDate value="${order.receiveDate}" pattern="yyyy-MM-dd HH:mm:ss" var="receiveDate" />
                            <p><strong>Ngày nhận hàng (dự kiến):</strong> 
                                <c:if test="${order.receiveDate != null}"><fmt:formatDate value="${receiveDate}" pattern="dd/MM/yyyy HH:mm:ss" /></c:if>
                                <c:if test="${order.receiveDate == null}"><span class="text-muted">Không có</span></c:if></p>

                                <p><strong>Phương thức thanh toán:</strong> <span 
                                    <c:if test="${order.paymentMethodId == 2}">class="badge-primary badge font-weight-bold"</c:if>
                                    <c:if test="${order.paymentMethodId == 1}">class="badge-info badge font-weight-bold"</c:if>
                                    > ${order.paymentMethodName}</span></p>
                            <p><strong>Trạng thái thanh toán:</strong> <span  <c:if test="${order.paymentStatusId == 1}">class="badge-warning badge font-weight-bold"</c:if>
                                                                                                                         <c:if test="${order.paymentStatusId == 2}">class="badge-success badge font-weight-bold"</c:if>
                                                                                                                         <c:if test="${order.paymentStatusId == 3}">class="badge-danger badge font-weight-bold"</c:if>
                                                                                                                         <c:if test="${order.paymentStatusId == 4}">class="badge-warning badge font-weight-bold"</c:if>
                                                                                                                         <c:if test="${order.paymentStatusId == 5}">class="badge-info badge font-weight-bold"</c:if>
                                                                                                                         <c:if test="${order.paymentStatusId == 5}">class="badge-success badge font-weight-bold"</c:if>
                                                                                                                         >${order.paymentStatusName}</span></p>
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
                        <div class="card-header" style="background-color: #000000;">
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
                <div class="card-header" style="background-color: #000000;">
                    <h5 class="mb-0 text-white">Sản phẩm</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered " >
                            <thead class="table-gray">
                                <tr>
                                    <th class="text-center">STT</th>
                                    <th>Sản phẩm</th>
                                    <th class="text-center">Kích cỡ</th>
                                    <th class="text-center">Số lượng</th>
                                    <th>Giá</th>
                                    <th>Tổng tiền</th>
                                    <th class="text-center">Đánh giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="subtotal" value="0"></c:set>
                                <c:forEach var="o" items="${orderDetails}" varStatus="status">
                                    <tr>
                                        <td class="text-center"> ${status.index + 1}</td>
                                        <td>
                                            <img src="${o.thumbnail}" alt="Sản phẩm" class="img-thumbnail me-2" style="width: 50px;height: 50px">
                                            ${o.productName}
                                        </td>
                                        <td class="text-center">${o.sizeName}</td>
                                        <td class="text-center">${o.quantity}</td>
                                        <td><fmt:formatNumber value="${o.unitPrice}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                        <td><fmt:formatNumber value="${o.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>




                                        <td class="text-center">
                                            <c:if test="${order.orderStatusId == 4}">
                                                <form action="${pageContext.request.contextPath}/productfeedback" method="get">
                                                    <input type="hidden" name="pid" value="${o.productId}">
                                                    <input type="hidden" name="oid" value="${order.orderId}">
                                                    <button type="submit" class="btn btn-sm btn-outline-dark">Đánh giá</button>
                                                </form>
                                            </c:if>
                                            <c:if test="${order.orderStatusId != 4}">
                                                <button onclick="alert('Bạn chỉ có thể đánh giá khi đã nhận hàng.')" type="button" class="btn btn-sm btn-outline-dark">Đánh giá</button>
                                            </c:if>
                                        </td>

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
                                    <td colspan="4" class="text-danger">-<fmt:formatNumber value="${subtotal*order.voucherPercent/100}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
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
            <c:if test="${order.orderStatusId == 1 || order.orderStatusId == 2 || order.orderStatusId == 6}">
                <div class="text-right mt-4 mb-5">
                    <button id="cancelButton" onclick="cancelOrder(${order.orderId},${order.paymentMethodId},${order.paymentStatusId})" type="button" class="btn btn-danger btn-lg" aria-label="Hủy đơn hàng">
                        Hủy đơn hàng
                    </button>                   
                </div>
            </c:if>
        </div>


        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->



        <script>
            function cancelOrder(orderId, methodId, payStatus) {
                document.getElementById('cancelButton').disabled = true;
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "cancelorder", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("orderId=" + orderId + "&methodId=" + methodId + "&payStatus=" + payStatus);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        alert("Hủy đơn hàng thành công !");
                        location.reload();
                    }
                };
            }
            function goBack() {
                window.location.href = '${pageContext.request.contextPath}/orderHistory';
            }
        </script>

        <script src="${pageContext.request.contextPath}/common/js/jquery.nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/jquery.nicescroll.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/jquery.countdown.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/jquery.slicknav.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/mixitup.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/owl.carousel.min.js"></script>
    </body>
</html>