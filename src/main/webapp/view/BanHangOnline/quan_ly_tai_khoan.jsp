<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MS - Store</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="/view_ban_hang/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/view_ban_hang/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/view_ban_hang/css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <%--    Thêm thư viện SweetAlert2 để thiển thị thông báo--%>
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        .nav-link {
            border: none !important;
            outline: none !important;
            box-shadow: none !important;
        }

        .nav-link:focus, .nav-link:active {
            outline: none !important;
            box-shadow: none !important;
        }
    </style>

    <style>

        .profile-menu {
            width: 250px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .profile-pic {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .username {
            font-size: 18px;
            font-weight: bold;
        }

        .menu-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu-item {
            margin-bottom: 10px;
        }

        .menu-item > a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .menu-item > a:hover {
            background-color: #f0f0f0;
        }

        .submenu-list {
            list-style: none;
            padding-left: 20px;
            display: none;
        }

        .submenu-list.show {
            display: block;
        }

        .submenu-item > a {
            text-decoration: none;
            color: #555;
            font-size: 14px;
            display: block;
            padding: 5px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .submenu-item > a:hover {
            background-color: #f0f0f0;
        }
    </style>

    <style>
        .userCart {
            display: flex;
            align-items: center;
            justify-content: end;
        }

        .dropdown ul li:hover {
            text-decoration: underline;
        }

        .dropdown-menu {
            display: none;
        }

        .totalQuantityCart {
            width: 15px;
            height: 15px;
            background: #db2121;
            display: block;
            text-align: center;
            line-height: 14px;
            border-radius: 100%;
            color: #fff;
            font-weight: 700;
            font-size: 11px;
            padding: 0 2px;
            position: absolute;
            top: 3px;
            right: 17px;
            margin: 0;
            min-width: 0;
        }
    </style>

    <style>
        .search-box {
            position: relative;
            width: 300px;
            margin: 50px auto;
        }

        .search-box input[type="text"] {
            width: 100%;
            padding: 10px 40px 10px 20px;
            border: 2px solid #ccc;
            border-radius: 25px;
            font-size: 16px;
            outline: none;
        }

        .search-box button {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            background: none;
            border: none;
            outline: none;
            cursor: pointer;
        }

        .search-box button img {
            width: 20px;
            height: 20px;
        }
    </style>
</head>

<body>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span
                        class="text-primary font-weight-bold border px-3 mr-1">MS</span>Store</h1>
            </a>
        </div>
        <div class="col-lg-6 col-6 text-left">

        </div>
        <div class="col-lg-3 col-6 text-right userCart">
            <div class="dropdown" onmouseover="showDropdown()" onmouseout="hideDropdown()">
                <button class="btn btn-light bg-light" style="font-size: 19px; margin-right: 3px"
                        type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <!-- Hiển thị tên và hình ảnh người dùng nếu đã đăng nhập -->
                            <span class="info-text" style="font-size: 14px">${sessionScope.user.taiKhoan}</span>
                            <c:if test="${sessionScope.user.anhDaiDien != null}">
                                <img src="/image/${sessionScope.user.anhDaiDien}" alt=""
                                     style="width: 30px; height: 30px; border-radius: 50%; margin-left: 5px;">
                            </c:if>
                            <c:if test="${sessionScope.user.anhDaiDien == null}">
                                <i class="bi bi-person-circle" style="color:#D19C97; margin: 5px"></i>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <!-- Hiển thị biểu tượng mặc định nếu chưa đăng nhập -->
                            <i class="bi bi-person-circle" style="color:#D19C97; margin: 5px"></i>
                        </c:otherwise>
                    </c:choose>
                </button>
                <ul class="dropdown-menu btn border" aria-labelledby="dropdownMenuButton1" id="dropdownContent">
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <!-- Hiển thị nút đăng nhập khi chưa đăng nhập -->
                            <li><a class="dropdown-item text-center" href="#">
                                <button class="btn btn-primary w-100 px-5" data-toggle="modal"
                                        data-target="#loginModal">Đăng nhập
                                </button>
                            </a></li>

                            <li><a class="dropdown-item text-center mt-3 " href="#">
                                <button class="btn btn-primary w-100 px-5" data-toggle="modal"
                                        data-target="#registerModal">Đăng ký
                                </button>
                            </a></li>
                        </c:when>
                        <c:otherwise>
                            <!-- Hiển thị nút đăng xuất khi đã đăng nhập -->
                            <li><a class="dropdown-item" href="/cua-hang/don-mua">Đơn mua</a></li>
                            <li><a class="dropdown-item" href="/cua-hang/quan-ly-tai-khoan">Tài Khoản Của Tôi</a></li>
                            <li><a class="dropdown-item" href="/cua-hang/logout">Đăng xuất</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <div class="col-lg-3 col-6 text-right" style="position: relative">
                <a href="/cua-hang/gio-hang" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <c:if test="${soLuongGioHang > 0}">
                    <span class="totalQuantityCart"
                          style="display: flex; justify-content: center; align-items: center">${soLuongGioHang}</span>
                    </c:if>
                    <c:if test="${soLuongGioHang == null}">
                    <span class="totalQuantityCart"
                          style="display: flex; justify-content: center; align-items: center">0</span>
                    </c:if>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Topbar End -->

<!-- Login Modal Start  (Modal Form đăng nhập)-->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true"
     data-backdrop="true" data-keyboard="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-center text-info w-100">Login</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="login-form-wrapper">
                    <form id="login-form" class="form" action="login" method="post" modelAttribute="khachHangDTO">
                        <div class="form-group">
                            <label for="taiKhoan" class="text-info">Username:</label><br>
                            <input placeholder="Username" type="text" id="taiKhoan" name="taiKhoan"
                                   value="${khachHangDTO.taiKhoan}" class="form-control">
                            <small id="taiKhoanError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <label for="matKhau" class="text-info">Password:</label><br>
                            <input placeholder="Password" type="password" id="matKhau" name="matKhau"
                                   value="${khachHangDTO.matKhau}" class="form-control">
                            <small id="matKhauError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" class="btn btn-info btn-md w-100" value="Submit">
                        </div>
                        <div id="register-link" class="text-right">
                            <a href="#" class="text-info " data-toggle="modal" data-target="#registerModal"
                               data-dismiss="modal">Register here</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Login Modal End -->

<!-- Registration Modal Start (Modal Form đăng ký) -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel"
     aria-hidden="true"
     data-backdrop="true" data-keyboard="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-center text-info w-100">Register</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="register-form-wrapper">
                    <form id="register-form" class="form" action="register" method="post" modelAttribute="khachHangDTO">
                        <div class="form-group">
                            <label for="registerUsername" class="text-info">Username:</label><br>
                            <input placeholder="Username" type="text" id="registerUsername" name="taiKhoan"
                                   class="form-control" value="${khachHangDTO.taiKhoan}">
                            <small id="registerUsernameError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <label for="registerEmail" class="text-info">Email:</label><br>
                            <input placeholder="Email" type="text" id="registerEmail" name="email"
                                   class="form-control" value="${khachHangDTO.email}">
                            <small id="registerEmailError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <label for="registerPhone" class="text-info">Phone:</label><br>
                            <input placeholder="Phone" type="text" id="registerPhone" name="sdt"
                                   class="form-control" value="${khachHangDTO.sdt}">
                            <small id="registerPhoneError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <label for="registerPassword" class="text-info">Password:</label><br>
                            <input placeholder="Password" type="password" id="registerPassword" name="matKhau"
                                   class="form-control" value="${khachHangDTO.matKhau}">
                            <small id="registerPasswordError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" class="btn btn-info btn-md w-100" value="Register">
                        </div>
                        <div id="login-link" class="text-right">
                            <a href="#" class="text-info " data-toggle="modal" data-target="#loginModal"
                               data-dismiss="modal">Back to Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Registration Modal End -->

<!-- Navbar Start -->
<div class="container-fluid">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
               data-toggle="collapse" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                <h6 class="m-0 text-light">Trải nghiệm mua sắm chất lượng</h6>
            </a>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span
                            class="text-primary font-weight-bold border px-3 mr-1">MS</span>Store</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/cua-hang/trang-chu" class="nav-item nav-link active">Trang chủ</a>
                        <a href="/cua-hang/gioi-thieu" class="nav-item nav-link">Giới thiệu</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->


<%--        Body Giao diện quản lý hồ sơ cá nhân--%>
<div class="container-fluid">
    <div class="row">
        <div class="col-1"></div>
        <div class="col-3">
            <div class="profile-menu" style="position: relative; top: 41px;">
                <div class="profile-header">
                    <img src="/image/${sessionScope.user.anhDaiDien}" alt="Profile Picture" class="profile-pic">
                    <span class="username">${sessionScope.user.taiKhoan}</span>
                </div>
                <ul class="menu-list">
                    <li class="menu-item">
                        <a href="#">Tài Khoản Của Tôi <i class="bi bi-chevron-down"></i></a>
                        <ul class="submenu-list">
                            <li class="submenu-item"><a href="/cua-hang/quan-ly-tai-khoan">Hồ Sơ</a></li>
                            <li class="submenu-item"><a href="/cua-hang/dia-chi">Địa Chỉ</a></li>
                        </ul>
                    </li>
                    <li class="menu-item"><a href="/cua-hang/don-mua">Đơn Mua</a></li>
                </ul>
            </div>
        </div>
        <div class="col-7" style="box-shadow: 3px 8px 38px -13px;">
            <div class="d-flex flex-column align-items justify-content-center" style="min-height: 150px">
                <h5 class="font-weight-semi-bold text-uppercase mb-3">Thông tin tài khoản</h5>
            </div>
            <form:form action="/cua-hang/cap-nhat-thong-tin" method="post" modelAttribute="user"
                       enctype="multipart/form-data"
                       id="updateProfileForm">
                <div class="row">
                    <!-- Thông tin cá nhân -->
                    <div class="col-md-4">
                        <div class="mb-2">
                            <label for="username" class="form-label"><b>Tên đăng nhập:</b></label>
                            <form:input readonly="true" path="taiKhoan" id="username" placeholder="Tên đăng nhập"
                                        cssClass="form-control"/>
                            <div class="text-danger" id="usernameError"></div>
                        </div>
                        <div class="mb-2">
                            <label for="fullName" class="form-label"><b>Họ và tên:</b></label>
                            <form:input path="hoTen" id="fullName" placeholder="Họ và tên" cssClass="form-control"/>
                            <div class="text-danger" id="fullNameError"></div>
                        </div>
                        <div class="mb-2">
                            <label for="email" class="form-label"><b>Email:</b></label>
                            <form:input path="email" type="email" id="email" placeholder="Email"
                                        cssClass="form-control"/>
                            <div class="text-danger" id="emailError"></div>
                        </div>
                        <div class="mb-2">
                            <label for="phone" class="form-label"><b>Số điện thoại:</b></label>
                            <form:input path="sdt" id="phone" placeholder="Số điện thoại" cssClass="form-control"/>
                            <div class="text-danger" id="phoneError"></div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-12 col-form-label"><b>Giới tính:</b></label>
                            <div class="col-sm-12">
                                <div class="form-check form-check-inline">
                                    <form:radiobutton path="gioiTinh" id="genderMale" value="1"
                                                      cssClass="form-check-input"/>
                                    <label class="form-check-label" for="genderMale">Nam</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <form:radiobutton path="gioiTinh" id="genderFemale" value="2"
                                                      cssClass="form-check-input"/>
                                    <label class="form-check-label" for="genderFemale">Nữ</label>
                                </div>
                                <div class="text-danger" id="genderError"></div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="dob" class="form-label"><b>Ngày sinh:</b></label>
                            <form:input path="ngaySinh" type="date" id="dob" cssClass="form-control"/>
                            <div class="text-danger" id="dobError"></div>
                        </div>
                    </div>
                    <!-- Hình ảnh -->
                    <div class="col-md-8 text-center">
                        <div class="profile-image-wrapper mb-3 d-flex justify-content-center align-items-center">
                            <label for="profileImage">
                                <img style="width: 150px; height: 150px;"
                                     src="/image/<c:out value="${user.anhDaiDien != null ? user.anhDaiDien : 'https://via.placeholder.com/100'}" />"
                                     alt="Profile Image" id="profileImagePreview" class="profile-image">
                            </label>
                        </div>
                        <input type="file" id="profileImage" name="profileImage" accept="image/*"
                               style="display: none;">
                        <label for="profileImage" class="btn btn-outline-secondary" style="color: black">Chọn
                            ảnh</label>
                        <div class="text-danger" id="profileImageError"></div>
                        <p class="info-text mt-3 p-0">Định dạng: jpg, png, jpeg</p>
                        <p class="info-text m-0 p-0">Dung lượng tối đa: 2MB.</p>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary w-25"
                        style="position: relative; left: 472px; bottom: 100px;">Lưu
                </button>
            </form:form>
        </div>
        <div class="col-1">
        </div>
    </div>
</div>


<!-- Footer Start -->
<%@ include file="/view/BanHangOnline/footer.jsp"%>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/view_ban_hang/lib/easing/easing.min.js"></script>
<script src="/view_ban_hang/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="/view_ban_hang/mail/jqBootstrapValidation.min.js"></script>
<script src="/view_ban_hang/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="/view_ban_hang/js/main.js"></script>

<%--Validate form--%>
<script>
    //Hiển thị thông báo
    const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.onmouseenter = Swal.stopTimer;
            toast.onmouseleave = Swal.resumeTimer;
        }
    });

    // Thông báo lỗi không tìm thấy người dùng
    <c:if test="${not empty errorMessage}">
    Toast.fire({
        icon: "error",
        title: "${errorMessage}"
    });
    </c:if>


    // Hiển thị thông báo cập nhật thông tin cá nhân thành công
    <c:if test="${not empty successAccount}">
    Toast.fire({
        icon: "success",
        title: "${successAccount}"
    });
    </c:if>


    function isValidFullName(fullName) {
        var regex = /^[a-zA-ZÀ-ỹ\s]+$/;
        return regex.test(fullName);
    }
    <%--Validate Form hồ sơ cá nhân--%>
    $(document).ready(function () {
        $('#updateProfileForm').submit(function (event) {
            event.preventDefault(); // Ngăn form submit mặc định

            var form = $(this);
            var fullName = $('#fullName').val().trim();
            var email = $('#email').val().trim();
            var phone = $('#phone').val().trim();
            var dob = $('#dob').val().trim();
            var gender = $('input[name="gioiTinh"]:checked').val();
            var profileImage = $('#profileImage')[0].files[0];

            var hasError = false;

            $('.text-danger').text('');
            $('.form-control').removeClass('border-danger');

            if (!fullName) {
                $('#fullNameError').text('Vui lòng nhập họ và tên.');
                $('#fullName').addClass('border-danger');
                hasError = true;
            } else if (fullName.length > 30) {
                $('#fullNameError').text('Họ và tên không được vượt quá 30 ký tự.');
                $('#fullName').addClass('border-danger');
                hasError = true;
            } else if (!isValidFullName(fullName)) {
                $('#fullNameError').text('Họ và tên không chứa số hoặc ký tự đặc biệt.');
                $('#fullName').addClass('border-danger');
                hasError = true;
            }

            if (!email) {
                $('#emailError').text('Vui lòng nhập email.');
                $('#email').addClass('border-danger');
                hasError = true;
            } else if (email.length > 40) {
                $('#emailError').text('Email không được vượt quá 40 ký tự.');
                $('#email').addClass('border-danger');
                hasError = true;
            } else if (!isValidEmail(email)) {
                $('#emailError').text('Email không hợp lệ.');
                $('#email').addClass('border-danger');
                hasError = true;
            }

            if (!phone) {
                $('#phoneError').text('Vui lòng nhập số điện thoại.');
                $('#phone').addClass('border-danger');
                hasError = true;
            } else if (!isValidVietnamesePhoneNumber(phone)) {
                $('#phoneError').text('Số điện thoại không hợp lệ.');
                $('#phone').addClass('border-danger');
                hasError = true;
            }

            if (!dob) {
                $('#dobError').text('Vui lòng nhập ngày sinh.');
                $('#dob').addClass('border-danger');
                hasError = true;
            } else if (!isValidDOB(dob)) {
                $('#dobError').text('Ngày sinh không hợp lệ.');
                $('#dob').addClass('border-danger');
                hasError = true;
            }

            if (!gender) {
                $('#genderError').text('Vui lòng chọn giới tính.');
                hasError = true;
            }

            if (profileImage) {
                var allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
                if (!allowedExtensions.exec(profileImage.name)) {
                    $('#profileImageError').text('Định dạng ảnh không hợp lệ.');
                    hasError = true;
                } else if (profileImage.size > 2097152) {
                    $('#profileImageError').text('Dung lượng ảnh tối đa là 2MB.');
                    hasError = true;
                }
            }

            if (!hasError) {
                form.unbind('submit').submit(); // Allow form submission
            }
        });

        // Ẩn lỗi khi người dùng click vào trường input
        $('input').focus(function () {
            $(this).siblings('.text-danger').text('');
            $(this).removeClass('border-danger');
        });

        // Hàm kiểm tra định dạng họ tên
        function isValidFullName(fullName) {
            var regex = /^[a-zA-ZÀ-ỹ\s]+$/;
            return regex.test(fullName);
        }

        // Hàm kiểm tra định dạng email
        function isValidEmail(email) {
            var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return regex.test(email);
        }

        // Hàm kiểm tra định dạng số điện thoại
        function isValidVietnamesePhoneNumber(phoneNumber) {
            var regex = /^(0|\+84)\d{9,10}$/;
            return regex.test(phoneNumber);
        }

        // Hàm kiểm tra ngày sinh không ở trong tương lai
        function isValidDOB(dob) {
            var dobDate = new Date(dob);
            var today = new Date();
            return dobDate <= today;
        }
    });




    // Hàm hiển thị hình ảnh khi chọn ảnh ở trang tài khoản của tôi
    function previewImage() {
        const fileInput = document.getElementById('profileImage');
        const imagePreview = document.getElementById('profileImagePreview');

        fileInput.addEventListener('change', function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();

                reader.addEventListener('load', function () {
                    imagePreview.setAttribute('src', this.result);
                });

                reader.readAsDataURL(file);
            }
        });
    }

    document.addEventListener('DOMContentLoaded', previewImage);
</script>

<script>
    document.querySelectorAll('.menu-item > a').forEach(item => {
        item.addEventListener('click', event => {
            const submenu = item.nextElementSibling;
            if (submenu) {
                submenu.classList.toggle('show');
            }
        });
    });
</script>

</body>
</html>