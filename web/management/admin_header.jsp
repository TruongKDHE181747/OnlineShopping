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
                    <a href="../admindashboard" class="nav-link text-white home-link <c:if test="${pageContext.request.requestURI.endsWith('admindasboard.jsp')}">active bg-secondary</c:if>" aria-current="page">
                            <!-- Dashboard Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                                <path d="M8 .5l-6 6h1v8a1 1 0 0 0 1 1h3v-5h2v5h3a1 1 0 0 0 1-1v-8h1l-6-6z"/>
                            </svg>
                            Bảng điều khiển
                        </a>
                    </li>
                    <li>
                        <a href="../adminuser" class="nav-link text-white product-link <c:if test="${pageContext.request.requestURI.endsWith('adminuserlist.jsp') || pageContext.request.requestURI.endsWith('adminclassficationuser.jsp') || pageContext.request.requestURI.endsWith('adminsearchuser.jsp')}">active bg-secondary</c:if>">
                            <!-- Product Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.216 7A6.992 6.992 0 0 1 8 14a6.992 6.992 0 0 1 5.216 1H2.784zM8 15a7 7 0 0 0-6.71 5h13.42A7 7 0 0 0 8 15z"/>
                            </svg>

                            Danh sách tài khoản
                        </a>
                    </li>
                    <li>
                        <a href="../settinglist" class="nav-link text-white account-link <c:if test="${pageContext.request.requestURI.endsWith('settinglist.jsp')}">active bg-secondary</c:if>">
                        <!-- Slider Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
                            <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0zM9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.433 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.892 3.433-.901 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.892-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.368l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.116l.094-.318z"/>
                        </svg>

                            Cài đặt
                    </a>
                </li>

            </ul>
            <hr>
                </div>
                </div>
