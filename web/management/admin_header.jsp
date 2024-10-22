<%-- 
    Document   : admin_header
    Created on : 22 thg 10, 2024, 15:50:15
    Author     : 84983
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <div class="col-md-2">
    <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="position: absolute; width: 100%; height: 100%; min-height: 600px">
        <hr>
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="../admindashboard" class="nav-link text-white home-link <c:if test="${pageContext.request.requestURI.endsWith('admindashboard')}">active</c:if>" aria-current="page">
                            <!-- Dashboard Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                                <path d="M8 .5l-6 6h1v8a1 1 0 0 0 1 1h3v-5h2v5h3a1 1 0 0 0 1-1v-8h1l-6-6z"/>
                            </svg>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="../adminuser" class="nav-link text-white product-link <c:if test="${pageContext.request.requestURI.endsWith('adminuser') || pageContext.request.requestURI.endsWith('search-product.jsp')}">active</c:if>">
                            <!-- Product Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm0 1a7 7 0 1 1 0 14A7 7 0 0 1 8 1zm0 11.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM8 3a3 3 0 1 1 0 6A3 3 0 0 1 8 3z"/>
                            </svg>
                            User List
                        </a>
                    </li>
                    <li>
                        <a href="../settinglist" class="nav-link text-white account-link <c:if test="${pageContext.request.requestURI.endsWith('settinglist')}">active</c:if>">
                            <!-- Slider Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sliders" viewBox="0 0 16 16">
                                <path d="M15 8a1 1 0 0 0 0-2h-4a1 1 0 0 0 0 2h4zM8 5a1 1 0 0 0 0-2H5a1 1 0 0 0 0 2h3zM8 10a1 1 0 0 0 0-2H5a1 1 0 0 0 0 2h3zM3 8a1 1 0 0 0 0-2H1a1 1 0 0 0 0 2h2z"/>
                            </svg>
                            Setting List
                        </a>
                    </li>
                    
            </ul>
        <hr>
    </div>
</div>
