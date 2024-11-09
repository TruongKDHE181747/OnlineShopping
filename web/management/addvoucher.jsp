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
        <title>Thêm mã giảm giá</title>
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
                <a href="../voucherlist" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <i style="margin-right: 10px;
                       font-size: 24px;" class="bi bi-arrow-90deg-left"></i>
                    <span class="fs-4">Quay lại</span>
                </a>                
            </header>
        </div>


        <div class="container">
            <main>
                <div class="py-5 text-center" >
                    <img class="d-block mx-auto mb-4" src="img/user.png" alt="" width="72">
                    <h2>Thêm mã giảm giá</h2>
                </div>

                <div class="row g-5" style="justify-content: center;">


                   

                    <div class="col-md-8">
                        <form class="needs-validation" action="../addvoucher" enctype="multipart/form-data">
                            <div class="row g-3">
                                

                                <div class="col-sm-6">
                                    <label for="voucher_name" class="form-label">Tên</label>
                                    <input maxlength="50" value="" name="voucher_name" type="text" class="form-control" id="voucher_name" required>

                                </div>
                                <div class="col-sm-6">
                                    <label for="description" class="form-label">Mô tả</label>
                                    <input maxlength="500" value="" name="description" type="text" class="form-control" id="description" required>

                                </div>
                                <div class="col-sm-6">
                                    <label for="start_date" class="form-label">Ngày bắt đầu</label>
                                    <input  value="" name="start_date" type="date" class="form-control" id="start_date" required>

                                </div>
                                <div class="col-sm-6">
                                      <label for="end_date" class="form-label">Ngày kết thúc</label>
                                    <input value="" name="end_date" type="date" class="form-control" id="end_date" required>
                                
                                </div>
                                <div class="col-sm-6">
                                    <label for="quantity" class="form-label">Số lượng</label>
                                    <input name="quantity" type="number" min="0" class="form-control" id="quantity" required>
                                </div>


                                <div class="col-sm-6">
                                    <label for="percent" class="form-label">Giảm giá(%)</label>
                                    <input  value="" name="percent" type="number" min="0" max="100" class="form-control" id="percent" required>

                                </div>
                                
                                <div class="col-sm-6">
                                    <label for="code" class="form-label">Mã giảm giá</label>
                                    <input maxlength="50" value="" name="code" type="text"  class="form-control" id="code" required>
                                </div>
                                
                                <div class="my-3 col-sm-6">
                                    <label for="status" class="form-label">Trạng thái</label>
                                    <div class="form-check">
                                        <input value="1" id="status" name="status" type="radio" class="form-check-input">
                                        <label class="form-check-label" for="status">Hoạt động</label>
                                    </div>
                                    <div class="form-check">
                                        <input value="0" id="status1" name="status" type="radio" class="form-check-input">
                                        <label class="form-check-label" for="status1">Ngừng hoạt động</label>
                                    </div>
                                    
                                </div>
                                
                            </div>

                            <hr class="my-4">
                            <!-- Error check Username and Password -->
                            <% 
                            String er = (String) session.getAttribute("er");
                            if (er != null) {
                            %>
                            <div style="text-align: left;
                                 color: red;
                                 margin-left: 5px;">
                                <h5> <%= er%></h5><br>
                            </div>
                            <%
                                    // Xóa thông báo lỗi sau khi hiển thị
                                    session.removeAttribute("er");
                                }
                            %>

                            <button class="w-100 btn btn-primary btn-lg" type="submit">Lưu</button>
                        </form>
                    </div>
                </div>
            </main>

            <footer class="my-5 pt-5 text-body-secondary text-center text-small">

            </footer>
        </div>

    </body>
</html>
