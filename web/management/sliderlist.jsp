<%-- 
    Document   : admin
    Created on : May 28, 2024, 9:07:04 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="icon" href="img/webLogo.jpg" type="image/x-icon" />
        <!-- CSS Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <!-- Script Link Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <!-- Font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            .criteria{
                border: 1px solid #bb9797;
                border-radius: 6px;
                padding: 10px;
                box-shadow: 1px 1px 1px 1px #eeafaf;
            }

            .icon{
                justify-content: left;
                display: flex;
                align-items: center;
                font-size: 30px;

            }

            .content{
                text-align: right;
                padding: 0;
            }

            .content p{
                margin: 0;
            }

            .list2{
                margin-bottom: 22px;
            }

            .products{
                border: 1px solid gray;
                border-radius: 12px;
                box-shadow: 1px 1px 4px gray;
            }

            .edit{
                display: inline-block;
                background-color: yellow;
                padding: 6px 8px;
                border-radius: 4px;
                cursor: pointer;
                box-shadow: 1px 1px 6px gray;
            }

            .remove{
                color: white;
                display: inline-block;
                background-color: red;
                padding: 6px 8px;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 12px;
                box-shadow: 1px 1px 6px gray;
            }

            .edit:hover,.remove:hover,.add:hover{
                opacity: 0.8;
            }

            .add{
                background-color: #c5c511;
                padding: 8px 10px;
                border-radius: 4px;
                color: white;
                cursor: pointer;
                box-shadow: 1px 1px 6px gray;
            }

            .product-img{
                width: 40%;
            }

            .product-img img{
                width: 60%;
            }
            
            .dropdown-toggle::after{
                color: white;
            }

            label{
                color: #8e7c7c;
            }

            select{
                padding: 16px;

            }

            .input{
                margin: 10px 0;
            }

            .search{
                width: 100%;
                margin-top: 10px;
                padding: 16px 0;
            }
        </style>
    </head>
    <body>
        <div class="row">
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
                            <a href="#" class="nav-link text-white home-link active" aria-current="page">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"/></svg>
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link text-white product-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                                Products
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link text-white account-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"/></svg>
                                Accounts
                            </a>
                        </li>
                        
                        <li>
                            <a href="#" class="nav-link text-white station-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"/></svg>
                                Stations
                            </a>
                        </li>
                        
                        <li>
                            <a href="#" class="nav-link text-white contract-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
                                Contracts
                            </a>
                        </li>
                        
                    </ul>
                    <hr>

                </div>
            </div>

            <!-- END menu -->

            <div class="col-md-10" style="padding: 40px;">
                

                
                <!-- START products -->
                <div class="product">
                    <div class="container products" >
                        <div>
                            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                                <div class="container-fluid">
                                    <h5 class="navbar-brand" >Sliders List</h5>

                                    <div class="" id="navbarSupportedContent">
                                        <form class="d-flex" role="search">
                                            <input placeholder="Search by id, name,description,..." name="productsearch" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                            <button class="btn btn-outline-success" type="submit">Search</button>
                                        </form>
                                    </div>


                                    <div class="">
                                        <div class="d-flex add" role="search">
                                            <a href="#"><i style="color: white;" class="fa-solid fa-plus"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Image</th>
                                    <th scope="col"> Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                          
                                <!-- START Product item -->
                                  <c:forEach var="s" items="${sessionScope.slider}">
                                <tr>
                                    <th scope="row">${s.id}</th>
                                    <td>${s.description}</td>
                                    <td class="product-img">
                                        
                                        <img src="${s.img}" alt="alt"/>
                                       
                                    </td>
                                    
                                    <td>
                                        <c:if test="${s.status==1}">
                                            <p style="color: green">Active</p>
                                        
                                        </c:if>
                                               <c:if test="${s.status==0}">
                                            <p style="color: green">Inactive</p>
                                        
                                        </c:if>
                                        
                                        
                                    </td>
                                    
                                    <td>
                                        <div class="edit">
                                            <a href="#"><i style="color: black;" class="fa-solid fa-pen"></i></a>
                                            
                                        </div>
                                        <div class="remove">
                                            <a onclick="return confirm('Do you want to delete carID 1')" href="#"><i style="color: white;" class="fa-solid fa-trash-can"></i></a>     
                                        </div>
                                    </td>

                                </tr>
                                 </c:forEach>
                                <!-- END Product item -->
                               
                                <!-- START Product item -->
                             
                                <!-- END Product item -->

                            </tbody>
                        </table>
                             
                               
                    <!-- START PAGE -->
                    
                    <div style="display: flex;
                                justify-content: center;">
                        
                        <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                          
                            <c:forEach begin="1" end="${sessionScope.page}" var="p">
                                
                                <li class="page-item   "><a class="page-link  <c:if test="${sessionScope.cpage==p}">active</c:if>" href="../sliderpaging?p=${p}">${p}</a></li>
                                
                            </c:forEach>
                            
                         
                            <li class="page-item">
                                <a class="page-link" href="" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                        
                    </div>
                    <!-- END PAGE -->
                                
                    </div>
                </div>
                <!-- END products -->
                
                
            </div>
        </div>

        
    </body>
</html>
