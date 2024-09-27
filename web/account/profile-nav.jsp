<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="col-xl-4">
    <!-- Profile picture card-->
    <div class="card mb-4 mb-xl-0">
        <div class="card-header">Profile Picture</div>
        <div class="card-body text-center">
            <!-- Profile picture image-->
            <img style=" height: 10rem; width: 10rem" class="img-account-profile rounded-circle mb-2" 
                 src="<c:if test="${account.profile_picture_url == null}">${pageContext.request.contextPath}/profile_img/default.jpg</c:if>
                 <c:if test="${account.profile_picture_url != null}">${account.profile_picture_url}</c:if>"
                     alt="">


                 <!-- Profile picture upload button-->
                 <form action="./uploadProfileImage" method="post" enctype="multipart/form-data">
                     <input style="margin-left: 40px;"  type="file" name="profileImage" accept="image/*">                                 
                     <button class="btn btn-primary mt-2" type="submit">Upload new image</button>
                 </form>
            </div>
        </div>
    <%
        String currentPage = request.getRequestURI();
    %>
    <div class="card mb-4 mb-xl-0" style="margin-top: 30px">
        <div class="card-body">
            <div class="card-body">
                <nav class="nav flex-column nav-pills nav-gap-y-1">
                    <a href="./profile" class="nav-item nav-link has-icon nav-link-faded <%= currentPage.contains("profile")? "active":"" %>">
                        Account Details
                    </a>
                    <a href="./changePassword"  class="nav-item nav-link has-icon nav-link-faded <%= currentPage.contains("changePassword")? "active":"" %>">
                        Security
                    </a>
                    <a href="#"  class="nav-item nav-link has-icon nav-link-faded">
                        Order History
                    </a>
                    <a href="#" class="nav-item nav-link has-icon nav-link-faded">
                        Address
                    </a>
                </nav>
            </div>
        </div>
    </div>

</div>