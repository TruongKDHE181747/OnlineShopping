<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../common/css.jsp" />
    </head>
    <body>
        <%@include file="../common/header.jsp" %>

        <div class="container-xl px-4 mt-4">
            <hr class="mt-0 mb-4">
            <div class="row " style="margin-bottom: 40px">
                <jsp:include page="../account/profile-nav.jsp"/>
                <div class="col-lg-8">
                    <!-- Change password card-->
                    <div class="card mb-4">
                        <div class="card-header">Đổi Mật Khẩu</div>
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
                        <c:if test="${sessionScope.account.password != null}">
                            <div class="card-body">
                                <form action="./changePassword" method="POST">
                                    <!-- Form Group (current password)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="currentPassword">Mật Khẩu Hiện Tại</label>
                                        <input maxlength="50" name="currentPassword" class="form-control" id="currentPassword" type="password" placeholder="Nhập mật khẩu hiện tại" required>
                                    </div>
                                    <!-- Form Group (new password)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="newPassword">Mật Khẩu Mới</label>
                                        <input maxlength="50" name="newPassword" class="form-control" id="newPassword" type="password" placeholder="Nhập mật khẩu mới" required>
                                    </div>
                                    <!-- Form Group (confirm password)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="confirmPassword">Xác Nhận Mật Khẩu</label>
                                        <input maxlength="50" name="confirmPassword" class="form-control" id="confirmPassword" type="password" placeholder="Xác nhận mật khẩu mới" required>
                                    </div>
                                    <button class="btn btn-dark" type="submit">Lưu</button>
                                </form>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.account.password == null}">
                            <div class="card-body">
                                <h6>Tài khoản của bạn hiện chưa có mật khẩu.</h6> 
                                <h6><a href="./setPasswordRequest">Nhấn vào đây để nhận email đặt lại mật khẩu.</a></h6>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->
        <jsp:include page="../common/js.jsp" />
    </body>
</html>
