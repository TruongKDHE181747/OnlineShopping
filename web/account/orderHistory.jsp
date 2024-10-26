<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../common/css.jsp" />

        <style>
            .order-status {
                font-weight: bold;
            }
            .status-delivered {
                color: green;
            }
            .status-processing {
                color: orange;
            }
            .status-cancelled {
                color: red;
            }
        </style>
    </head>
    <body>
        <%@include file="../common/header.jsp" %>

        <div class="container mt-5">
            <div class="row "  style="margin-bottom: 40px">
                <jsp:include page="../account/profile-nav.jsp"/>
                
                <div class="table-responsive col-8">
                    <h3 class="mb-4">Lịch sử đơn hàng</h3>
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>STT</th>
                                <th>Ngày đặt hàng</th>
                                <th>Tổng tiền</th>
                                <th>Thanh toán</th>
                                <th>Trạng thái đơn hàng</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="o" varStatus="status">
                            <tr>
                                <td>${status.index +1}</td>
                                <td>${o.orderedDate}</td>
                                <td><fmt:formatNumber value="${o.totalAmount}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                <td>${o.paymentMethodName}</td>
                                <td>${o.orderStatusName}</td>
                                <td><a href="orderhistorydetail?orderId=${o.orderId}" class="btn btn-sm btn-primary"><span class="fa fa-eye"></span></a></td>
                            </tr>
                            </c:forEach>
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->

        <jsp:include page="../common/js.jsp" />
    </body>
</html>
