<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product Page</title>
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
                <a href="../product-list.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <i style="margin-right: 10px;
                       font-size: 24px;" class="bi bi-arrow-90deg-left"></i>
                    <span class="fs-4">Back</span>
                </a>                
            </header>
        </div>


        <div class="container">
            <main>
                <div class="py-5 text-center" >
                    <img class="d-block mx-auto mb-4" src="img/user.png" alt="" width="72">
                    <h2>Edit Product</h2>
                </div>

                <div class="row g-5" style="justify-content: center;">
                    
                    <%
                        Product p = session.getAttribute("product_details");
                    %>
                   

                    <div class="col-md-8">
                        <form class="needs-validation" action="caredit" method="post" enctype="multipart/form-data">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="carid" class="form-label">Product Id</label>
                                    <input disabled="" value="1" name="carid" type="text" class="form-control" id="carid" required>

                                </div>

                                <div class="col-sm-6">
                                    <label for="carname" class="form-label">Product Name</label>
                                    <input  value="Car1" name="carname" type="text" class="form-control" id="carname" required>

                                </div>
                                <div class="col-sm-6">
                                    <label for="image" class="form-label">Product Image</label>
                                    <input name="image" type="file" class="form-control" id="image">
                                    <img style="margin-top: 10px;" src="img/car1.jpg" alt="alt"/>
                                </div>


                                <div class="my-3 col-sm-6">
                                    <label for="available" class="form-label">Available</label>
                                    <div class="form-check">
                                        <input value="1" id="available" name="available" type="radio" class="form-check-input">
                                        <label class="form-check-label" for="available">1</label>
                                    </div>
                                    <div class="form-check">
                                        <input id="available1" name="available" type="radio" class="form-check-input">
                                        <label class="form-check-label" for="available1">0</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label for="priceid" class="form-label">Product Price</label>
                                    <select name="priceid" class="form-control">
                                        
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </div>

                                <div class="col-12">
                                    <label for="stationid" class="form-label">Station Id</label>
                                    <select name="stationid" class="form-control">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </div>

                                <div class="col-12">
                                    <label for="numberofseats" class="form-label">Number of Seats</label>
                                    <input value="5" name="numberofseats" type="number" class="form-control" id="numberofseats" placeholder="5,7,10,...">
                                </div>
                                <div class="col-12">
                                    <label for="numberoflargebags" class="form-label">Number of Large Bags</label>
                                    <input value="6" name="numberoflargebags" type="number" class="form-control" id="numberoflargebags" placeholder="1,2,3,...">
                                </div>
                                <div class="col-12">
                                    <label for="numberofsmallbags" class="form-label">Number of Small Bags</label>
                                    <input value="7" name="numberofsmallbags" type="number" class="form-control" id="numberofsmallbags" placeholder="1,2,3,...">
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
