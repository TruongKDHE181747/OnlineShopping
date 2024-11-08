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
        <title>Thêm tài khoản</title>
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
                    <h2>Thêm tài khoản</h2>
                </div>

                <div class="row g-5" style="justify-content: center;">


                   

                    <div class="col-md-8">
                        <form class="needs-validation" method="post" action="../adduserlist" enctype="multipart/form-data">
                            <div class="row g-3">
                                

                                <div class="col-sm-6">
                                    <label for="username" class="form-label">Tên tài khoản</label>
                                    <input  value="" name="username" type="text" class="form-control" id="username" required>

                                </div>
                                <div class="col-sm-6">
                                    <label for="first_name" class="form-label">Họ</label>
                                    <input  value="" name="first_name" type="text" class="form-control" id="first_name" required>

                                </div>
                                <div class="col-sm-6">
                                    <label for="last_name" class="form-label">Tên</label>
                                    <input  value="" name="last_name" type="text" class="form-control" id="last_name" required>

                                </div>
                                <div class="col-sm-6">
                                      <label for="password" class="form-label">Mật khẩu</label>
                                    <input value="" name="password" type="text" class="form-control" id="password" required="">
                                
                                </div>
                                <div class="col-sm-6">
                                    <label class="form-label">Ảnh đại diện</label>
                                    <input name="img" type="file" class="form-control" id="fileInput">
                                </div>


                                <div class="my-3 col-sm-6">
                                    <label for="gender" class="form-label">Giới tính</label>
                                    <div class="form-check">
                                        <input value="true" id="male" name="gender" type="radio" class="form-check-input">
                                           
                                        <label class="form-check-label" for="male">Nam</label>
                                    </div>
                                    <div class="form-check">
                                        <input value="false" id="female" name="gender" type="radio" class="form-check-input">
                                            
                                        <label class="form-check-label" for="female">Nữ</label>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input  value="" name="phone" type="text" class="form-control" id="phone" required>

                                </div>
                                <div class="col-sm-6">
                                    <label for="email" class="form-label">Email</label>
                                    <input  value="" name="email" type="text" class="form-control" id="email" required>

                                </div>
                                <div class="col-sm-6">
                                    <label for="dob" class="form-label">Ngày sinh</label>
                                    <input  value="" name="dob" type="date" class="form-control" id="dob" required>

                                </div>
                                
                                 <div class="col-sm-6">
                                    <label for="role" class="form-label">Chức vụ</label>
                                        <select id="role" name="role" class="form-select">
                                            <option value="1" >quản trị viên</option>
                                            <option value="2" >quản lý bán hàng</option>
                                            <option value="3" >nhân viên bán hàng</option>
                                            <option value="4" >nhân viên marketing</option>
                                            <option value="5" >người dùng</option>
                                        </select>
                                </div>  
                                
                            </div>

                            <hr class="my-4">
                            <!-- Error check Username and Password -->
                            <div style="text-align: left;
                                        color: red;
                                        margin-left: 5px;">
                                <h5>${sessionScope.error}</h5><br>
                             </div>

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
