<%-- 
    Document   : hproductdetail
    Created on : Sep 19, 2024, 9:56:05 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%@page import="model.ProductImg"%>
<%@page import="model.ProductSize"%>
<%@page import="model.ProductFeedback"%>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.NumberFormat"%>
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

        <style>

        </style>
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <!-- Page Preloder -->
        <jsp:include page="../common/header.jsp" />
        <!-- Header Section End -->

        <!-- Shop Details Section Begin -->
        <section class="shop-details">
            <div class="product__details__pic">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__details__breadcrumb">
                                <a href="./index.html">Home</a>
                                <a href="./shop.html">Shop</a>
                                <span>Product Details</span>
                            </div>
                        </div>
                    </div>
                    <%
                     Product product = (Product)session.getAttribute("dproduct");
                     List<ProductImg> piList = (List<ProductImg>)session.getAttribute("dpiList");
                     List<ProductFeedback> pfList = (List<ProductFeedback>)session.getAttribute("pf2List");
                     List<ProductFeedback> alldpfList = (List<ProductFeedback>)session.getAttribute("alldpfList");
                     List<ProductSize> psList = (List<ProductSize>)session.getAttribute("dpsList");
        
                     Locale locale = new Locale("vi", "VN");
                    Currency currency = Currency.getInstance("VND");
                    DecimalFormatSymbols df = DecimalFormatSymbols.getInstance(locale);
                    df.setCurrency(currency);
                    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
                    numberFormat.setCurrency(currency);
                    
                    int price =product.getPrice() - product.getPrice()*product.getDiscount()/100;
                    String cmoney = numberFormat.format(price);
                    %>
                    <div class="row">
                        <div class="col-lg-3 col-md-3">
                            <ul class="nav nav-tabs" role="tablist">
                                <%
                                int i = 1;
                                for (ProductImg productImg : piList){
                                     if(productImg.getIs_active()==1){
                                     
                                %>
                                <li class="nav-item">
                                    <a class="nav-link <%=i==1?"active":""%>" data-toggle="tab" href="#tabs-<%=i%>" role="tab">
                                        <div class="product__thumb__pic set-bg" data-setbg="../<%=productImg.getImage_url()%>">
                                        </div>
                                    </a>
                                </li>
                                <%
                                    i++;
                                 }
                                     }
                                %>


                            </ul>
                        </div>
                        <div class="col-lg-6 col-md-9">
                            <div class="tab-content">
                                <%
                                i = 1;
                                for (ProductImg productImg : piList){
                                
                                     if(productImg.getIs_active()==1){
                                %>
                                <div class="tab-pane <%=i==1?"active":""%>" id="tabs-<%=i%>" role="tabpanel">
                                    <div class="product__details__pic__item">
                                        <img src="../<%=productImg.getImage_url()%>" alt="">
                                    </div>
                                </div>
                                <%
                                    i++;
                                 }
                                     }
                                %>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product__details__content">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-8">
                            <div class="product__details__text">
                                <h4><%=product.getProduct_name()%></h4>
                                <div class="rating">
                                    <%if(product.getRated_star()<=0){
                                    %>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <% } else if(product.getRated_star()<=1){%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <% } else if(product.getRated_star()<=2){  %>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <%} else if(product.getRated_star()<=3){%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <%} else if(product.getRated_star()<=4){%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <%} else { %>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <%}%>
                                    <span> - <%=alldpfList.size()%> Reviews</span>
                                </div>
                                <h3><%=cmoney%></h3>
                                <p><%=product.getDescription()%></p>
                                <div class="product__details__option">
                                    
                                    <div class="product__details__option__size">
                                        <span>Size:</span>
                                        
                                        <div class="shop__sidebar__tags">
                                            <%
                                     int dsize = Integer.parseInt(session.getAttribute("dsize")+"");
                                     int dquantity = Integer.parseInt(session.getAttribute("dquantity")+"");
                                    for (ProductSize productSize : psList) {
                                            %>

                                            <a style="<%=dsize==productSize.getSize_id()?
                                                    "background-color: black; color: white;":
                                                    "color: #b7b7b7;"%>" href="../dsetquantity?sid=<%=productSize.getSize_id()%>"><%=productSize.getSize_name()%></a>
                                            <%
                                                }
                                            %>


                                        </div>

                                    </div>

                                </div>
                                <div class="product__details__cart__option">
                                    
                                    <form action="#">
                                        <span style="margin-right: 12px;
                                        font-weight: bold;">In stock: <%=dquantity%></span>
                                        <div class="quantity">
                                        <div class="pro-qty">
                                            
                                            <input value="1" type="number" min="1" max="<%=dquantity%>">
                                        </div>
                                    </div>
                                    <a href="#" class="primary-btn">add to cart</a>
                                    <a href="#" class="primary-btn">Checkout</a>
                                    </form>
                                </div>


                            </div>
                        </div>
                    </div>
                    <% String dcontent = session.getAttribute("dcontent")+"";%>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__details__tab">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link <%=dcontent.equals("pdescription")?"active":""%>" data-toggle="tab" href="#tabs-5"
                                           role="tab">Description</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link <%=dcontent.equals("pfeedback")?"active":""%>" data-toggle="tab" href="#tabs-6" role="tab">Customer
                                            Previews(<%=alldpfList.size()%>)</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane <%=dcontent.equals("pdescription")?"active":""%>" id="tabs-5" role="tabpanel">
                                        <div class="product__details__tab__content">
                                            <div class="product__details__tab__content__item">
                                                <h5>Products Infomation</h5>
                                                <p><p><%=product.getDescription()%></p></p>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane <%=dcontent.equals("pfeedback")?"active":""%>" id="tabs-6" role="tabpanel">
                                        <%
                                        for (ProductFeedback productFeedback : pfList) {
            
        
                                        %>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="product__item row" style="margin: 24px 0;">
                                                    <div style="height: 120px" class="product__item__pic set-bg col-md-2" data-setbg="../<%=productFeedback.getThumbnail()%>">

                                                    </div>

                                                    <div class="col-md-10">
                                                        <h6><%=productFeedback.getReview()%></h6>

                                                        <div class="rating">
                                                            <%if(productFeedback.getRating()<=0){
                                                            %>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <% } else if(productFeedback.getRating()<=1){%>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <% } else if(productFeedback.getRating()<=2){  %>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <%} else if(productFeedback.getRating()<=3){%>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <%} else if(productFeedback.getRating()<=4){%>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <%} else { %>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <%}%>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            }
                                        %>


                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="product__pagination">
                                                    <%
                                                        int numberOfPage = alldpfList.size()/2+1;
                                                    int dfeedbackpage = Integer.parseInt(session.getAttribute("dfeedbackpage")+"");
                                                    for (int j = 0; j < numberOfPage; j++) {
                                                    %>
                                                    <a class="<%=dfeedbackpage==j?"active":""%>" href="../fbpagination?cpage=<%=j%>"><%=j+1%> </a>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Details Section End -->

        <!-- Related Section Begin -->
        <section class="related spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="related-title">Related Product</h3>
                    </div>
                </div>
                <%
                List<Product> prlList = (List<Product>)session.getAttribute("prlList");
                
                %>
                <div class="row">
                     <%
                   
                    
                    for (Product rproduct : prlList) {
                    int rprice =rproduct.getPrice() - rproduct.getPrice()*rproduct.getDiscount()/100;
                    String rcmoney = numberFormat.format(rprice);
                    if(rproduct.isIs_active()){

                    %>
                     <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="../<%=rproduct.getThumbnail()%>">
                                    <%
                                if(rproduct.getDiscount()!=0){
                                %>
                                <span style="background-color: black; color: white;" class="label">-<%=rproduct.getDiscount()%>%</span>
                                <% }%>
                                    <ul class="product__hover">
                                        
                                        <li><a href="../hproductdetail?proid=<%=rproduct.getProduct_id()%>"><img src="img/icon/search.png" alt=""></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><%=rproduct.getProduct_name()%></h6>
                                    <a href="#" class="add-cart">+ Add To Cart</a>
                                    <div class="rating">
                                    <%if(rproduct.getRated_star()<=0){
                                        %>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <% } else if(rproduct.getRated_star()<=1){%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                       <% } else if(rproduct.getRated_star()<=2){  %>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                       <%} else if(rproduct.getRated_star()<=3){%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                        <%} else if(rproduct.getRated_star()<=4){%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                        <%} else { %>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                        <%}%>
                                </div>
                                        <h5><%=rcmoney%> 
                                        </h5>
                                    <div class="product__color__select">
                                        <label for="pc-4">
                                            <input type="radio" id="pc-4">
                                        </label>
                                        <label class="active black" for="pc-5">
                                            <input type="radio" id="pc-5">
                                        </label>
                                        <label class="grey" for="pc-6">
                                            <input type="radio" id="pc-6">
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%
                            }
                        }
                    %>
                    
                </div>
            </div>
        </section>
        <!-- Related Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="#"><img src="img/footer-logo.png" alt=""></a>
                            </div>
                            <p>The customer is at the heart of our unique business model, which includes design.</p>
                            <a href="#"><img src="img/payment.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                        <div class="footer__widget">
                            <h6>Shopping</h6>
                            <ul>
                                <li><a href="#">Clothing Store</a></li>
                                <li><a href="#">Trending Shoes</a></li>
                                <li><a href="#">Accessories</a></li>
                                <li><a href="#">Sale</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-6">
                        <div class="footer__widget">
                            <h6>Shopping</h6>
                            <ul>
                                <li><a href="#">Contact Us</a></li>
                                <li><a href="#">Payment Methods</a></li>
                                <li><a href="#">Delivary</a></li>
                                <li><a href="#">Return & Exchanges</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                        <div class="footer__widget">
                            <h6>NewLetter</h6>
                            <div class="footer__newslatter">
                                <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                                <form action="#">
                                    <input type="text" placeholder="Your email">
                                    <button type="submit"><span class="icon_mail_alt"></span></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="footer__copyright__text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            <p>Copyright ©
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>2020
                                All rights reserved | This template is made with <i class="fa fa-heart-o"
                                                                                    aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            </p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search End -->

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
