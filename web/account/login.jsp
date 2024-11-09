<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

        <jsp:include page="../common/css.jsp" />

        <link rel="stylesheet" href="./account/css/registerstyle.css"/>
    </head>

    <body>

        <jsp:include page="../common/header.jsp" />

        <!-- Bắt đầu dự án của bạn ở đây -->
        <section style="margin: 50px 0" class="full-height">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-lg p-4">
                            <div class="card-body">
                                <!-- Tiêu đề đăng nhập -->
                                <h2 class="text-center mb-4">Đăng Nhập</h2>
                                <c:if test="${loginError != null}">
                                    <div class="alert alert-danger" >
                                        ${loginError}
                                    </div>
                                </c:if> 
                                <!-- Form -->
                                <form method="post" action="./login">
                                    <!-- Nhập tên người dùng -->
                                    <div class="form-floating mb-3">
                                        <input maxlength="50" type="text" name="username" class="form-control" id="userInput" placeholder="Tên người dùng" value="${requestScope.username!=null?requestScope.username:''}" required>
                                        <label for="userInput">Tên tài khoản</label>
                                    </div>

                                    <!-- Nhập mật khẩu -->
                                    <div class="form-floating mb-3">
                                        <input maxlength="50" type="password" name="password" class="form-control" id="passwordInput" placeholder="Mật khẩu" required>
                                        <label for="passwordInput">Mật khẩu</label>
                                    </div>

                                    <!-- Ghi nhớ tôi và quên mật khẩu -->
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <div class="form-check">
                                            <input class="form-check-input" name="rememberMe" type="checkbox" id="rememberMe" value="On" checked="" />
                                            <label class="form-check-label" for="rememberMe"> Ghi nhớ tôi </label>
                                        </div>
                                        <a href="./resetPasswordRequest" class="custom-link">Quên mật khẩu?</a>
                                    </div>

                                    <!-- Nút gửi ở giữa -->
                                    <div class="d-grid mb-3">
                                        <button type="submit" class="btn btn-primary btn-lg">Đăng Nhập</button>
                                    </div>

                                    <!-- Liên kết đăng ký -->
                                    <p class="text-center">Chưa có tài khoản? 
                                        <a href="./register" class="custom-link">Đăng ký ở đây</a>
                                    </p>

                                    <!-- Phân cách -->
                                    <div class="d-flex divider my-4 justify-content-center">
                                        <p class="text-muted">HOẶC</p>
                                    </div>

                                    <!-- Nút đăng nhập Google ở giữa -->
                                    <div class="d-grid">
                                        <a style="display: block" class="btn btn-lg btn-danger" href="https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:8080/OnlineShopping/loginGoogle&response_type=code&client_id=450628772818-p20skk8fdd4nog131u03npn16l27gk9q.apps.googleusercontent.com&approval_prompt=force" >
                                            <i class="fab fa-google me-2"></i>Tiếp tục với Google
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Kết thúc dự án của bạn ở đây -->
        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS với Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
        <jsp:include page="../common/js.jsp" />

    </body>

</html>
