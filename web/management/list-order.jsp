<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order"%>
<%@page import="model.PaymentStatus"%>
<%@page import="dal.PaymentStatusDAO"%>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý đơn hàng</title>
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
                background-color: red;
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
                width: 25%;
            }

            .product-img img{
                width: 60%;
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
        </style>
    </head>
    <body>
        <div class="row">
            <jsp:include page="../common/header.jsp" />
            <!-- START menu -->
            <jsp:include page="marketing_header.jsp"/>
            <!-- END menu -->

            <div class="col-md-10" style="padding: 40px;">

                <div class="product">
                    <div class="container products" >
                        <div>
                            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                                <div class="container-fluid">
                                    <h5 class="navbar-brand" href="#">Quản lý đơn hàng</h5>

                                    <div class="" id="navbarSupportedContent">
                                        <form class="d-flex" role="search" action="../searchorder" method="get">
                                            <input placeholder="Tìm kiếm đơn hàng theo tên khách hàng" name="search" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                            <button class="btn btn-outline-success" type="submit">Search</button>
                                        </form>
                                    </div>
                                </div>
                            </nav>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Ngày đặt hàng</th>
                                    <th scope="col">Tên người nhận</th>
                                    <th scope="col">Tổng giá tiền(₫)</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>


                                <!-- START Order item -->
                                <%
                                    List<Order> oList = (ArrayList<Order>) session.getAttribute("order_list");
                                    PaymentStatusDAO psdao = new PaymentStatusDAO();
                                    int i = 1;
                                    
                                    for (Order o : oList) {
                                        PaymentStatus ps = psdao.getPaymentStatusById(o.getPaymentStatusId());
                                %>
                                <tr>

                                    <td><%= i%></td>

                                    <td><%= o.getOrderedDate()%></td>

                                    <td><%= o.getReceiverName()%></td>

                                    <td><%= o.getTotalPrice()%></td>

                                    <td><%= ps.getPaymentStatusName()%></td>

                                    <td>
                                        <div class="edit" style="background-color: greenyellow">
                                            <a href="../vieworderdetails?oid=<%= o.getOrderId()%>&button=view"><i style="color: black;" class="bi bi-eye-fill"></i></a>
                                        </div>
                                    </td>
                                    <%
                                        i++;
                                        }
                                    %>

                                </tr>
                                <!-- END Order item -->

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
