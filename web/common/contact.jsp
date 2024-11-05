<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Male-Fashion | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <!-- Page Preloder -->
        
        <jsp:include page="../common/header.jsp" />

        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d10971.851007145786!2d105.56398356479062!3d21.086312384866847!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134584fa63b2f87%3A0xe32074883f9b0849!2zVHLGsOG7m2MgTmfDoyA0IE5n4buNYyBMw6J1IDIwME0gKFjDoyDEkOG6oWkgxJDhu5NuZyAtIEh1eeG7h24gVGjhuqFjaCBUaOG6pXQpIC0gxJDGsOG7nW5nIFThu4luaCBM4buZIDQxOQ!5e0!3m2!1svi!2s!4v1729960752312!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>   
        </div>

        <!-- Contact Section Begin -->
        <section class="contact spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="contact__text">
                            <div class="section-title">
                                <span>Thông tin</span>
                                <h2>Liên hệ</h2>
                                <p>Chúng tôi xin chân thành cảm ơn các ý kiến đóng góp của các bạn. Chúng tôi sẽ tiếp tục cải thiện để mang đến dịch vụ tốt nhất cho tất cả mọi người. <br> Xin cảm ơn!</p>
                            </div>
                            <ul>
                                <li>
                                    <h4>Địa chỉ</h4>
                                    <p>Số nhà 43, thôn 3, xã Đại Đồng, Huyện Thạch Thất, Thành phố Hà Nội<br />Phone: +0347 818 511
                                        <br />Email: khuditru1520@gmail.com
                                    </p>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="contact__form">
                            <form action="${pageContext.request.contextPath}/contact" method="post">
                                <div class="row">

                                    <div class="col-lg-12">
                                        <input name="email" required="" type="email" placeholder="Email">
                                    </div>
                                    <div class="col-lg-12">
                                        <textarea name="message" required="" maxlength="2000" placeholder="Lời nhắn"></textarea>
                                        <button type="submit" class="site-btn">Gửi</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact Section End -->
        <jsp:include page="../common/footer.jsp" />

    <c:if test="${not empty sessionScope.contactMsg}">
        <script>
            alert('${sessionScope.contactMsg}');
        </script>

        <%session.removeAttribute("contactMsg");%>
    </c:if>
    
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>