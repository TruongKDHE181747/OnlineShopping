<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt lại Mật khẩu</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <jsp:include page="../common/css.jsp" />

        <link rel="stylesheet" href="./account/css/registerstyle.css"/>
    </head>

    <body>
        <jsp:include page="../common/header.jsp" />

        <section style="margin: 50px 0">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-lg p-4">
                            <div class="card-body">
                                <!-- Tiêu đề -->
                                <h2 class="text-center mb-4">Đặt lại Mật khẩu</h2>

                                <c:if test="${error != null}">
                                    <div class="alert alert-danger">
                                        ${error}
                                    </div>
                                </c:if>
                                <div class="form-floating mb-3">
                                    <h6>Tài khoản của bạn: ${requestScope.email}</h6>
                                </div>
                                <!-- Form để Đặt lại Mật khẩu -->
                                <form method="post" action="./resetPassword">
                                    <!-- Nhập Mật khẩu mới -->
                                    <div class="form-floating mb-3">
                                        <input maxlength="50" type="password" name="newPassword" class="form-control" id="newPassword" placeholder="Mật khẩu mới" required>
                                        <label for="newPassword">Mật khẩu mới</label>
                                    </div>

                                    <!-- Nhập lại Mật khẩu -->
                                    <div class="form-floating mb-3">
                                        <input maxlength="50" type="password" name="confirmPassword" class="form-control" id="confirmPassword" placeholder="Nhập lại Mật khẩu" required>
                                        <label for="confirmPassword">Nhập lại Mật khẩu</label>
                                    </div>
                                    <input type="hidden" name="email" value="${requestScope.email}">
                                    <!-- Nút Gửi -->
                                    <div class="d-grid mb-3">
                                        <button type="submit" class="btn btn-primary btn-lg">Đặt lại Mật khẩu</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS với Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
        <jsp:include page="../common/js.jsp" />

        <!-- JavaScript cho xác thực phía máy khách -->


    </body>

</html>
