
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

        <jsp:include page="../common/css.jsp" />

        <link rel="stylesheet" href="./account/css/registerstyle.css"/>
    </head>

    <body>
        <jsp:include page="../common/header.jsp" />

        <!-- Start your project here -->
        <section style="margin: 50px 0">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-lg p-4">
                            <div class="card-body">
                                <!-- Title -->
                                <h2 class="text-center mb-4">Forgot Password</h2>

                                <!-- Info Message -->
                                <p class="text-center text-muted mb-4">
                                    If you have forgotten your password, you can use this form to reset it. You will receive an email with instructions.
                                </p>
                                
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

                                <!-- Form -->
                                <form method="get" action="./resetPassword">
                                    <!-- Email input -->
                                    <div class="form-floating mb-3">
                                        <input type="email" name="email" class="form-control" id="emailInput" placeholder="Email" required>
                                        <label for="emailInput">Email</label>
                                    </div>

                                    <!-- Submit button -->
                                    <div class="d-grid mb-3">
                                        <button type="submit" class="btn btn-primary btn-lg">Send Reset Link</button>
                                    </div>

                                    <!-- Back to login link -->
                                    <p class="text-center">
                                        <a href="./login" class="">Back to Login</a>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End your project here -->

        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
        <jsp:include page="../common/js.jsp" />

    </body>

</html>

