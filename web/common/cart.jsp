<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <jsp:include page="../common/css.jsp" />
        <link rel="stylesheet" href="./account/css/registerstyle.css" />
    </head>

    <body>
        <jsp:include page="../common/header.jsp" />

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Giỏ hàng</h4>
                            <div class="breadcrumb__links">
                                <a href="homeslider">Trang chủ</a>
                                <a href="homeproduct">Sản phẩm</a>
                                <span>Giỏ hàng</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Start your project here -->
        <section class="shopping-cart spad">
            <div class="container">
                <c:if test="${not empty sessionScope.cartQuantityError}">



                    <div class="text-danger row" style="margin-bottom: 50px;">
                        ${sessionScope.cartQuantityError}
                    </div>


                    <% session.removeAttribute("cartQuantityError"); %>
                </c:if>
                <div class="row">

                    <div class="col-lg-8">



                        <form method="GET" action="updateCart">
                            <div class="shopping__cart__table">

                                <table>
                                    <thead>
                                        <tr class="text-center">
                                            <th>Sản phẩm</th>
                                            <th class="text-left">Kích cỡ</th>
                                            <th>Số lượng</th>
                                            <th>Tổng</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="subtotal" value="${0}" />
                                        <c:forEach var="o" items="${cart}" varStatus="status">
                                            <fmt:setLocale value="vi_VN" />
                                            <c:set var="price" value="${o.product.price - (o.product.price * o.product.discount / 100)}" />

                                            <tr>
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__pic">
                                                        <img style="width: 100px;height: 100px" src="${o.product.thumbnail}" alt="">
                                                    </div>
                                                    <div class="product__cart__item__text">
                                                        <h6 style="max-width: 90%">${o.product.product_name}</h6>
                                                        <h5><fmt:formatNumber value="${price}" type="currency" currencySymbol="₫" groupingUsed="true" /></h5>
                                                    </div>
                                                </td>
                                                <td  style="width: 100px;">
                                                    <div >
                                                        <select   id="sid_${status.index}" name="sid_${status.index}" >
                                                            <c:forEach var="s" items="${listSize}">
                                                                <c:if test="${o.product.product_id == s.product_id && s.quantity > 0}">
                                                                    <option ${o.size.size_id == s.size_id ? "selected" : ""} value="${s.size_id}">${s.size_name}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td class="quantity__item" style="width: 150px">
                                                    <div class="quantity">
                                                        <div class="text-center">
                                                            <input style="width: 60px;text-align: center" id="quantity_${status.index}" name="quantity_${status.index}" type="number" min="1" value="${o.quantity}">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="cart__price text-center"><fmt:formatNumber value="${price * o.quantity}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                                <c:set var="subtotal" value="${subtotal + (price * o.quantity)}" />
                                                <td class="cart__close text-center"><a class="text-reset" href="removeOne?pid=${o.product.product_id}&sid=${o.size.size_id}"><i class="fa fa-close"></i></a></td>

                                        <input type="hidden" name="pid_${status.index}" value="${o.product.product_id}">
                                        </tr>
                                        <c:set var="maxIndex" value="${status.index}" />
                                    </c:forEach>
                                    <input type="hidden" name="maxIndex" value="${maxIndex}">
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="continue__btn update__btn ">
                                        <button onclick="window.location.href = './removeAll'" style="width: 80%;margin-right:auto" class="btn btn-block btn-dark btn-lg" type="button">Xóa tất cả</button>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="continue__btn update__btn " style="margin: auto">
                                        <button style="width: 80%;margin-left:auto" class="btn btn-block btn-dark btn-lg" type="submit"><i class="fa fa-spinner"></i> Cập nhật giỏ hàng</button>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 30px">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="continue__btn text-center">
                                        <a style="width: 100%" href="${pageContext.request.contextPath}/homeproduct">Tiếp tục mua sắm</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-lg-4">
                        <div class="cart__discount">
                            <h6>Mã giảm giá</h6>
                            <c:if test="${sessionScope.voucherError != null}">
                                <div class="alert-danger alert">
                                    ${sessionScope.voucherError}
                                </div>
                                <%
                                    session.removeAttribute("voucherError");
                                %>
                            </c:if>
                            <form action="applyVoucher" method="POST">
                                <input type="text" name="voucherCode" placeholder="Nhập mã giảm giá" maxlength="255">
                                <button type="submit">Áp dụng</button>
                            </form>
                            <c:if test="${sessionScope.voucher != null}">
                                <div class="alert alert-secondary d-flex justify-content-between align-items-center" style="margin-top: 20px;">
                                    <span>${sessionScope.voucher.voucher_name} - <fmt:formatNumber value="${sessionScope.voucher.percent}" type="number" minFractionDigits="0" maxFractionDigits="2" />%</span>
                                    <button onclick="window.location.href = 'removeVoucher'" type="button" class="btn-close" aria-label="Close"></button>
                                </div>
                            </c:if>
                        </div>
                        <div class="cart__total">
                            <h4>Tổng giỏ hàng</h4>
                            <hr>
                            <ul>
                                <li style="font-weight: normal ">Tổng phụ <span class="text-reset"><fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="₫" groupingUsed="true" /></span></li>
                                    <c:set var="discountPercent" value="${0}" />
                                    <c:if test="${sessionScope.voucher != null}">
                                        <c:set var="discountPercent" value="${sessionScope.voucher.percent / 100}" />
                                    <li style="font-weight: normal">Mã giảm giá
                                        <span class="text-reset">- <fmt:formatNumber value="${subtotal * discountPercent}" type="currency" currencySymbol="₫" groupingUsed="true" /></span>
                                    </li>
                                </c:if>
                                <c:set var="total" value="${subtotal - subtotal * discountPercent}" />
                                <li style="font-size: 21px;font-weight: bold">Tổng <span><fmt:formatNumber value="${total}" type="currency" currencySymbol="₫" groupingUsed="true" /></span></li>
                            </ul>
                            <a href="checkout" class="primary-btn">Xác nhận đơn hàng</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- End your project here -->
        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <jsp:include page="../common/js.jsp" />


        <c:if test="${not empty sessionScope.cartError}">
            <script>
                                        alert('${sessionScope.cartError}');
            </script>

            <% session.removeAttribute("cartError"); %>
        </c:if>

        <c:if test="${not empty sessionScope.noAddressError}">
            <script>
                if (confirm('${sessionScope.noAddressError} Bạn có muốn tạo một địa chỉ ngay bây giờ không?')) {
                    window.location.href = 'address';
                }
            </script>

            <% session.removeAttribute("noAddressError"); %>
        </c:if>
    </body>

</html>
