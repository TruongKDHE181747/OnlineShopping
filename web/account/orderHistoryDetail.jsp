<%-- 
    Document   : orderHistoryDetail
    Created on : Oct 25, 2024, 1:36:00 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <jsp:include page="../common/css.jsp" />
        
        <style>
            body {
                background-color: #f8f9fa;
            }
            .card {
                border: none;
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            }
            .card-header {
                background-color: #f8f9fa;
                border-bottom: 1px solid #e9ecef;
            }
            .badge-success {
                background-color: #28a745;
            }
            .badge-pink {
                background-color: #fce4ec;
                color: #d81b60;
            }
            .table-gray {
                background-color: lightgrey;
            }
            .btn-outline-primary {
                color: #007bff;
                border-color: #007bff;
            }
            .btn-outline-primary:hover {
                background-color: #007bff;
                color: white;
            }
            .card-header{
                background: black;
                
            }
        </style>
    </head>
    <body>
        <%@include file="../common/header.jsp" %>
        
        
        <div class="container mt-5">
            <h2 class="mb-4">Chi tiết đơn hàng</h2>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0 text-white">Thông tin đơn hàng</h5>
                        </div>
                        <div class="card-body">
                            <p><strong>Mã đơn hàng:</strong> 19bec560-c816-474b-ae6a-248da4d41be8</p>
                            <p><strong>Ngày đặt hàng:</strong> 16:10 20/07/2024</p>
                            <p><strong>Ghi chú:</strong> <span class="text-muted">Không có</span></p>
                            <p><strong>Phương thức thanh toán:</strong> Thanh toán bằng tiền mặt</p>
                            <p><strong>Tổng tiền:</strong> <span class="badge badge-pink">120.001₫</span></p>
                            <p><strong>Trạng thái:</strong> <span class="badge badge-success">Thành công</span></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0 text-white">Thông tin khách hàng</h5>
                        </div>
                        <div class="card-body">
                            <p><strong>Người nhận:</strong> Khang</p>
                            <p><strong>Số điện thoại:</strong> 0777777777</p>
                            <p><strong>Email:</strong> khanghtse183192@fpt.edu.vn</p>
                            <p><strong>Địa chỉ:</strong> 381/61 Hoang Van Thu, Phuong 2, Quan Tan Binh, Ho Chi Minh</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mt-4">
                <div class="card-header">
                    <h5 class="mb-0 text-white">Sản phẩm</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="table-gray">
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                    <th>Tổng tiền</th>
                                    <th>Đánh giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <img src="/placeholder.svg?height=50&width=50" alt="Sản phẩm" class="img-thumbnail me-2" style="width: 50px;">
                                        Tên sản phẩm8.993195287456396
                                    </td>
                                    <td>1</td>
                                    <td>10.000₫</td>
                                    <td>10.000₫</td>
                                    <td><a href="#" class="btn btn-sm btn-outline-primary">Xem đánh giá</a></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="3" class="text-end"><strong>Tạm tính</strong></td>
                                    <td colspan="2">10.000₫</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-end"><strong>Sử dụng voucher</strong></td>
                                    <td colspan="2" class="text-danger">-0₫</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-end"><strong>Sử dụng xu</strong></td>
                                    <td colspan="2" class="text-danger">-0₫</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->

        <jsp:include page="../common/js.jsp" />
        
    </body>
</html>