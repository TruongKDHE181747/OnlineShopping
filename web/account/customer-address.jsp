
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../common/css.jsp" />


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

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


            });
            function loadProvinces() {
                $.get("location?action=getProvinces", function (data) {
                    $('#province').html(data);
                    $('#district').html('<option value="">Select District</option>');
                    $('#ward').html('<option value="">Select Ward</option>');
                }).fail(function () {
                    $('#province').html('<option value="">Fail to load data</option>');
                    $('#district').html('<option value="">Fail to load data</option>');
                    $('#ward').html('<option value="">Fail to load data</option>');
                });
            }
            ;

            function loadDistricts(provinceId) {
                $.get("location?action=getDistricts&provinceId=" + provinceId, function (data) {
                    $('#district').html(data);
                    $('#ward').html('<option value="">Select Ward</option>');
                }).fail(function () {
                    $('#district').html('<option value="">Fail to load data</option>');
                    $('#ward').html('<option value="">Fail to load data</option>');
                });

            }
            ;

            function loadWards(districtId) {
                $.get("location?action=getWards&districtId=" + districtId, function (data) {
                    $('#ward').html(data);
                }).fail(function () {
                    $('#ward').html('<option value="">Fail to load data</option>');
                });
            }
            ;


        </script>


    </head>
    <body>
        <jsp:include page="../common/header.jsp" />


        <div class="container-xl px-4 mt-4" >

            <hr class="mt-0 mb-4">
            <div class="row "  style="margin-bottom: 40px">
                <jsp:include page="../account/profile-nav.jsp"/>
                <div class="col-lg-8">
                    <!-- Change password card-->
                    <div class="card mb-4">
                        <div class="card-header">Addresses</div>

                        <div class="card-body">
                            <!-- View Addresses -->
                            <div id="" class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                                <!-- Sample addresses (these would be dynamically generated in a real application) -->
                                <div class="col-lg-12" style="margin: 20px 0">
                                    <button style="width: 60px" type="button" onclick="openAddForm()" class="btn btn-sm btn-outline-primary me-2" >
                                        <span class="fa fa-plus"></span>
                                    </button>
                                </div>
                                <div class="col-lg-12" >
                                    <div class="">
                                        <c:forEach var="o" items="${addressList}">
                                            <div class="card" style="margin: 20px 0">
                                                <div class="card-body">
                                                    <c:if test="${o.is_default}">
                                                        <p class="text-success text-small">Default Address</p>
                                                    </c:if>
                                                    <p class="card-text">
                                                    <div>Name: ${o.receiver_name}</div>
                                                    <div>Phone: ${o.phone}</div>
                                                    <div>Address: ${o.address}, ${o.ward_name}, ${o.district_name}, ${o.province_name}</div>
                                                    </p>

                                                </div>
                                                <div class="card-footer">
                                                    <button style="width: 80px" class="btn btn-sm btn-outline-primary me-2"

                                                            onclick="openUpdateForm('${o.customer_addresses_id}'
                                                                            , '${o.receiver_name}'
                                                                            , '${o.phone}'
                                                                            , '${o.province_id}'
                                                                            , '${o.province_name}'
                                                                            , '${o.district_id}'
                                                                            , '${o.district_name}'
                                                                            , '${o.ward_code}'
                                                                            , '${o.ward_name}'
                                                                            , '${o.address}'
                                                                            , ${o.is_default})"


                                                            ><span class="fa-pencil fa"></span></button>


                                                    <c:if test="${!o.is_default}">
                                                        <button style="width: 80px" onclick="confirmDelete(${o.customer_addresses_id})" class="btn btn-sm btn-outline-danger"><span class="fa-trash fa"></span></button>
                                                        <button style="width: fit-content" onclick="window.location.href = 'setDefaultAddress?addressId=${o.customer_addresses_id}'" class="btn btn-sm btn-outline-success">Set to default</button>
                                                        </c:if>
                                                </div>
                                            </div>
                                        </c:forEach>


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
                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
                    </div>
                    <div class="modal-body">
                        <form id="addressForm" action="addAddress" method="POST">

                            <div class="mb-3">
                                <label for="receiver_name" class="form-label">Receiver Name:</label>
                                <input type="text" class="form-control" id="receiver_name" name="receiver_name" maxlength="255" required="">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone:</label>
                                <input type="tel" pattern="\d{10}" title="Phone number must be exactly 10 digits" class="form-control" id="phone" name="phone" maxlength="20" required="">
                            </div>

                            <div class="mb-3">
                                <label for="province" class="form-label">Province:</label>
                                <select class="form-control" id="province" name="province" required>


                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="district" class="form-label">District:</label>
                                <select class="form-control" id="district" name="district" required>


                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="ward" class="form-label">Ward:</label>
                                <select class="form-control" id="ward" name="ward" required>


                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="address" class="form-label">Address:</label>
                                <textarea class="form-control" id="address" name="address" maxlength="2000" rows="3" required=""></textarea>
                            </div>


                            <div class="mb-3 form-check" id="default-address">

                                <input type="checkbox" class="form-check-input" id="is_default" name="is_default" value="On">
                                <label class="form-check-label" for="is_default">Is Default</label>
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" id='submitButton' >Add Address</button>
                            </div>

                            <input type="hidden" id="addressId" name="addressId">
                        </form>
                    </div>

                </div>
            </div>
        </div>







        <jsp:include page="../common/footer.jsp" />
        <!-- Bootstrap JS with Popper.js -->

        <script>
            function confirmDelete(addressId) {
                if (confirm("Are you sure you want to delete this address?")) {
                    window.location.href = 'deleteAddress?addressId=' + addressId;
                }
            }
            ;


            function openAddForm() {
                $('#addAddressModalLabel').text('Add New Address');
                $('#addressForm').attr('action', 'addAddress');
                $('#addressId').val('');
                $('#submitButton').text('Add Address');
                $('#receiver_name').val('');
                $('#phone').val('');
                $('#province').val('');
                $('#district').val('');
                $('#ward').val('');
                loadProvinces();
                $('#address').val('');
                $('#is_default').prop('checked', false);
                var myModal = new bootstrap.Modal(document.getElementById('addAddressModal'));
                myModal.show();
            }
            ;

            function openUpdateForm(addressId, receiverName, phone, provinceId, provinceName
                    , districtId, districtName, wardCode, wardName, address, isDefault) {

                $('#addAddressModalLabel').text('Update Address');
                $('#addressForm').attr('action', 'updateAddress');
                $('#addressId').val(addressId);
                $('#submitButton').text('Update Address');

                $('#receiver_name').val(receiverName);
                $('#phone').val(phone);

                $('#province').val(provinceId + '#' + provinceName);
                loadDistricts(provinceId);
                setTimeout(function () {
                    $('#district').val(districtId + '#' + districtName);
                    loadWards(districtId);
                }, 300);

                setTimeout(function () {
                    $('#ward').val(wardCode + '#' + wardName);
                }, 600);

                $('#address').val(address);


                if (isDefault) {
                    $('#default-address').hide();
                } else {
                    $('#default-address').show();
                }
                var myModal = new bootstrap.Modal(document.getElementById('addAddressModal'));
                myModal.show();
            }
            ;


        </script>

        <script src="${pageContext.request.contextPath}/common/js/jquery.nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/jquery.nicescroll.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/jquery.countdown.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/jquery.slicknav.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/mixitup.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/js/owl.carousel.min.js"></script>


    </body>
</html>
