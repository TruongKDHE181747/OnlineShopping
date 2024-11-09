<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

        <%@include file="../common/css.jsp" %>

        <link rel="stylesheet" href="./account/css/registerstyle.css"/>
    </head>

    <body>
        <%@include file="../common/header.jsp" %>
        <!-- Bắt đầu dự án của bạn ở đây -->
        <section style="margin: 40px 0" class="full-height">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-lg-8">
                        <div class="card shadow-lg p-4">
                            <div class="card-body">
                                <!-- Tiêu đề Đăng ký -->
                                <h2 class="text-center mb-4">Đăng Ký</h2>
                                <c:if test="${error != null}">
                                    <div class="alert alert-danger">
                                        ${error}
                                    </div>
                                </c:if>
                                <!-- Form -->
                                <form action="./register" method="POST">

                                    <div class="row mb-4">
                                        <div class="col-md-12">
                                            <div class="form-floating">
                                                <input type="text" name="username" class="form-control" id="username" value="${param.username}" placeholder="Tên người dùng" required maxlength="50">
                                                <label for="username">Tên người dùng</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="password" name="password" class="form-control" id="password" placeholder="Mật khẩu" required maxlength="50">
                                                <label for="password">Mật khẩu</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" placeholder="Xác nhận mật khẩu" required maxlength="50">
                                                <label for="confirmPassword">Xác nhận mật khẩu</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-4">
                                        <div class="form-floating">
                                            <input type="email" name="email" class="form-control" id="email" value="${param.email}" placeholder="Địa chỉ email" required maxlength="255">
                                            <label for="email">Địa chỉ email</label>
                                        </div>
                                    </div>
                                    <!-- Họ và Tên -->
                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="text" name="firstname" class="form-control" value="${param.firstname}"  id="firstName" placeholder="Tên" maxlength="50">
                                                <label for="firstName">Tên</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="text" name="lastname" class="form-control" value="${param.lastname}" id="lastName" placeholder="Họ" maxlength="50">
                                                <label for="lastName">Họ</label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Giới tính và Ngày sinh -->
                                    <div class="row mb-4">
                                        <div class="col-md-6 d-flex align-items-center">
                                            <label class="form-label me-3">Giới tính:</label>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" id="male" value="true" required checked="">
                                                <label class="form-check-label" for="male">Nam</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" id="female" ${param.gender == false ? 'checked':''} value="false" required>
                                                <label class="form-check-label" for="female">Nữ</label>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="date" name="dob" class="form-control" value="${param.dob}" id="dob">
                                                <label for="dob">Ngày sinh</label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Số điện thoại -->
                                    <div class="row mb-4">
                                        <div>
                                            <div class="form-floating">
                                                <input type="tel" name="phone" pattern="\d{10}" value="${param.phone}" title="Số điện thoại phải có đúng 10 chữ số" class="form-control" id="phone" placeholder="Số điện thoại" required maxlength="15">
                                                <label for="phone">Số điện thoại</label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Nút gửi trung tâm -->
                                    <div class="d-grid mb-3">
                                        <button type="submit" class="btn btn-primary btn-lg">Đăng Ký</button>
                                    </div>

                                    <!-- Liên kết đăng nhập -->
                                    <p class="text-center">Bạn đã có tài khoản?
                                        <a href="login" class="custom-link">Đăng nhập ở đây</a>
                                    </p>

                                    <!-- Phân cách -->
                                    <div class="divider my-4">
                                        <p class="text-muted">HOẶC</p>
                                    </div>

                                    <!-- Nút đăng nhập Google ở giữa -->
                                    <div class="d-grid">
                                        <a class="btn btn-danger btn-lg" href="https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:8080/OnlineShopping/loginGoogle&response_type=code&client_id=450628772818-p20skk8fdd4nog131u03npn16l27gk9q.apps.googleusercontent.com&approval_prompt=force" role="button">
                                            <i class="fab fa-google me-2"></i>Đăng nhập bằng Google
                                        </a>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Kết thúc dự án của bạn -->

        <%@include file="../common/footer.jsp" %>
        <!-- Bootstrap JS với Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
        <%@include file="../common/js.jsp" %>
    </body>

</html>
