
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../common/css.jsp" />

    </head>
    <body>
        <jsp:include page="../common/header.jsp" />

        <div class="container-xl px-4 mt-4" >
            
            <hr class="mt-0 mb-4">
            <div class="row" style="margin-bottom: 40px">
                <jsp:include page="../account/profile-nav.jsp"/>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card-body">
                            <form action="./profile" method="POST">
                                <!-- Form Group (username)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputUsername">Username</label>
                                    <input class="form-control" id="inputUsername" readonly="" type="text" value="${account.username}">
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (first name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputFirstName">First name</label>
                                        <input name="firstname" class="form-control" id="inputFirstName" type="text" maxlength="50" placeholder="Enter your first name" value="${account.first_name}">
                                    </div>
                                    <!-- Form Group (last name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLastName">Last name</label>
                                        <input name="lastname" class="form-control" id="inputLastName" type="text" maxlength="50" placeholder="Enter your last name" value="${account.last_name}">
                                    </div>
                                </div>

                                <!-- Form Group (email address)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                    <input  class="form-control" id="inputEmailAddress" type="email" readonly="" value="${account.email}">
                                </div>
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputPhone">Phone number</label>
                                    <input name="phone" class="form-control" id="inputPhone" maxlength="15" type="tel" placeholder="Enter your phone number" value="${account.phone}">
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1">Gender</label>
                                        <div>
                                            <div class="form-check form-check-inline">
                                                <input value="true" class="form-check-input" type="radio" id="radioMale" name="gender" value="male" ${account.gender == true ? 'checked' : ''}>
                                                <label class="form-check-label" for="radioMale">Male</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input value="false" class="form-check-input" type="radio" id="radioFemale" name="gender" value="female" ${account.gender == false ? 'checked' : ''}>
                                                <label class="form-check-label" for="radioFemale">Female</label>
                                            </div>
                                        </div>                                  
                                    </div>
                                    <!-- Form Group (birthday)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputBirthday">Birthday</label>
                                        <input name="dob" class="form-control" id="inputBirthday" type="date" name="birthday" placeholder="Enter your birthday" value="${account.dob}">
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
