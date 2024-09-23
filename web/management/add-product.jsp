<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        
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
                <div class="py-5 text-center">
                    <img class="d-block mx-auto mb-4" src="img/product.png" alt="" width="72">
                    <h2>Add Product</h2>
                </div>

                <div class="row g-5" style="justify-content: center;">
                    <div class="col-md-8">
                        <form class="needs-validation" action="../addproduct" method="post" enctype="multipart/form-data">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="name" class="form-label">Product Name</label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter product name" required>
                                </div>

                                <div class="col-sm-6">
                                    <label for="price" class="form-label">Price</label>
                                    <input type="number" class="form-control" id="price" name="price" placeholder="Enter product price" required>
                                </div>

                                <div class="col-sm-6">
                                    <label for="quantity" class="form-label">Total Quantity</label>
                                    <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter total quantity" required>
                                </div>

                                <div class="col-sm-6">
                                    <label for="discount" class="form-label">Discount</label>
                                    <input type="number" class="form-control" id="discount" name="discount" placeholder="Enter discount (in %)" required>
                                </div>

                                <div class="col-12">
                                    <label for="description" class="form-label">Description</label>
                                    <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter product description"></textarea>
                                </div>

                                <div class="col-12">
                                    <label for="img" class="form-label">Thumbnail</label>
                                    <input type="file" class="form-control" id="img" name="img" required>
                                </div>

                                <div class="col-12 my-3">
                                    <label class="form-label">Status</label>
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="statusShow" name="status" value="1">
                                        <label class="form-check-label" for="statusShow">Show</label>
                                    </div>
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="statusHide" name="status" value="0">
                                        <label class="form-check-label" for="statusHide">Hidden</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="brand" class="form-label">Brand</label>
                                    <select class="form-select" id="brand" name="brand" required>
                                        <option value="1">4man</option>
                                        <option value="2">Coolmate</option>
                                        <option value="3">Uniqlo</option>
                                    </select>
                                </div>

                                <div class="col-12">
                                    <label for="category" class="form-label">Category</label>
                                    <select class="form-select" id="category" name="category" required>
                                        <option value="1">Dress Shirt</option>
                                        <option value="2">T-shirt</option>
                                        <option value="3">Jeans</option>
                                        <option value="4">Dresses</option>
                                    </select>
                                </div>
                            </div>

                            <hr class="my-4">
                            <button class="w-100 btn btn-primary btn-lg" type="submit">Add Product</button>
                        </form>
                    </div>
                </div>
            </main>

            <footer class="my-5 pt-5 text-body-secondary text-center text-small">
            </footer>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
