<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__option">
        <div class="offcanvas__links">
            <a href="#">Sign in</a>
            <a href="#">FAQs</a>
        </div>
        <div class="offcanvas__top__hover">
            <span>Usd <i class="arrow_carrot-down"></i></span>
            <ul>
                <li>USD</li>
                <li>EUR</li>
                <li>USD</li>
            </ul>
        </div>
    </div>
    <div class="offcanvas__nav__option">
        <a href="#" class="search-switch"><img src="./common/img/icon/search.png" alt=""></a>
        <a href="#"><img src="../common/img/icon/heart.png" alt=""></a>
        <a href="#"><img src="./common/img/icon/cart.png" alt=""> <span>0</span></a>
        <div class="price">$0.00</div>
    </div>
    <div id="mobile-menu-wrap"></div>

</div>
<!-- Offcanvas Menu End -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">

                </div>
                <%
                String s = request.getContextPath();;
                %>
                <div class="col-lg-6 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__links">
                            <c:if test="${sessionScope.account eq null}">
                            <a href="<%=s%>/login">Sign in</a>
                            <a href="<%=s%>/register">Sign up</a>                      
                            </c:if>
                            <c:if test="${sessionScope.account ne null}">
                                <a href="<%=s%>/profile">Hello ${sessionScope.account.username}</a>
                            <a href="<%=s%>/logout">Logout</a>                      
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="./index.html"><img src="<%=s%>/common/img/logo.png" alt=""></a>
                </div>
            </div>
            <%
            String mainpage = session.getAttribute("mainpage")+"";
            if(mainpage.equals("null")) mainpage = "home";
            %>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li class="<%=mainpage.equals("home")?"active":""%>"><a href="<%=s%>/homeslider">Home</a></li>
                        <li class="<%=mainpage.equals("shop")?"active":""%>"><a href="<%=s%>/homeproduct">Shop</a></li>
                        <li><a href="#">Pages</a>
                            <ul class="dropdown">
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Shop Details</a></li>
                                <li><a href="#">Shopping Cart</a></li>
                                <li><a href="#">Check Out</a></li>
                                <li><a href="#">Blog Details</a></li>
                            </ul>
                        </li>
                        <li class="<%=mainpage.equals("blog")?"active":""%>"><a href="<%=s%>/hpostlist">Blog</a></li>
                        <li><a href="#">Contacts</a></li>
                    </ul>
                </nav>
            </div>
                        <%
                    String pname = session.getAttribute("pname")+"";
                    if(pname.equals("null")) pname= "";
                    %>
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option row" style="padding: 22px 0;">
                    <div class="col-md-10">
                        <form class="d-flex" role="search" action="<%=s%>/homeproductsearch">
                            <input value="<%=pname%>" class="form-control me-2" name="pname" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit" style="margin-left: 10px;">Search</button>
                        </form>

                    </div>
                    <div style="display: flex; align-items: center;" class="col-md-2"><a href="#"><img src="<%=s%>/common/img/icon/cart.png" alt=""> <span>0</span></a></div>



                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>