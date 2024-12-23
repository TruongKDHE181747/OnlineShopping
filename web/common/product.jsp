<%-- 
    Document   : product
    Created on : Sep 18, 2024, 2:43:01 PM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%@page import="model.Brand"%>
<%@page import="model.Size"%>
<%@page import="model.Price"%>
<%@page import="model.ProductCategory"%>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormatSymbols" %>
<%@page import="java.text.NumberFormat" %>
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
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <jsp:include page="../common/header.jsp" />
        <!-- Header Section End -->

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Sản phẩm</h4>
                            <div class="breadcrumb__links">
                                <a>Trang chủ</a>
                                <span>Sản phẩm</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shop Section Begin -->
        <%
        String sid = session.getAttribute("fsid")+"";
        String cid = session.getAttribute("fcid")+"";
        String bid = session.getAttribute("fbid")+"";
        String pid = session.getAttribute("fpid")+"";
        String price1 = session.getAttribute("price1")+"";
        String price2 = session.getAttribute("price2")+"";
        if(sid.equals("null")) sid = "";
        if(cid.equals("null")) cid = "";
        if(bid.equals("null")) bid = "";
        if(pid.equals("null")) pid = "";
        if(price1.equals("null")) price1 = "";
        if(price2.equals("null")) price2 = "";
        %>
        <section class="shop spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="shop__sidebar">

                            <div class="shop__sidebar__accordion">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseOne">Phân loại</a>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <%
                                                List<ProductCategory> pcList = (List<ProductCategory>)session.getAttribute("pcList");
        
                                                %>
                                                <div class="shop__sidebar__categories">
                                                    <ul class="nice-scroll">
                                                        <%
                                                        for (ProductCategory productCategory : pcList) {
                                                        if(productCategory.getIs_active()==1){
                                                        %>

                                                        <li><a style="color: <%=cid.equals(productCategory.getProduct_category_id()+"")?"black":"#b7b7b7"%>"  href="../productfilter?cid=<%=productCategory.getProduct_category_id()%>"><%=productCategory.getProduct_category_name()%></a></li>
                                                            <%
                                                                }
                                                            }
                                                            %>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseTwo">Thương hiệu</a>
                                        </div>
                                        <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <%
                                                List<Brand> bList = (List<Brand>)session.getAttribute("bList");
                                                %>
                                                <div class="shop__sidebar__brand">
                                                    <ul>
                                                        <%
                                                        for (Brand brand : bList) {
                                                    if(brand.getIs_active()==1){

                                                        %>
                                                        <li><a style="color: <%=bid.equals(brand.getBrand_id()+"")?"black":"#b7b7b7"%>" href="../productfilter?bid=<%=brand.getBrand_id()%>"><%=brand.getBrand_name()%></a></li>
                                                            <%
                                                                       }
                                                             }
                                                            %>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseThree">Lọc theo giá</a>
                                        </div>
                                        <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <%
                                                    List<Price> prList = (List<Price>)session.getAttribute("prList");
                                                    int maxPrice = Integer.parseInt(session.getAttribute("maxPrice")+"");
                                                %>
                                                <div class="shop__sidebar__price">
                                                    <ul>
                                                        <%
                                                         for (Price price : prList) {

                                                        %>
                                                        <li><a style="color: <%=pid.equals(price.getPrice_id()+"")?"black":"#b7b7b7"%>" href="../productfilter?pid=<%=price.getPrice_id()%>">₫<%=price.getFrom()%>.000 - ₫<%=price.getTo()%>.000</a></li>
                                                            <%
                                                                }
                                                            %>
                                                        <li><a style="color: <%=pid.equals("max")?"black":"#b7b7b7"%>" href="../productfilter?pid=max">₫<%=maxPrice%>.000+</a></li>
                                                    </ul>
                                                </div>
                                                <form action="../productfilter">
                                                    <div class="row" style="margin-top: 14px;">
                                                        <div class="col-md-5">
                                                            <input value="<%=price1%>" name="price1" type="number" min="0" max="1000000000" required="" placeholder="Từ" style="width: 100%;"> 
                                                        </div>
                                                        <div class="col-md-2">
                                                            --
                                                        </div>
                                                        <div class="col-md-5">
                                                            <input value="<%=price2%>" name="price2" type="number" min="0" max="1000000000" required="" placeholder="Đến" style="width: 100%;"> 
                                                        </div>
                                                    </div>
                                                    <button style="margin-top: 10px;
                                                            width: 100%;" type="submit" class="btn btn-dark">Áp dụng</button> 
                                                </form>                 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseFour">Kích cỡ</a>
                                        </div>
                                        <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <%
                                                List<Size> sList = (List<Size>)session.getAttribute("sList");
                                            
                                                %>
                                                <div class="shop__sidebar__tags">
                                                    <%
                                                    for (Size size : sList) {

                                                    %>                       
                                                    <a style="<%=sid.equals(size.getSize_id()+"")?
                                                    "background-color: black; color: white;":
                                                    "color: #b7b7b7;"%>" href="../productfilter?sid=<%=size.getSize_id()%>"><%=size.getSize_name()%></a>
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
                        <%
String sql1 =  session.getAttribute("sql")+"";
if(sql1.equals("null")) sql1 = "";
                        %>

                        <!-- <%=sql1%> --> 
                    </div>


                    <%
                         List<Product> pList = (List<Product>)session.getAttribute("ppList");
                        int pages = Integer.parseInt(session.getAttribute("ppage")+"");
                        int curpage = Integer.parseInt(session.getAttribute("curpage")+"");
                        int totalProduct = Integer.parseInt(session.getAttribute("totalProduct")+"");
                        Locale locale = new Locale("vi", "VN");
                        Currency currency = Currency.getInstance("VND");

                        DecimalFormatSymbols df = DecimalFormatSymbols.getInstance(locale);
                        df.setCurrency(currency);
                        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
                        numberFormat.setCurrency(currency);
                    %>

                    <div class="col-lg-9">
                        <div class="shop__product__option">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="shop__product__option__left">
                                        <p>Hiển thị <%=curpage*9+1%>–<%=curpage*9+pList.size()%> trên <%=totalProduct%> kết quả</p>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="shop__product__option__right">
                                        <%
                                        String sortValue = session.getAttribute("sortValue")+"";
                                        if(sortValue.equals("null")) sortValue = "";
                                        %>
                                        <form action="../productsort">
                                            <p>Sắp xếp theo:</p>
                                            <select name="sortValue">
                                                <option <%=sortValue.equals("low")?"selected":""%> value="low">Giá: Thấp đến Cao</option>
                                                <option <%=sortValue.equals("high")?"selected":""%> value="high">Giá: Cao đến Thấp</option>
                                                <option <%=sortValue.equals("rate")?"selected":""%> value="rate">Đánh giá của người dùng</option>
                                                <option <%=sortValue.equals("best")?"selected":""%> value="best">Bán chạy nhất</option>
                                            </select>
                                            <button type="submit" class="btn btn-outline-dark">Áp dụng</button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="row">

                            <%
                   
                    
                        for (Product product : pList) {
                        int price =product.getPrice() - product.getPrice()*product.getDiscount()/100;
                        String cmoney = numberFormat.format(price);
                        String omoney = numberFormat.format(product.getPrice());
                        if(product.isIs_active()){

                            %>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="../<%=product.getThumbnail()%>">
                                        <%
                                    if(product.getDiscount()!=0){
                                        %>
                                        <span style="background-color: black; color: white;" class="label">-<%=product.getDiscount()%>%</span>
                                        <% }%>
                                        <ul class="product__hover">

                                            <li><a href="../hproductdetail?proid=<%=product.getProduct_id()%>"><img src="img/icon/search.png" alt=""></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h5 style="cursor: pointer" onclick="window.location.href = '../hproductdetail?proid=<%=product.getProduct_id()%>'"><%=product.getProduct_name()%></h5>



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
                                        </div>
                                        <h5><%
                                            if(product.getDiscount()!=0){
                                            %>
                                            <del style="color: gray; font-size: 12px;"><%=omoney%></del>
                                            <% }%>
                                            <%=cmoney%> 
                                        </h5>

                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>


                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="product__pagination">
                                    <%
                                    for (int i = 0; i < pages; i++) {
                                    %>
                                    <a class="<%=i==curpage?"active":""%>" href="../pagination?cpage=<%=i%>"><%=i+1%> </a>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="../common/footer.jsp" />
   
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
