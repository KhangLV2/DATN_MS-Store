<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                            <li><a class="dropdown-item" href="/cua-hang/quan-ly-tai-khoan">Tài khoản của tôi</a></li>
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

<!-- Boby -->
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
                <h5 class="font-weight-semi-bold text-uppercase mb-3">Đơn mua</h5>
            </div>
            <div class="row px-xl-3">
                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
                                data-bs-target="#tat-ca"
                                type="button" role="tab" aria-controls="tat-ca" aria-selected="true">Tất cả
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                  style="z-index: 1000; color: white">
                                ${countAllHoaDon}
                            </span>
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                data-bs-target="#cho-xac-nhan"
                                type="button" role="tab" aria-controls="#cho-xac-nhan" aria-selected="false">Chờ
                            xác
                            nhận
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                  style="z-index: 1000; color: white">
                                ${countHDByChoXacNhan}
                            </span>
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                data-bs-target="#cho-giao-hang"
                                type="button" role="tab" aria-controls="#cho-giao-hang" aria-selected="false">Chờ
                            giao
                            hàng
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                  style="z-index: 1000; color: white">
                                ${countHDByChoGiaoHang}
                            </span>
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                data-bs-target="#dang-giao-hang"
                                type="button" role="tab" aria-controls="#dang-giao-hang" aria-selected="false">Đang
                            giao
                            hàng
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                  style="z-index: 1000; color: white">
                                ${countHDByDangGiaoHang}
                            </span>
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                data-bs-target="#hoan-thanh"
                                type="button" role="tab" aria-controls="#hoan-thanh" aria-selected="false">Hoàn
                            thành
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                  style="z-index: 1000; color: white">
                                ${countHDByHoanThanh}
                            </span>
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                data-bs-target="#don-huy"
                                type="button" role="tab" aria-controls="#don-huy" aria-selected="false">Đơn hủy
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                  style="z-index: 1000; color: white">
                                ${countHDDaHuy}
                            </span>
                        </button>
                    </li>
                </ul>
                <div class="tab-content" id="pills-tabContent">
                    <%-- Tất cả danh sách --%>
                    <div class="tab-pane fade show active" id="tat-ca" role="tabpanel" aria-labelledby="tat-ca-tab">
                        <div class="container mt-5">
                            <c:if test="${not empty listHD.content}">
                                <c:forEach var="i" items="${listHD.content}">
                                    <c:if test="${i.trangThai >= 1}">
                                        <div class="row mb-4 rounded p-2" style="border: 1px solid #D19C97">
                                            <div class="col-6">
                                                <div><strong>Mã hóa đơn:</strong> ${i.ma}</div>
                                            </div>
                                            <div class="col-6 d-flex align-items-end justify-content-end">
                                                <c:choose>
                                                    <c:when test="${i.trangThai == 1}">
                                                        <div class="badge badge-primary"
                                                             style="border-radius: 10px;">
                                                            Chờ xác nhận
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${i.trangThai == 3}">
                                                        <div class="badge badge-warning"
                                                             style="border-radius: 10px;">
                                                            Chờ giao hàng
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${i.trangThai == 4}">
                                                        <div class="badge badge-info" style="border-radius: 10px;">
                                                            Đang giao hàng
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${i.trangThai == 6}">
                                                        <div class="badge badge-success"
                                                             style="border-radius: 10px;">
                                                            Hoàn thành
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${i.trangThai == 7}">
                                                        <div class="badge badge-danger"
                                                             style="border-radius: 10px;">
                                                            Đơn hủy
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                            <c:set var="ngayThanhToanFormatted" value="${fn:replace(i.ngayThanhToan, 'T', ' ')}" />
                                            <div class="col-6" style="bottom: -45px;">
                                                <div>
                                                    <strong>Ngày đặt hàng:</strong> ${ngayThanhToanFormatted}
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div><strong>Tổng:</strong>
                                                    <label style="color: red"><fmt:formatNumber value="${i.tongTien}"
                                                                                                type="currency"
                                                                                                currencySymbol="₫"/></label>
                                                </div>
                                            </div>

                                            <div class="col-12 mt-3" style="text-align: end">
                                                <a href="/cua-hang/don-mua/${i.id}">
                                                    <button class="btn btn-primary" style="border-radius: 10px;">Chi
                                                        tiết
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty listHD.content}">
                                <div class="row mt-4 p-3 text-center"
                                     style="position: relative; left: 300px; top: 40px; margin-bottom: 5rem !important;">
                                    <h5>Không có hóa đơn</h5>
                                </div>
                            </c:if>
                        </div>
                        <!-- Phân trang -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <c:if test="${listHD.number > 0}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHD.number - 1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${listHD.totalPages > 0}">
                                    <c:forEach var="i" begin="0" end="${listHD.totalPages - 1}">
                                        <li class="page-item ${i == listHD.number ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${listHD.number < listHD.totalPages - 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHD.number + 1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>

                    <%-- Danh sách chờ xác nhận --%>
                    <div class="tab-pane fade" id="cho-xac-nhan" role="tabpanel" aria-labelledby="cho-xac-nhan-tab">
                        <div class="container mt-5">
                            <c:if test="${not empty listHDByChoXacNhan.content}">
                                <c:forEach var="i" items="${listHDByChoXacNhan.content}">
                                    <div class="row mb-4 rounded p-2" style="border: 1px solid #D19C97">
                                        <div class="col-6">
                                            <div><strong>Mã hóa đơn:</strong> ${i.ma}</div>
                                        </div>
                                        <div class="col-6 d-flex align-items-end justify-content-end">
                                            <c:if test="${i.trangThai == 1}">
                                                <div class="badge badge-primary" style="border-radius: 10px;">
                                                    Chờ xác nhận
                                                </div>
                                            </c:if>
                                        </div>
                                        <c:set var="ngayThanhToanFormatted" value="${fn:replace(i.ngayThanhToan, 'T', ' ')}" />
                                        <div class="col-6" style="bottom: -45px;">
                                            <div>
                                                <strong>Ngày đặt hàng:</strong> ${ngayThanhToanFormatted}
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div><strong>Tổng:</strong>
                                                <label style="color: red"><fmt:formatNumber value="${i.tongTien}"
                                                                                            type="currency"
                                                                                            currencySymbol="₫"/></label>
                                            </div>
                                        </div>
                                        <div class="col-12 mt-3" style="text-align: end">
                                            <a href="/cua-hang/don-mua/${i.id}">
                                                <button class="btn btn-primary" style="border-radius: 10px;">Chi
                                                    tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty listHDByChoXacNhan.content}">
                                <div class="row mt-4 p-3 text-center"
                                     style="position: relative; left: 300px; top: 40px; margin-bottom: 5rem !important;">
                                    <h5>Không có hóa đơn</h5>
                                </div>
                            </c:if>
                        </div>
                        <!-- Phân trang -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <c:if test="${listHDByChoXacNhan.number > 0}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHDByChoXacNhan.number - 1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${listHDByChoXacNhan.totalPages > 0}">
                                    <c:forEach var="i" begin="0" end="${listHDByChoXacNhan.totalPages - 1}">
                                        <li class="page-item ${i == listHDByChoXacNhan.number ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${listHDByChoXacNhan.number < listHDByChoXacNhan.totalPages - 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHDByChoXacNhan.number + 1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    <%-- Danh sách chờ giao-hang --%>
                    <div class="tab-pane fade" id="cho-giao-hang" role="tabpanel"
                         aria-labelledby="cho-giao-hang-tab">
                        <div class="container mt-5">
                            <c:if test="${not empty listHDByChoGiaoHang.content}">
                                <c:forEach var="i" items="${listHDByChoGiaoHang.content}">
                                    <div class="row mb-4 rounded p-2" style="border: 1px solid #D19C97">
                                        <div class="col-6">
                                            <div><strong>Mã hóa đơn:</strong> ${i.ma}</div>
                                        </div>
                                        <div class="col-6 d-flex align-items-end justify-content-end">
                                            <c:if test="${i.trangThai == 3}">
                                                <div class="badge badge-warning" style="border-radius: 10px;">
                                                    Chờ giao hàng
                                                </div>
                                            </c:if>
                                        </div>
                                        <c:set var="ngayThanhToanFormatted" value="${fn:replace(i.ngayThanhToan, 'T', ' ')}" />
                                        <div class="col-6" style="bottom: -45px;">
                                            <div>
                                                <strong>Ngày đặt hàng:</strong> ${ngayThanhToanFormatted}
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div><strong>Tổng:</strong>
                                                <label style="color: red"><fmt:formatNumber value="${i.tongTien}"
                                                                                            type="currency"
                                                                                            currencySymbol="₫"/></label>
                                            </div>
                                        </div>
                                        <div class="col-12 mt-3" style="text-align: end">
                                            <a href="/cua-hang/don-mua/${i.id}">
                                                <button class="btn btn-primary" style="border-radius: 10px;">Chi
                                                    tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty listHDByChoGiaoHang.content}">
                                <div class="row mt-4 p-3 text-center"
                                     style="position: relative; left: 300px; top: 40px; margin-bottom: 5rem !important;">
                                    <h5>Không có hóa đơn</h5>
                                </div>
                            </c:if>
                        </div>
                        <!-- Phân trang -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <c:if test="${listHDByChoGiaoHang.number > 0}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHDByChoGiaoHang.number - 1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${listHDByChoGiaoHang.totalPages > 0}">
                                    <c:forEach var="i" begin="0" end="${listHDByChoGiaoHang.totalPages - 1}">
                                        <li class="page-item ${i == listHDByChoGiaoHang.number ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${listHDByChoGiaoHang.number < listHDByChoGiaoHang.totalPages - 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHDByChoGiaoHang.number + 1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    <%-- Danh sách đang giao-hang --%>
                    <div class="tab-pane fade" id="dang-giao-hang" role="tabpanel"
                         aria-labelledby="dang-giao-hang-tab">
                        <div class="container mt-5">
                            <c:if test="${not empty listHDByDangGiaoHang.content}">
                                <c:forEach var="i" items="${listHDByDangGiaoHang.content}">
                                    <div class="row mb-4 rounded p-2" style="border: 1px solid #D19C97">
                                        <div class="col-6">
                                            <div><strong>Mã hóa đơn:</strong> ${i.ma}</div>
                                        </div>
                                        <div class="col-6 d-flex align-items-end justify-content-end">
                                            <c:if test="${i.trangThai == 4}">
                                                <div class="badge badge-info" style="border-radius: 10px;">
                                                    Đang giao hàng
                                                </div>
                                            </c:if>
                                        </div>
                                        <c:set var="ngayThanhToanFormatted" value="${fn:replace(i.ngayThanhToan, 'T', ' ')}" />
                                        <div class="col-6" style="bottom: -45px;">
                                            <div>
                                                <strong>Ngày đặt hàng:</strong> ${ngayThanhToanFormatted}
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div><strong>Tổng:</strong>
                                                <label style="color: red"><fmt:formatNumber value="${i.tongTien}"
                                                                                            type="currency"
                                                                                            currencySymbol="₫"/></label>
                                            </div>
                                        </div>
                                        <div class="col-12 mt-3" style="text-align: end">
                                            <a href="/cua-hang/don-mua/${i.id}">
                                                <button class="btn btn-primary" style="border-radius: 10px;">Chi
                                                    tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty listHDByDangGiaoHang.content}">
                                <div class="row mt-4 p-3 text-center"
                                     style="position: relative; left: 300px; top: 40px; margin-bottom: 5rem !important;">
                                    <h5>Không có hóa đơn</h5>
                                </div>
                            </c:if>
                        </div>
                        <!-- Phân trang -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <c:if test="${listHDByDangGiaoHang.number > 0}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHDByDangGiaoHang.number - 1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${listHDByDangGiaoHang.totalPages > 0}">
                                    <c:forEach var="i" begin="0" end="${listHDByDangGiaoHang.totalPages - 1}">
                                        <li class="page-item ${i == listHDByDangGiaoHang.number ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${listHDByDangGiaoHang.number < listHDByDangGiaoHang.totalPages - 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHDByDangGiaoHang.number + 1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    <div class="tab-pane fade" id="hoan-thanh" role="tabpanel" aria-labelledby="hoan-thanh-tab">
                        <div class="container mt-5">
                            <c:if test="${not empty listHDByHoanThanh.content}">
                                <c:forEach var="i" items="${listHDByHoanThanh.content}">
                                    <div class="row mb-4 rounded p-2" style="border: 1px solid #D19C97">
                                        <div class="col-6">
                                            <div><strong>Mã hóa đơn:</strong> ${i.ma}</div>
                                        </div>
                                        <div class="col-6 d-flex align-items-end justify-content-end">
                                            <c:if test="${i.trangThai == 6}">
                                                <div class="badge badge-success" style="border-radius: 10px;">
                                                    Hoàn thành
                                                </div>
                                            </c:if>
                                        </div>
                                        <c:set var="ngayThanhToanFormatted" value="${fn:replace(i.ngayThanhToan, 'T', ' ')}" />
                                        <div class="col-6" style="bottom: -45px;">
                                            <div>
                                                <strong>Ngày đặt hàng:</strong> ${ngayThanhToanFormatted}
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div><strong>Tổng:</strong>
                                                <label style="color: red"><fmt:formatNumber value="${i.tongTien}"
                                                                                            type="currency"
                                                                                            currencySymbol="₫"/></label>
                                            </div>
                                        </div>
                                        <div class="col-12 mt-3" style="text-align: end">
                                            <a href="/cua-hang/don-mua/${i.id}">
                                                <button class="btn btn-primary" style="border-radius: 10px;">Chi
                                                    tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty listHDByHoanThanh.content}">
                                <div class="row mt-4 p-3 text-center"
                                     style="position: relative; left: 300px; top: 40px; margin-bottom: 5rem !important;">
                                    <h5>Không có hóa đơn</h5>
                                </div>
                            </c:if>
                        </div>
                        <!-- Phân trang -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <c:if test="${listHDByHoanThanh.number > 0}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHDByHoanThanh.number - 1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${listHDByHoanThanh.totalPages > 0}">
                                    <c:forEach var="i" begin="0" end="${listHDByHoanThanh.totalPages - 1}">
                                        <li class="page-item ${i == listHDByHoanThanh.number ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${listHDByHoanThanh.number < listHDByHoanThanh.totalPages - 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHDByHoanThanh.number + 1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    <%-- Danh sách đơn hủy --%>
                    <div class="tab-pane fade" id="don-huy" role="tabpanel" aria-labelledby="don-huy-tab">
                        <div class="container mt-5">
                            <c:if test="${not empty listHDDaHuy.content}">
                                <c:forEach var="i" items="${listHDDaHuy.content}">
                                    <div class="row mb-4 rounded p-2" style="border: 1px solid #D19C97">
                                        <div class="col-6">
                                            <div><strong>Mã hóa đơn:</strong> ${i.ma}</div>
                                        </div>
                                        <div class="col-6 d-flex align-items-end justify-content-end">
                                            <c:if test="${i.trangThai == 7}">
                                                <div class="badge badge-danger" style="border-radius: 10px;">
                                                    Đơn hủy
                                                </div>
                                            </c:if>
                                        </div>
                                        <c:set var="ngayThanhToanFormatted" value="${fn:replace(i.ngayThanhToan, 'T', ' ')}" />
                                        <div class="col-6" style="bottom: -45px;">
                                            <div>
                                                <strong>Ngày đặt hàng:</strong> ${ngayThanhToanFormatted}
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div><strong>Tổng:</strong>
                                                <label style="color: red"><fmt:formatNumber value="${i.tongTien}"
                                                                                            type="currency"
                                                                                            currencySymbol="₫"/></label>
                                            </div>
                                        </div>
                                        <div class="col-12 mt-3" style="text-align: end">
                                            <a href="/cua-hang/don-mua/${i.id}">
                                                <button class="btn btn-primary" style="border-radius: 10px;">Chi
                                                    tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty listHDDaHuy.content}">
                                <div class="row mt-4 p-3 text-center"
                                     style="position: relative; left: 300px; top: 40px; margin-bottom: 5rem !important;">
                                    <h5>Không có hóa đơn</h5>
                                </div>
                            </c:if>
                        </div>
                        <!-- Phân trang -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <c:if test="${listHDDaHuy.number > 0}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHDDaHuy.number - 1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${listHDDaHuy.totalPages > 0}">
                                    <c:forEach var="i" begin="0" end="${listHDDaHuy.totalPages - 1}">
                                        <li class="page-item ${i == listHDDaHuy.number ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${listHDDaHuy.number < listHDDaHuy.totalPages - 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${listHDDaHuy.number + 1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-1">
        </div>
    </div>
</div>


<!-- Body End -->

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
<script>
</script>

<script>
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

    <c:if test="${not empty error}">
    Toast.fire({
        icon: "error",
        title: "${error}"
    });
    </c:if>

    <c:if test="${not empty successMessage}">
    Toast.fire({
        icon: "success",
        title: "${successMessage}"
    });
    </c:if>

    <c:if test="${not empty message}">
    Toast.fire({
        icon: "success",
        title: "${message}"
    });
    </c:if>




    $(document).ready(function () {
        $('#searchInput').on('input', function () {
            var searchText = $(this).val().toLowerCase();
            $('#invoiceList .row').each(function () {
                var invoiceId = $(this).find('strong:contains("Mã hóa đơn:")').text().toLowerCase();
                if (invoiceId.indexOf(searchText) === -1) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            });
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