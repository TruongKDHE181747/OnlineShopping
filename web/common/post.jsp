<%-- 
    Document   : post
    Created on : Sep 23, 2024, 10:49:55 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Post"%>
<%@page import="model.PostCategory"%>
<%@page import="java.util.*" %>
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
        <jsp:include page="../common/header.jsp" />
        <!-- Header Section End -->

        <%
        List<Post> top6post = (List<Post>)session.getAttribute("top6post");
            List<Post> allpostlist = (List<Post>)session.getAttribute("allpostlist");
             
        
        %>
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-blog set-bg" data-setbg="../post_img/post1.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Our Blog</h2>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->




        <!-- Blog Section Begin -->
        <section class="blog spad">

            <%
            String begin = session.getAttribute("pobegin")+"";
        String end = session.getAttribute("poend")+"";
        String author = session.getAttribute("author")+"";
        String title = session.getAttribute("title")+"";
        if(begin.equals("null")) begin = "";
        if(end.equals("null")) end = "";
        if(author.equals("null")) author = "";
        if(title.equals("null")) title = "";
        
            %>
            <div class="container">
                <form action="../hpostfilter">
                    <div class="shop__product__option">
                    <div class="row">
                        
                             <div class="col-lg-6 col-md-6 col-sm-6">
                            
                                <div class="row" style="margin-top: 14px;">
                                    <div class="col-md-6">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-default">From</span>
                                            <input value="<%=begin%>" name="begin" type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Author</span>
                                            <input value="<%=author%>" name="author" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        --
                                    </div>
                                    <div class="col-md-5">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-default">To</span>
                                            <input value="<%=end%>" name="end" type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Post tittle</span>
                                            <input value="<%=title%>" name="title" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                        </div>
                                    </div>
                                    <div class="col-md-3">

                                    </div>
                                </div>
                               
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="shop__product__option__right" style="margin-top: 15px; padding: 10px 0;">
                                <%
                                 List<PostCategory> postcategorylist = (List<PostCategory>)session.getAttribute("postcategorylist");
                                
                                String sortValue = session.getAttribute("sortPostValue")+"";
                                if(sortValue.equals("null")) sortValue = "";
                                %>
                                
                                    <p>Sort by:</p>
                                    <select name="sortValue">
                                        <option <%=sortValue.equals("new")?"selected":""%> value="new">Newest</option>
                                        <option <%=sortValue.equals("old")?"selected":""%> value="old">Oldest</option>
                                        <%
                                            for (PostCategory postCategory : postcategorylist) {

                                
                                        %>
                                        <option <%=sortValue.equals(postCategory.getPost_category_id()+"")?"selected":""%> value="<%=postCategory.getPost_category_id()%>">Tag: <%=postCategory.getPost_category_name()%></option>
                                        <%
                                            }
                                        %>

                                    </select>

                                

                            </div>
                            <button  style="width: 100%;
                                     margin-top: 8px;" type="submit" class="btn btn-outline-dark">Apply</button>
                        <%
                        String loi = session.getAttribute("ploi")+"";
                        String postsql = session.getAttribute("postsql")+"";
                        if(loi.equals("null")) loi = "";
                        %>
                        <div style="color: red;">
                            <%=loi%>
                        </div>
                        </div>
                       
                       <!--<%=postsql%>-->
                    </div>
                </div>
                </form>
                
                <div class="row">
                    <%
                    for (Post post : top6post) {

                    %>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="../<%=post.getThumbnail()%>"></div>
                            <div class="blog__item__text">
                                <span><img src="img/icon/calendar.png" alt=""> <%=post.getModified_at()%></span>
                                <h5><%=post.getTitle()%></h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>


                </div>
                <%
                    int npage = allpostlist.size()/6+1;
                int cpostpage = 0;
            if(session.getAttribute("cpostpage")!=null) cpostpage = Integer.parseInt(session.getAttribute("cpostpage")+"");
                %>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__pagination">
                            <%
                            for (int i = 0; i < npage; i++) {
                            %>
                            <a class="<%=i==cpostpage?"active":""%>" href="../postpagination?cpage=<%=i%>"><%=i+1%> </a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Section End -->

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
