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
                                <th style="vertical-align: top">STT</th>
                                <th style="vertical-align: top">Ngày đặt hàng</th>
                                <th style="vertical-align: top">Tổng tiền</th>
                                <th>Phương thức thanh toán</th>
                                <th>Trạng thái đơn hàng</th>
                                <th style="vertical-align: top">Xem</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="o" varStatus="status">
                                <tr>
                                    <td>${status.index +1}</td>
                                    <fmt:parseDate value="${o.orderedDate}" pattern="yyyy-MM-dd HH:mm:ss" var="orderDate" />
                                    <td><fmt:formatDate value="${orderDate}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
                                    <td><fmt:formatNumber value="${o.totalAmount}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                    <td 
                                        <c:if test="${o.paymentMethodId == 2}">class="text-primary font-weight-bold"</c:if>
                                        <c:if test="${o.paymentMethodId == 1}">class="text-success font-weight-bold"</c:if>
                                        >${o.paymentMethodName}</td>
                                    <td
                                        <c:if test="${o.orderStatusId == 1}">class="text-warning  font-weight-bold"</c:if>
                                        <c:if test="${o.orderStatusId == 2}">class="text-primary  font-weight-bold"</c:if>
                                        <c:if test="${o.orderStatusId == 3}">class="text-info  font-weight-bold"</c:if>
                                        <c:if test="${o.orderStatusId == 4}">class="text-success  font-weight-bold"</c:if>
                                        <c:if test="${o.orderStatusId == 5}">class="text-danger font-weight-bold"</c:if>
                                        <c:if test="${o.orderStatusId == 6}">class="text-success font-weight-bold"</c:if>
                                        >${o.orderStatusName}</td>
                                    <td>
                                        <form action="orderhistorydetail" method="get">
                                            <input type="hidden" name="orderId" value="${o.orderId}">
                                            <button class="btn btn-sm btn-dark"><span class="fa fa-eye"></span></button>
                                        </form>
                                    </td>
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
