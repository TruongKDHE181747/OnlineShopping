

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Login</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
        
        <link rel="stylesheet" href="./account/css/loginstyle.css"/>
    </head>

    <body>
        <!-- Start your project here -->
        <section class="vh-100">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-lg p-4">
                            <div class="card-body">
                                <!-- Login Title -->
                                <h2 class="text-center mb-4">Sign In</h2>

                                <!-- Form -->
                                <form>
                                    <!-- Username input -->
                                    <div class="form-floating mb-3">
                                        <input type="text" name="username" class="form-control" id="userInput" placeholder="Username" required>
                                        <label for="userInput">Username</label>
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-floating mb-3">
                                        <input type="password" name="password" class="form-control" id="passwordInput" placeholder="Password" required>
                                        <label for="passwordInput">Password</label>
                                    </div>

                                    <!-- Remember me and forgot password -->
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <div class="form-check">
                                            <input class="form-check-input" name="rememberMe" type="checkbox" id="rememberMe" />
                                            <label class="form-check-label" for="rememberMe"> Remember me </label>
                                        </div>
                                        <a href="#!" class="custom-link">Forgot password?</a>
                                    </div>

                                    <!-- Centered Submit button -->
                                    <div class="d-grid mb-3">
                                        <button type="submit" class="btn btn-primary btn-lg">Sign In</button>
                                    </div>

                                    <!-- Register link -->
                                    <p class="text-center">Don't have an account? 
                                        <a href="./register" class="custom-link">Register here</a>
                                    </p>

                                    <!-- Divider -->
                                    <div class="divider my-4">
                                        <p class="text-muted">OR</p>
                                    </div>

                                    <!-- Centered Google login button -->
                                    <div class="d-grid">
                                        <a class="btn btn-google btn-lg text-white" href="#!" role="button">
                                            <i class="fab fa-google me-2"></i>Continue with Google
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

