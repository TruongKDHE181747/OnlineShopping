<%-- 
    Document   : hblogdetail
    Created on : Sep 25, 2024, 10:44:12 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.Post"%>
<%@page import="model.PostCategory"%>
<%@page import="model.User"%>
<%@page import="model.PostFeedback"%>
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
        Post ppostdetail = (Post)session.getAttribute("ppostdetail");
        Post afterPost = (Post)session.getAttribute("afterPost");
        Post beforePost = (Post)session.getAttribute("beforePost");
            PostCategory ppostcategory = (PostCategory)session.getAttribute("ppostcategory");
            User ppostauthor = (User)session.getAttribute("ppostauthor");
            
        List<PostFeedback> top3postfblist = (List<PostFeedback>)session.getAttribute("top3postfblist");
        List<PostFeedback> allpostfblist = (List<PostFeedback>)session.getAttribute("allpostfblist");
        
        
        %>
        <!-- Blog Details Hero Begin -->
        <section class="blog-hero spad">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-9 text-center">
                        <div class="blog__hero__text">
                            <h2><%=ppostdetail.getTitle()%></h2>
                            <ul>
                                <li>By <%=ppostauthor.getFirst_name()%> <%=ppostauthor.getLast_name()%></li>
                                <li><%=ppostdetail.getModified_at()%></li>
                                <li><%=allpostfblist.size()%> Comments</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Details Hero End -->

        <!-- Blog Details Section Begin -->
        <section class="blog-details spad">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-12">
                        <div class="blog__details__pic">
                            <img src="../<%=ppostdetail.getThumbnail()%>" alt="">
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="blog__details__content">
                            <div class="blog__details__share">
                                <span>share</span>
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#" class="youtube"><i class="fa fa-youtube-play"></i></a></li>
                                    <li><a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                            <div class="blog__details__text">
                                <p><%=ppostdetail.getContent()%></p>

                            </div>

                            <div class="blog__details__option">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="blog__details__author">
                                            <div class="blog__details__author__pic">
                                                <%
                                                if(ppostauthor.getProfile_picture_url()!=null){
                                                %>
                                                <img src="../<%=ppostauthor.getProfile_picture_url()%>" alt="">
                                                <%
                                                    } else {
                                                %>
                                                <img src="img/blog/details/blog-author.jpg" alt="">
                                                <%
                                                    }
                                                %>
                                            </div>
                                            <div class="blog__details__author__text">
                                                <h5><%=ppostauthor.getFirst_name()%> <%=ppostauthor.getLast_name()%></h5>
                                            </div>
                                        </div>
                                    </div>

                                    <%
                                    List<PostCategory> postcategorylist = (List<PostCategory>)session.getAttribute("postcategorylist");
                                    %>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="blog__details__tags">
                                            <%
                                            for (PostCategory postCategory : postcategorylist) {
            
        
                                            %>
                                            <a style="color: <%=ppostcategory.getPost_category_id()==postCategory.getPost_category_id()?"black":
                                                "#b7b7b7;"%>" 
                                               href="../filterpostbycategory?cid=<%=postCategory.getPost_category_id()%>">
                                                #<%=postCategory.getPost_category_name()%></a>
                                                <%
                                                    }
                                                %>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="blog__details__btns">
                                <div class="row">                                  
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <%
                                        if(beforePost!=null) {
                                        %>
                                        <a href="../hpostdetail?bid=<%=beforePost.getPost_id()%>" class="blog__details__btns__item">
                                            <p><span class="arrow_left"></span> Previous Pod</p>
                                            <h5><%=beforePost.getTitle()%></h5>
                                        </a>
                                        <%
                                            }
                                        %>
                                        
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <%
                                        if(afterPost!=null){
                                        %>
                                        <a href="../hpostdetail?bid=<%=afterPost.getPost_id()%>" class="blog__details__btns__item blog__details__btns__item--next">
                                            <p>Next Pod <span class="arrow_right"></span></p>
                                            <h5><%=afterPost.getTitle()%></h5>
                                        </a>
                                        <%
                                            }
                                        %>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="blog__details__comment">
                                <h4>Leave A Comment</h4>
                                <form action="#">
                                    <div class="row">
                                        
                                        <div class="col-lg-12 text-center">
                                            <textarea placeholder="Comment"></textarea>
                                            <button type="submit" class="site-btn">Post Comment</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <%
                            int cpfpage = 0;
                            if(session.getAttribute("pofpage")!=null) cpfpage = Integer.parseInt(session.getAttribute("pofpage")+"");
        
                            %>
                            <div class="row" style="margin-top: 24px;">
                                <div class="blog__details__option" style="width: 100%;">
                                    <div class="row">
                                        
                                        <%
                                        for (PostFeedback postFeedback : top3postfblist) {
            
        
                                        %>
                                        <div class="col-md-12 row" style="margin: 5px 0;">
                                            <div class="blog__details__author col-md-12 row">
                                                <div class="blog__details__author__pic col-md-2">
                                                    <img src="../<%=postFeedback.getProfile_picture_url()%>" alt="">
                                                </div>
                                                <div class="blog__details__author__text col-md-9">
                                                    <h5><%=postFeedback.getUsername()%></h5>
                                                    <p><%=postFeedback.getReview()%></p>
                                                </div>

                                            </div>
                                        </div>
                                        <%
                                            }
                                        %>
                                        

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="product__pagination">
                                                <%
                                                int npage = allpostfblist.size()/3+1;
                                                for (int i = 0; i < npage; i++) {
                                                %>
                                                <a class="<%=i==cpfpage?"active":""%>" href="../postfbpagination?cpage=<%=i%>"><%=i+1%> </a>
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
        </section>
        <!-- Blog Details Section End -->



        <!-- Latest Blog Section Begin -->
        <section class="latest spad" style="padding-top: 0;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Related News</span>
                            <h2>Similar <%=ppostcategory.getPost_category_name()%> Posts </h2>
                        </div>
                    </div>
                </div>
                        
                        <%
                        List<Post> relatedPostList = (List<Post>)session.getAttribute("relatedPostList");
        
                        %>
                <div class="row">
                    
                    <%
                    for (Post post : relatedPostList) {
            
        
                    %>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="../<%=post.getThumbnail()%>"></div>
                            <div class="blog__item__text">
                                <span><img src="img/icon/calendar.png" alt=""> <%=post.getModified_at()%></span>
                                <h5><%=post.getTitle()%></h5>
                                <a href="../hpostdetail?bid=<%=post.getPost_id()%>">Read More</a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    
                    
                </div>
            </div>
        </section>
        <!-- Latest Blog Section End -->
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
