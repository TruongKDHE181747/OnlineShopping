

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

    <head>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

        <jsp:include page="../common/css.jsp" />

        <link rel="stylesheet" href="./account/css/registerstyle.css"/>
        <style>
            .payment-option {
                cursor: pointer;
                transition: all 0.3s ease;
            }
            .payment-option:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            .payment-option input[type="radio"]:checked + .card {
                border-color: #28a745;
                background-color: #d4edda;
            }
            .payment-option input[type="radio"]:checked + .card .card-body {
                color: #155724;
            }
            .payment-option input[type="radio"]:checked + .card .payment-icon {
                background-color: #28a745;
                color: white;
            }
            .payment-icon {
                font-size: 2rem;
                margin-bottom: 0.5rem;
                width: 60px;
                height: 60px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                background-color: #f8f9fa;
                margin: 0 auto 1rem;
                transition: all 0.3s ease;
            }
        </style>
    </head>

    <body>

        <jsp:include page="../common/header.jsp" />

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Xác nhận đơn hàng</h4>
                            <div class="breadcrumb__links">
                                <a href="homeslider">Trang chủ</a>
                                <a href="homeproduct">Sản phẩm</a>
                                <a href="cart">Giỏ hàng</a>
                                <span>Xác nhận</span>
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
                <div class="row">

                    <div class="col-lg-8">
                        <div class="shopping__cart__table">
                            <table>
                                <thead>
                                    <tr class="text-center">
                                        <th class="text-left">STT</th>
                                        <th>Sản phẩm</th>
                                        <th>Kích cỡ</th>
                                        <th>Số lượng</th>
                                        <th>Tổng</th>

                                    </tr>
                                </thead>

                                <tbody>
                                    <c:set var="subtotal" value="${0}"/>
                                    <c:forEach var="o" items="${items}" varStatus="status">
                                        <fmt:setLocale value="vi_VN" />
                                        <c:set var="price" value="${o.product.price - (o.product.price * o.product.discount / 100)}" />             

                                        <tr>
                                            <td class="text-left" style="width: 70px">${status.index +1}</td>
                                            <td class="product__cart__item">
                                                <div class="product__cart__item__pic">
                                                    <img style="width: 100px;height: 100px" src="${o.product.thumbnail}" alt="">
                                                </div>
                                                <div class="product__cart__item__text">
                                                    <h6 style="max-width: 90%">${o.product.product_name}</h6>
                                                    <h5><fmt:formatNumber value="${price}" type="currency" currencySymbol="₫" groupingUsed="true" /></h5>
                                                </div>
                                            </td>
                                            <td class="" style="width: 150px">
                                                <div class="text-center" >
                                                    ${o.size.size_name}
                                                </div>
                                            </td>
                                            <td class="" style="width: 150px">
                                                <div class="quantity">
                                                    <div class="text-center">
                                                        x${o.quantity}
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="cart__price text-center"><fmt:formatNumber value="${price*o.quantity}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                            <c:set var="subtotal" value="${subtotal + (price*o.quantity)}"/>



                                    <input type="hidden" name="pid_${status.index}" value="${o.product.product_id}">

                                    </tr>

                                    <c:set var="maxIndex" value="${status.index}" />
                                </c:forEach>

                                <input type="hidden" name="maxIndex" value="${maxIndex}">



                                </tbody>
                            </table>

                        </div>


                        <div class="row">
                            <h3 class="text-center mb-4">Payment Method</h3>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="payment-option w-100">
                                        <input type="radio" name="paymentMethod" value="1" class="d-none" checked onclick="setPaymentMethod(this.value)">
                                        <div class="card h-100">
                                            <div class="card-body text-center">
                                                <div class="payment-icon">💵</div>
                                                <h5 class="card-title">Thanh toán khi nhận hàng</h5>

                                            </div>
                                        </div>
                                    </label>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="payment-option w-100">
                                        <input type="radio" name="paymentMethod" value="2" class="d-none" onclick="setPaymentMethod(this.value)">
                                        <div class="card h-100">
                                            <div class="card-body text-center">
                                                <div class="payment-icon">💳</div>
                                                <h5 class="card-title">Thanh toán qua VNPAY</h5>

                                            </div>
                                        </div>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4">
                        <div class="checkout__order">
                            <div class="row">
                                <h4 class="mb-3 col-10" style="font-weight: bold">Địa chỉ giao hàng </h4>

                                <a href="address" class="btn btn-dark col-2" style="height: 40px"><span class="fa fa-pencil"></span></a>
                            </div>
                            <hr style="border: 0.1px solid black;">
                            <div class="mb-2">
                                <c:if test="${address != null}">
                                    <p class="mb-1"><strong>${address.receiver_name}</strong></p>
                                    <p class="mb-1">${address.address}, ${address.ward_name}, </p>
                                    <p class="mb-1">${address.district_name}, ${address.province_name}</p>
                                    <p class="mb-1">Số điện thoại: ${address.phone}</p>
                                </c:if>
                            </div>

                        </div>
                        <div class="cart__discount" style="margin-top: 20px">
                            <h6>Mã giảm giá</h6>
                            <c:if test="${sessionScope.voucherError!=null}">
                                <div class="alert-danger alert">
                                    ${sessionScope.voucherError}
                                </div>
                                <%
                                    session.removeAttribute("voucherError");
                                %>
                            </c:if>
                            <form action="applyVoucher" method="POST">
                                <input type="text" name="voucherCode" placeholder="Nhập mã giảm giá" maxlength="255" >
                                <input type="hidden" name="isCheckout" value="true">
                                <button type="submit">Áp dụng</button>
                            </form>
                            <c:if test="${sessionScope.voucher!=null}">
                                <div class="alert alert-secondary d-flex justify-content-between align-items-center" style="margin-top: 20px;">
                                    <span>${sessionScope.voucher.voucher_name} - <fmt:formatNumber value="${sessionScope.voucher.percent}" type="number" minFractionDigits="0" maxFractionDigits="2" />%</span>
                                    <button onclick="window.location.href = 'removeVoucher?isCheckout=true'" type="button" class="btn-close" aria-label="Close"></button>
                                </div>
                            </c:if>
                        </div>
                        <div >
                            <div class="checkout__order">
                                <h3 style="font-weight: bold;">Tổng đơn hàng</h3>
                                <hr style="border: 0.1px solid black;">
                                <ul class="checkout__total__all" style="border:none">
                                    <li style="font-weight: normal ">Tổng <span class="text-reset"><fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="₫" groupingUsed="true" /></span></li>

                                    <c:set var="discountPercent" value="${0}"/>
                                    <c:if test="${sessionScope.voucher!=null}">
                                        <c:set var="discountPercent" value="${sessionScope.voucher.percent/100}"/>
                                        <li style="font-weight: normal" >Mã giảm giá
                                            <span class="text-reset">- <fmt:formatNumber value="${subtotal*discountPercent}" type="currency" currencySymbol="₫" groupingUsed="true" /></span>
                                        </li>

                                    </c:if>
                                    <li style="font-weight: normal ">Phí vận chuyển <span class="text-reset"><fmt:formatNumber value="${ship}" type="currency" currencySymbol="₫" groupingUsed="true" /></span></li>
                                        <c:set var="total" value="${subtotal - subtotal*discountPercent + ship}"/>
                                    <li style="font-size: 21px;font-weight: bold">Thành tiền <span><fmt:formatNumber value="${total}" type="currency" currencySymbol="₫" groupingUsed="true" /></span></li>

                                </ul>
                                <hr style="border: 0.1px solid black;">
                                <form action="checkout" method="post">
                                    <input type="hidden" name="totalPrice" value="${subtotal}">
                                    <input type="hidden" name="shippingFee" value="${ship}">
                                    <input type="hidden" name="voucherId" value="${sessionScope.voucher.voucher_id}">
                                    <input type="hidden" name="totalAmount" value="${total}">
                                    <input id="selectedPaymentMethod" type="hidden" name="paymentMethod" value="1">


                                    <button type="submit" class="site-btn">Đặt hàng</button>
                                </form>
                            </div>
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

        <c:if test="${not empty sessionScope.systemError}">
            <script>
                                        alert('Lỗi hệ thống. Vui lòng thử lại sau !');
            </script>

            <%session.removeAttribute("noAddressError");%>
        </c:if>

    </body>

</html>