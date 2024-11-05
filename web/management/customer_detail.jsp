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
        <title>Thông tin khách hàng</title>
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
                    <c:set var="s" value="${sessionScope.customer}"></c:set>

        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                <a href="../customerlist" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <i style="margin-right: 10px;
                       font-size: 24px;" class="bi bi-arrow-90deg-left"></i>
                    <span class="fs-4">Back to home</span>
                </a>                
            </header>
        </div>


        <div class="container">
            <main>
                <div class="py-5 text-center" >
                    <img class="d-block mx-auto mb-4" src="img/user.png" alt="" width="72">
                    <h2>Khách hàng ${s.first_name} ${s.last_name}</h2>
                </div>

                <div class="row g-5" style="justify-content: center;">

                  


                        <div class="col-md-8">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="id" class="form-label"> Id</label>
                                    <input disabled="" value="${s.user_id}" name="id" type="text" class="form-control" id="id" required>

                            </div>


                            <img src="../${s.profile_picture_url}" alt="alt" style="width: 130px;height: 108px;"/>


                            <div class="col-sm-6">
                                <label for="title" class="form-label">Họ</label>
                                <input disabled=""  value="${s.first_name}" name="title" type="text" class="form-control" id="title" required>

                            </div>
                            <div class="col-sm-6">
                                <label for="title" class="form-label">Tên</label>
                                <input disabled=""  value="${s.last_name}" name="title" type="text" class="form-control" id="title" required>

                            </div>

                            <div class="my-3 col-sm-6">
                                <label for="title" class="form-label">SDT</label>
                                <input disabled=""  value="${s.phone}" name="title" type="text" class="form-control" id="title" required>

                            </div>

                            <div class="col-sm-6">
                                <label for="title" class="form-label">Email</label>
                                <input disabled=""  value="${s.email}" name="title" type="text" class="form-control" id="title" required>

                            </div>
                            <div class="col-sm-6">
                                <label for="title" class="form-label">Giới tính</label>
                                <input disabled=""  value="<c:if test="${s.gender=='true'}">Male</c:if>  <c:if test="${s.gender=='false'}">Female</c:if>" name="title" type="text" class="form-control" id="title" required>

                                </div>

                                <div class="col-sm-6">
                                    <label for="title" class="form-label">Ngày sinh</label>
                                        <input disabled=""  value="${s.dob}" name="title" type="text" class="form-control" id="title" required>

                            </div>
                               
                                     <div class="my-3 col-sm-6">
                                    <label for="status" class="form-label">Trạng thái tài khoản</label>
                                    <div class="form-check">
                                        <input disabled="" value="1" id="status" name="status" type="radio" class="form-check-input" <c:if test="${s.is_active=='true'}">checked=""</c:if>>
                                        <label class="form-check-label" for="status">Đã kích hoạt</label>
                                    </div>
                                    <div class="form-check">
                                        <input  disabled="" value="0" id="status" name="status" type="radio" class="form-check-input" <c:if test="${s.is_banned=='true'}">checked=""</c:if> >
                                        <label class="form-check-label" for="status">Bị cấm</label>
                                    </div>
                                </div>
                                
                                
                        </div>

                        <hr class="my-4">
                        <!-- Error check Username and Password -->


                        <a href="../customerlist">   <button class="w-100 btn btn-primary btn-lg" >Quay lại</button></a>

                    </div>
                </div>
            </main>

            <footer class="my-5 pt-5 text-body-secondary text-center text-small">

            </footer>
        </div>

    </body>
</html>
