<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

        <%@include file="../common/css.jsp" %>
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
        <%@include file="../common/header.jsp" %>
        <div style="margin: 50px auto" class="container text-center mt-5">
            <h2 style="margin: 30px 0">Enter 6-Digit OTP</h2>
            <c:if test="${error != null}">
                <div style="width: 350px; margin: 10px auto" class="alert alert-danger">
                    ${error}
                </div>
            </c:if>
            <form action="verify" method="POST" id="otpForm" style="margin: 50px 0;height: 200px">
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

                <a style="width: 150px" class="btn btn-primary mt-4" href="verify?userId=${requestScope.userId}">Resend OTP</a>

                <button style="width: 150px" type="submit" class="btn btn-primary mt-4">Verify</button>

            </form>
        </div>

        <%@include file="../common/footer.jsp" %>
        <!-- Bootstrap JS with Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
        <%@include file="../common/js.jsp" %>
        
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
                // Make an AJAX request to resend the OTP
                fetch('resendOtp?userId=' + userId)
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert('OTP resent successfully!');
                            } else {
                                alert('Failed to resend OTP. Please try again.');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('An error occurred. Please try again later.');
                        });
            });
        </script>
    </body>
</html>
