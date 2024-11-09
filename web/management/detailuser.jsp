<%-- 
    Document   : profile
    Created on : May 24, 2024, 1:21:04 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin tài khoản</title>
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
                <a href="../adminuser" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <i style="margin-right: 10px;
                       font-size: 24px;" class="bi bi-arrow-90deg-left"></i>
                    <span class="fs-4">Quay lại</span>
                </a>                
            </header>
        </div>


        <div class="container">
            <main>
                <div class="py-5 text-center" >
                    <img class="d-block mx-auto mb-4" src="img/user.png" alt="" width="72">
                    <h2>Thông tin tài khoản ${sessionScope.u.username}</h2>
                </div>

                <div class="row g-5" style="justify-content: center;">




                    <div class="col-md-8">
                        <form class="needs-validation" action="../edituser" method="post" enctype="multipart/form-data">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="user_id" class="form-label">STT</label>
                                    <input disabled="" value="${sessionScope.userid}" name="user_id" type="text" class="form-control" id="user_id" >

                                </div>

                                <div class="col-sm-6">
                                    <label for="username" class="form-label">Tên tài khoản</label>
                                    <input disabled="" value="${sessionScope.u.username}" name="username" type="text" class="form-control" id="username" >

                                </div>
                                <div class="col-sm-6">
                                    <label for="first_name" class="form-label">Họ</label>
                                    <input maxlength="50" value="${sessionScope.u.first_name}" name="first_name" type="text" class="form-control" id="first_name" >

                                </div>
                                <div class="col-sm-6">
                                    <label for="last_name" class="form-label">Tên</label>
                                    <input maxlength="50" value="${sessionScope.u.last_name}" name="last_name" type="text" class="form-control" id="last_name" >

                                </div>
                                <div class="col-sm-6">
                                    <label class="form-label">Ảnh đại diện</label>
                                    <input name="profile_picture_url" type="file" class="form-control" id="fileInput">
                                    <img style="margin-top: 10px; height: 100px;" 
                                         src="../${sessionScope.u.profile_picture_url}" 
                                         alt="Profile Image"/>
                                </div>


                                <div class="my-3 col-sm-6">
                                    <label for="gender" class="form-label">Giới tính</label>
                                    <div class="form-check">
                                        <input value="true" id="male" name="gender" type="radio" class="form-check-input"
                                               <c:if test="${sessionScope.u.gender == true}">checked</c:if>>
                                               <label class="form-check-label" for="male">Nam</label>
                                        </div>
                                        <div class="form-check">
                                            <input value="false" id="female" name="gender" type="radio" class="form-check-input"
                                            <c:if test="${sessionScope.u.gender == false}">checked</c:if>>
                                            <label class="form-check-label" for="female">Nữ</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <label for="phone" class="form-label">Số điện thoại</label>
                                        <input maxlength="20" value="${sessionScope.u.phone}" name="phone" type="text" class="form-control" id="phone" >

                                </div>
                                <div class="col-sm-6">
                                    <label for="email" class="form-label">Email</label>
                                    <input maxlength="50" value="${sessionScope.u.email}" name="email" type="email" class="form-control" id="email" >

                                </div>
                                <div class="col-sm-6">
                                    <label for="dob" class="form-label">Ngày sinh</label>
                                    <input  value="${sessionScope.u.dob}" name="dob" type="date" class="form-control" id="dob" >

                                </div>

                                <div class="col-sm-6">
                                    <label for="role" class="form-label">Chức vụ</label>
                                    <select id="role" name="role" class="form-select">
                                        <option value="quản trị viên" <c:if test="${sessionScope.u.role.role_id == 1}">selected</c:if>>quản trị viên</option>
                                        <option value="quản lý bán hàng" <c:if test="${sessionScope.u.role.role_id == 2}">selected</c:if>>quản lý bán hàng</option>
                                        <option value="nhân viên bán hàng" <c:if test="${sessionScope.u.role.role_id == 3}">selected</c:if>>nhân viên bán hàng</option>
                                        <option value="nhân viên marketing" <c:if test="${sessionScope.u.role.role_id == 4}">selected</c:if>>nhân viên marketing</option>
                                        <option value="người dùng" <c:if test="${sessionScope.u.role.role_id == 5}">selected</c:if>>người dùng</option>
                                        
                                        </select>
                                    </div>  
                                    <input disabled="" value="${sessionScope.u.password}" name="password" type="hidden" class="form-control" id="password" >

                            </div>

                            <hr class="my-4">
                            <!-- Error check Username and Password -->
                            <% 
                            String erro = (String) session.getAttribute("erro");
                            if (erro != null) {
                            %>
                            <div style="text-align: left;
                                 color: red;
                                 margin-left: 5px;">
                                <h5> <%= erro%></h5><br>
                            </div>
                            <%
                                    // Xóa thông báo lỗi sau khi hiển thị
                                    session.removeAttribute("erro");
                                }
                            %>

                            <button class="w-100 btn btn-primary btn-lg" type="submit">Lưu</button>
                        </form>
                    </div>
                </div>
            </main>

            <footer class="my-5 pt-5 text-body-secondary text-center text-small">

            </footer>
        </div>

        <script>
            function validateImage(file) {
                const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                if (file && allowedTypes.includes(file.type)) {
                    return true;
                } else {
                    alert("Hãy tải lên hình ảnh hợp lệ.");
                    fileInput.value = "";
                    return false;
                }
            }

            const fileInput = document.getElementById('fileInput');
            fileInput.addEventListener('change', function () {
                const file = fileInput.files[0];
                validateImage(file);
            });
        </script>
    </body>
</html>
