<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <jsp:include page="../common/css.jsp" />
        <link rel="stylesheet" href="./account/css/registerstyle.css"/>
    </head>

    <body>
        <jsp:include page="../common/header.jsp" />

        <!-- Start your project here -->
        <div class="col-md-12 text-center" style="margin: 100px 0">
            <span class="icon-shopping-cart display-3 text-secondary mb-4">
                <i class="fa fa-shopping-cart"></i>
            </span>
            <h2 class="display-3 text-black">Giỏ Hàng Của Bạn Trống</h2>
            <p class="lead mb-5">Có vẻ như bạn chưa thêm sản phẩm nào vào giỏ hàng.</p>
            <p><a href="${pageContext.request.contextPath}/homeproduct" class="btn btn-lg btn-dark">Mua Ngay</a></p>
        </div>
        <!-- End your project here -->
        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
        <jsp:include page="../common/js.jsp" />
    </body>

</html>
