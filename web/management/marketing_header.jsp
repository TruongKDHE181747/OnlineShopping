<%-- 
    Document   : Marketing_header
    Created on : Sep 26, 2024, 3:47:38 PM
    Author     : quanpyke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>

   
   
            <!-- START HEADER -->

            <header class="p-3 text-bg-dark" style="z-index: 1;
                    position: relative;">
                <div class="container">
                    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                        <a href="admin.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                            <i style="font-size: 32px" class="bi bi-house-door-fill"></i>
                        </a>

                        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">

                        </ul>

                        <!-- User check exist -->

                        <!--                        <div class="text-end">
                        
                                                    <a href="login.jsp" class="btn btn-outline-light me-2" previewlistener="true">Login</a>
                                                    <a href="register.jsp" class="btn btn-warning" previewlistener="true">Sign-up</a>
                                                </div>-->


                        <div class="text-end" style="display: flex;">

                            <div class="dropdown text-end">

                                <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="img/user.png" alt="mdo" width="32" height="32" class="rounded-circle">
                                </a>
                                <ul class="dropdown-menu text-small">

                                    <li>
                                        <a class="dropdown-item" href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="img/user.png" alt="mdo" width="32" height="32" class="rounded-circle"> admin  
                                        </a>

                                    </li>
                                    <li><a class="dropdown-item" href="#">New project...</a></li>
                                    <li><a class="dropdown-item" href="#">Change password</a></li>
                                    <li><a class="dropdown-item" href="#">Profile</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Sign out</a></li>
                                </ul>
                            </div>
                        </div>




                    </div>
                </div>
            </header>

            <!-- END HEADER -->

            <!-- START menu -->
            <div class="col-md-2">
                <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="    position: absolute;
                     width: 16%;
                     top: 80px;
                     height: 120%;
                     bottom: 0;
                     ">

                    <hr>
                   

                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white home-link" aria-current="page">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="../home"/></svg>
                                Dashboard
                            </a>
                        </li>
                        <li>
                            <a href="../productlist" class="nav-link text-white product-link ">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                                Product
                            </a>
                        </li>
                        
                        <li>
                          <a href="../sliderlist" class="nav-link text-white account-link  <c:if test="${curlink == 'slider'}"> active </c:if> ">
    <svg class="bi pe-none me-2" width="16" height="16">
        <use xlink:href="#table"/>
    </svg>
    Slider
</a>
                        </li>

                        <li>
                            <a href="../customerlist" class="nav-link text-white station-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"/></svg>
                                Customer
                            </a>
                        </li>

                        <li>
                            <a href="#" class="nav-link text-white contract-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
                                Post
                            </a>
                        </li>
                        
                        <li>
                            <a href="#" class="nav-link text-white contract-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
                                Product Feedback
                            </a>
                        </li>
                        
                        <li>
                            <a href="#" class="nav-link text-white contract-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
                                Post Feedback
                            </a>
                        </li>
                        
                    </ul>
                    <hr>

                </div>
            </div>
 

