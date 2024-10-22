
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
            <div class="row "  style="margin-bottom: 40px">
                <jsp:include page="../account/profile-nav.jsp"/>
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
                        <c:if test="${sessionScope.account.password != null}">

                            <div class="card-body">
                                <form action="./changePassword" method="POST">
                                    <!-- Form Group (current password)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="currentPassword">Current Password</label>
                                        <input maxlength="50" name="currentPassword" class="form-control" id="currentPassword" type="password" placeholder="Enter current password" required>
                                    </div>
                                    <!-- Form Group (new password)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="newPassword">New Password</label>
                                        <input maxlength="50" name="newPassword" class="form-control" id="newPassword" type="password" placeholder="Enter new password" required>
                                    </div>
                                    <!-- Form Group (confirm password)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="confirmPassword">Confirm Password</label>
                                        <input maxlength="50" name="confirmPassword" class="form-control" id="confirmPassword" type="password" placeholder="Confirm new password" required>
                                    </div>
                                    <button class="btn btn-primary" type="submit">Save</button>
                                </form>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.account.password == null}">
                            <div class="card-body">
                                <h6>Your account does not currently have a password.</h6> 
                                <h6><a href="./setPasswordRequest">Click on this link to receive reset password email.</a></h6>
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
