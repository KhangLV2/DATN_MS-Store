<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
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
        .table-responsive {
            max-height: 420px;
            overflow-y: auto;
        }

        .table tbody {
            display: block;
            height: 135px;
            overflow-y: auto;
        }

        .table thead, .table tbody tr {
            display: table;
            width: 100%;
            table-layout: fixed;
        }

        .list-group-item.active {
            border-color: #007bff !important;
            /* Màu border khi mục được chọn */
        }

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
                <button class="btn btn-secondary bg-light" style="padding: 4px; font-size: 19px; margin-right: 3px"
                        type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-person-circle" style="color:#D19C97; margin: 5px"></i>
                </button>
                <ul class="dropdown-menu btn border" aria-labelledby="dropdownMenuButton1">
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
                            <li><a class="dropdown-item" href="#">Theo dõi đơn hàng</a></li>
                            <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li>
                            <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                            <li><a class="dropdown-item" href="/home/logout">Đăng xuất</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <div class="col-lg-3 col-6 text-right" style="position: relative">
                <a href="gio-hang" class="btn border">
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


<!-- Shop Start -->
<!-- Shop End -->
<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">GIỎ HÀNG CỦA BẠN</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Trang chủ</a></p>
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
                        <tr>
                            <td class="align-middle align-center"><img src="/image/${i.hinhAnh1}" alt=""
                                                                       style="width: 50px;">
                                    ${i.tenSanPham}
                            </td>
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
                                           value="${i.soLuong}">
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
                            <td class="align-middle">${i.donGia}</td>
                            <td class="align-middle">${i.soLuong*i.donGia}</td>
                            <td class="align-middle">
                                <a href="/cua-hang/delete/${i.idHDCT}">
                                    <button type="button" class="btn btn-sm btn-primary">
                                        <i class="fa fa-times"></i>
                                    </button>
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
        <!--Test modal-->
        <!--Danh sách địa chỉ-->
        <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addAddressModal">
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
                                    <div class="col-9 form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault"
                                               id="flexRadioDefault${i.id}"
                                               data-ten-nguoi-nhan="${i.tenNguoiNhan}"
                                               data-sdt-nguoi-nhan="${i.sdtNguoiNhan}"
                                               data-dia-chi-chi-tiet="${i.diaChiChiTiet}"
                                               data-id-tinh-thanh="${i.idTinhThanh}"
                                               data-id-quan-huyen="${i.idQuanHuyen}"
                                               data-id-phuong-xa="${i.idPhuongXa}"
                                               <c:if test="${i.trangThai == 1}">checked</c:if>>
                                        <label>
                                            <b>${i.tenNguoiNhan}</b> | ${i.sdtNguoiNhan}
                                        </label>
                                        <label>${i.diaChiChiTiet}, ${i.idPhuongXa}, ${i.idQuanHuyen}, ${i.idTinhThanh}</label>
                                        <c:if test="${i.trangThai == 1}">
                                            <label style="color: red">Mặc định</label>
                                        </c:if>
                                    </div>
                                    <div class="col-3">
                                        <a href="" class="update-address-link" style="color: #1571ff;"
                                           data-toggle="modal"
                                           data-target="#updateAddressModal${i.id}" data-address-id="1">
                                            Cập nhật
                                        </a>
                                        <div class="modal fade" id="updateAddressModal${i.id}" tabindex="-1"
                                             role="dialog"
                                             aria-labelledby="updateAddressModalLabel${i.id}" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="updateAddressModalLabel${i.id}">Cập
                                                            nhật địa chỉ</h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="/cua-hang/cap-nhat-dia-chi/${i.id}" method="post"
                                                              id="suaDiaChi${i.id}">
                                                            <div class="row px-xl-5">
                                                                <div class="col-md-6 form-group">
                                                                    <label><b>Họ tên</b></label>
                                                                    <input class="form-control" type="text"
                                                                           name="tenNguoiNhan" value="${i.tenNguoiNhan}"
                                                                           style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                                                           placeholder="Họ tên">
                                                                    <span class="error-message"
                                                                          style="color: red"></span>
                                                                </div>
                                                                <div class="col-md-6 form-group">
                                                                    <label><b>Số điện thoại</b></label>
                                                                    <input class="form-control" type="number"
                                                                           name="sdtNguoiNhan" value="${i.sdtNguoiNhan}"
                                                                           style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                                                           placeholder="Số điện thoại">
                                                                    <span class="error-message"
                                                                          style="color: red"></span>
                                                                </div>
                                                                <div class="col-md-12 form-group">
                                                                    <label><b>Địa chỉ</b></label>
                                                                    <input class="form-control" type="text"
                                                                           name="diaChiChiTiet"
                                                                           value="${i.diaChiChiTiet}"
                                                                           style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                                                           placeholder="Địa chỉ">
                                                                    <span class="error-message"
                                                                          style="color: red"></span>
                                                                </div>
                                                                <div class="col-md-4 form-group">
                                                                    <label><b>Tỉnh/Thành phố</b></label>
                                                                    <select class="custom-select"
                                                                            id="tenTT${i.id}" name="tenTT"
                                                                            title="Chọn Tỉnh Thành"
                                                                            style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                                                        <option value="${i.idTinhThanh}">${i.idTinhThanh}</option>
                                                                    </select>
                                                                    <span class="error-message"
                                                                          style="color: red"></span>
                                                                </div>
                                                                <div class="col-md-4 form-group">
                                                                    <label><b>Quận/Huyện</b></label>
                                                                    <select class="custom-select"
                                                                            id="tenQH${i.id}" name="tenQH"
                                                                            title="Chọn Quận Huyện"
                                                                            style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                                                        <option value="${i.idQuanHuyen}">${i.idQuanHuyen}</option>
                                                                    </select>
                                                                    <span class="error-message"
                                                                          style="color: red"></span>
                                                                </div>
                                                                <div class="col-md-4 form-group">
                                                                    <label><b>Phường/Xã</b></label>
                                                                    <select class="custom-select"
                                                                            id="tenPX${i.id}" name="tenPX"
                                                                            title="Chọn Phường Xã"
                                                                            style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                                                        <option value="${i.idPhuongXa}">${i.idPhuongXa}</option>
                                                                    </select>
                                                                    <span class="error-message"
                                                                          style="color: red"></span>
                                                                </div>
                                                            </div>
                                                            <button type="submit" id="" class=" btn btn-primary">
                                                                Cập nhật
                                                            </button>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Quay lại
                                                        </button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <a style="color: #ff3818" href="/cua-hang/xoa-dia-chi/${i.id}">Xóa</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class=" btn btn-primary" onclick="chonDiaChi()">Xác nhận</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--Thêm địa chỉ--%>
    <button type="button" class="btn btn-primary mb-3" data-toggle="modal"
            data-target="#addAddressModal1">
        + Thêm địa chỉ
    </button>
    <div class="modal fade" id="addAddressModal1" tabindex="-1" role="dialog"
         aria-labelledby="addAddressModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
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
                                   value="${diaChi.tenNguoiNhan}"
                                   style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                   placeholder="Họ tên">
                            <span id="tenNguoiNhanError" class="text-danger"></span>
                        </div>
                        <div class="col-md-6 form-group">
                            <label><b>Số điện thoại</b></label>
                            <input class="form-control" type="number" name="sdtNguoiNhan" id="sdtNguoiNhan"
                                   value="${diaChi.sdtNguoiNhan}"
                                   style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                   placeholder="Số điện thoại">
                            <span id="sdtNguoiNhanError" class="text-danger"></span>
                        </div>
                        <div class="col-md-12 form-group">
                            <label><b>Địa chỉ</b></label>
                            <input class="form-control" type="text" name="diaChiChiTiet" id="diaChiChiTiet"
                                   value="${diaChi.diaChiChiTiet}"
                                   style="background-color: #f1f1f1; border: 2px solid #e4e4e4;"
                                   placeholder="Địa chỉ">
                            <span id="diaChiChiTietError" class="text-danger"></span>
                        </div>
                        <div class="col-md-4 form-group">
                            <label><b>Tỉnh/Thành phố</b></label>
                            <select class="custom-select" id="tinh" name="tinh" title="Chọn Tỉnh Thành"
                                    style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                <option value="${diaChi.idTinhThanh}">${diaChi.idTinhThanh}</option>
                            </select>
                            <span id="tinhError" class="text-danger"></span>
                        </div>
                        <div class="col-md-4 form-group">
                            <label><b>Quận/Huyện</b></label>
                            <select class="custom-select" id="quan" name="quan" title="Chọn Quận Huyện"
                                    style="background-color: #f1f1f1; border: 1px solid #e4e4e4;">
                                <option value="${diaChi.idQuanHuyen}">${diaChi.idQuanHuyen}</option>
                            </select>
                            <span id="quanError" class="text-danger"></span>
                        </div>
                        <div class="col-md-4 form-group">
                            <label><b>Phường/Xã</b></label>
                            <select class="custom-select" id="phuong" name="phuong" title="Chọn Phường Xã"
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

            <div class="col-lg-4" style="background-color: white;">
                <div class="input-group mb-4">
                    <input type="text" id="discountCode" class="form-control p-4"
                           style="background-color: #f1f1f1; border: 1px solid #e4e4e4;" placeholder="Mã giảm giá">
                    <div class="input-group-append">
                        <button id="openModalBtn" class="btn btn-primary" data-toggle="modal" data-target="#couponModal"
                                type="button">
                            Phiếu giảm giá
                        </button>
                    </div>
                </div>

                <!-- The Modal -->
                <div id="couponModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="couponModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="couponModalLabel">Phiếu giảm giá</h5>
                            </div>
                            <div class="modal-body">
                                <c:forEach var="i" items="${listKhuyenMai}">
                                    <a href="javascript:void(0);"
                                       class="list-group-item list-group-item-action flex-column align-items-start"
                                       onclick="selectCoupon('${i.ma}', '${i.soTienGiam}')">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1">Giảm ${i.soTienGiam}</h5>
                                            <small>Hết hạn ${i.ngayKetThuc}</small>
                                        </div>
                                        <p class="mb-1">Mã: ${i.ma}</p>
                                    </a>
                                </c:forEach>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                <button type="button" class="btn btn-primary" onclick="confirmCoupon()">Xác nhận
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Thông tin đơn hàng</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Tổng sản phẩm: </h6>
                            <h6 class="font-weight-medium" style="font-size: 18px">${soLuong}</h6>
                        </div>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Tổng tiền hàng: </h6>
                            <h6 class="font-weight-medium" style="font-size: 18px">${tongTien}</h6>
                        </div>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Khuyến mại: </h6>
                            <h6 class="font-weight-medium" style="font-size: 18px" id="soTienGiam"></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Phí vận chuyển: </h6>
                            <h6 class="font-weight-medium" style="font-size: 18px">0₫</h6>
                        </div>
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
                                    <label class="custom-control-label" for="directcheck">QRCode qua VNPay</label>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold" style="margin-left: 18px">Tổng thanh toán:</h5>
                            <h5 class="font-weight-bold" id="tongThanhToan"
                                style="margin-right: 18px; font-size: 22px">${tongTien}₫</h5>
                        </div>

                        <div class="card-footer border-secondary bg-transparent">
                            <button type="submit" style="font-size: 26px"
                                    class="btn btn-block btn-primary my-3 py-3">
                                <b>Đặt hàng ngay</b></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</c:if>
<c:if test="${check == true}">
    <h3 style="text-align: center">Giỏ hàng không có sản phẩm</h3>
</c:if>

<!-- Cart End -->


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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
    <%--Validate Form đăng nhặp--%>
    $(document).ready(function () {
        // Bắt lỗi khi submit form
        $('#login-form').submit(function (event) {
            event.preventDefault(); // Ngăn form submit mặc định

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

            // Clear previous errors
            $('.text-danger').text('');
            $('.form-control').removeClass('border-danger');

            // Validate fields
            if (!username) {
                $('#registerUsernameError').text('Vui lòng nhập username.');
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
            }
            if (!phone) {
                $('#registerPhoneError').text('Vui lòng nhập số điện thoại.');
                $('#registerPhone').addClass('border-danger');
                hasError = true;
            } else if (!isValidVietnamesePhoneNumber(phone)) {
                $('#registerPhoneError').text('Số điện thoại không hợp lệ');
                $('#registerPhone').addClass('border-danger');
                hasError = true;
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


            // Check if username already exists
            <%--var registerErrors = '<%= request.getAttribute("registerErrors") %>';--%>
            <%--if (registerErrors !== 'null') {--%>
            <%--    $('#registerUsernameError').text(registerErrors);--%>
            <%--    $('#registerUsername').addClass('border-danger');--%>
            <%--    hasError = true;--%>
            <%--}--%>

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
            // Ngăn chặn gửi biểu mẫu ngay lập tức
            e.preventDefault();

            // Xóa các thông báo lỗi trước đó
            $(".text-danger").text("");

            var tenTinh = $("#tinh option:selected").text();
            var tenQuan = $("#quan option:selected").text();
            var tenPhuong = $("#phuong option:selected").text();

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
            var phonePattern = /^(03|05|07|08|09)+([0-9]{8})$/; // Định dạng số điện thoại 10 số bắt đầu 03, 05, 07, 08, 09.

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

        //Lấy tỉnh thành
        getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', function (data_tinh) {
            // Sắp xếp theo ProvinceID tăng dần
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

            // Kiểm tra Tên người nhận
            if ($("#tenNguoiNhan1").val().trim() === "") {
                $("#tenNguoiNhan1Error").text("Vui lòng nhập họ tên");
                isValid = false;
            }

            // Kiểm tra SĐT người nhận
            if ($("#sdtNguoiNhan1").val().trim() === "") {
                $("#sdtNguoiNhan1Error").text("Vui lòng nhập số điện thoại");
                isValid = false;
            }

            // Kiểm tra Địa chỉ
            if ($("#diaChiChiTiet1").val().trim() === "") {
                $("#diaChiChiTiet1Error").text("Vui lòng nhập địa chỉ chi tiết");
                isValid = false;
            }

            // Kiểm tra Tỉnh/Thành phố
            if ($("#tinhThanh").val() === "0") {
                $("#tinhThanhError").text("Vui lòng chọn Tỉnh/Thành phố.");
                isValid = false;
            }

            // Kiểm tra Quận/Huyện
            if ($("#quanHuyen").val() === "0") {
                $("#quanHuyenError").text("Vui lòng chọn Quận/Huyện.");
                isValid = false;
            }

            // Kiểm tra Phường/Xã
            if ($("#phuongXa").val() === "0") {
                $("#phuongXaError").text("Vui lòng chọn Phường/Xã.");
                isValid = false;
            }

            if (isValid) {
                var tenTinhThanh = $("#tinhThanh option:selected").text();
                var tenQuanHuyen = $("#quanHuyen option:selected").text();
                var tenPhuongXa = $("#phuongXa option:selected").text();

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
        }

        // Đóng modal
        $('#addAddressModal').modal('hide');
    }
</script>

<script>
    var selectedCouponCode = '';
    var soTienGiamJS = '';
    var tongTien = parseFloat('${tongTien}');

    function selectCoupon(code, soTienGiam) {
        selectedCouponCode = code;
        soTienGiamJS = soTienGiam;

    }

    function confirmCoupon() {
        if (selectedCouponCode !== '' || soTienGiamJS !== '') {
            document.getElementById('discountCode').value = selectedCouponCode;
            document.getElementById('soTienGiam').textContent = soTienGiamJS;
            $('#couponModal').modal('hide');
        }
    }
</script>
</body>

</html>