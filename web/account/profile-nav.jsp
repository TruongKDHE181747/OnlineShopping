<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>




    .nav-link {
        color: #495057; /* Default text color for nav links */
    }

    .is-active {
        background-color: #495057; /* Dark background for active link */
        color: #ffffff; /* Active link text color */
    }

    .nav-link:hover {
        color: orange; /* Hover text color */
    }



</style>
<div class="col-xl-4">
    <!-- Profile picture card-->
    <div class="card mb-4 mb-xl-0">
        <div class="card-header">Ảnh Đại Diện</div>
        <div class="card-body text-center">
            <!-- Profile picture image-->
            <img style="height: 10rem; width: 10rem" class="img-account-profile rounded-circle mb-2" 
                 src="${account.profile_picture_url != null ? account.profile_picture_url : pageContext.request.contextPath + '/profile_img/default.jpg'}"
                 alt="Ảnh Đại Diện">

            <!-- Profile picture upload button-->
            <form action="./uploadProfileImage" method="post" enctype="multipart/form-data">
                <input style="margin-left: 40px;" type="file" name="profileImage" id="fileInput" accept="image/*">                                 
                <button class="btn btn-dark mt-3" type="submit">Tải Lên</button>
            </form>
        </div>
    </div>

    <% String currentPage = request.getRequestURI(); %>
    <div class="card mb-4 mb-xl-0" style="margin-top: 30px">
        <div class="card-body">
            <nav class="nav flex-column nav-pills nav-gap-y-1">
                <a href="./profile" class="nav-item nav-link has-icon nav-link-faded  <%= currentPage.contains("profile") ? "is-active" : "" %>">
                    Thông Tin Tài Khoản
                </a>
                <a href="./changePassword" class="nav-item nav-link has-icon nav-link-faded <%= currentPage.contains("changePassword") ? "is-active" : "" %>">
                    Bảo Mật
                </a>
                <a href="./orderHistory" class="nav-item nav-link has-icon nav-link-faded <%= currentPage.contains("orderHistory") ? "is-active" : "" %>">
                    Lịch Sử Đơn Hàng
                </a>
                <a href="./address" class="nav-item nav-link has-icon nav-link-faded <%= currentPage.contains("address") ? "is-active" : "" %>">
                    Địa Chỉ
                </a>
            </nav>
        </div>
    </div>
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

    const fileInput = document.getElementById('fileInput');
    fileInput.addEventListener('change', function () {
        const file = fileInput.files[0];
        validateImage(file);
    });
</script>