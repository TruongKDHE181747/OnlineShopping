<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <%@include file="../common/css.jsp" %>
</head>

<body>
    <%@include file="../common/header.jsp" %>

    <section style="margin: 50px 0">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card shadow-lg p-4">
                        <div class="card-body">
                            <!-- Title -->
                            <h2 class="text-center mb-4">Reset Password</h2>

                            <c:if test="${error != null}">
                                <div class="alert alert-danger">
                                    ${error}
                                </div>
                            </c:if>
                            
                            <!-- Form for Reset Password -->
                            <form method="post" action="./resetPassword">
                                <!-- New Password input -->
                                <div class="form-floating mb-3">
                                    <input type="password" name="newPassword" class="form-control" id="newPassword" placeholder="New Password" required>
                                    <label for="newPassword">New Password</label>
                                </div>

                                <!-- Confirm Password input -->
                                <div class="form-floating mb-3">
                                    <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" placeholder="Confirm Password" required>
                                    <label for="confirmPassword">Confirm Password</label>
                                </div>
                                <input type="hidden" name="email" value="${requestScope.email}">
                                <!-- Centered Submit button -->
                                <div class="d-grid mb-3">
                                    <button type="submit" class="btn btn-primary btn-lg">Reset Password</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@include file="../common/footer.jsp" %>

    <!-- Bootstrap JS with Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <%@include file="../common/js.jsp" %>

    <!-- JavaScript for client-side validation -->
 

</body>

</html>
