

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
    </head>

    <body>

        <jsp:include page="../common/header.jsp" />

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Shopping Cart</h4>
                            <div class="breadcrumb__links">
                                <a href="#">Home</a>
                                <a href="#">Shop</a>
                                <span>Shopping Cart</span>
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
                        <form method="GET" action="updateCart">
                            <div class="shopping__cart__table">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>&nbsp;Size</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th></th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <c:forEach var="o" items="${cart}" varStatus="status">
                                            <fmt:setLocale value="vi_VN" />
                                            <c:set var="price" value="${o.product.price - (o.product.price * o.product.discount / 100)}" />             

                                            <tr >
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__pic">
                                                        <img style="width: 100px;height: 100px" src="${o.product.thumbnail}" alt="">
                                                    </div>
                                                    <div class="product__cart__item__text">
                                                        <h6>${o.product.product_name}</h6>
                                                        <h5><fmt:formatNumber value="${price}" type="currency" currencySymbol="₫" groupingUsed="true" /></h5>
                                                    </div>
                                                </td>
                                                <td class="cart__price">
                                                    <div >
                                                        <select id="sid_${status.index}" name="sid_${status.index}">
                                                            <c:forEach var="s" items="${listSize}">
                                                                <c:if test="${o.product.product_id == s.product_id}">
                                                                    <option ${o.size.size_id == s.size_id ? "selected":""} value="${s.size_id}">${s.size_name}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td class="quantity__item">
                                                    <div class="quantity">
                                                        <div class="pro-qty-2">
                                                            <input id="quantity_${status.index}" name="quantity_${status.index}" type="text" value="${o.quantity}">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="cart__price"><fmt:formatNumber value="${price*o.quantity}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                                <td class="cart__close"><a class="text-reset" href="removeOne?pid=${o.product.product_id}&sid=${o.size.size_id}"><i class="fa fa-close"></i></a></td>


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
                                    <div class="continue__btn update__btn " >
                                        <button onclick="window.location.href='./removeAll'" style="width: 80%;margin-right:auto" class="btn btn-block btn-dark btn-lg" type="button">Remove all</button>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="continue__btn update__btn " style="margin: auto">
                                        <button style="width: 80%;margin-left:auto" class="btn btn-block btn-dark btn-lg" type="submit"><i class="fa fa-spinner"></i> Update cart</button>
                                    </div>
                                </div>
                            </div>
                                    <div class="row" style="margin-top: 30px">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="continue__btn text-center" >
                                        <a style="width: 100%" href="#">Continue Shopping</a>
                                    </div>
                                </div>
        
                            </div>
                        </form>
                    </div>

                    <div class="col-lg-4">
                        <div class="cart__discount">
                            <h6>Discount codes</h6>
                            <form action="#">
                                <input type="text" placeholder="Coupon code">
                                <button type="submit">Apply</button>
                            </form>
                        </div>
                        <div class="cart__total">
                            <h6>Cart total</h6>
                            <ul>
                                <li>Subtotal <span>$ 169.50</span></li>
                                <li>Total <span>$ 169.50</span></li>
                            </ul>
                            <a href="#" class="primary-btn">Proceed to checkout</a>
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

    </body>

</html>

