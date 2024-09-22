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
                <a href="../productlist" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <i style="margin-right: 10px;
                       font-size: 24px;" class="bi bi-arrow-90deg-left"></i>
                    <span class="fs-4">Back</span>
                </a>                
            </header>
        </div>


        <div class="container">
            <main>
                <div class="py-5 text-center" >
                    <img class="d-block mx-auto mb-4" src="#" alt="" width="72">
                    <h2>Edit Product</h2>
                </div>

                <div class="row g-5" style="justify-content: center;">
                    
                    <%
                        Product p = (Product)session.getAttribute("pdetail");
                    %>
                   

                    <div class="col-md-8">
                        <form class="needs-validation" action="../updateproduct" method="post" enctype="multipart/form-data">
                            <div class="row g-3">
                                
                                <div class="col-sm-6">
                                    <label for="productid" class="form-label">Product Id</label>
                                    <input disabled="" value="<%= p.getProduct_id()%>" name="productid" type="text" class="form-control" id="productid" required>
                                </div>

                                <div class="col-sm-6">
                                    <label for="productname" class="form-label">Product Name</label>
                                    <input  value="<%= p.getProduct_name()%>" name="productname" type="text" class="form-control" id="productname" required>
                                </div>
                                    
                                <div class="col-sm-6">
                                    <label for="image" class="form-label">Product Image</label>
                                    <input name="image" type="file" class="form-control" id="image">
                                    <img style="margin-top: 10px;" src="../<%= p.getThumbnail()%>" alt="alt"/>
                                </div>


                                <div class="my-3 col-sm-6">
                                    <label for="available" class="form-label">Available</label>
                                    <div class="form-check">
                                        <input value="1" id="available" name="available" type="radio" class="form-check-input">
                                        <label class="form-check-label" for="available">Active</label>
                                    </div>
                                    <div class="form-check">
                                        <input id="available1" name="available" type="radio" class="form-check-input">
                                        <label class="form-check-label" for="available1">Inactive</label>
                                    </div>
                                </div>
                                
                                <div class="col-sm-6">
                                    <label for="price" class="form-label">Price</label>
                                    <input value="<%= p.getPrice()%>" name="price" type="text" class="form-control" id="price" required>
                                </div>
                                
                                <div class="col-sm-6">
                                    <label for="quantity" class="form-label">Total Quantity</label>
                                    <input disabled="" value="<%= p.getTotal_quantity()%>" name="quantity" type="text" class="form-control" id="quantity" required>
                                </div>
                                
                                <div class="col-sm-6">
                                    <label for="discount" class="form-label">Discount</label>
                                    <input value="<%= p.getDiscount()%>" name="discount" type="text" class="form-control" id="discount" required>
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
