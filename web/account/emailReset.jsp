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
        <section style="margin: 50px 0">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-lg p-4">
                            <div class="card-body">
                                <!-- Tiêu đề -->
                                <h2 class="text-center mb-4">Quên Mật Khẩu</h2>

                                <!-- Thông điệp thông tin -->
                                <p class="text-center text-muted mb-4">
                                    Nếu bạn đã quên mật khẩu, bạn có thể sử dụng mẫu này để đặt lại mật khẩu. Bạn sẽ nhận được email với hướng dẫn.
                                </p>
                                
                                <c:if test="${error != null}">
                                    <div class="alert alert-danger">
                                        ${error}
                                    </div>
                                </c:if>
                                <c:if test="${success != null}">
                                    <div class="alert alert-success">
                                        ${success}
                                    </div>
                                </c:if> 

                                <!-- Mẫu -->
                                <form method="get" action="./resetPassword">
                                    <!-- Nhập email -->
                                    <div class="form-floating mb-3">
                                        <input maxlength="255" type="email" name="email" class="form-control" id="emailInput" placeholder="Email" required>
                                        <label for="emailInput">Email</label>
                                    </div>

                                    <!-- Nút gửi -->
                                    <div class="d-grid mb-3">
                                        <button type="submit" class="btn btn-primary btn-lg">Đặt Lại Mật Khẩu</button>
                                    </div>

                                    <!-- Liên kết quay lại đăng nhập -->
                                    <p class="text-center">
                                        <a href="./login" class="">Quay lại Đăng Nhập</a>
                                    </p>
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
