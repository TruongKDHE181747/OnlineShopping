<%-- 
    Document   : profile
    Created on : May 24, 2024, 1:21:04 PM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Car Page</title>
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
                <a href="../settinglist" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
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
                    <h2>Edit Setting</h2>
                </div>
                <div class="row g-5" style="justify-content: center;">


                   

                    <div class="col-md-8">
                        <form class="needs-validation" action="../updatesetting" enctype="multipart/form-data">
                            <div class="row g-3">
                                
                                <div class="col-sm-3"></div>
                                <div class="col-sm-6">
                                    <label for="pname" class="form-label"> Name</label>
                                    <input value="${sessionScope.pd.product_category_name}" name="pname" type="text" class="form-control" id="pname" required>
                                    
                                    
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-6">
                                    <label for="classification">Classification:</label>
                                    <input value="${sessionScope.type}"name="classification" type="text" class="form-control" id="classification" disabled="">

                                    </select>
                                </div>

                               <div class="col-sm-3"></div>
                               <div class="col-sm-3"></div>
                                <div class="my-3 col-sm-6">
                                    <label for="status" class="form-label">Status</label>
                                    <div class="form-check">
                                        <input value="1" id="status" name="status" type="radio" class="form-check-input"
                                               <c:if test="${sessionScope.pd.is_active ==1}">checked</c:if>>
                                        <label class="form-check-label" for="status">Show</label>
                                    </div>
                                    <div class="form-check">
                                        <input value="0" id="status1" name="status" type="radio" class="form-check-input"
                                        <c:if test="${sessionScope.pd.is_active == 0}">checked</c:if>>
                                        <label class="form-check-label" for="status1">Hidden</label>
                                    </div>
                                    
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-6">
                                    <input value="${sessionScope.pd.product_category_id}" name="pid" type="hidden" class="form-control" id="pid">
                                    
                                    
                                </div>
                                
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
