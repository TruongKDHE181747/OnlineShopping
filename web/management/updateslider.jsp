<%-- 
    Document   : profile
    Created on : May 24, 2024, 1:21:04 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chỉnh sửa slider</title>
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
                <a href="../sliderlist" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
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
                    <h2>Sửa Slider</h2>
                </div>

                <div class="row g-5" style="justify-content: center;">

                    <c:set var="s" value="${sessionScope.s}"></c:set>


                        <div class="col-md-8">
                            <form class="needs-validation" action="../updateslider" method="post" enctype="multipart/form-data">
                                <div class="row g-3">
                                    <div class="col-sm-6">
                                        <label for="id" class="form-label"> Id</label>
                                        <input readonly value="${s.id}" name="id" type="text" class="form-control" id="id" required>

                                </div>
                                <input type="text" hidden="" value="${s.img}" name="currentimg">
                                <div class="col-sm-6">
                                    <label for="title" class="form-label">Tiêu đề</label>
                                    <input maxlength="50" value="${s.title}" name="title" type="text" class="form-control" id="title" required>

                                </div>
                                <div class="col-sm-6">
                                    <label for="img" class="form-label"> Ảnh</label>
                                    <input name="img" type="file" class="form-control" id="img">
                                    <img style="margin-top: 10px;width:  285px;height: 141px;" src="../${s.img}" alt="alt"/>
                                </div>
 <script>
                                    function validateImage(file) {
                                        const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                                        if (file && allowedTypes.includes(file.type)) {
                                            return true;
                                        } else {
                                            alert("Hãy tải lên hình ảnh hợp lệ.");
                                            fileInput.value = "";
                                            return false;
                                        }
                                    }

                                    const fileInput = document.getElementById('img');
                                    fileInput.addEventListener('change', function () {
                                        const file = fileInput.files[0];
                                        validateImage(file);
                                    });
                                </script>

                                <div class="my-3 col-sm-6">
                                    <label for="status" class="form-label">Trạng thái</label>
                                    <div class="form-check">
                                        <input value="1" id="status" name="status" type="radio" class="form-check-input"
                                               <c:if test="${s.status == 1}"> checked</c:if>>
                                               <label class="form-check-label" for="status">Hiện</label>
                                        </div>
                                        <div class="form-check">
                                            <input value="0" id="status" name="status" type="radio" class="form-check-input"
                                            <c:if test="${s.status == 0}"> checked</c:if>>
                                            <label class="form-check-label" for="status">Ẩn</label>
                                        </div>
                                    </div>

                                    <div class="row g-3">
                                        <div class="col-sm-6">
                                            <label for="description" class="form-label">Mô tả</label>
                                            <input maxlength="200" value="${s.description}" name="description" type="text" class="form-control" id="id" required>

                                    </div>



                                </div>

                                <hr class="my-4">
                                <!-- Error check Username and Password -->


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
