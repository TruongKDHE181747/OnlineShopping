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
 <jsp:include page="../common/css.jsp" />
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
        <c:set var="curlink" value="slider"></c:set>
        
        <div class="row">
            <!-- START HEADER -->
        <jsp:include page="../common/header.jsp" />
              <jsp:include page="marketing_header.jsp" />

            <!-- END menu -->

            <div class="col-md-10" style="padding: 40px;">
                <c:set var="no" value="${(sessionScope.prfpage-1)*5+1}"></c:set>

                
                <!-- START products -->
                <div class="product">
                    <div class="container products" >
                        <div>
                            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                                <div class="container-fluid">
                                    <h5 class="navbar-brand" >Product Feedback List</h5>

                                    <div class="" id="navbarSupportedContent">
                                        <form class="d-flex" role="search" action="../postfeedbackpaging" method="get">
                                            <select name="filter">
                                                <option value="post" >Sort by Post</option>
                                                <option value="user"<c:if test="${sessionScope.filter=='user'}"> selected </c:if>>Sort by User</option>
                                              <option value="show"<c:if test="${sessionScope.filter=='show'}"> selected </c:if>>Only show active</option>
                                                <option value="hidden"<c:if test="${sessionScope.filter=='hidden'}"> selected </c:if>>Only show hidden</option>
                                            </select>
                                            <button class="btn btn-outline-success" type="submit"><i class="bi bi-filter"></i></button>
                                        </form>
                                    </div>


                                  
                                </div>
                            </nav>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                      <th scope="col">Product Img</th>
                                    <th scope="col">Product Name</th>
                                    <th scope="col"> Rating</th>  
                                    <th scope="col">Content</th>
                                    <th scope="col"> User</th>
                                   <th scope="col"> Time Created</th>
                                    <th>Status</th>
                                    
                                    <th scope="col" style="width: 14%">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                          
                                <!-- START Product item -->
                                  <c:forEach var="s" items="${sessionScope.prflist}">
                                 
                                  <td>
                                      ${no}
                                      <c:set var="no" value="${no+1}"></c:set>
                                  </td>
                                     
                                     <td class="product-img">
                                        
                                         <img src="../${s.product.thumbnail}" style="width: 106px;height: 98px;" alt="alt"/ >
                                       
                                    </td>
                                    <td><a href="../viewproduct?pid=${s.product.product_id}">${s.product.product_name}</a></td>
                                    <td>${s.rating}⭐</td>
                                    
                                      <td>${s.review}</td>
                                          <td class="product-img">
                                        
                                              <img src="../${s.user.profile_picture_url}" style="width:67px;height: 69px;" alt="alt"/>
                                          ${s.user.first_name} ${s.user.last_name} 
                                    </td>
                                         <td>${s.create_at}</td>
                                      <td>
                                        <c:if test="${s.is_active==1}">
                                            <p style="color: green">Active</p>
                                        
                                        </c:if>
                                               <c:if test="${s.is_active==0}">
                                            <p style="color: red">Inactive</p>
                                        
                                        </c:if>
                                        
                                        
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
                            <c:if test="${sessionScope.prfpage>1}" >
                            <li class="page-item">
                                <a class="page-link" href="../postfeedbackpaging?p=${sessionScope.prfpage-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                          </c:if>
                            <c:forEach begin="1" end="${sessionScope.prfnum}" var="p">
                                
                                <li class="page-item   "><a class="page-link  <c:if test="${sessionScope.prfpage==p}">active</c:if>" href="../productfeedbackpaging?p=${p}">${p}</a></li>
                                
                            </c:forEach>
                            
                        <c:if test="${sessionScope.prfpage<sessionScope.prfnum}" >
                            <li class="page-item">
                                <a class="page-link" href="../productfeedbackpaging?p=${sessionScope.prfpage+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            </c:if>
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
