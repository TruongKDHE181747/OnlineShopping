
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
                <a class="nav-link active" href="#" target="__blank">Security</a>
            </nav>
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->
                            <img style=" height: 10rem;" class="img-account-profile rounded-circle mb-2" 
                                 src="<c:if test="${profile.profile_picture_url == null}">${pageContext.request.contextPath}/profile_img/default.jpg</c:if>
                                 <c:if test="${profile.profile_picture_url != null}">${profile.profile_picture_url}</c:if>"
                                     alt="">
                                 

                                 <!-- Profile picture upload button-->
                                 <form action="./uploadProfileImage" method="post" enctype="multipart/form-data">
                                     <input style="margin-left: 40px;"  type="file" name="profileImage" accept="image/*">                                 
                                     <button class="btn btn-primary mt-2" type="submit">Upload new image</button>
                                 </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <!-- Account details card-->
                        <div class="card mb-4">
                            <div class="card-header">Account Details</div>
                            <div class="card-body">
                                <form action="./profile" method="POST">
                                    <!-- Form Group (username)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputUsername">Username</label>
                                        <input class="form-control" id="inputUsername" readonly="" type="text" value="${profile.username}">
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (first name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputFirstName">First name</label>
                                        <input name="firstname" class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" value="${profile.first_name}">
                                    </div>
                                    <!-- Form Group (last name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLastName">Last name</label>
                                        <input name="lastname" class="form-control" id="inputLastName" type="text" placeholder="Enter your last name" value="${profile.last_name}">
                                    </div>
                                </div>

                                <!-- Form Group (email address)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                    <input  class="form-control" id="inputEmailAddress" type="email" readonly="" value="${profile.email}">
                                </div>
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputPhone">Phone number</label>
                                    <input name="phone" class="form-control" id="inputPhone" type="tel" placeholder="Enter your phone number" value="${profile.phone}">
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1">Gender</label>
                                        <div>
                                            <div class="form-check form-check-inline">
                                                <input value="true" class="form-check-input" type="radio" id="radioMale" name="gender" value="male" ${profile.gender == true ? 'checked' : ''}>
                                                <label class="form-check-label" for="radioMale">Male</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input value="false" class="form-check-input" type="radio" id="radioFemale" name="gender" value="female" ${profile.gender == false ? 'checked' : ''}>
                                                <label class="form-check-label" for="radioFemale">Female</label>
                                            </div>
                                        </div>                                  
                                    </div>
                                    <!-- Form Group (birthday)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputBirthday">Birthday</label>
                                        <input name="dob" class="form-control" id="inputBirthday" type="date" name="birthday" placeholder="Enter your birthday" value="${profile.dob}">
                                    </div>
                                </div>
                                <!-- Save changes button-->
                                <button class="btn btn-primary" type="submit">Save changes</button>
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
