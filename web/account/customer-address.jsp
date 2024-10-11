
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../common/css.jsp" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {

                loadProvinces();

                $('#province').change(function () {
                    var provinceId = $(this).val();
                    if (provinceId) {
                        loadDistricts(provinceId);
                    } else {
                        $('#district').html('<option value="">Select District</option>');
                        $('#ward').html('<option value="">Select Ward</option>');
                    }
                });


                $('#district').change(function () {
                    var districtId = $(this).val();
                    if (districtId) {
                        loadWards(districtId);
                    } else {
                        $('#ward').html('<option value="">Select Ward</option>');
                    }
                });


                function loadProvinces() {
                    $.get("location?action=getProvinces",
                            function (data) {
                                $('#province').html(data);
                                $('#district').html('<option value="">Select District</option>');
                                $('#ward').html('<option value="">Select Ward</option>');
                            });
                }


                function loadDistricts(provinceId) {
                    $.get("location?action=getDistricts&provinceId=" + provinceId,
                            function (data) {
                                $('#district').html(data);
                                $('#ward').html('<option value="">Select Ward</option>');
                            });
                }


                function loadWards(districtId) {
                    $.get("location?action=getWards&districtId=" + districtId,
                            function (data) {
                                $('#ward').html(data);
                            });
                }
            });
        </script>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />


        <div class="container-xl px-4 mt-4">

            <hr class="mt-0 mb-4">
            <div class="row "  style="margin-bottom: 40px">
                <jsp:include page="../account/profile-nav.jsp"/>
                <div class="col-lg-8">
                    <!-- Change password card-->
                    <div class="card mb-4">
                        <div class="card-header">Addresses</div>

                        <div class="card-body">


                            <!-- View Addresses -->

                            <div id="addressList" class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                                <!-- Sample addresses (these would be dynamically generated in a real application) -->
                                <div class="col-lg-12" style="margin: 20px 0">
                                    <button style="width: 60px" type="button" class="btn btn-sm btn-outline-primary me-2" data-bs-toggle="modal" data-bs-target="#addAddressModal">
                                        <span class="fa fa-plus"></span>
                                    </button>
                                </div>
                                <div class="col-lg-12" style="margin: 20px 0">
                                    <div class="card h-100">
                                        <div class="card-body">

                                            <p class="card-text">
                                            <div>Name: 123 Main St</div>
                                            <div>Phone: Apt 4B</div>
                                            <div>Address: New York, NY 10001</div>
                                            </p>
                                        </div>
                                        <div class="card-footer">
                                            <button style="width: 80px" class="btn btn-sm btn-outline-primary me-2"><span class="fa-pencil fa"></span></button>
                                            <button style="width: 80px"  class="btn btn-sm btn-outline-danger"><span class="fa-trash fa"></span></button>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>

            </div>

        </div>
        <!-- Add New Address Modal -->
        <div class="modal fade" id="addAddressModal" tabindex="-1" aria-labelledby="addAddressModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addAddressModalLabel">Add New Address</h5>
                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addressForm">

                            <div class="mb-3">
                                <label for="receiver_name" class="form-label">Receiver Name:</label>
                                <input type="text" class="form-control" id="receiver_name" name="receiver_name" maxlength="255">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone:</label>
                                <input type="tel" class="form-control" id="phone" name="phone" maxlength="20">
                            </div>

                            <div class="mb-3">
                                <label for="province" class="form-label">Province:</label>
                                <select class="form-control" id="province" name="province" required>
                                    <option value="">Select a province</option>

                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="district" class="form-label">District:</label>
                                <select class="form-control" id="district" name="district" required>
                                    <option value="">Select a district</option>

                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="ward" class="form-label">Ward:</label>
                                <select class="form-control" id="ward" name="ward" required>
                                    <option value="">Select a ward</option>

                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="address" class="form-label">Address:</label>
                                <textarea class="form-control" id="address" name="address" maxlength="2000" rows="3"></textarea>
                            </div>


                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="is_default" name="is_default" value="1">
                                <label class="form-check-label" for="is_default">Is Default</label>
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" >Add Address</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>






        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->





        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
