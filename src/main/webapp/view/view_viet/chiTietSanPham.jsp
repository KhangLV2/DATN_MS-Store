<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MSStore - Thời trang nam</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

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

    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
</head>

<body>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row bg-secondary py-2 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark" href="">FAQs</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Help</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Support</a>
            </div>
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark px-2" href="">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-twitter"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-linkedin-in"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-instagram"></i>
                </a>
                <a class="text-dark pl-2" href="">
                    <i class="fab fa-youtube"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span
                        class="text-primary font-weight-bold border px-3 mr-1">MS</span>Store</h1>
            </a>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <form action="">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for products">
                    <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-3 col-6 text-right userCart">
            <div class="dropdown">
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
                            <li><a class="dropdown-item" href="/store/don-mua">Đơn mua</a></li>
                            <li><a class="dropdown-item" href="/store/quan-ly-tai-khoan">Quản lý tài khoản</a></li>
                            <li><a class="dropdown-item" href="/store/logout">Đăng xuất</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <div class="col-lg-3 col-6 text-right" style="position: relative">
                <a href="/store/gio-hang" class="btn border">
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
                    <form id="login-form" class="form" action="/store/login" method="post" modelAttribute="khachHangDTO">
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
                            <label for="remember-me" class="text-info"><span>Remember me</span> <span><input
                                    id="remember-me" name="remember-me" type="checkbox"></span></label><br>
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
                    <form id="register-form" class="form" action="/store/register" method="post" modelAttribute="khachHangDTO">
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
                            <label for="registerPassword" class="text-info">Confirm Password:</label><br>
                            <input placeholder="Confirm password" type="password" id="nhapLaiMatKhau" name="nhapLaiMatKhau"
                                   class="form-control" value="">
                            <small id="nhapLaiMatKhauError" class="text-danger"></small>
                        </div>
                        <input type="hidden" name="checkDangKy" id="checkDangKy" value="1">
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
                        <a href="/store/trang-chu" class="nav-item nav-link active">Trang chủ</a>
                        <a href="detail.html" class="nav-item nav-link">Giới thiệu</a>
                        <a href="contact.html" class="nav-item nav-link">Liên hệ</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->


<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Shop Detail</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="/store/trang-chu">Trang chủ</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Chi tiết sản phẩm</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Shop Detail Start -->
<div class="container-fluid py-5" style="margin-top: -60px">
    <div class="row px-xl-5" style="justify-content: center">
        <div class="col-lg-5 pb-5" style="max-width: 32.66667%">
            <div id="product-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner border">
                    <div class="carousel-item active">
                        <img class="w-100 h-100" src="/image/${hinhAnh.hinhAnh1}" alt="Image" id="hinhAnh1">
                    </div>
                    <div class="carousel-item">
                        <img class="w-100 h-100" src="/image/${hinhAnh.hinhAnh2}" alt="Image" id="hinhAnh2">
                    </div>
                    <div class="carousel-item">
                        <img class="w-100 h-100" src="/image/${hinhAnh.hinhAnh3}" alt="Image" id="hinhAnh3">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                    <i class="fa fa-2x fa-angle-left text-dark"></i>
                </a>
                <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                    <i class="fa fa-2x fa-angle-right text-dark"></i>
                </a>
            </div>
        </div>

        <div class="col-lg-7 pb-5">
            <h3 class="font-weight-semi-bold">${ctsp.idSanPham.ten} - ${ctsp.idSanPham.ma}</h3>
            <div class="d-flex mb-3">
                <div class="text-primary mr-2">
                    <small class="fas fa-star"></small>
                    <small class="fas fa-star"></small>
                    <small class="fas fa-star"></small>
                    <small class="fas fa-star-half-alt"></small>
                    <small class="far fa-star"></small>
                </div>
            </div>

            <h3 class="font-weight-semi-bold mb-4">
                <fmt:formatNumber value="${ctsp.giaBan}" type="currency" currencySymbol="₫"/>
            </h3>

            <p class="mb-4">${ctsp.moTa}</p>

            <div class="d-flex mb-3">
                <p class="text-dark font-weight-medium mb-0 mr-3">Số lượng tồn:</p>
                <div class=" custom-control-inline">
                    <span id="soLuongTon" style="font-weight: bold">${soLuongTon}</span>
                </div>
            </div>

            <form method="post" action="/store/add-gio-hang">
                <input type="hidden" name="idCTSP" value="${ctsp.id}">

                <div class="d-flex mb-4">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Màu sắc:</p>
                    <c:forEach items="${listMauSac}" var="mauSac" varStatus="i">
                        <div class="custom-control custom-radio custom-control-inline">
                            <input onchange="onchangeByMauSac('${mauSac.tenMS}')" type="radio"
                                   class="custom-control-input"
                                   id="${mauSac.idMS}"
                                   <c:if test="${i.index==0}">checked</c:if>
                                   value="${mauSac.tenMS}" name="mauSac">
                            <label class="custom-control-label" for="${mauSac.idMS}">${mauSac.tenMS}</label>
                        </div>
                    </c:forEach>
                </div>

                <div class="d-flex mb-3">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Kích thước:</p>
                    <c:forEach items="${listKichThuoc}" var="kichThuoc" varStatus="i">
                        <div class="custom-control custom-radio custom-control-inline kichThuocOption">
                            <input onchange="onchangeByKichThuoc('${kichThuoc.tenKth}')" type="radio"
                                   class="custom-control-input" id="${kichThuoc.idKth}"
                                   <c:if test="${i.index==0}">checked</c:if> value="${kichThuoc.tenKth}"
                                   name="kichThuoc">
                            <label class="custom-control-label" for="${kichThuoc.idKth}">${kichThuoc.tenKth}</label>
                        </div>
                    </c:forEach>
                </div>

                <div class="d-flex align-items-center mb-4 pt-2">
                    <div class="input-group quantity mr-3" style="width: 130px;">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-primary btn-minus">
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <input type="text" class="form-control bg-secondary text-center" id="soLuong" name="soLuong"
                               value="1">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-primary btn-plus">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Thêm
                        vào giỏ hàng
                    </button>
                </div>
            </form>

            <div class="d-flex pt-2">
                <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                <div class="d-inline-flex">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-pinterest"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (0)</a>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="tab-pane-1">
                    <h4 class="mb-3">Product Description</h4>
                    <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt
                        duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur
                        invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet
                        rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam
                        consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam,
                        ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr
                        sanctus eirmod takimata dolor ea invidunt.</p>
                    <p>Dolore magna est eirmod sanctus dolor, amet diam et eirmod et ipsum. Amet dolore tempor
                        consetetur sed lorem dolor sit lorem tempor. Gubergren amet amet labore sadipscing clita clita
                        diam clita. Sea amet et sed ipsum lorem elitr et, amet et labore voluptua sit rebum. Ea erat sed
                        et diam takimata sed justo. Magna takimata justo et amet magna et.</p>
                </div>
                <div class="tab-pane fade" id="tab-pane-2">
                    <h4 class="mb-3">Additional Information</h4>
                    <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt
                        duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur
                        invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet
                        rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam
                        consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam,
                        ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr
                        sanctus eirmod takimata dolor ea invidunt.</p>
                    <div class="row">
                        <div class="col-md-6">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item px-0">
                                    Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                </li>
                                <li class="list-group-item px-0">
                                    Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                </li>
                                <li class="list-group-item px-0">
                                    Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                </li>
                                <li class="list-group-item px-0">
                                    Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item px-0">
                                    Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                </li>
                                <li class="list-group-item px-0">
                                    Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                </li>
                                <li class="list-group-item px-0">
                                    Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                </li>
                                <li class="list-group-item px-0">
                                    Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="tab-pane-3">
                    <div class="row">
                        <div class="col-md-6">
                            <h4 class="mb-4">1 review for "Colorful Stylish Shirt"</h4>
                            <div class="media mb-4">
                                <img src="/view_ban_hang/img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1"
                                     style="width: 45px;">
                                <div class="media-body">
                                    <h6>John Doe<small> - <i>01 Jan 2045</i></small></h6>
                                    <div class="text-primary mb-2">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                    <p>Diam amet duo labore stet elitr ea clita ipsum, tempor labore accusam ipsum et no
                                        at. Kasd diam tempor rebum magna dolores sed sed eirmod ipsum.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h4 class="mb-4">Leave a review</h4>
                            <small>Your email address will not be published. Required fields are marked *</small>
                            <div class="d-flex my-3">
                                <p class="mb-0 mr-2">Your Rating * :</p>
                                <div class="text-primary">
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>
                            </div>
                            <form>
                                <div class="form-group">
                                    <label for="message">Your Review *</label>
                                    <textarea id="message" cols="30" rows="5" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="name">Your Name *</label>
                                    <input type="text" class="form-control" id="name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Your Email *</label>
                                    <input type="email" class="form-control" id="email">
                                </div>
                                <div class="form-group mb-0">
                                    <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Shop Detail End -->


<!-- Products Start -->
<div class="container-fluid py-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="/view_ban_hang/img/product-1.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6>
                            <h6 class="text-muted ml-2">
                                <del>$123.00</del>
                            </h6>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View
                            Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i
                                class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="/view_ban_hang/img/product-2.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6>
                            <h6 class="text-muted ml-2">
                                <del>$123.00</del>
                            </h6>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View
                            Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i
                                class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="/view_ban_hang/img/product-3.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6>
                            <h6 class="text-muted ml-2">
                                <del>$123.00</del>
                            </h6>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View
                            Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i
                                class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="/view_ban_hang/img/product-4.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6>
                            <h6 class="text-muted ml-2">
                                <del>$123.00</del>
                            </h6>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View
                            Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i
                                class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="/view_ban_hang/img/product-5.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                        <div class="d-flex justify-content-center">
                            <h6>$123.00</h6>
                            <h6 class="text-muted ml-2">
                                <del>$123.00</del>
                            </h6>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View
                            Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i
                                class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Products End -->


<!-- Footer Start -->
<div class="container-fluid bg-secondary text-dark mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <a href="" class="text-decoration-none">
                <h1 class="mb-4 display-5 font-weight-semi-bold"><span
                        class="text-primary font-weight-bold border border-white px-3 mr-1">MS</span>Store</h1>
            </a>
            <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore
                amet erat.</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                        <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop
                            Detail</a>
                        <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping
                            Cart</a>
                        <a class="text-dark mb-2" href="checkout.html"><i
                                class="fa fa-angle-right mr-2"></i>Checkout</a>
                        <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                        <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop
                            Detail</a>
                        <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping
                            Cart</a>
                        <a class="text-dark mb-2" href="checkout.html"><i
                                class="fa fa-angle-right mr-2"></i>Checkout</a>
                        <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                    <form action="">
                        <div class="form-group">
                            <input type="text" class="form-control border-0 py-4" placeholder="Your Name"
                                   required="required"/>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                   required="required"/>
                        </div>
                        <div>
                            <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row border-top border-light mx-xl-5 py-4">
        <div class="col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-dark">
                &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved.

                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                Designed by <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a>
            </p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
            <img class="img-fluid" src="/view_ban_hang/img/payments.png" alt="">
        </div>
    </div>
</div>
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
</body>

<script>
    var list = [];
    <c:forEach items="${listMauSizeSL}" var="item">
    var MauSizeSL = {};
    MauSizeSL.hinhAnh1 = "${item.hinhAnh1}";
    MauSizeSL.hinhAnh2 = "${item.hinhAnh2}";
    MauSizeSL.hinhAnh3 = "${item.hinhAnh3}";
    MauSizeSL.tenMauSac = "${item.tenMauSac}";
    MauSizeSL.tenKichThuoc = "${item.tenKichThuoc}";
    MauSizeSL.soLuong = "${item.soLuong}";
    list.push(MauSizeSL);
    </c:forEach>

    // Tìm và set giá trị ban đầu
    var initialSelectedMauSac = document.querySelector('input[name="mauSac"]:checked').value;
    var initialSelectedKichThuoc = document.querySelector('input[name="kichThuoc"]:checked').value;
    setHinhAnhAndSoLuong(initialSelectedMauSac, initialSelectedKichThuoc);
    filterKichThuocOptions(initialSelectedMauSac);

    // Lọc số lượng tồn spct theo kích thước khi chọn màu sắc
    function onchangeByMauSac(tenMauSac) {
        var tenKichThuoc = document.querySelector('input[name="kichThuoc"]:checked').value;
        var isKichThuocValid = list.some(item => item.tenMauSac === tenMauSac && item.tenKichThuoc === tenKichThuoc);

        if (!isKichThuocValid) {
            // Chọn kích thước đầu tiên có sẵn cho màu sắc mới
            var kichThuocOptions = document.querySelectorAll('.kichThuocOption');
            for (var option of kichThuocOptions) {
                var input = option.querySelector('input[name="kichThuoc"]');
                var isMatch = list.some(item => item.tenMauSac === tenMauSac && item.tenKichThuoc === input.value);
                if (isMatch) {
                    input.checked = true;
                    tenKichThuoc = input.value;
                    break;
                }
            }
        }
        setHinhAnhAndSoLuong(tenMauSac, tenKichThuoc);
        filterKichThuocOptions(tenMauSac);
    }


    // Hàm cập nhật hình ảnh và số lượng
    function setHinhAnhAndSoLuong(tenMauSac, tenKichThuoc) {
        var soLuong = 0;
        var hinhAnh1 = "";
        var hinhAnh2 = "";
        var hinhAnh3 = "";

        list.forEach(item => {
            if (item.tenMauSac == tenMauSac && item.tenKichThuoc == tenKichThuoc) {
                soLuong = item.soLuong;
                hinhAnh1 = item.hinhAnh1;
                hinhAnh2 = item.hinhAnh2;
                hinhAnh3 = item.hinhAnh3;
            }
        });

        if (soLuong < 0 || soLuong == null) {
            soLuong = 0;
        }

        document.getElementById("soLuongTon").textContent = soLuong;
        document.getElementById("hinhAnh1").src = "/image/" + hinhAnh1;
        document.getElementById("hinhAnh2").src = "/image/" + hinhAnh2;
        document.getElementById("hinhAnh3").src = "/image/" + hinhAnh3;
    }

    // Lọc các tùy chọn kích thước dựa trên màu sắc
    function filterKichThuocOptions(tenMauSac) {
        var kichThuocOptions = document.querySelectorAll('.kichThuocOption');
        kichThuocOptions.forEach(option => {
            var input = option.querySelector('input[name="kichThuoc"]');
            var isMatch = list.some(item => item.tenMauSac === tenMauSac && item.tenKichThuoc === input.value);
            option.style.display = isMatch ? 'inline-block' : 'none';
        });
        // Chọn kích thước đầu tiên hiển thị
        var visibleOptions = Array.from(kichThuocOptions).filter(option => option.style.display !== 'none');
        if (visibleOptions.length > 0) {
            visibleOptions[0].querySelector('input').checked = true;
        }
    }

    //Lọc số lượng tồn ctsp theo màu sắc khi chọn kích thước
    function onchangeByKichThuoc(tenKichThuoc) {
        var listMauSac = document.getElementsByName("mauSac");
        var tenMauSac = "";
        for (var i = 0; i < listMauSac.length; i++) {
            if (listMauSac.item(i).checked) {
                tenMauSac = listMauSac.item(i).value;
            }
        }
        var soLuong;
        list.forEach(item => {
            if (item.tenKichThuoc == tenKichThuoc && item.tenMauSac == tenMauSac) {
                soLuong = item.soLuong
            }
        });
        document.getElementById("soLuongTon").textContent = soLuong != null ? soLuong : 0;
    }
</script>

<script>
    // Hiển thị thông báo thất bại nếu đăng nhập thất bại
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

    <%--    Hiển thị thông báo thành công khi đăng nhập thất bại--%>
    <c:if test="${not empty error}">
    Toast.fire({
        icon: "error",
        title: "${error}"
    });
    </c:if>

    <%--    Hiển thị thông báo thành công khi đăng nhập thành công--%>
    <c:if test="${not empty successMessage}">
    Toast.fire({
        icon: "success",
        title: "${successMessage}"
    });
    </c:if>

    //Lấy ra danh sách khách hàng
    const listKhachHang = [];
    <c:forEach items="${listKhachHang}" var="kh">
    var KhachHang = {};
    KhachHang.taiKhoan = '${kh.taiKhoan}';
    KhachHang.email = '${kh.email}';
    KhachHang.sdt = '${kh.sdt}';
    listKhachHang.push(KhachHang);
    </c:forEach>
    <%--Validate Form đăng nhặp--%>
    $(document).ready(function () {
        // Bắt lỗi khi submit form
        $('#login-form').submit(function (event) {
            event.preventDefault(); // Ngăn form submit mặc định
            debugger
            var form = $(this);
            var username = $('#taiKhoan').val().trim();
            var password = $('#matKhau').val().trim();

            var hasError = false;

            if (!username) {
                $('#taiKhoanError').text('Vui lòng nhập username.');
                $('#taiKhoan').addClass('border-danger');
                hasError = true;
            } else {
                $('#taiKhoanError').text('');
                $('#taiKhoan').removeClass('border-danger');
            }

            if (!password) {
                $('#matKhauError').text('Vui lòng nhập password.');
                $('#matKhau').addClass('border-danger');
                hasError = true;
            } else {
                $('#matKhauError').text('');
                $('#matKhau').removeClass('border-danger');
            }

            if (!hasError) {
                // Gửi yêu cầu đăng nhập bằng AJAX
                $.ajax({
                    type: 'POST',
                    url: form.attr('action'),
                    data: form.serialize(),
                    success: function (response) {
                        if (response.success) {
                            // Đăng nhập thành công, điều hướng sang trang home
                            Toast.fire({
                                icon: "success",
                                title: response.successMessage
                            });

                            setTimeout(function () {
                                window.location.href = response.redirectUrl;
                            }, 2000);
                        } else {
                            // Đăng nhập không thành công, hiển thị lỗi
                            if (response.errorUsername) {
                                $('#taiKhoanError').text(response.errorUsername);
                                $('#taiKhoan').addClass('border-danger');
                            }
                            if (response.errorPassword) {
                                $('#matKhauError').text(response.errorPassword);
                                $('#matKhau').addClass('border-danger');
                            }

                        }
                    },
                    error: function () {
                        console.error('Đã xảy ra lỗi khi gửi yêu cầu đăng nhập.');
                    }
                });
            }
        });

        // Xử lý lỗi và hiển thị modal khi submit form đăng ký
        $('#register-form').submit(function (event) {
            var form = $(this);
            var hasError = false;

            var username = $('#registerUsername').val().trim();
            var email = $('#registerEmail').val().trim();
            var phone = $('#registerPhone').val().trim();
            var password = $('#registerPassword').val().trim();
            var confirmPassword = $('#nhapLaiMatKhau').val().trim();

            // Clear previous errors
            $('.text-danger').text('');
            $('.form-control').removeClass('border-danger');

            // Validate fields
            if (!username) {
                $('#registerUsernameError').text('Vui lòng nhập username.');
                $('#registerUsername').addClass('border-danger');
                hasError = true;
            } else if (listKhachHang.some(kh => kh.taiKhoan == username)){
                $('#registerUsernameError').text('Tên tài khoản đã tồn tại');
                $('#registerUsername').addClass('border-danger');
                hasError = true;
            }
            if (!email) {
                $('#registerEmailError').text('Vui lòng nhập email.');
                $('#registerEmail').addClass('border-danger');
                hasError = true;
            } else if (!isValidEmail(email)) {
                $('#registerEmailError').text('Email không hợp lệ.');
                $('#registerEmail').addClass('border-danger');
                hasError = true;
            } else if (listKhachHang.some(kh => kh.email == email)){
                $('#registerEmailError').text('Email đã tồn tại.');
                $('#registerEmail').addClass('border-danger');
                hasError = true;
            }
            if (!phone) {
                $('#registerPhoneError').text('Vui lòng nhập số điện thoại.');
                $('#registerPhone').addClass('border-danger');
                hasError = true;
            } else if (!isValidVietnamesePhoneNumber(phone)) {
                $('#registerPhoneError').text('Số điện thoại không hợp lệ');
                $('#registerPhone').addClass('border-danger');
                hasError = true;
            } else if (listKhachHang.find(kh => {
                if (kh.sdt == phone){
                    if (kh.taiKhoan != ""){
                        $('#registerPhoneError').text('Số điện thoại đã được sử dụng đăng ký tài khoản!');
                        $('#registerPhone').addClass('border-danger');
                        hasError = true;
                    }else {
                        $('#checkDangKy').val(0);
                    }
                }
            })){}

            if (!password) {
                $('#registerPasswordError').text('Vui lòng nhập mật khẩu.');
                $('#registerPassword').addClass('border-danger');
                hasError = true;
            } else if (password.length < 6) {
                $('#registerPasswordError').text('Mật khẩu phải có ít nhất 6 ký tự.');
                $('#registerPassword').addClass('border-danger');
                hasError = true;
            }
            if (!confirmPassword) {
                $('#nhapLaiMatKhauError').text('Vui lòng nhập lại mật khẩu.');
                $('#nhapLaiMatKhau').addClass('border-danger');
                hasError = true;
            } else if (password != confirmPassword) {
                $('#nhapLaiMatKhauError').text('Mật khẩu nhập lại chưa đúng!');
                $('#nhapLaiMatKhau').addClass('border-danger');
                hasError = true;
            }


            // If any validation errors exist, prevent form submission
            if (hasError) {
                event.preventDefault();
            }
        });


        // Ẩn lỗi khi người dùng click vào trường input
        $('input').focus(function () {
            $(this).siblings('.text-danger').text('');
            $(this).removeClass('border-danger');
        });

        // Hiển thị lỗi từ Controller (nếu có)
        var errorUsername = '<%= request.getAttribute("errorUsername") %>';
        var errorPassword = '<%= request.getAttribute("errorPassword") %>';
        var errorUsernameExit = '<%= request.getAttribute("errorUsernameExit") %>';

        if (errorUsername && errorUsername !== 'null') {
            $('#taiKhoanError').text(errorUsername);
            $('#taiKhoan').addClass('border-danger');
        }
        if (errorPassword && errorPassword !== 'null') {
            $('#matKhauError').text(errorPassword);
            $('#matKhau').addClass('border-danger');
        }

        if (errorUsernameExit !== 'null') {
            $('#registerUsername').text(errorUsernameExit);
            $('#taiKhoan').addClass('border-danger');
        }

        // Khi modal được mở, thêm class "modal-open" vào body
        $('#loginModal').on('shown.bs.modal', function () {
            $('body').addClass('modal-open');
        });

        // Khi modal được đóng, loại bỏ class "modal-open" khỏi body
        $('#loginModal').on('hidden.bs.modal', function () {
            $('body').removeClass('modal-open');
        });
    });

    // Hàm kiểm tra định dạng email
    function isValidEmail(email) {
        // Biểu thức chính quy để kiểm tra định dạng email
        var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
    }

    // Hàm kiểm tra định dạng số điện thoại
    function isValidVietnamesePhoneNumber(phoneNumber) {
        // Biểu thức chính quy để kiểm tra định dạng số điện thoại (theo quy định của Việt Nam)
        var regex = /^(0|\+84)\d{9,10}$/;
        return regex.test(phoneNumber);
    }
</script>

</html>