<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        .range-slider {
            position: relative;
            width: 200px;
            height: 35px;
            text-align: center;
        }

        .range-slider input {
            pointer-events: none;
            position: absolute;
            overflow: hidden;
            left: 0;
            top: 15px;
            width: 200px;
            outline: none;
            height: 18px;
            margin: 0;
            padding: 0;
        }

        .range-slider input::-webkit-slider-thumb {
            pointer-events: all;
            position: relative;
            z-index: 1;
            outline: 0;
        }

        .range-slider input::-moz-range-thumb {
            pointer-events: all;
            position: relative;
            z-index: 10;
            -moz-appearance: none;
            width: 9px;
        }

        .range-slider input::-moz-range-track {
            position: relative;
            z-index: -1;
            background-color: red;
            border: 0;
        }

        .range-slider input:last-of-type::-moz-range-track {
            -moz-appearance: none;
            background: none transparent;
            border: 0;
        }

        .range-slider input[type=range]::-moz-focus-outer {
            border: 0;
        }

        .rangeValue {
            width: 30px;
        }

        .output {
            position: absolute;
            width: 40px;
            height: 30px;
            text-align: center;
            color: #999;
            border-radius: 4px;
            display: inline-block;
            font: bold 15px/30px Helvetica, Arial;
            bottom: 75%;
            left: 50%;
            transform: translate(-50%, 0);
        }

        .output.outputTwo {
            left: 100%;
        }

        input[type=range] {
            -webkit-appearance: none;
            background: none;
        }

        input[type=range]::-webkit-slider-runnable-track {
            height: 5px;
            border: none;
            border-radius: 3px;
            background: transparent;
        }

        input[type=range]::-ms-track {
            height: 5px;
            background: transparent;
            border: none;
            border-radius: 3px;
        }

        input[type=range]::-moz-range-track {
            height: 5px;
            background: transparent;
            border: none;
            border-radius: 3px;
        }

        input[type=range]::-webkit-slider-thumb {
            -webkit-appearance: none;
            border: none;
            height: 16px;
            width: 16px;
            border-radius: 50%;
            background: #555;
            margin-top: -5px;
            position: relative;
            z-index: 10000;
        }

        input[type=range]::-ms-thumb {
            -webkit-appearance: none;
            border: none;
            height: 16px;
            width: 16px;
            border-radius: 50%;
            background: #555;
            margin-top: -5px;
            position: relative;
            z-index: 10000;
        }

        input[type=range]::-moz-range-thumb {
            -webkit-appearance: none;
            border: none;
            height: 16px;
            width: 16px;
            border-radius: 50%;
            background: #555;
            margin-top: -5px;
            position: relative;
            z-index: 10000;
        }

        input[type=range]:focus {
            outline: none;
        }

        .full-range,
        .incl-range {
            width: 100%;
            height: 5px;
            left: 0;
            top: 21px;
            position: absolute;
            background: #DDD;
        }

        .incl-range {
            background: #D19C97;
        }

        .custom-col {
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
        }
        .pagination li.active a {
            background-color: #007bff;
            color: white;
        }
        .pagination li a {
            cursor: pointer;
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
            <form id="searchForm" action="">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Tìm kiếm" id="searchInput">
                    <div class="input-group-append">
                <span class="input-group-text bg-transparent text-primary">
                    <i class="fa fa-search"></i>
                </span>
                    </div>
                </div>
            </form>
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
                    <c:if test="${soLuong > 0}">
                            <span class="totalQuantityCart"
                                  style="display: flex; justify-content: center; align-items: center">${soLuong}</span>
                    </c:if>
                    <c:if test="${soLuong == null}">
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
                <h4 class="modal-title text-center text-info w-100">ĐĂNG NHẬP</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="login-form-wrapper">
                    <form id="login-form" class="form" action="/cua-hang/login" method="post" modelAttribute="khachHangDTO">
                        <div class="form-group">
                            <label for="taiKhoan" class="text-info">Tài khoản:</label><br>
                            <input placeholder="Tài khoản" type="text" id="taiKhoan" name="taiKhoan"
                                   value="${khachHangDTO.taiKhoan}" class="form-control">
                            <small id="taiKhoanError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <label for="matKhau" class="text-info">Mật khẩu:</label><br>
                            <input placeholder="Mật khẩu" type="password" id="matKhau" name="matKhau"
                                   value="${khachHangDTO.matKhau}" class="form-control">
                            <small id="matKhauError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" class="btn btn-info btn-md w-100" value="Đăng nhập">
                        </div>
                        <div id="register-link" class="text-right">
                            <a href="#" class="text-info " data-toggle="modal" data-target="#registerModal"
                               data-dismiss="modal">Đăng ký tài khoản</a>
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
                <h4 class="modal-title text-center text-info w-100">ĐĂNG KÝ TÀI KHOẢN</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="register-form-wrapper">
                    <form id="register-form" class="form" action="/cua-hang/register" method="post" modelAttribute="khachHangDTO">
                        <div class="form-group">
                            <label for="registerUsername" class="text-info">Tài khoản:</label><br>
                            <input placeholder="Tài khoản" type="text" id="registerUsername" name="taiKhoan"
                                   class="form-control" value="${khachHangDTO.taiKhoan}">
                            <small id="registerUsernameError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <label for="registerEmail" class="text-info">Email:</label><br>
                            <input placeholder="Email" type="text" id="registerEmail" name="email"
                                   class="form-control" value="${khachHangDTO.email}">
                            <small id="registerEmailError" class="text-danger"></small>
                        </div>
                        <input type="hidden" name="checkDangKy" id="checkDangKy" value="1">
                        <div class="form-group">
                            <label for="registerPhone" class="text-info">Số điện thoại:</label><br>
                            <input placeholder="Số điện thoại" type="text" id="registerPhone" name="sdt"
                                   class="form-control" value="${khachHangDTO.sdt}">
                            <small id="registerPhoneError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <label for="registerPassword" class="text-info">Mật khẩu:</label><br>
                            <input placeholder="Mật khẩu" type="password" id="registerPassword" name="matKhau"
                                   class="form-control" value="${khachHangDTO.matKhau}">
                            <small id="registerPasswordError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <label for="registerPassword" class="text-info">Nhập lại mật khẩu:</label><br>
                            <input placeholder="Nhập lại mật khẩu" type="password" id="nhapLaiMatKhau" name="nhapLaiMatKhau"
                                   class="form-control" value="">
                            <small id="nhapLaiMatKhauError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" class="btn btn-info btn-md w-100" value="Đăng ký">
                        </div>
                        <div id="login-link" class="text-right">
                            <a href="#" class="text-info " data-toggle="modal" data-target="#loginModal"
                               data-dismiss="modal">Quay về đăng nhập</a>
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
<div id="header-carousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item" style="height: 410px;">
            <img class="img-fluid" src="/view_ban_hang/img/LDP_PRIMIUM.webp" alt="Image">
        </div>
        <div class="carousel-item active" style="height: 410px;">
            <img class="img-fluid" src="/view_ban_hang/img/cover1.png" alt="Image">
        </div>
    </div>
    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
        <div class="btn btn-dark" style="width: 45px; height: 45px;">
            <span class="carousel-control-prev-icon mb-n2"></span>
        </div>
    </a>
    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
        <div class="btn btn-dark" style="width: 45px; height: 45px;">
            <span class="carousel-control-next-icon mb-n2"></span>
        </div>
    </a>
</div>
<!-- Page Header End -->


<!-- Shop Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
            <form id="filter" method="post" action="/trang-chu/filter">
                <!-- Color Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Màu sắc</h5>
                    <c:forEach varStatus="i" items="${listMauSac}" var="mauSac">
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input color-filter" id="color_${mauSac.ten}"
                                   value="${mauSac.ten}">
                            <label class="custom-control-label" for="color_${mauSac.ten}">${mauSac.ten}</label>
                        </div>
                    </c:forEach>
                </div>
                <!-- Color End -->

                <!-- Size Start -->
                <div class="mb-5">
                    <h5 class="font-weight-semi-bold mb-4">Kích thước</h5>
                    <c:forEach varStatus="i" items="${listKichThuoc}" var="kichThuoc">
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input size-filter" id="size_${kichThuoc.ten}"
                                   value="${kichThuoc.ten}">
                            <label class="custom-control-label" for="size_${kichThuoc.ten}">${kichThuoc.ten}</label>
                        </div>
                    </c:forEach>

                </div>
                <!-- Size End -->

                <!-- Kiểu tay Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Kiểu tay</h5>
                    <c:forEach varStatus="i" items="${listKieuTay}" var="kieuTay">
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input style-filter" id="style_${kieuTay.ten}"
                                   value="${kieuTay.ten}">
                            <label class="custom-control-label" for="style_${kieuTay.ten}">${kieuTay.ten}</label>
                        </div>
                    </c:forEach>
                </div>
                <!-- Kiểu tay End -->

                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Đơn giá</h5>
                    <section class="range-slider container">
                        <span class="output outputOne"></span>
                        <span class="output outputTwo"></span>
                        <span class="full-range"></span>
                        <span class="incl-range"></span>
                        <input id="minGiaBan" name="rangeOne" type="range">
                        <input id="maxGiaBan" name="rangeTwo" type="range">
                    </section>
                </div>
                <!-- Price End -->
            </form>
        </div>
        <!-- Shop Sidebar End -->

        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId"
                                    data-toggle="dropdown" aria-haspopup="true" style="position: relative; left: 900px;"
                                    aria-expanded="false">
                                Sắp sếp theo
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                <a class="dropdown-item" id="shortDonGiaTang">Đơn giá tăng dần</a>
                                <a class="dropdown-item" id="shortDonGiaGiam">Đơn giá giảm dần</a>
                                <a class="dropdown-item" id="shortTop5">Top 5 sản phẩm bán chạy</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="row" id="product-container">
                        <c:forEach varStatus="i" items="${listSanPhamRes}" var="sp">
                            <a href="/cua-hang/detail-san-pham/${sp.idCTSP}" style="text-decoration: none">
                                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                    <div class="card product-item border-0 mb-2">
                                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                            <img style="width: 100%; height: 370px;" class="img-fluid w-100"
                                                 src="/image/${sp.hinhAnh1}" alt="">
                                        </div>
                                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3"
                                             style="margin-top: -10px; margin-bottom: -12px">
                                            <h6 class="text-truncate mb-2">${sp.tenSP}</h6>
                                            <h6 class="text-truncate mb-2" style="font-family: auto">${sp.maSP}</h6>
                                        </div>
                                        <div class="card-footer d-flex justify-content-between bg-light border float-start"
                                             style="margin-top: -3px; margin-bottom: -3px">
                                            <div class="d-flex justify-content-center mb-0" style="margin-bottom: 3px">
                                                <h6>
                                                    <fmt:formatNumber value="${sp.giaBan}" type="currency"
                                                                      currencySymbol="₫"/>
                                                    <span style="font-size: 16px; text-decoration: underline"></span>
                                                </h6>
                                            </div>
                                            <a href="/cua-hang/detail-san-pham/${sp.idCTSP}"
                                               class="btn btn-sm text-dark p-0">
                                                <i class="fas fa-eye text-primary mr-1"></i>Chi tiết
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>

                </div>

                <div class="col-12 pb-1">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center mb-3" id="pagination"></ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const searchForm = document.getElementById('searchForm');
        const searchInput = document.getElementById('searchInput');

        searchForm.addEventListener('submit', (event) => {
            event.preventDefault(); // Ngăn chặn việc gửi form mặc định

            const searchTerm = searchInput.value.trim();

            if (searchTerm) {
                // Thực hiện tìm kiếm sản phẩm nếu giá trị tìm kiếm không rỗng
                paginate(1);
            }
        });

        // Các mã khác của bạn...

        const products = [];
        <c:forEach items="${listCTSPRes}" var="ctsp">
        products.push({
            idCTSP: '${ctsp.idCTSP}',
            idSP: '${ctsp.idSP}',
            maSP: '${ctsp.maSP}',
            tenSanPham: '${ctsp.tenSanPham}',
            tenMauSac: '${ctsp.tenMauSac}',
            tenKichThuoc: '${ctsp.tenKichThuoc}',
            tenKieuTay: '${ctsp.tenKieuTay}',
            tenChatLieu: '${ctsp.tenChatLieu}',
            soLuong: '${ctsp.soLuong}',
            giaBan: parseFloat('${ctsp.giaBan}'),
            hinhAnh1: '${ctsp.hinhAnh1}'
        });
        </c:forEach>

        console.log(products)

        const listCTHD = [];
        <c:forEach items="${listCTHDByTT}" var="cthd">
        listCTHD.push({
            id: '${cthd.id}',
            idCTSP: '${cthd.idCTSP.id}',
            idSP: '${cthd.idCTSP.idSanPham.id}',
            soLuong: parseInt('${cthd.soLuong}', 10)
        });
        </c:forEach>

        const totalQuantities = {};
        listCTHD.forEach(cthd => {
            if (!totalQuantities[cthd.idSP]) {
                totalQuantities[cthd.idSP] = 0;
            }
            totalQuantities[cthd.idSP] += cthd.soLuong;
        });

        const sortedTotalQuantities = Object.entries(totalQuantities)
            .map(([idSP, soLuong]) => ({ idSP, soLuong }))
            .sort((a, b) => b.soLuong - a.soLuong);

        const top5Products = sortedTotalQuantities.slice(0, 5).map(item => item.idSP);

        const colorFilters = document.querySelectorAll('.color-filter');
        const sizeFilters = document.querySelectorAll('.size-filter');
        const styleFilters = document.querySelectorAll('.style-filter');
        const minPriceInput = document.getElementById('minGiaBan');
        const maxPriceInput = document.getElementById('maxGiaBan');
        const itemsPerPage = 9;

        const filterProducts = () => {
            const selectedColors = Array.from(colorFilters).filter(cb => cb.checked).map(cb => cb.value);
            const selectedSizes = Array.from(sizeFilters).filter(cb => cb.checked).map(cb => cb.value);
            const selectedStyles = Array.from(styleFilters).filter(cb => cb.checked).map(cb => cb.value);
            const minPrice = parseFloat(minPriceInput.value) || 0;
            const maxPrice = parseFloat(maxPriceInput.value) || Infinity;
            const searchTerm = searchInput.value.toLowerCase();

            const filteredProducts = products.filter(product => {
                const matchesColor = selectedColors.length === 0 || selectedColors.includes(product.tenMauSac);
                const matchesSize = selectedSizes.length === 0 || selectedSizes.includes(product.tenKichThuoc);
                const matchesStyle = selectedStyles.length === 0 || selectedStyles.includes(product.tenKieuTay);
                const matchesPrice = product.giaBan >= minPrice && product.giaBan <= maxPrice;
                const matchesSearch = product.tenSanPham.toLowerCase().includes(searchTerm) ||
                    product.tenMauSac.toLowerCase().includes(searchTerm) ||
                    product.tenKieuTay.toLowerCase().includes(searchTerm);
                return matchesColor && matchesSize && matchesStyle && matchesPrice && matchesSearch;
            });

            const uniqueProducts = [];
            const seenSPIds = new Set();
            for (const product of filteredProducts) {
                if (!seenSPIds.has(product.idSP)) {
                    uniqueProducts.push(product);
                    seenSPIds.add(product.idSP);
                }
            }

            return uniqueProducts;
        };

        const displayProducts = (products, pageNumber = 1) => {
            const productContainer = document.getElementById('product-container');
            productContainer.innerHTML = '';

            const startIndex = (pageNumber - 1) * itemsPerPage;
            const endIndex = Math.min(startIndex + itemsPerPage, products.length);
            const pageProducts = products.slice(startIndex, endIndex);

            pageProducts.forEach(sp => {
                const soldQuantity = totalQuantities[sp.idSP] || 0;
                const productHTML =
                    '<a href="/cua-hang/detail-san-pham/' + sp.idCTSP + '" style="text-decoration: none">' +
                    '<div class="col-lg-4 col-md-6 col-sm-12 pb-1 custom-col">' +
                    '<div class="card product-item border-0 mb-2">' +
                    '<div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">' +
                    '<img style="width: 100%; height: 370px;" class="img-fluid w-100" src="/image/' + sp.hinhAnh1 + '" alt="">' +
                    '</div>' +
                    '<div class="card-body border-left border-right text-center p-0 pt-4 pb-3" style="margin-top: -10px; margin-bottom: -12px">' +
                    '<h6 class="text-truncate mb-2">' + sp.tenSanPham + " " + sp.tenKieuTay + " " + sp.tenChatLieu + '</h6>' +
                    '<h6 class="text-truncate mb-2" style="font-family: auto">' + sp.maSP + '</h6>' +
                    '<p class="text-truncate mb-2">Đã bán: ' + soldQuantity + '</p>' +
                    '</div>' +
                    '<div class="card-footer d-flex justify-content-between bg-light border float-start" style="margin-top: -3px; margin-bottom: -3px">' +
                    '<div class="d-flex justify-content-center mb-0" style="margin-bottom: 3px">' +
                    '<h6>' +
                    new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(sp.giaBan) +
                    '<span style="font-size: 16px; text-decoration: underline"></span>' +
                    '</h6>' +
                    '</div>' +
                    '<a href="/cua-hang/detail-san-pham/' + sp.idCTSP + '" class="btn btn-sm text-dark p-0">' +
                    '<i class="fas fa-eye text-primary mr-1"></i>Chi tiết' +
                    '</a>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</a>';
                productContainer.insertAdjacentHTML('beforeend', productHTML);
            });

            const paginationHtml = generatePagination(products.length, pageNumber);
            document.getElementById('pagination').innerHTML = paginationHtml;
        };

        const generatePagination = (totalItems, currentPage) => {
            const totalPages = Math.ceil(totalItems / itemsPerPage);
            let paginationHtml = '';

            if (currentPage > 1) {
                paginationHtml +=
                    '<li class="page-item">' +
                    '<a class="page-link" href="#" onclick="paginate(' + (currentPage - 1) + '); return false;" aria-label="Previous">' +
                    '<span aria-hidden="true">&laquo;</span>' +
                    '<span class="sr-only">Previous</span>' +
                    '</a>' +
                    '</li>';
            } else {
                paginationHtml +=
                    '<li class="page-item disabled">' +
                    '<a class="page-link" href="#" aria-label="Previous">' +
                    '<span aria-hidden="true">&laquo;</span>' +
                    '<span class="sr-only">Previous</span>' +
                    '</a>' +
                    '</li>';
            }

            for (let i = 1; i <= totalPages; i++) {
                paginationHtml +=
                    '<li class="page-item ' + (i === currentPage ? 'active' : '') + '">' +
                    '<a class="page-link" href="#" onclick="paginate(' + i + '); return false;">' + i + '</a>' +
                    '</li>';
            }

            if (currentPage < totalPages) {
                paginationHtml +=
                    '<li class="page-item">' +
                    '<a class="page-link" href="#" onclick="paginate(' + (currentPage + 1) + '); return false;" aria-label="Next">' +
                    '<span aria-hidden="true">&raquo;</span>' +
                    '<span class="sr-only">Next</span>' +
                    '</a>' +
                    '</li>';
            } else {
                paginationHtml +=
                    '<li class="page-item disabled">' +
                    '<a class="page-link" href="#" aria-label="Next">' +
                    '<span aria-hidden="true">&raquo;</span>' +
                    '<span class="sr-only">Next</span>' +
                    '</a>' +
                    '</li>';
            }

            return paginationHtml;
        };

        const paginate = (pageNumber) => {
            const filteredProducts = filterProducts();
            displayProducts(filteredProducts, pageNumber);
        };

        window.paginate = paginate;

        const sortProductsByPriceAscending = () => {
            const sortedProducts = filterProducts().sort((a, b) => a.giaBan - b.giaBan);
            displayProducts(sortedProducts);
        };

        const sortProductsByPriceDescending = () => {
            const sortedProducts = filterProducts().sort((a, b) => b.giaBan - a.giaBan);
            displayProducts(sortedProducts);
        };

        const displayTop5Products = () => {
            const filteredProducts = filterProducts();
            const top5FilteredProducts = filteredProducts
                .filter(product => top5Products.includes(product.idSP))
                .sort((a, b) => totalQuantities[b.idSP] - totalQuantities[a.idSP]);
            displayProducts(top5FilteredProducts);
        };

        document.getElementById('shortDonGiaTang').addEventListener('click', sortProductsByPriceAscending);
        document.getElementById('shortDonGiaGiam').addEventListener('click', sortProductsByPriceDescending);
        document.getElementById('shortTop5').addEventListener('click', displayTop5Products);

        colorFilters.forEach(cb => cb.addEventListener('change', () => paginate(1)));
        sizeFilters.forEach(cb => cb.addEventListener('change', () => paginate(1)));
        styleFilters.forEach(cb => cb.addEventListener('change', () => paginate(1)));
        minPriceInput.addEventListener('input', () => paginate(1));
        maxPriceInput.addEventListener('input', () => paginate(1));
        searchInput.addEventListener('input', () => paginate(1));

        // Hiển thị ban đầu
        paginate(1);
    });
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>

<hr>

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
</body>
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
    listKhachHang.push({
        taiKhoan: '${kh.taiKhoan}',
        email: '${kh.email}',
        sdt: '${kh.sdt}',
    });
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
            var usernameRegex = /^[a-zA-Z0-9]{6,40}$/;
            if (!username) {
                $('#registerUsernameError').text('Vui lòng nhập username.');
                $('#registerUsername').addClass('border-danger');
                hasError = true;
            } else if (!usernameRegex.test(username)) {
                $('#registerUsernameError').text('Tài khoản phải từ 6 đến 40 ký tự và không chứa ký tự đặc biệt.');
                $('#registerUsername').addClass('border-danger');
                hasError = true;
            } else if (listKhachHang.some(kh => kh.taiKhoan == username)) {
                $('#registerUsernameError').text('Tên tài khoản đã tồn tại');
                $('#registerUsername').addClass('border-danger');
                hasError = true;
            }

            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!email) {
                $('#registerEmailError').text('Vui lòng nhập email.');
                $('#registerEmail').addClass('border-danger');
                hasError = true;
            } else if (!emailRegex.test(email)) {
                $('#registerEmailError').text('Email không hợp lệ.');
                $('#registerEmail').addClass('border-danger');
                hasError = true;
            } else if (listKhachHang.some(kh => kh.email == email)) {
                $('#registerEmailError').text('Email đã tồn tại.');
                $('#registerEmail').addClass('border-danger');
                hasError = true;
            }

            var phoneRegex = /^(0|\+84)[3-9][0-9]{8}$/;
            if (!phone) {
                $('#registerPhoneError').text('Vui lòng nhập số điện thoại.');
                $('#registerPhone').addClass('border-danger');
                hasError = true;
            } else if (!phoneRegex.test(phone)) {
                $('#registerPhoneError').text('Số điện thoại không hợp lệ.');
                $('#registerPhone').addClass('border-danger');
                hasError = true;
            } else if (listKhachHang.find(kh => {
                if (kh.sdt == phone) {
                    if (kh.taiKhoan != "") {
                        $('#registerPhoneError').text('Số điện thoại đã được sử dụng đăng ký tài khoản!');
                        $('#registerPhone').addClass('border-danger');
                        hasError = true;
                    } else {
                        $('#checkDangKy').val(0);
                    }
                }
            })) {}

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
<script>
    // Giả sử sliderConfig được lấy từ controller
    const sliderConfig = {
        min: 100000,
        max: '${maxGiaBan}'
    };

    var rangeOne = document.querySelector('input[name="rangeOne"]');
    var rangeTwo = document.querySelector('input[name="rangeTwo"]');
    var outputOne = document.querySelector('.outputOne');
    var outputTwo = document.querySelector('.outputTwo');
    var inclRange = document.querySelector('.incl-range');

    // Gán giá trị min và max cho các slider
    rangeOne.min = sliderConfig.min;
    rangeOne.max = sliderConfig.max;
    rangeTwo.min = sliderConfig.min;
    rangeTwo.max = sliderConfig.max;

    rangeOne.value = sliderConfig.min;
    rangeTwo.value = sliderConfig.max;

    function formatCurrency(value) {
        return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function updateView() {
        // Định dạng giá trị hiển thị
        outputOne.innerHTML = formatCurrency(rangeOne.value);
        outputTwo.innerHTML = formatCurrency(rangeTwo.value);

        // Cập nhật vị trí của các chỉ số giá trị
        outputOne.style.left = (rangeOne.value - rangeOne.min) / (rangeOne.max - rangeOne.min) * 100 + '%';
        outputTwo.style.left = (rangeTwo.value - rangeTwo.min) / (rangeTwo.max - rangeTwo.min) * 100 + '%';

        // Cập nhật chiều rộng và vị trí của phần tử incl-range
        if (parseInt(rangeOne.value) > parseInt(rangeTwo.value)) {
            inclRange.style.width = (rangeOne.value - rangeTwo.value) / (rangeTwo.max - rangeTwo.min) * 100 + '%';
            inclRange.style.left = (rangeTwo.value - rangeOne.min) / (rangeTwo.max - rangeTwo.min) * 100 + '%';
        } else {
            inclRange.style.width = (rangeTwo.value - rangeOne.value) / (rangeTwo.max - rangeTwo.min) * 100 + '%';
            inclRange.style.left = (rangeOne.value - rangeOne.min) / (rangeTwo.max - rangeOne.min) * 100 + '%';
        }
    }

    function syncSliders() {
        let minValue = parseInt(rangeOne.value);
        let maxValue = parseInt(rangeTwo.value);

        if (minValue > maxValue) {
            rangeOne.value = maxValue;
            minValue = maxValue;
        }

        if (maxValue < minValue) {
            rangeTwo.value = minValue;
            maxValue = minValue;
        }

        // Cập nhật lại giá trị sau khi điều chỉnh
        updateView();
    }

    document.addEventListener('DOMContentLoaded', function () {
        updateView();

        rangeOne.addEventListener('input', function () {
            syncSliders();
        });

        rangeTwo.addEventListener('input', function () {
            syncSliders();
        });
    });
</script>
</html>