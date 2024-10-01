<%-- 
    Document   : listpostmarketing
    Created on : Sep 27, 2024, 9:37:00 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Post"%>
<%@page import="model.PostCategory"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="icon" href="img/webLogo.jpg" type="image/x-icon" />
        <!-- CSS Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <!-- Script Link Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <!-- Font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <jsp:include page="../common/css.jsp" />
        <style>
            .criteria{
                border: 1px solid #bb9797;
                border-radius: 6px;
                padding: 10px;
                box-shadow: 1px 1px 1px 1px #eeafaf;
            }

            .icon{
                justify-content: left;
                display: flex;
                align-items: center;
                font-size: 30px;

            }

            .content{
                text-align: right;
                padding: 0;
            }

            .content p{
                margin: 0;
            }

            .list2{
                margin-bottom: 22px;
            }

            .products{
                border: 1px solid gray;
                border-radius: 12px;
                box-shadow: 1px 1px 4px gray;
            }

            .edit{
                display: inline-block;
                background-color: yellow;
                padding: 6px 8px;
                border-radius: 4px;
                cursor: pointer;
                box-shadow: 1px 1px 6px gray;
            }

            .remove{
                color: white;
                display: inline-block;
                background-color: #a0a1e0;
                padding: 6px 8px;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 12px;
                box-shadow: 1px 1px 6px gray;
            }

            .edit:hover,.remove:hover,.add:hover{
                opacity: 0.8;
            }

            .add{
                background-color: #c5c511;
                padding: 8px 10px;
                border-radius: 4px;
                color: white;
                cursor: pointer;
                box-shadow: 1px 1px 6px gray;
            }

            .product-img{
                width: 30%;
            }

            .product-img img{
                width: 80%;
            }
            
            .dropdown-toggle::after{
                color: white;
            }

            label{
                color: #8e7c7c;
            }

            select{
                padding: 16px;

            }

            .input{
                margin: 10px 0;
            }

            .search{
                width: 100%;
                margin-top: 10px;
                padding: 16px 0;
            }
            .post-title{
                width: 16%;
                    
            }
        </style>
        
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <div class="row">
            <!-- START menu -->
            <div class="col-md-2" style="min-height: 552px">
                <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="    
                         width: 100%;
                        height: 100%;
                     ">

                    <hr>
                    
                    
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white home-link" aria-current="page">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"/></svg>
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link text-white product-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                                Products
                            </a>
                        </li>
                        <li>
                            <a href="../listpostmarketing" class="nav-link text-white account-link active">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"/></svg>
                                Post
                            </a>
                        </li>
                        
                        <li>
                            <a href="#" class="nav-link text-white station-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"/></svg>
                                Stations
                            </a>
                        </li>
                        
                        <li>
                            <a href="#" class="nav-link text-white contract-link">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
                                Contracts
                            </a>
                        </li>
                        
                    </ul>
                    <hr>

                </div>
            </div>

            <!-- END menu -->

            
            <div class="col-md-10" style="padding: 40px;">
                
                <%
                 List<Post> top3postmarketing = (List<Post>)session.getAttribute("top3postmarketing");
            List<Post> listpostmarketing = (List<Post>)session.getAttribute("listpostmarketing");
            
            int npage = listpostmarketing.size()/3+1;
                int cpostpage = 0;
            if(session.getAttribute("cpostmkt")!=null) cpostpage = Integer.parseInt(session.getAttribute("cpostmkt")+"");
                %>
                
                <%
            String begin = session.getAttribute("begindatemkt")+"";
        String end = session.getAttribute("enddatemkt")+"";
        String author = session.getAttribute("authormkt")+"";
        String title = session.getAttribute("titlemkt")+"";
        if(begin.equals("null")) begin = "";
        if(end.equals("null")) end = "";
        if(author.equals("null")) author = "";
        if(title.equals("null")) title = "";
        

        String pcmktName = session.getAttribute("pcmktName")+"";
        if(pcmktName.equals("null")) pcmktName = "";
            %>
                <!-- START products -->
                <div class="product">
                    <div class="container products" >
                        <div class="" id="navbarSupportedContent" style="margin: 10px 0;">
                            <form action="../listpostfiltermkt" class="d-flex" role="search">
                                            <h5 style="font-weight: bold;" class="navbar-brand" href="#">From:</h5>
                                            <input value="<%=begin%>" name="begindate" class="form-control me-2" type="date" aria-label="Search">
                                            <h5 style="font-weight: bold;" class="navbar-brand" href="#">To:</h5>
                                            <input value="<%=end%>" name="enddate" class="form-control me-2" type="date" aria-label="Search">
                                            <input value="<%=title%>" placeholder="Post title" name="title" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                            <input value="<%=author%>" placeholder="Author name" name="author" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                            <button class="btn btn-outline-success" type="submit">Search</button>
                                        </form>
                            <%
                        String loi = session.getAttribute("pmktloi")+"";
                        String postsql = session.getAttribute("postsql")+"";
                        if(loi.equals("null")) loi = "";
                        %>
                        <div style="color: red;">
                            <%=loi%>
                        </div>
                                    </div>
                        <div>
                            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                                <div class="container-fluid">
                                    <h5 style="font-weight: bold;" class="navbar-brand" href="#">Manage Post</h5>

                                    <%
                                        
                                    List<PostCategory> postcategorylist = (List<PostCategory>)session.getAttribute("listpostcategorymkt");
                                    %>
                                    <div class="btn-group" style="">
                                      <button  style="color: white;"type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                        <%=pcmktName.equals("")?"Select category":pcmktName%>
                                      </button>
                                      <ul class="dropdown-menu">
                                          <%
                                          for (PostCategory postCategory : postcategorylist) {

                                          %>
                                          <li class=""><a class="dropdown-item " href="../listpostfiltermkt?cid=<%=postCategory.getPost_category_id()%>"><%=postCategory.getPost_category_name()%></a></li>
                                          <%
                                              }
                                          %>
                                      </ul>
                                    </div>
                                    
                                    <!-- Example single danger button -->
                                    

                                    <div class="">
                                        <div class="d-flex add" role="search">
                                            <a href="#"><i style="color: white;" class="fa-solid fa-plus"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Created Day</th>
                                    <th scope="col">Modified Day</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                int i = 1;
                                for (Post post : top3postmarketing) {
                                
                                %>
                                
                                <!-- START Product item -->
                                <tr>
                                    <th scope="row"><%=i%></th>
                                    <td class="post-title"><%=post.getTitle()%></td>
                                    <td class="product-img">
                                        <img src="../<%=post.getThumbnail()%>">
                                    </td>
                                    <td><%=post.getAuthor_name()%></td>
                                    <td><%=post.getCreated_at()%></td>
                                    <td><%=post.getModified_at()%></td>
                                    <td>
                                        <div class="edit">
                                            <a href="#"><i style="color: black;" class="fa-solid fa-pen"></i></a>
                                        </div>
                                        <div class="remove">
                                            <a style="color: white;"onclick="return confirm('Do you want to delete carID 1')" href="#"><i class="fa-solid fa-circle-info"></i></a> 
                                            
                                        </div>
                                        <div class="remove" style="background-color: greenyellow">                               
                                           <a href="#?sid=1&button=show" onclick="return confirm('Show this slider?')">
                                             <i style="color: black;" class="bi bi-eye-fill"></i>
                                           </a>    
                                        </div>
                                    </td>

                                </tr>
                                <!-- END Product item -->
                                
                                
                                <%
                                    i++;
                                    }
                                %>
                                


                            </tbody>
                        </table>
                                
                    <!-- START PAGE -->
                    
                    <div style="display: flex;
                                justify-content: center;
                                margin-bottom: 16px;">
                        
                        <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="../postmktpagi?cpage=<%=cpostpage-1%>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            
                            <%
                            for (int j = 0; j < npage; j++) {
                            %>
                            <li class="page-item"><a class="page-link <%=j==cpostpage?"active":""%>" href="../postmktpagi?cpage=<%=j%>"><%=j+1%></a></li>
                            <%
                                }
                            %>
                            <li class="page-item">
                                <a class="page-link" href="../postmktpagi?cpage=<%=cpostpage+1%>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                        
                    </div>
                    <!-- END PAGE -->
                                
                    </div>
                </div>
                <!-- END products -->
                
                
            </div>
        </div>

        
    </body>
</html>
