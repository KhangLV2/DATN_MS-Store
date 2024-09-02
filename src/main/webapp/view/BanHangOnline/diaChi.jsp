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

        body.modal-open {
            overflow-y: auto;
            padding-right: 0 !important;
        }

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

        .modal-dialog {
            max-width: 800px;
            margin: 1.75rem auto;
        }

        .modal-content {
            width: 100%;
            height: auto;
            top: 160px;
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
                            <li><a class="dropdown-item" href="/cua-hang/quan-ly-tai-khoan">Tài khoản của tôi</a>
                            </li>
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
                            <input placeholder="Email" type="email" id="registerEmail" name="email"
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


<!-- Page Header Start -->
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
        <div class="col-7">
            <div class="d-flex flex-column align-items justify-content-center" style="min-height: 150px">
                <h5 class="font-weight-semi-bold text-uppercase mb-3">Địa chỉ nhận hàng</h5>
            </div>
            <div>
                <%--Thêm địa chỉ--%>
                <button type="button" class="btn btn-primary mb-3" data-toggle="modal"
                        data-target="#addAddressModal1" style="position: relative; left: 657px; top: -27px">
                    <i class="bi bi-plus-circle"></i> Thêm địa chỉ
                </button>
                <div class="modal fade" id="addAddressModal1" tabindex="-1" role="dialog"
                     aria-labelledby="addAddressModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content" style="width: 880px; left: -35px; top: 124px">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addAddressModalLabel">Thêm địa chỉ mới</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="/cua-hang/them-dia-chi" method="post" id="themDiaChi">
                                    <div class="row px-xl-5">
                                        <div class="col-md-6 form-group">
                                            <label><b>Họ tên</b></label>
                                            <input class="form-control" type="text" name="tenNguoiNhan"
                                                   id="tenNguoiNhan1"
                                                   style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                                   placeholder="Họ tên">
                                            <span id="tenNguoiNhan1Error" class="text-danger"></span>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label><b>Số điện thoại</b></label>
                                            <input class="form-control" type="number" name="sdtNguoiNhan"
                                                   id="sdtNguoiNhan1"
                                                   style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                                   placeholder="Số điện thoại">
                                            <span id="sdtNguoiNhan1Error" class="text-danger"></span>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label><b>Địa chỉ</b></label>
                                            <input class="form-control" type="text" name="diaChiChiTiet"
                                                   id="diaChiChiTiet1"
                                                   style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                                   placeholder="Địa chỉ">
                                            <span id="diaChiChiTiet1Error" class="text-danger"></span>
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <label><b>Tỉnh/Thành phố</b></label>
                                            <select class="custom-select"
                                                    id="tinhThanh" name="tinhThanh"
                                                    title="Chọn Tỉnh Thành"
                                                    style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                                <option value="0">Chọn tỉnh thành</option>
                                            </select>
                                            <span id="tinhThanhError" class="text-danger"></span>
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <label><b>Quận/Huyện</b></label>
                                            <select class="custom-select"
                                                    id="quanHuyen" name="quanHuyen"
                                                    title="Chọn Quận Huyện"
                                                    style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                                <option value="0">Chọn quận huyện</option>
                                            </select>
                                            <span id="quanHuyenError" class="text-danger"></span>
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <label><b>Phường/Xã</b></label>
                                            <select class="custom-select"
                                                    id="phuongXa" name="phuongXa"
                                                    title="Chọn Phường Xã"
                                                    style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                                <option value="0">Chọn phường xã</option>
                                            </select>
                                            <span id="phuongXaError" class="text-danger"></span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Quay lại</button>
                                <button type="button" id="submitForm" class=" btn btn-primary">Thêm</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:forEach var="i" items="${listDiaChi}">
                <div class="container">
                    <div class="row">
                        <div class="col-9 form-check mb-5">
                            <label class="form-check-input" type="text" name="flexRadioDefault"
                                   id="flexRadioDefault${i.id}"
                                   data-ten-nguoi-nhan="${i.tenNguoiNhan}"
                                   data-sdt-nguoi-nhan="${i.sdtNguoiNhan}"
                                   data-dia-chi-chi-tiet="${i.diaChiChiTiet}"
                                   data-id-tinh-thanh="${i.idTinhThanh}"
                                   data-id-quan-huyen="${i.idQuanHuyen}"
                                   data-id-phuong-xa="${i.idPhuongXa}"
                                   <c:if test="${i.trangThai == 1}">checked</c:if>>
                            </label>
                            <label>
                                <b>${i.tenNguoiNhan}</b> | ${i.sdtNguoiNhan}
                            </label>
                            <br>
                            <label>${i.diaChiChiTiet}, ${i.idPhuongXa}, ${i.idQuanHuyen}, ${i.idTinhThanh}</label>
                            <div>
                                <c:if test="${i.trangThai == 1}">
                                    <label style="color: red">Mặc định</label>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-3">
                            <a href="" style="color: #1571ff;" data-toggle="modal"
                               data-target="#updateAddressModal1${i.id}" data-address-id="1">
                                Cập nhật
                            </a>
                            <div class="modal fade" id="updateAddressModal1${i.id}" tabindex="-1" role="dialog"
                                 aria-labelledby="updateAddressModalLabel1${i.id}" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content" style="width: 880px; left: -33px; top: 120px;">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="updateAddressModalLabel1">Cập nhật địa
                                                chỉ</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="/cua-hang/cap-nhat-dia-chi/${i.id}" method="post"
                                                  id="suaDiaChi${i.id}">
                                                <div class="row px-xl-5">
                                                    <div class="col-md-6 form-group">
                                                        <label><b>Họ tên</b></label>
                                                        <input class="form-control" type="text" name="tenNguoiNhan"
                                                               value="${i.tenNguoiNhan}"
                                                               style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                                               placeholder="Họ tên">
                                                        <span class="error-message" style="color: red"></span>
                                                    </div>
                                                    <div class="col-md-6 form-group">
                                                        <label><b>Số điện thoại</b></label>
                                                        <input class="form-control" type="number" name="sdtNguoiNhan"
                                                               value="${i.sdtNguoiNhan}"
                                                               style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                                               placeholder="Số điện thoại">
                                                        <span class="error-message" style="color: red"></span>
                                                    </div>
                                                    <div class="col-md-12 form-group">
                                                        <label><b>Địa chỉ</b></label>
                                                        <input class="form-control" type="text" name="diaChiChiTiet"
                                                               value="${i.diaChiChiTiet}"
                                                               style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                                               placeholder="Địa chỉ">
                                                        <span class="error-message" style="color: red"></span>
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label><b>Tỉnh/Thành phố</b></label>
                                                        <select class="custom-select" id="tenTT${i.id}" name="tenTT"
                                                                title="Chọn Tỉnh Thành"
                                                                style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                                            <option value="${i.idTinhThanh}">${i.idTinhThanh}</option>
                                                        </select>
                                                        <span class="error-message" style="color: red"></span>
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label><b>Quận/Huyện</b></label>
                                                        <select class="custom-select" id="tenQH${i.id}" name="tenQH"
                                                                title="Chọn Quận Huyện"
                                                                style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                                            <option value="${i.idQuanHuyen}">${i.idQuanHuyen}</option>
                                                        </select>
                                                        <span class="error-message" style="color: red"></span>
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label><b>Phường/Xã</b></label>
                                                        <select class="custom-select" id="tenPX${i.id}" name="tenPX"
                                                                title="Chọn Phường Xã"
                                                                style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                                            <option value="${i.idPhuongXa}">${i.idPhuongXa}</option>
                                                        </select>
                                                        <span class="error-message" style="color: red"></span>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Quay lại
                                                    </button>
                                                    <button type="submit" id="" class=" btn btn-primary">
                                                        Cập nhật
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${i.trangThai != 1}">
                                <a style="color: #ff3818" href="/cua-hang/xoa-dia-chi/${i.id}">Xóa</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="col-1"></div>
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

            // Clear previous errors
            $('.text-danger').text('');
            $('.form-control').removeClass('border-danger');

            if (!fullName) {
                $('#fullNameError').text('Vui lòng nhập họ và tên.');
                $('#fullName').addClass('border-danger');
                hasError = true;
            }

            if (!email) {
                $('#emailError').text('Vui lòng nhập email.');
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

    //Thêm địa chỉ
    $(document).ready(function () {
        var token = '4787bafa-2157-11ef-a90d-aaf29aa34580';
        var phoneNumbers = [];

        // Function to get JSON with token
        function getJSONWithToken(url, callback) {
            $.ajax({
                url: url,
                headers: {
                    'Token': token
                },
                success: callback,
                error: function (xhr, status, error) {
                    console.error("Lỗi: " + error);
                }
            });
        }

        function isValidPhoneNumber(phone) {
            var regex = /^(03|05|07|08|09)[0-9]{8}$/;
            return regex.test(phone);
        }

        // Lấy tỉnh thành
        getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', function (data_tinh) {
            data_tinh.data.sort(function (a, b) {
                return a.ProvinceID - b.ProvinceID;
            });

            $.each(data_tinh.data, function (key_tinh, val_tinh) {
                $("#tinhThanh").append('<option value="' + val_tinh.ProvinceID + '" name="' + val_tinh.ProvinceName + '">' + val_tinh.ProvinceName + '</option>');
            });

            $("#tinhThanh").change(function (e) {
                var idtinh = $(this).val();

                // Lấy quận huyện
                getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=' + idtinh, function (data_quan) {
                    $("#quanHuyen").html('<option value="0">Quận Huyện</option>');
                    $("#phuongXa").html('<option value="0">Phường Xã</option>');
                    $.each(data_quan.data, function (key_quan, val_quan) {
                        $("#quanHuyen").append('<option value="' + val_quan.DistrictID + '">' + val_quan.DistrictName + '</option>');
                    });

                    // Lấy phường xã
                    $("#quanHuyen").change(function (e) {
                        var idquan = $(this).val();
                        getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=' + idquan, function (data_phuong) {
                            $("#phuongXa").html('<option value="0">Phường Xã</option>');
                            $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                $("#phuongXa").append('<option value="' + val_phuong.WardCode + '">' + val_phuong.WardName + '</option>');
                            });
                        });
                    });
                });
            });
        });

        $("#submitForm").click(function () {
            // Xóa các thông báo lỗi trước đó
            $(".text-danger").text("");

            var isValid = true;
            var phoneNumber = $("#sdtNguoiNhan1").val().trim();
            var namePattern = /^[a-zA-ZÀ-ỹ\s]{1,40}$/;
            var addressPattern = /^[a-zA-Z0-9À-ỹ\s]+$/;

            var tenNguoiNhan = $("#tenNguoiNhan1").val().trim();
            if (tenNguoiNhan === "") {
                $("#tenNguoiNhan1Error").text("Vui lòng nhập họ tên");
                isValid = false;
            } else if (!namePattern.test(tenNguoiNhan)) {
                $("#tenNguoiNhan1Error").text("Họ tên không hợp lệ.");
                isValid = false;
            }

            if (phoneNumber === "") {
                $("#sdtNguoiNhan1Error").text("Vui lòng nhập số điện thoại");
                isValid = false;
            } else if (!isValidPhoneNumber(phoneNumber)) {
                $("#sdtNguoiNhan1Error").text("Số điện thoại không hợp lệ.");
                isValid = false;
            } else {
                phoneNumbers.push(phoneNumber);
            }

            var diaChiChiTiet = $("#diaChiChiTiet1").val().trim();
            if (diaChiChiTiet === "") {
                $("#diaChiChiTiet1Error").text("Vui lòng nhập địa chỉ chi tiết");
                isValid = false;
            } else if (diaChiChiTiet.length < 6 || diaChiChiTiet.length > 50) {
                $("#diaChiChiTiet1Error").text("Địa chỉ phải có độ dài từ 6 đến 50 ký tự.");
                isValid = false;
            } else if (!addressPattern.test(diaChiChiTiet)) {
                $("#diaChiChiTiet1Error").text("Địa chỉ không hợp lệ.");
                isValid = false;
            } else {
                $("#diaChiChiTiet1Error").text("");
            }

            if ($("#tinhThanh").val() === "0") {
                $("#tinhThanhError").text("Vui lòng chọn Tỉnh/Thành phố.");
                isValid = false;
            }

            if ($("#quanHuyen").val() === "0") {
                $("#quanHuyenError").text("Vui lòng chọn Quận/Huyện.");
                isValid = false;
            }

            if ($("#phuongXa").val() === "0") {
                $("#phuongXaError").text("Vui lòng chọn Phường/Xã.");
                isValid = false;
            }

            if (isValid) {
                var tenTinhThanh = $("#tinhThanh option:selected").text();
                var tenQuanHuyen = $("#quanHuyen option:selected").text();
                var tenPhuongXa = $("#phuongXa option:selected").text();

                var idTinhThanh = $("#tinhThanh").val();
                var idQuanHuyen = $("#quanHuyen").val();
                var idPX = $("#phuongXa").val();

                console.log("ten tỉnh: " + tenTinhThanh);
                console.log("ten quận huyện: " + tenQuanHuyen);
                console.log("ten phường xã: " + tenPhuongXa);

                console.log("id tỉnh: " + idTinhThanh);
                console.log("id qh: " + idQuanHuyen);
                console.log("id px: " + idPX);

                // Thêm dữ liệu ẩn vào form
                $("<input>").attr({
                    type: "hidden",
                    name: "idTinhThanh",
                    value: idTinhThanh
                }).appendTo("#themDiaChi");

                $("<input>").attr({
                    type: "hidden",
                    name: "idQuanHuyen",
                    value: idQuanHuyen
                }).appendTo("#themDiaChi");

                $("<input>").attr({
                    type: "hidden",
                    name: "idPX",
                    value: idPX
                }).appendTo("#themDiaChi");

                $("<input>").attr({
                    type: "hidden",
                    name: "tenTinhThanh",
                    value: tenTinhThanh
                }).appendTo("#themDiaChi");

                $("<input>").attr({
                    type: "hidden",
                    name: "tenQuanHuyen",
                    value: tenQuanHuyen
                }).appendTo("#themDiaChi");

                $("<input>").attr({
                    type: "hidden",
                    name: "tenPhuongXa",
                    value: tenPhuongXa
                }).appendTo("#themDiaChi");

                $("#themDiaChi").submit();
            }
        });
    });

    //Sửa địa chỉ
    $(document).ready(function () {
        var token = '4787bafa-2157-11ef-a90d-aaf29aa34580';

        function getJSONWithToken(url, callback) {
            $.ajax({
                url: url,
                headers: {
                    'Token': token
                },
                success: callback,
                error: function (xhr, status, error) {
                    console.error("Lỗi: " + error);
                }
            });
        }

        $('body').on('show.bs.modal', '.modal', function () {

            var modalId = $(this).attr('id');
            var provinceSelect = $("#" + modalId + " select[name='tenTT']");
            var districtSelect = $("#" + modalId + " select[name='tenQH']");
            var wardSelect = $("#" + modalId + " select[name='tenPX']");

            // Gọi API để lấy danh sách tỉnh/thành phố
            getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', function (data_tinh) {
                // Đổ danh sách tỉnh/thành phố vào dropdown
                data_tinh.data.sort(function (a, b) {
                    return a.ProvinceID - b.ProvinceID;
                });
                $.each(data_tinh.data, function (key_tinh, val_tinh) {
                    provinceSelect.append('<option value="' + val_tinh.ProvinceID + '" name="' + val_tinh.ProvinceName + '">' + val_tinh.ProvinceName + '</option>');
                });

                provinceSelect.change(function (e) {
                    var idtinh = $(this).val();

                    // Lấy quận huyện
                    getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=' + idtinh, function (data_quan) {
                        districtSelect.html('<option value="0">Quận Huyện</option>');
                        wardSelect.html('<option value="0">Phường Xã</option>');
                        $.each(data_quan.data, function (key_quan, val_quan) {
                            districtSelect.append('<option value="' + val_quan.DistrictID + '">' + val_quan.DistrictName + '</option>');
                        });

                        // Lấy phường xã
                        districtSelect.change(function (e) {
                            var idquan = $(this).val();
                            getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=' + idquan, function (data_phuong) {
                                wardSelect.html('<option value="0">Phường Xã</option>');
                                $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                    wardSelect.append('<option value="' + val_phuong.WardCode + '">' + val_phuong.WardName + '</option>');
                                });
                            });
                        });
                    });
                });
            });
        });
        $('form[id^="suaDiaChi"]').submit(function (e) {
            var modalId = $(this).closest('.modal').attr('id');
            var tenTinh = $("#" + modalId + " select[name='tenTT'] option:selected").text();
            var tenQuan = $("#" + modalId + " select[name='tenQH'] option:selected").text();
            var tenPhuong = $("#" + modalId + " select[name='tenPX'] option:selected").text();

            var idTinh = $("#" + modalId + " select[name='tenTT']").val();
            var idQuan = $("#" + modalId + " select[name='tenQH']").val();
            var idPhuong = $("#" + modalId + " select[name='tenPX']").val();

            console.log("tên tỉnh:" + tenTinh);
            console.log("tên quận:" + tenQuan);
            console.log("tên phường:" + tenPhuong);
            console.log("id tỉnh:" + idTinh);
            console.log("id quận:" + idQuan);
            console.log("id phường:" + idPhuong);

            //Lấy id
            $("<input>").attr({
                type: "hidden",
                name: "idTinh",
                value: idTinh
            }).appendTo(this);

            $("<input>").attr({
                type: "hidden",
                name: "idQuan",
                value: idQuan
            }).appendTo(this);

            $("<input>").attr({
                type: "hidden",
                name: "idPhuong",
                value: idPhuong
            }).appendTo(this);
            //

            $("<input>").attr({
                type: "hidden",
                name: "tenTinh",
                value: tenTinh
            }).appendTo(this);

            $("<input>").attr({
                type: "hidden",
                name: "tenQuan",
                value: tenQuan
            }).appendTo(this);

            $("<input>").attr({
                type: "hidden",
                name: "tenPhuong",
                value: tenPhuong
            }).appendTo(this);

            return true;
        });
    });

    //Check validate cập nhật địa chỉ
    $(document).ready(function () {
        // Lắng nghe sự kiện submit form
        $('form[id^="suaDiaChi"]').submit(function (e) {
            var modalId = $(this).closest('.modal').attr('id');
            var isValid = true;

            // Reset thông báo lỗi
            $("#" + modalId + " .error-message").text('');

            // Validate Họ tên
            var tenNguoiNhan = $("#" + modalId + " input[name='tenNguoiNhan']").val().trim();
            if (tenNguoiNhan === '') {
                $("#" + modalId + " input[name='tenNguoiNhan']").next('.error-message').text('Vui lòng nhập họ tên');
                isValid = false;
            }

            // Validate Số điện thoại
            var sdtNguoiNhan = $("#" + modalId + " input[name='sdtNguoiNhan']").val().trim();
            if (sdtNguoiNhan === '') {
                $("#" + modalId + " input[name='sdtNguoiNhan']").next('.error-message').text('Vui lòng nhập số điện thoại');
                isValid = false;
            }

            // Validate địa chỉ chi tiết
            var diaChiChiTiet = $("#" + modalId + " input[name='diaChiChiTiet']").val().trim();
            if (diaChiChiTiet === '') {
                $("#" + modalId + " input[name='diaChiChiTiet']").next('.error-message').text('Vui lòng nhập địa chỉ chi tiết');
                isValid = false;
            }

            // Validate Tỉnh/Thành phố
            var tenTT = $("#" + modalId + " select[name='tenTT']").val();
            if (!tenTT || tenTT === '0') {
                $("#" + modalId + " select[name='tenTT']").next('.error-message').text('Vui lòng chọn Tỉnh/Thành phố');
                isValid = false;
            }

            // Validate Quận/Huyện
            var tenQH = $("#" + modalId + " select[name='tenQH']").val();
            if (!tenQH || tenQH === '0') {
                $("#" + modalId + " select[name='tenQH']").next('.error-message').text('Vui lòng chọn Quận/Huyện');
                isValid = false;
            }

            // Validate Phường/Xã
            var tenPX = $("#" + modalId + " select[name='tenPX']").val();
            if (!tenPX || tenPX === '0') {
                $("#" + modalId + " select[name='tenPX']").next('.error-message').text('Vui lòng chọn Phường/Xã');
                isValid = false;
            }

            // Nếu các trường đều hợp lệ, tiến hành submit form
            return isValid;
        });
    });

    $(document).ready(function () {
        // Khi modal mở
        $('#addAddressModal1, #updateAddressModal1').on('show.bs.modal', function () {
            $('body').css('padding-right', '0');
        });

        // Khi modal đóng
        $('#addAddressModal1, #updateAddressModal1').on('hidden.bs.modal', function () {
            $('body').css('padding-right', '');
        });
    });

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