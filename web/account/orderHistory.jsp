
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
                    <h3 class="mb-4">Order History</h3>
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>No.</th>
                                <th>Order Date</th>
                                <th>Total</th>
                                <th>Payment Method</th>
                                <th>Payment Status</th>
                                <th>Order Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="o" varStatus="status">
                            <tr>
                                <td>${status.index +1}</td>
                                <td>${o.orderedDate}</td>
                                <td>${o.totalAmount}</td>
                                <td></td>
                                <td></td>
                                <td><span class="order-status"></span></td>
                                <td><button class="btn btn-sm btn-primary"><span class="fa fa-eye"></span></button></td>
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
