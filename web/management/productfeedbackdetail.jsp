<%-- 
    Document   : profile
    Created on : May 24, 2024, 1:21:04 PM
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
        <title>Edit Car Page</title>
        <link rel="icon" href="img/webLogo.jpg" type="image/x-icon" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <!-- CSS Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <!-- Script Link Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>


    </head>
    <body class="bg-body-tertiary">

        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                <a href="../productfeedbackpaging" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <i style="margin-right: 10px;
                       font-size: 24px;" class="bi bi-arrow-90deg-left"></i>
                    <span class="fs-4">Back</span>
                </a>                
            </header>
        </div>


        <div class="container">
            <main>
                <div class="py-5 text-center" >
                    <h2>Chi tiết đánh giá</h2>
                </div>
                <c:set var="pf" value="${sessionScope.pf}"></c:set>
                <div class="row g-5" style="justify-content: center;">

                


                        <div class="col-md-8">
                           
                                <div class="row g-3">
                                    <div class="col-sm-6">
                                        <label for="id" class="form-label"> Khách hàng</label>
                                        <input readonly value="${pf.user.first_name} ${pf.user.last_name}   " name="id" type="text" class="form-control" id="id" required>
                                      
                                </div>
                               
                                <div class="col-sm-6">
                                        
                                    <img src="../${pf.user.profile_picture_url}" style="width: 85px;height: 85px" alt="alt"/>
                                </div>
                                <div class="col-sm-6">
                                    <label for="img" class="form-label"> Sản phẩm</label>
                                        <input readonly value="${pf.product.product_name}" name="id" type="text" class="form-control" id="id" required>
                                </div>
                                   <div class="col-sm-6">
                                        <img src="../${pf.product.thumbnail}" style="width: 147px;height: 114px" alt="alt"/>

                                </div>

                                <div class="my-3 col-sm-6">
                                    <label for="status" class="form-label">Đánh giá</label>
                                    <p>  Ảnh thực tế </p> <img style="margin-top: 10px;width:  147px;height: 114px;" src="../${pf.thumbnail}" alt="alt"/>

                                        
                                    
                                    
                                    </div>

                                   
                                       

                                        <div class="col-sm-12">
                                            <label for="description" class="form-label">Nội dung</label>
                                            <input style="width: 285px;height: 100px" value="${pf.review}" name="description" type="text" class="form-control" id="id" required>

                                        </div>
                                             <div class="col-sm-6">
                                            <label for="description" class="form-label">Rating</label>
                                            <p>
                                            <c:forEach begin="1" end="${pf.rating}" >
                                                ⭐
                                            </c:forEach> </p>

                                    </div>
                                            <div class="col-sm-6">  
                                                  <div class="my-3 col-sm-6">
                                    <label for="status" class="form-label">Status</label>
                                    <div class="form-check">
                                        <input value="1" id="status" name="status" type="radio" class="form-check-input"
                                               <c:if test="${pf.is_active == 1}"> checked</c:if>>
                                               <label class="form-check-label" for="status">Active</label>
                                        </div>
                                        <div class="form-check">
                                            <input value="0" id="status" name="status" type="radio" class="form-check-input"
                                            <c:if test="${pf.is_active == 0}"> checked</c:if>>
                                            <label class="form-check-label" for="status">Inactive</label>
                                        </div>
                                    </div>
                                            </div>


                                <hr class="my-4">
                                <!-- Error check Username and Password -->


                               
                        
                    </div>
                </div>
            </main>

            <footer class="my-5 pt-5 text-body-secondary text-center text-small">

            </footer>
        </div>

    </body>
</html>
