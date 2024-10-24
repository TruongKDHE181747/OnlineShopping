<%-- 
    Document   : profile
    Created on : May 24, 2024, 1:21:04 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail user Page</title>
        <link rel="icon" href="img/webLogo.jpg" type="image/x-icon" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <!-- CSS Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <!-- Script Link Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>


    </head>
    <body class="bg-body-tertiary">

        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                <a href="../adminuser" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <i style="margin-right: 10px;
                       font-size: 24px;" class="bi bi-arrow-90deg-left"></i>
                    <span class="fs-4">Back to home</span>
                </a>                
            </header>
        </div>


        <div class="container">
            <main>
                <div class="py-5 text-center" >
                    <img class="d-block mx-auto mb-4" src="img/user.png" alt="" width="72">
                    <h2>Detail user </h2>
                </div>

                <div class="row g-5" style="justify-content: center;">


                   

                    <div class="col-md-8">
                        <form class="needs-validation" action="../edituser" method="post" enctype="multipart/form-data">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="user_id" class="form-label">User ID</label>
                                    <input disabled="" value="${sessionScope.userid}" name="user_id" type="text" class="form-control" id="user_id" >

                                </div>

                                <div class="col-sm-6">
                                    <label for="username" class="form-label">Username</label>
                                    <input  value="${sessionScope.u.username}" name="username" type="text" class="form-control" id="username" >

                                </div>
                                <div class="col-sm-6">
                                    <label for="first_name" class="form-label">First name</label>
                                    <input  value="${sessionScope.u.first_name}" name="first_name" type="text" class="form-control" id="first_name" >

                                </div>
                                <div class="col-sm-6">
                                    <label for="last_name" class="form-label">Last name</label>
                                    <input  value="${sessionScope.u.last_name}" name="last_name" type="text" class="form-control" id="last_name" >

                                </div>
                                <div class="col-sm-6">
                                    <label for="profile_picture_url" class="form-label">Profile Image</label>
                                    <input name="profile_picture_url" type="file" class="form-control" id="profile_picture_url">
                                    <img style="margin-top: 10px; height: 100px;" 
                                         src="../${sessionScope.u.profile_picture_url}" 
                                         alt="Profile Image"/>
                                </div>


                                <div class="my-3 col-sm-6">
                                    <label for="gender" class="form-label">Gender</label>
                                    <div class="form-check">
                                        <input value="true" id="male" name="gender" type="radio" class="form-check-input"
                                            <c:if test="${sessionScope.u.gender == true}">checked</c:if>>
                                        <label class="form-check-label" for="male">Male</label>
                                    </div>
                                    <div class="form-check">
                                        <input value="false" id="female" name="gender" type="radio" class="form-check-input"
                                            <c:if test="${sessionScope.u.gender == false}">checked</c:if>>
                                        <label class="form-check-label" for="female">Female</label>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label for="phone" class="form-label">Phone number</label>
                                    <input  value="${sessionScope.u.phone}" name="phone" type="text" class="form-control" id="phone" >

                                </div>
                                <div class="col-sm-6">
                                    <label for="email" class="form-label">Email</label>
                                    <input  value="${sessionScope.u.email}" name="email" type="text" class="form-control" id="email" >

                                </div>
                                <div class="col-sm-6">
                                    <label for="dob" class="form-label">Date of birth</label>
                                    <input  value="${sessionScope.u.dob}" name="dob" type="date" class="form-control" id="dob" >

                                </div>

                                 <div class="col-sm-6">
                                    <label for="role" class="form-label">Role</label>
                                        <select id="role" name="role" class="form-select">
                                            <option value="admin" <c:if test="${sessionScope.u.role.role_id == 1}">selected</c:if>>Admin</option>
                                            <option value="sale manager" <c:if test="${sessionScope.u.role.role_id == 2}">selected</c:if>>sale manager</option>
                                            <option value="saler" <c:if test="${sessionScope.u.role.role_id == 3}">selected</c:if>>saler</option>
                                            <option value="marketer" <c:if test="${sessionScope.u.role.role_id == 4}">selected</c:if>>marketer</option>
                                            <option value="user" <c:if test="${sessionScope.u.role.role_id == 5}">selected</c:if>>user</option>
                                        </select>
                                </div>  
                                <input disabled="" value="${sessionScope.u.password}" name="password" type="hidden" class="form-control" id="password" >

                            </div>

                            <hr class="my-4">
                            <!-- Error check Username and Password -->
                            

                            <button class="w-100 btn btn-primary btn-lg" type="submit">Save</button>
                        </form>
                    </div>
                </div>
            </main>

            <footer class="my-5 pt-5 text-body-secondary text-center text-small">

            </footer>
        </div>

    </body>
</html>
