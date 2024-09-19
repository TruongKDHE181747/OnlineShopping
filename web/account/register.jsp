
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Register</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />

        <link rel="stylesheet" href="./css/registerstyle.css"/>
    </head>

    <body>

        <!-- Start your project here -->
        <section class="full-height">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-lg-8">
                        <div class="card shadow-lg p-4">
                            <div class="card-body">
                                <!-- Register Title -->
                                <h2 class="text-center mb-4">Register</h2>
                                <c:if test="${error != null}">
                                    <div class="alert alert-danger" >
                                        ${error}
                                    </div>
                                </c:if>
                                <c:if test="${success!=null}">
                                    <div class="alert alert-success" >
                                        ${success}
                                    </div>
                                </c:if>
                                <!-- Form -->
                                <form action="./register" method="POST">

                                    <div class="row mb-4">
                                        <div class="col-md-12">
                                            <div class="form-floating">
                                                <input type="text" name="username" class="form-control" id="username" placeholder="Username" required>
                                                <label for="username">Username</label>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="password" name="password" class="form-control" id="password" placeholder="Password" required>
                                                <label for="password">Password</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="text" name="confirmPassword" class="form-control" id="confirmPassword" placeholder="Confirm password" required>
                                                <label for="confirmPassword">Confirm password</label>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="mb-4">
                                        <div class="form-floating">
                                            <input type="email" name="email"  class="form-control" id="email" placeholder="Email address" required>
                                            <label for="email">Email address</label>
                                        </div>
                                    </div>
                                    <!-- First and Last Name -->
                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="text" name="firstname"  class="form-control" id="firstName" placeholder="First name" required>
                                                <label for="firstName">First name</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="text" name="lastname" class="form-control" id="lastName" placeholder="Last name" required>
                                                <label for="lastName">Last name</label>
                                            </div>
                                        </div>
                                    </div>



                                    <!-- Gender and Date of Birth inputs -->
                                    <div class="row mb-4">
                                        <div class="col-md-6 d-flex align-items-center">
                                            <label class="form-label me-3">Gender:</label>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" id="male" value="true" required checked="">
                                                <label class="form-check-label" for="male">Male</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" id="female" value="false" required>
                                                <label class="form-check-label" for="female">Female</label>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="date" name="dob" class="form-control" id="dob" required>
                                                <label for="dob">Date of Birth</label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Phone and Address in the same row -->
                                    <div class="row mb-4">
                                        <div>
                                            <div class="form-floating">
                                                <input type="tel" name="phone"  class="form-control" id="phone" placeholder="Phone number" required>
                                                <label for="phone">Phone</label>
                                            </div>
                                        </div>

                                    </div>

                                    <!-- Email input -->


                                    <!-- Centered Submit button -->
                                    <div class="d-grid mb-3">
                                        <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
                                    </div>

                                    <!-- Register link -->
                                    <p class="text-center">Already have an account?
                                        <a href="./login" class="custom-link">Login here</a>
                                    </p>

                                    <!-- Divider -->
                                    <div class="divider my-4">
                                        <p class="text-muted">OR</p>
                                    </div>

                                    <!-- Centered Google sign-in button -->
                                    <div class="d-grid">
                                        <a class="btn btn-google btn-lg text-white" href="#!" role="button">
                                            <i class="fab fa-google me-2"></i>Sign in with Google
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End your project here -->

        <!-- Bootstrap JS with Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>

