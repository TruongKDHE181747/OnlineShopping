<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add setting</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .form-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
                box-sizing: border-box; /* Quan trọng để padding không ảnh hưởng đến kích thước tổng */
            }

        input[type="radio"] {
            margin-right: 10px;
        }
        .form-group.radio-group {
            display: flex;
            justify-content: space-between;
        }
        .form-group.radio-group label {
            font-weight: normal;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <button>
            <a href="../settinglist">
            <i class="fas fa-arrow-left"></i> Back</a>
        </button>
        <h1>Add setting</h1>
        <form action="../addsettinglist" enctype="multipart/form-data">
            <!-- Name field -->
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <!-- Classification select -->
            <div class="form-group">
                <label for="classification">Classification:</label>
                        <select id="classification" name="classification">
                          <option value="product">Product</option>
                          <option value="post">Post</option>
                          
                        </select>
            </div>

            <!-- Status radio buttons -->
            <div class="form-group radio-group">
                <label>Status</label>
                
                <label><input type="radio" name="status" value="1">Show</label>
                <label><input type="radio" name="status" value="0">Hidden</label>
                 
                
            </div>

            <input type="submit" value="Thêm">
        </form>
    </div>

</body>
</html>
