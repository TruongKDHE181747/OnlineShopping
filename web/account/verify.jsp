<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>OTP Input</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <div class="container text-center mt-5">
            <h2>Enter 6-Digit OTP</h2>
            <c:if test="${error != null}">
                <div class="alert alert-danger" >
                    ${error}
                </div>
            </c:if>
            <form action="verify" method="POST" id="otpForm">
                <div class="d-flex justify-content-center">
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                    <input type="text" class="form-control otp-input" maxlength="1" required>
                </div>
                <input type="hidden" name="otp" id="otpHiddenInput">
                <button type="submit" class="btn btn-primary mt-4">Submit</button>
            </form>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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
                    otpValue += input.value;  // Combine the values of all inputs
                });

                document.getElementById('otpHiddenInput').value = otpValue;  // Set the hidden input with the combined value
            });

        </script>
    </body>
</html>
