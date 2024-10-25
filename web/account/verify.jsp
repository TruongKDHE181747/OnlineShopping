<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

        <jsp:include page="../common/css.jsp" />
        
        <link rel="stylesheet" href="./account/css/registerstyle.css"/>
        <style>
            .otp-input {
                width: 50px;
                height: 50px;
                font-size: 24px;
                text-align: center;
                margin: 0 5px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <div style="margin: 50px auto" class="container text-center mt-5">
            <h2 style="margin: 30px 0">Nhập OTP 6 chữ số</h2>
            <c:if test="${error != null}">
                <div style="width: 350px; margin: 10px auto" class="alert alert-danger">
                    ${error}
                </div>
            </c:if>
            <form action="./verify" method="POST" id="otpForm" style="margin: 50px 0;height: 200px">
                <div class="d-flex justify-content-center">
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                </div>
                <input type="hidden" name="otp" id="otpHiddenInput">
                <input type="hidden" name="userId" value="${requestScope.userId}">

                <a style="width: 150px" class="btn btn-primary mt-4" href="verify?userId=${requestScope.userId}">Gửi lại OTP</a>

                <button style="width: 150px" type="submit" class="btn btn-primary mt-4">Xác thực</button>

            </form>
        </div>

        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS với Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
        <jsp:include page="../common/js.jsp" />
        
        <script>
            const otpInputs = document.querySelectorAll('.otp-input');
            otpInputs.forEach((input, index) => {
                input.addEventListener('keyup', function (event) {
                    if (event.key >= 0 && event.key <= 9) {
                        if (index < otpInputs.length - 1) {
                            otpInputs[index + 1].focus();
                        }
                    } else if (event.key === 'Backspace') {
                        if (index > 0) {
                            otpInputs[index - 1].focus();
                        }
                    }
                });
            });

            document.getElementById('otpForm').addEventListener('submit', function (event) {
                const otpInputs = document.querySelectorAll('.otp-input');
                let otpValue = '';
                otpInputs.forEach(input => {
                    otpValue += input.value;
                });
                document.getElementById('otpHiddenInput').value = otpValue;
            });

            document.getElementById('resendOtpButton').addEventListener('click', function () {
                const userId = document.querySelector('input[name="userId"]').value;
                // Gửi yêu cầu AJAX để gửi lại OTP
                fetch('resendOtp?userId=' + userId)
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert('Gửi lại OTP thành công!');
                            } else {
                                alert('Gửi lại OTP không thành công. Vui lòng thử lại.');
                            }
                        })
                        .catch(error => {
                            console.error('Lỗi:', error);
                            alert('Đã xảy ra lỗi. Vui lòng thử lại sau.');
                        });
            });
        </script>
    </body>
</html>
