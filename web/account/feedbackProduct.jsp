<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

        <jsp:include page="../common/css.jsp" />

        <style>
            .star-rating button {
                background: none;
                border: none;
                padding: 0;
                font-size: 24px;
                color: #ffc107;
                cursor: pointer;
            }
            .star-rating button:hover {
                transform: scale(1.1);
                transition: transform 0.2s;
            }
        </style>
    </head>

    <body>

        <jsp:include page="../common/header.jsp" />
        <div class="container mt-5">
            <button class="btn btn-dark" onclick="goBack()">
                <i class="fa fa-arrow-left me-2"></i> Back
            </button>
        </div>
        <!-- Bắt đầu dự án của bạn ở đây -->
        <section style="margin: 50px 0" class="full-height">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-lg-10 col-xl-10">
                        <div class="card shadow-lg p-4">

                            <form method="POST" action="${pageContext.request.contextPath}/productfeedback" enctype="multipart/form-data">


                                <input type="hidden" name="oid" value="${oid}">
                                <input type="hidden" name="pid" value="${pid}">
                                <div class="mb-3">
                                    <p class="text-secondary text-center">Cảm nhận của bạn về sản phẩm ${product.product_name}</p>
                                </div>
                                <div class="mb-3 star-rating text-center">
                                    <button type="button" data-value="1"><i class="fa fa-star"></i></button>
                                    <button type="button" data-value="2"><i class="fa fa-star"></i></button>
                                    <button type="button" data-value="3"><i class="fa fa-star"></i></button>
                                    <button type="button" data-value="4"><i class="fa fa-star"></i></button>
                                    <button type="button" data-value="5"><i class="fa fa-star"></i></button>
                                </div>

                                <input type="hidden" name="rating" id="rating" value="${pf.rating}" >

                                <div class="mb-3">
                                    Ảnh:<br/>
                                    <input type="file" name="thumbnail">
                                </div>
                                <c:if test="${pf!=null}">
                                    
                                    <div class="mb-3" style="width: 150px;height: 100%">
                                        <img src="${pf.thumbnail}" alt="img"/>
                                    </div>
                                </c:if>
                                <div class="mb-3"> 
                                    Đánh giá:
                                    <textarea name="review" required="" class="form-control" rows="4" >${pf.review}</textarea>
                                </div>


                                <div class="modal-footer">
                                    <button type="submit" style="width: 100px" class="btn btn-dark">Lưu</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <
        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS với Popper.js -->

        <jsp:include page="../common/js.jsp" />
        
        
        <c:if test="${not empty sessionScope.feedbackMsg}">
            <script>
                alert('${sessionScope.feedbackMsg}');
            </script>
            <% session.removeAttribute("feedbackMsg"); %>
        </c:if>

        <script>
            function goBack() {
                window.location.href = '${pageContext.request.contextPath}/orderhistorydetail?orderId=${oid}';
            }

            // Get the stored rating from the hidden input field
            const storedRating = parseInt(document.getElementById('rating').value) || 0;

// Function to update star colors based on a rating value
            function updateStars(rating) {
                const stars = document.querySelectorAll('.star-rating button i');
                stars.forEach((star, index) => {
                    star.style.color = index < rating ? '#ffc107' : '#dee2e6';
                });
            }

// Initial load: Set stars based on stored rating
            updateStars(storedRating);

// Handle star clicks to update the rating dynamically
            document.querySelectorAll('.star-rating button').forEach((button, index) => {
                button.addEventListener('click', () => {
                    const ratingValue = index + 1;
                    document.getElementById('rating').value = ratingValue; // Set new rating in hidden input
                    updateStars(ratingValue); // Update the star colors
                });
            });

        </script>
    </script>

</body>

</html>
