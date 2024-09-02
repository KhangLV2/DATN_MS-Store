<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        .disabled-voucher {
            opacity: 0.4;
            pointer-events: none;
        }

        .disabled-voucher .voucher-button button {
            cursor: not-allowed;
        }

        .voucher-container {
            display: flex;
            flex-wrap: wrap;
            gap: 15px; /* Khoảng cách giữa các voucher */
            max-height: 377px; /* Hoặc bạn có thể đặt chiều cao mà bạn muốn */
            overflow-y: scroll;
            padding-right: 15px; /* Đảm bảo rằng thanh cuộn không che mất nội dung */
        }

        .voucher-card {
            border: 2px solid #007bff; /* Màu xanh của btn-primary */
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: calc(50% - 15px); /* Giảm chiều rộng để vừa 2 voucher trong 1 hàng */
        }

        .voucher-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #007bff; /* Màu xanh của btn-primary */
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .voucher-discount {
            color: #007bff; /* Màu xanh của btn-primary */
            font-size: 1.5em;
            font-weight: bold;
        }

        .voucher-expiry {
            font-size: 0.9em;
            color: #888;
        }

        .voucher-code {
            font-size: 1.2em;
            font-weight: bold;
            margin: 10px 0;
        }

        .voucher-button {
            text-align: center;
        }

        .voucher-button button {
            background-color: #007bff; /* Màu xanh của btn-primary */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .voucher-button button:hover {
            background-color: #0056b3; /* Màu xanh đậm hơn khi hover */
        }

        /* CSS cố định modal */
        .modal-fixed {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1050;
            display: none;
            width: 90%; /* Điều chỉnh kích thước modal */
            max-width: 500px; /* Giới hạn kích thước modal */
        }

        .modal-fixed.show {
            display: block;
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

        .modal-dialog {
            max-width: 500px;
            margin: 100px auto;
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
        .align-middle {
            vertical-align: middle !important;
        }

        .align-center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .align-center img {
            margin-right: 10px;
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
                    <form id="login-form" class="form" action="/cua-hang/login" method="post"
                          modelAttribute="khachHangDTO">
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
                    <form id="register-form" class="form" action="/cua-hang/register" method="post"
                          modelAttribute="khachHangDTO">
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
                            <input placeholder="Nhập lại mật khẩu" type="password" id="nhapLaiMatKhau"
                                   name="nhapLaiMatKhau"
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


<!-- Shop Start -->
<!-- Shop End -->
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">GIỎ HÀNG CỦA BẠN</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="/cua-hang/trang-chu">Trang chủ</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Giỏ hàng</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<!-- Giỏ hàng -->

<c:if test="${check == false}">
    <div class="container-fluid pt-7"
         style="font-family: 'Roboto Condensed', 'Helvetica Neue', Helvetica, Arial, sans-serif;">

        <div class="row px-xl-5">
            <div class="col-lg table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                    <tr>
                        <th>Ảnh</th>
                        <th>Sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Màu sắc</th>
                        <th>Kích thước</th>
                        <th>Đơn giá</th>
                        <th>Thành tiền</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <c:forEach var="i" items="${listGioHang}">
                        <tbody class="align-middle">
                        <c:if test="${i.soLuongCTSP == 0}">
                            <tr>
                                <td class="align-middle align-center"><img src="/image/${i.hinhAnh1}" alt=""
                                                                           style="width: 50px;"></td>
                                <td class="align-middle">${i.tenSanPham} -- <span class="text-danger">Hết hàng</span></td>
                                <td class="align-middle">
                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <a href="/cua-hang/giam-so-luong/${i.idHDCT}">
                                                <button type="button" class="btn btn-sm btn-primary btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </a>
                                        </div>
                                        <input type="text" class="form-control form-control-sm bg-secondary text-center"
                                               value="${i.soLuong}" readonly>
                                        <div class="input-group-btn">
                                            <a href="/cua-hang/tang-so-luong/${i.idHDCT}">
                                                <button type="button" class="btn btn-sm btn-primary btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td class="align-middle">${i.tenMauSac}</td>
                                <td class="align-middle">${i.tenKichThuoc}</td>
                                <td class="align-middle">
                                    <fmt:formatNumber value="${i.donGia}" type="currency" currencySymbol="₫"/>
                                </td>
                                <td class="align-middle">
                                    <fmt:formatNumber value="${i.soLuong*i.donGia}" type="currency" currencySymbol="₫"/>
                                </td>
                                <td class="align-middle">
                                    <a href="/cua-hang/delete/${i.idHDCT}">
                                        <button type="button" class="btn btn-sm btn-primary">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </a>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${i.soLuongCTSP < i.soLuong && i.soLuongCTSP != 0}">
                            <tr>
                                <td class="align-middle align-center"><img src="/image/${i.hinhAnh1}" alt=""
                                                                           style="width: 50px;"></td>
                                <td class="align-middle">${i.tenSanPham} -- <span class="text-danger">Không đủ hàng</span>
                                    <br> (Còn lại: <span class="font-weight-bold">${i.soLuongCTSP}</span> sản phẩm)</td>
                                <td class="align-middle">
                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <a href="/cua-hang/giam-so-luong/${i.idHDCT}">
                                                <button type="button" class="btn btn-sm btn-primary btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </a>
                                        </div>
                                        <input type="text" class="form-control form-control-sm bg-secondary text-center"
                                               value="${i.soLuong}" readonly>
                                        <div class="input-group-btn">
                                            <a href="/cua-hang/tang-so-luong/${i.idHDCT}">
                                                <button type="button" class="btn btn-sm btn-primary btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td class="align-middle">${i.tenMauSac}</td>
                                <td class="align-middle">${i.tenKichThuoc}</td>
                                <td class="align-middle">
                                    <fmt:formatNumber value="${i.donGia}" type="currency" currencySymbol="₫"/>
                                </td>
                                <td class="align-middle">
                                    <fmt:formatNumber value="${i.soLuong*i.donGia}" type="currency" currencySymbol="₫"/>
                                </td>
                                <td class="align-middle">
                                    <a href="/cua-hang/delete/${i.idHDCT}">
                                        <button type="button" class="btn btn-sm btn-primary">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </a>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${i.soLuongCTSP >= i.soLuong}">
                            <tr>
                                <td class="align-middle align-center"><img src="/image/${i.hinhAnh1}" alt=""
                                                                           style="width: 50px;"></td>
                                <td class="align-middle">${i.tenSanPham}</td>
                                <td class="align-middle">
                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <a href="/cua-hang/giam-so-luong/${i.idHDCT}">
                                                <button type="button" class="btn btn-sm btn-primary btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </a>
                                        </div>
                                        <input type="text" class="form-control form-control-sm bg-secondary text-center"
                                               value="${i.soLuong}" readonly>
                                        <div class="input-group-btn">
                                            <a href="/cua-hang/tang-so-luong/${i.idHDCT}">
                                                <button type="button" class="btn btn-sm btn-primary btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td class="align-middle">${i.tenMauSac}</td>
                                <td class="align-middle">${i.tenKichThuoc}</td>
                                <td class="align-middle">
                                    <fmt:formatNumber value="${i.donGia}" type="currency" currencySymbol="₫"/>
                                </td>
                                <td class="align-middle">
                                    <fmt:formatNumber value="${i.soLuong*i.donGia}" type="currency" currencySymbol="₫"/>
                                </td>
                                <td class="align-middle">
                                    <a href="/cua-hang/delete/${i.idHDCT}">
                                        <button type="button" class="btn btn-sm btn-primary">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </a>
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
        <!--Test modal-->
        <!--Danh sách địa chỉ-->
        <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addAddressModal"
                style="position: relative; left: 729px; bottom: -186px;">
            Chọn địa chỉ
        </button>
        <div class="modal fade" id="addAddressModal" tabindex="-1" role="dialog" aria-labelledby="addAddressModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addAddressModalLabel1">Địa chỉ của tôi</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <c:forEach var="i" items="${listDiaChi}">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12 form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault"
                                               id="flexRadioDefault${i.id}"
                                               data-ten-nguoi-nhan="${i.tenNguoiNhan}"
                                               data-sdt-nguoi-nhan="${i.sdtNguoiNhan}"
                                               data-dia-chi-chi-tiet="${i.diaChiChiTiet}"
                                               data-id-tinh-thanh="${i.idTinhThanh}"
                                               data-id-quan-huyen="${i.idQuanHuyen}"
                                               data-id-phuong-xa="${i.idPhuongXa}"
                                               data-id-tinh-thanh-test="${i.idT}"
                                               data-id-quan-huyen-test="${i.idQH}"
                                               data-id-phuong-xa-test="${i.idPX}"
                                               <c:if test="${i.trangThai == 1}">checked</c:if> onchange="chonDiaChi()">
                                        <label>
                                            <b>${i.tenNguoiNhan}</b> | ${i.sdtNguoiNhan}
                                        </label>
                                        <label>${i.diaChiChiTiet}, ${i.idPhuongXa}, ${i.idQuanHuyen}, ${i.idTinhThanh}</label>
                                        <br>
                                        <c:if test="${i.trangThai == 1}">
                                            <label style="color: red">Mặc định</label>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <%--                        <button type="submit" class=" btn btn-primary" id="chonDC" onclick="chonDiaChi()">Xác nhận</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--Thêm địa chỉ--%>
    <button type="button" class="btn btn-primary mb-3" data-toggle="modal"
            data-target="#addAddressModal1" style="position: relative; left: 855px; bottom: -132px;">
        <i class="bi bi-plus-circle"></i>
    </button>
    <div class="modal fade" id="addAddressModal1" tabindex="-1" role="dialog"
         aria-labelledby="addAddressModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="width: 880px; left: -173px; top: 40px">
                <div class="modal-header">
                    <h5 class="modal-title" id="addAddressModalLabel">Thêm địa chỉ mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/cua-hang/them-dia-chi-gio-hang" method="post" id="themDiaChi">
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
    <!-- End modal -->

    <!-- Thông tin giao hàng -->
    <form action="/cua-hang/thanh-toan" method="post" id="diaChiForm">
        <div class="row px-xl-5" style="margin-top: 100px">
            <div class="col-lg-8 table-responsive">
                <div class="container-fluid mb-10">
                    <h4 class="font-weight-semi-bold mb-4" style="margin-left: 50px">Thông tin giao hàng</h4>
                    <div class="row px-xl-5">
                        <div class="col-md-6 form-group">
                            <label><b>Họ tên</b></label>
                            <input class="form-control" type="text" name="tenNguoiNhan" id="tenNguoiNhan"
                                   value="${diaChi.tenNguoiNhan}" readonly
                                   style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                   placeholder="Họ tên">
                            <span id="tenNguoiNhanError" class="text-danger"></span>
                        </div>
                        <div class="col-md-6 form-group">
                            <label><b>Số điện thoại</b></label>
                            <input class="form-control" type="number" name="sdtNguoiNhan" id="sdtNguoiNhan"
                                   value="${diaChi.sdtNguoiNhan}" readonly
                                   style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                   placeholder="Số điện thoại">
                            <span id="sdtNguoiNhanError" class="text-danger"></span>
                        </div>
                        <div class="col-md-12 form-group">
                            <label><b>Địa chỉ</b></label>
                            <input class="form-control" type="text" name="diaChiChiTiet" id="diaChiChiTiet"
                                   value="${diaChi.diaChiChiTiet}" readonly
                                   style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                   placeholder="Địa chỉ">
                            <span id="diaChiChiTietError" class="text-danger"></span>
                        </div>
                        <div class="col-md-4 form-group">
                            <label><b>Tỉnh/Thành phố</b></label>
                            <select class="custom-select" id="tinh" name="tinh" title="Chọn Tỉnh Thành" disabled
                                    style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                <option value="${diaChi.idTinhThanh}">${diaChi.idTinhThanh}</option>
                            </select>
                            <span id="tinhError" class="text-danger"></span>
                        </div>
                        <div class="col-md-4 form-group">
                            <label><b>Quận/Huyện</b></label>
                            <select class="custom-select" id="quan" name="quan" title="Chọn Quận Huyện" disabled
                                    style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                <option value="${diaChi.idQuanHuyen}">${diaChi.idQuanHuyen}</option>
                            </select>
                            <span id="quanError" class="text-danger"></span>
                        </div>
                        <div class="col-md-4 form-group">
                            <label><b>Phường/Xã</b></label>
                            <select class="custom-select" id="phuong" name="phuong" title="Chọn Phường Xã" disabled
                                    style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                <option value="${diaChi.idPhuongXa}">${diaChi.idPhuongXa}</option>
                            </select>
                            <span id="phuongError" class="text-danger"></span>
                        </div>
                        <div class="col-md-12 form-group">
                            <label><b>Ghi chú</b></label>
                            <textarea class="form-control" type="textarea" name="ghiChu"
                                      style="background-color: #f1f1f1; border: 1px solid #e4e4e4;"
                                      placeholder="Ghi chú"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Checkout End -->

            <!-- Thông tin đơn hàng -->
            <div class="col-lg-4" style="background-color: white;">
                <div style="position: relative" class="input-group mb-4">
                    <input type="text" id="discountCode" class="form-control p-4"
                           style="background-color: #f1f1f1; border: 1px solid #e4e4e4;" placeholder="Mã giảm giá"
                           value="${hoaDon.idKhuyenMai.ma}"
                           readonly>
                    <a id="removeDiscountLink" href="/cua-hang/xoa-khuyen-mai/${hoaDon.idKhuyenMai.id}"
                       style="position: absolute;right: 144px;bottom: 5px; display: none;">
                        <button style="color: black" class="btn btn-outline-secondary" type="button">
                            <i class="fas fa-times"></i>
                        </button>
                    </a>
                    <div class="input-group-append">
                        <button id="openModalBtn" class="btn btn-primary" data-toggle="modal" data-target="#couponModal"
                                type="button">
                            Phiếu giảm giá
                        </button>
                    </div>
                </div>
                <div class="card mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Thông tin đơn hàng</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Tổng sản phẩm: </h6>
                            <h6 class="font-weight-medium" style="font-size: 18px">${soLuongGioHang}</h6>
                        </div>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Tổng tiền hàng: </h6>
                            <h6 class="font-weight-medium" style="font-size: 18px">
                                <fmt:formatNumber value="${tongTien}" type="currency" currencySymbol="₫"/>
                            </h6>
                        </div>
                        <c:if test="${hoaDon.idKhuyenMai.soTienGiam != null}">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <h6 class="font-weight-medium">Số tiền giảm: </h6>
                                <h6 class="font-weight-medium" style="font-size: 18px">
                                    <fmt:formatNumber value="${hoaDon.idKhuyenMai.soTienGiam}" type="currency"
                                                      currencySymbol="₫"/>
                                </h6>
                            </div>
                        </c:if>
                        <c:if test="${hoaDon.idKhuyenMai.soTienGiam == null}">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <h6 class="font-weight-medium">Số tiền giảm: </h6>
                                <h6 class="font-weight-medium" style="font-size: 18px">
                                    <fmt:formatNumber value="0" type="currency"
                                                      currencySymbol="₫"/>
                                </h6>
                            </div>
                        </c:if>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Phí vận chuyển: </h6>
                            <h6 class="price font-weight-medium" id="phiShip" style="font-size: 18px"></h6>
                            <input type="hidden" name="phiVanChuyen" value="" id="phiVanChuyen"/>
                        </div>
                        <div><p style="color: red">Phí ship mang tính chất tham khảo.</p></div>
                    </div>
                    <div class="card border-secondary">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Phương thức thanh toán</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <input class="custom-control-input" id="paypal" type="radio"
                                           name="phuongThucThanhToan" value="0" checked>
                                    <label class="custom-control-label" for="paypal">Thanh toán khi nhận
                                        hàng</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <input class="custom-control-input" id="directcheck" type="radio"
                                           name="phuongThucThanhToan" value="1">
                                    <label class="custom-control-label" for="directcheck">Thanh toán qua VNPay</label>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <c:if test="${hoaDon.idKhuyenMai.soTienGiam == null || tongTien > hoaDon.idKhuyenMai.soTienGiam}">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold" style="margin-left: 18px">Tổng thanh toán:</h5>
                                <h5 id="total-amount" class="font-weight-bold"
                                    style="margin-right: 18px; font-size: 22px"></h5>
                                <input type="hidden" name="tongTienThanhToan" value="" id="tongTienThanhToan"/>
                            </div>
                        </c:if>
                        <c:if test="${tongTien < hoaDon.idKhuyenMai.soTienGiam}">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold" style="margin-left: 18px">Tổng thanh toán:</h5>
                                <h5 id="total-amount1" class="font-weight-bold"
                                    style="margin-right: 18px; font-size: 22px">
                                    <fmt:formatNumber value="0" type="currency" currencySymbol="₫"/>
                                </h5>
                                <input type="hidden" name="tongTienThanhToan" value="0" id="tongTienThanhToan"/>
                            </div>
                        </c:if>

                        <div class="card-footer border-secondary bg-transparent">
                                <%--  Check sản phẩm tồn hết  --%>
                            <c:if test="${checkCTHDHetHang == true}">
                                <div class="alert alert-danger" role="alert">
                                    ${mess}
                                </div>
                                <button disabled type="submit" style="font-size: 26px" id="datHang"
                                        class="btn btn-block btn-primary my-3 py-3">
                                    <b>Không thể đặt hàng</b></button>
                            </c:if>
                            <c:if test="${checkCTHDHetHang == false}">
                                <button type="submit" style="font-size: 26px" id="datHang"
                                        class="btn btn-block btn-primary my-3 py-3">
                                    <b>Đặt hàng ngay</b></button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Modal phiếu giảm giá -->
    <div id="couponModal" class="modal-fixed">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style=" width: 950px; height: 540px; right: 230px; border-radius: 15px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="couponModalLabel">Phiếu giảm giá</h5>
                </div>
                <div class="modal-body">
                    <div class="voucher-container">
                        <c:forEach var="i" items="${listKhuyenMai}">
                            <div class="voucher-card ${i.apDung > tongTien ? 'disabled-voucher' : ''}">
                                <div class="voucher-header">
                                    <div class="voucher-discount">Giảm <fmt:formatNumber
                                            value="${i.soTienGiam}" type="currency"
                                            currencySymbol="₫"/></div>
                                    <div class="voucher-expiry">Hết hạn: ${i.ngayKetThuc}</div>
                                </div>
                                <div class="row">
                                    <div class="col-6 voucher-code">Mã: ${i.ma}</div>
                                    <c:if test="${i.apDung != null}">
                                        <div class="col-6 voucher-expiry"
                                             style="position: relative; text-align: end; top: 14px;">
                                            <strong>Áp dụng: <fmt:formatNumber value="${i.apDung}" type="currency"
                                                                                 currencySymbol="₫"/></strong></div>
                                    </c:if>
                                    <c:if test="${i.apDung == null}">
                                        <div class="col-6 voucher-expiry"
                                             style="position: relative; text-align: end; top: 14px;">
                                            <strong>Áp dụng: <fmt:formatNumber value="0" type="currency"
                                                                                 currencySymbol="₫"/></strong></div>
                                    </c:if>
                                </div>
                                <div class="voucher-button">
                                    <form action="/cua-hang/khuyen-mai/${i.id}" method="post">
                                        <button type="submit" ${i.apDung > tongTien ? 'disabled' : ''}>Xác nhận</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
</c:if>
<c:if test="${check == true}">
    <h3 style="text-align: center">Giỏ hàng không có sản phẩm</h3>
</c:if>

<!-- Cart End -->


<!-- Footer Start -->
<%@ include file="/view/BanHangOnline/footer.jsp" %>
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

    <c:if test="${not empty successMessage}">
    Toast.fire({
        icon: "success",
        title: "${successMessage}"
    });
    </c:if>

    <%--    Hiển thị thông báo thành công khi đăng nhập thất bại--%>
    <c:if test="${not empty error}">
    Toast.fire({
        icon: "error",
        title: "${error}"
    });
    </c:if>

    <%--    Hiển thị thông báo thành công khi đăng nhập thành công--%>


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
                $('#registerPhoneError').text('Số điện thoại không hợp lệ. Định dạng hợp lệ: bắt đầu với +84 hoặc 0 và theo sau là 9-10 chữ số.');
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
            })) {
            }

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
    //Thông tin giao hàng
    $(document).ready(function () {
        var token = '4787bafa-2157-11ef-a90d-aaf29aa34580';

        // Function to get JSON with token
        function getJSONWithToken(url, callback) {
            $.ajax({
                url: url,
                headers: {
                    'Token': token
                },
                success: callback,
                error: function (xhr, status, error) {
                    console.error("Error: " + error);
                }
            });
        }

        // Lấy tỉnh thành
        getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', function (data_tinh) {
            // Sắp xếp theo ProvinceID tăng dần
            data_tinh.data.sort(function (a, b) {
                return a.ProvinceID - b.ProvinceID;
            });

            $.each(data_tinh.data, function (key_tinh, val_tinh) {
                $("#tinh").append('<option value="' + val_tinh.ProvinceID + '" name="' + val_tinh.ProvinceName + '">' + val_tinh.ProvinceName + '</option>');
            });

            $("#tinh").change(function (e) {
                var idtinh = $(this).val();
                console.log("id tỉnh: " + idtinh);

                // Lấy quận huyện
                getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=' + idtinh, function (data_quan) {
                    $("#quan").html('<option value="0">Quận Huyện</option>');
                    $("#phuong").html('<option value="0">Phường Xã</option>');
                    $.each(data_quan.data, function (key_quan, val_quan) {
                        $("#quan").append('<option value="' + val_quan.DistrictID + '">' + val_quan.DistrictName + '</option>');
                    });

                    // Lấy phường xã
                    $("#quan").change(function (e) {
                        var idquan = $(this).val();
                        getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=' + idquan, function (data_phuong) {
                            $("#phuong").html('<option value="0">Phường Xã</option>');
                            $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                $("#phuong").append('<option value="' + val_phuong.WardCode + '">' + val_phuong.WardName + '</option>');
                            });
                        });
                    });
                });
            });
        });

        $("#diaChiForm").submit(function (e) {

            // Xóa các thông báo lỗi trước đó
            $(".text-danger").text("");

            var tenTinh = $("#tinh option:selected").text();
            var tenQuan = $("#quan option:selected").text();
            var tenPhuong = $("#phuong option:selected").text();
            var idTinhThanh = $("#tinh").val();
            var idQuanHuyen = $("#quan").val();
            var idPX = $("#phuong").val();

            $("<input>").attr({
                type: "hidden",
                name: "tenTinh",
                value: tenTinh
            }).appendTo("#diaChiForm");

            $("<input>").attr({
                type: "hidden",
                name: "tenQuan",
                value: tenQuan
            }).appendTo("#diaChiForm");

            $("<input>").attr({
                type: "hidden",
                name: "tenPhuong",
                value: tenPhuong
            }).appendTo("#diaChiForm");

            // Thêm phần kiểm tra tính hợp lệ của biểu mẫu
            var isValid = true;

            // Kiểm tra định dạng số điện thoại
            var phonePattern = /^(03|05|07|08|09)+([0-9]{8})$/;

            // Kiểm tra các trường bắt buộc
            if (!$("#tenNguoiNhan").val()) {
                isValid = false;
                $("#tenNguoiNhanError").text("Vui lòng nhập họ tên");
            } else if (!$("#sdtNguoiNhan").val()) {
                isValid = false;
                $("#sdtNguoiNhanError").text("Vui lòng nhập số điện thoại");
            } else if (!phonePattern.test($("#sdtNguoiNhan").val())) {
                isValid = false;
                $("#sdtNguoiNhanError").text("Số điện thoại không hợp lệ. Vui lòng nhập lại");
            } else if (!$("#diaChiChiTiet").val()) {
                isValid = false;
                $("#diaChiChiTietError").text("Vui lòng nhập địa chỉ chi tiết");
            } else if ($("#tinh").val() === "0") {
                isValid = false;
                $("#tinhError").text("Vui lòng chọn tỉnh/thành phố");
            } else if ($("#quan").val() === "0") {
                isValid = false;
                $("#quanError").text("Vui lòng chọn quận/huyện");
            } else if ($("#phuong").val() === "0") {
                isValid = false;
                $("#phuongError").text("Vui lòng chọn phường/xã");
            }

            if (isValid) {
                // Nếu hợp lệ, gửi biểu mẫu
                $("#diaChiForm")[0].submit();
            }
        });
    });

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


</script>

<%--Chuyển dữ liệu từ trên modal địa chỉ xuống form thông tin giao hàng--%>
<script>
    function chonDiaChi() {

        // Lấy tất cả các radio button trong modal
        const radios = document.querySelectorAll('#addAddressModal .form-check-input');

        // Tìm radio button đã được chọn
        let selectedRadio = null;
        radios.forEach(radio => {
            if (radio.checked) {
                selectedRadio = radio;
            }

        });

        // Nếu có radio button được chọn, lấy thông tin và cập nhật form
        if (selectedRadio) {
            const tenNguoiNhan = selectedRadio.getAttribute('data-ten-nguoi-nhan');
            const sdtNguoiNhan = selectedRadio.getAttribute('data-sdt-nguoi-nhan');
            const diaChiChiTiet = selectedRadio.getAttribute('data-dia-chi-chi-tiet');
            const idTinhThanh = selectedRadio.getAttribute('data-id-tinh-thanh');
            const idQuanHuyen = selectedRadio.getAttribute('data-id-quan-huyen');
            const idPhuongXa = selectedRadio.getAttribute('data-id-phuong-xa');

            //mơí
            const idTinhThanhTest = selectedRadio.getAttribute('data-id-tinh-thanh-test');
            const idQuanHuyenTest = selectedRadio.getAttribute('data-id-quan-huyen-test');
            const idPhuongXaTest = selectedRadio.getAttribute('data-id-phuong-xa-test');

            // Cập nhật giá trị các trường trong form thông tin giao hàng
            document.getElementById('tenNguoiNhan').value = tenNguoiNhan;
            document.getElementById('sdtNguoiNhan').value = sdtNguoiNhan;
            document.getElementById('diaChiChiTiet').value = diaChiChiTiet;

            // Cập nhật select box cho tỉnh, quận, phường
            const tinhSelect = document.getElementById('tinh');
            const quanSelect = document.getElementById('quan');
            const phuongSelect = document.getElementById('phuong');

            // Xóa các option cũ nếu cần thiết (tùy vào cách bạn load dữ liệu ban đầu)
            tinhSelect.innerHTML = '';
            quanSelect.innerHTML = '';
            phuongSelect.innerHTML = '';

            // Thêm option mới
            const tinhOption = document.createElement('option');
            tinhOption.value = idTinhThanh;
            tinhOption.text = idTinhThanh; // Hoặc tên của tỉnh, bạn có thể thay đổi nếu cần
            tinhSelect.add(tinhOption);

            const quanOption = document.createElement('option');
            quanOption.value = idQuanHuyen;
            quanOption.text = idQuanHuyen; // Hoặc tên của quận, bạn có thể thay đổi nếu cần
            quanSelect.add(quanOption);

            const phuongOption = document.createElement('option');
            phuongOption.value = idPhuongXa;
            phuongOption.text = idPhuongXa; // Hoặc tên của phường, bạn có thể thay đổi nếu cần
            phuongSelect.add(phuongOption);

            // Set giá trị cho select box
            tinhSelect.value = idTinhThanh;
            quanSelect.value = idQuanHuyen;
            phuongSelect.value = idPhuongXa;

            var token = '108bdaef-8395-11ee-af43-6ead57e9219a';
            var tongTien1 = parseFloat('${tongTien - hoaDon.idKhuyenMai.soTienGiam}');
            var tongTien2 = parseFloat('${tongTien}');
            var soLuongGioHang = ${soLuongGioHang}
                console.log("tongTien2: ", tongTien2);
            console.log("tongTien1: ", tongTien1);


// Function to get JSON with token
            function getJSONWithToken1(url, callback) {
                $.ajax({
                    url: url,
                    headers: {
                        'Token': token
                    },
                    success: callback,
                    error: function (xhr, status, error) {
                        console.error("Request Error: " + error);
                        console.error("Status: " + status);
                        console.error("Response: " + xhr.responseText);
                    }
                });
            }

            function getJSONWithToken(url, callback) {
                $.ajax({
                    url: url,
                    headers: {
                        'Token': token
                    },
                    success: callback,
                    error: function (xhr, status, error) {
                        console.error("Request Error: " + error);
                        console.error("Status: " + status);
                        console.error("Response: " + xhr.responseText);
                    }
                });
            }

// Tính phí ship
            getJSONWithToken1('https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services?shop_id=1244&to_district=' + idQuanHuyenTest + '&from_district=3440', function (data_maDV) {
                //console.log("API maDV: ", data_maDV.data[0].service_id); // Log the entire response
                var service_id = data_maDV.data[0].service_id;
                console.log("API maDV: ", service_id);

                console.log("Tổng sl: ", soLuongGioHang);

                var khoiLuong = soLuongGioHang * 200;
                console.log("Tổng kl: ", khoiLuong);

                getJSONWithToken('https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee?service_id=' + service_id + '&insurance_value=' + tongTien2 + '&from_district_id=3440&to_district_id=' + idQuanHuyenTest + '&to_ward_code=' + idPhuongXaTest + '&height=15&length=15&weight=' + khoiLuong + '&width=15', function (data_total) {

                    console.log("API Response: ", data_total.data.total); // Log the entire response

                    console.log("test data : ", data_total.data);

                    function formatVND(number) {
                        return number.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                    }


                    var firstFee = data_total.data.total

                    // Calculate the new total
                    var newTotal = tongTien1 + firstFee;

                    // Update the total amount in the DOM
                    $('#total-amount').text(newTotal.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));

                    // $("#totalAPI").val(firstFee); // Set the value of the input field with id 'totalAPI'
                    $("#phiShip").html(formatVND(firstFee));

                    var totalAmountNumber = newTotal;
                    $('#tongTienThanhToan').val(totalAmountNumber);

                    var phiVanChuyen = firstFee;
                    $('#phiVanChuyen').val(phiVanChuyen);

                });
            });
        }
        var listDC = document.getElementsByName('flexRadioDefault');
        for (var i = 0; i < listDC.length; i++) {
            listDC[i].addEventListener('change', function () {
                if (this.checked) {
                    // Hàm hiển thị thông báo
                    function showToast(type, message) {
                        Toast.fire({
                            icon: type,
                            title: message
                        });
                    }

                    showToast('success', 'Chọn địa chỉ thành công!');
                }
            });
        }
    }

    chonDiaChi();

    function showModal() {
        document.getElementById('couponModal').classList.add('show');
    }

    // JS để ẩn modal
    function hideModal() {
        document.getElementById('couponModal').classList.remove('show');
    }

    // Thêm sự kiện đóng modal vào nút "Đóng"
    document.querySelector('[data-dismiss="modal"]').addEventListener('click', hideModal);

    //fomat tiền

    function formatVND(number) {
        return number.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
    }


</script>

<script>
    function checkDiscountCode() {
        const discountCodeInput = document.getElementById('discountCode');
        const removeDiscountLink = document.getElementById('removeDiscountLink');

        if (discountCodeInput.value.trim() !== '') {
            removeDiscountLink.style.display = 'block';
        } else {
            removeDiscountLink.style.display = 'none';
        }
    }

    window.onload = checkDiscountCode;
</script>

<script>

    $(document).ready(function () {
        $('#datHang').click(function (e) {
            e.preventDefault(); // Ngăn chặn hành vi mặc định của nút Xác nhận

            Swal.fire({
                title: 'Bạn chắc chắn đặt hàng chứ ?',
                text: 'Xác nhận đơn hàng ?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#datHang').off('diaChiForm').submit();
                }
            });
        });
    });

</script>

</body>

</html>