<%-- 
    Document   : Marketing_header
    Created on : Sep 26, 2024, 3:47:38 PM
    Author     : quanpyke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- START menu -->
<div class="col-md-2">
    <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="position: absolute; width: 100%; height: 100%; min-height: 600px">
        <hr>
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="../dashboard" class="nav-link text-white home-link <c:if test="${pageContext.request.requestURI.endsWith('dashboard')}">active</c:if>" aria-current="page">
                            <!-- Dashboard Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                                <path d="M8 .5l-6 6h1v8a1 1 0 0 0 1 1h3v-5h2v5h3a1 1 0 0 0 1-1v-8h1l-6-6z"/>
                            </svg>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="../productlist" class="nav-link text-white product-link <c:if test="${pageContext.request.requestURI.endsWith('product-list.jsp') || pageContext.request.requestURI.endsWith('search-product.jsp')}">active</c:if>">
                            <!-- Product Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-fill" viewBox="0 0 16 16">
                                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h9V.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1v8a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V5H0a.5.5 0 0 1-.5-.5V.5a.5.5 0 0 1 .5-.5h2zM8 1v1H5.5a.5.5 0 0 0-.5.5V5h8V3H8zm5 10h1v-8H3v8h10z"/>
                            </svg>
                            Product
                        </a>
                    </li>
                    <li>
                        <a href="../sliderlist" class="nav-link text-white account-link <c:if test="${pageContext.request.requestURI.endsWith('sliderlist')}">active</c:if>">
                            <!-- Slider Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sliders" viewBox="0 0 16 16">
                                <path d="M15 8a1 1 0 0 0 0-2h-4a1 1 0 0 0 0 2h4zM8 5a1 1 0 0 0 0-2H5a1 1 0 0 0 0 2h3zM8 10a1 1 0 0 0 0-2H5a1 1 0 0 0 0 2h3zM3 8a1 1 0 0 0 0-2H1a1 1 0 0 0 0 2h2z"/>
                            </svg>
                            Slider
                        </a>
                    </li>
                    <li>
                        <a href="../customerlist" class="nav-link text-white station-link <c:if test="${pageContext.request.requestURI.endsWith('customerlist')}">active</c:if>">
                            <!-- Customer Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm0 1a7 7 0 1 1 0 14A7 7 0 0 1 8 1zm0 11.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM8 3a3 3 0 1 1 0 6A3 3 0 0 1 8 3z"/>
                            </svg>
                            Customer
                        </a>
                    </li>
                    <li>
                        <a href="../listpostmarketing" class="nav-link text-white contract-link <c:if test="${pageContext.request.requestURI.endsWith('postmarketing.jsp')}">active</c:if>">
                            <!-- Post Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
                                <path d="M9.293 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1V5.707l-4.293-4.293A1 1 0 0 0 9.293 0zM11 1v1H5.5a.5.5 0 0 0-.5.5V5h8V3H8zm5 10h1v-8H3v8h10z"/>
                            </svg>
                            Post
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white contract-link <c:if test="${pageContext.request.requestURI.endsWith('productfeedback')}">active</c:if>">
                            <!-- Product Feedback Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square" viewBox="0 0 16 16">
                                <path d="M1 0h14a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H3l-2 2V1a1 1 0 0 1 1-1z"/>
                            </svg>
                            Product Feedback
                        </a>
                    </li>
                    <li>
                        <a href="../postfeedbacklist" class="nav-link text-white contract-link <c:if test="${pageContext.request.requestURI.endsWith('postfeedback')}">active</c:if>">
                        <!-- Post Feedback Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left" viewBox="0 0 16 16">
                            <path d="M0 3a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H2l-1 1V3z"/>
                        </svg>
                        Post Feedback
                    </a>
                </li>
                        <li>
                        <a href="../voucherlist" class="nav-link text-white contract-link <c:if test="${pageContext.request.requestURI.endsWith('voucherlist')}">active</c:if>">
                        <!-- Post Feedback Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-ticket-detailed" viewBox="0 0 16 16">
                            <path d="M0 3a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H2l-1 1V3z"/>
                        </svg>
                        Voucher
                    </a>
                </li>
            </ul>
        <hr>
    </div>
</div>
<!-- END menu -->
