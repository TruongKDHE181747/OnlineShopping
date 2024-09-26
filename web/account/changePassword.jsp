
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../common/css.jsp" />

    </head>
    <body>
        <jsp:include page="../common/header.jsp" />

        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->
            <nav class="nav nav-borders">
                <a class="nav-link  ms-0" href="./profile" target="__blank">Profile</a>
                <a class="nav-link" href="#" target="__blank">Order History</a>
                <a class="nav-link active" href="./changePassword" target="__blank">Security</a>
            </nav>
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Change password card-->
                    <div class="card mb-4">
                        <div class="card-header">Change Password</div>
                        <c:if test="${error != null}">
                            <div class="alert alert-danger" >
                                ${error}
                            </div>
                        </c:if>
                        <c:if test="${success != null}">
                            <div class="alert alert-success" >
                                ${success}
                            </div>
                        </c:if>
                        <div class="card-body">
                            <form action="./changePassword" method="POST">
                                <!-- Form Group (current password)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="currentPassword">Current Password</label>
                                    <input name="currentPassword" class="form-control" id="currentPassword" type="password" placeholder="Enter current password" required>
                                </div>
                                <!-- Form Group (new password)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="newPassword">New Password</label>
                                    <input name="newPassword" class="form-control" id="newPassword" type="password" placeholder="Enter new password" required>
                                </div>
                                <!-- Form Group (confirm password)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="confirmPassword">Confirm Password</label>
                                    <input name="confirmPassword" class="form-control" id="confirmPassword" type="password" placeholder="Confirm new password" required>
                                </div>
                                <button class="btn btn-primary" type="submit">Save</button>
                            </form>
                        </div>
                    </div>


                </div>

            </div>
        </div>





        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->

        <jsp:include page="../common/js.jsp" />
    </body>
</html>
