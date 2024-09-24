<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form với Slider</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }

        .container {
            background-color: #fff;
            padding: 30px; /* Tăng padding */
            border-radius: 12px; /* Tăng độ bo tròn */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); /* Tăng độ bóng */
            width: 500px; /* Tăng chiều rộng */
        }

        h1 {
            text-align: center;
            margin-bottom: 20px; /* Tăng khoảng cách dưới tiêu đề */
        }

        .form-group {
            margin-bottom: 20px; /* Tăng khoảng cách giữa các nhóm trường */
        }

        label {
            display: block;
            margin-bottom: 10px; /* Tăng khoảng cách dưới nhãn */
            font-size: 18px; /* Tăng kích thước chữ của nhãn */
        }

        textarea {
            width: 100%;
            padding: 12px; /* Tăng padding */
            border: 1px solid #ddd;
            border-radius: 6px; /* Tăng độ bo tròn */
            font-size: 16px; /* Tăng kích thước chữ trong textarea */
            box-sizing: border-box;
        }

        input[type="file"] {
            display: block;
            margin-top: 10px; /* Thêm khoảng cách trên */
        }

        .slider-container {
            display: flex;
            align-items: center;
        }

        input[type="range"] {
            flex: 1;
            margin-right: 15px; /* Tăng khoảng cách bên phải của thanh trượt */
            height: 10px; /* Tăng chiều cao của thanh trượt */
        }

        #status-label {
            font-size: 18px; /* Tăng kích thước chữ của nhãn trạng thái */
        }

        button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 15px 20px; /* Tăng padding của nút */
            border-radius: 6px; /* Tăng độ bo tròn của nút */
            cursor: pointer;
            font-size: 18px; /* Tăng kích thước chữ của nút */
            width: 100%; /* Đặt chiều rộng nút bằng với chiều rộng của khối chứa */
            box-sizing: border-box;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add setting list</h1>
        <form action="../addsettinglist" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Name</label>
                <input id="name" name="name" type="text" > <!-- Tăng kích thước textarea -->
            </div>
            <div class="form-group">
                <label for="classification">Classification:</label>
                        <select id="classification" name="classification">
                          <option value="product">Product</option>
                          <option value="post">Post</option>
                          
                        </select>
            </div>
            <div class="form-group">
                <label>Status</label>
                <div class="slider-container">
                    <input type="radio" name="status" value="1">Show
                    <input type="radio" name="status" value="0">Hidden
                 
                </div>
            </div>
            <button type="submit">Gửi</button>
        </form>
    </div>
   
</body>
</html>
