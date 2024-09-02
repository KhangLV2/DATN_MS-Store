<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
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
                                <button class="btn btn-primary w-100 px-5" data-toggle="modal" data-target="#loginModal">Đăng nhập
                                </button>
                            </a></li>

                            <li><a class="dropdown-item text-center mt-3 " href="#">
                                <button class="btn btn-primary w-100 px-5" data-toggle="modal" data-target="#registerModal">Đăng ký
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
            <a href="" class="btn border">
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge">0</span>
            </a>
        </div>
    </div>
</div>
<!-- Topbar End -->

<!-- Login Modal Start  (Modal Form đăng nhập)-->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
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
                    <form id="login-form" class="form" action="/home/login" method="post" modelAttribute="khachHangDTO">
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
                            <a href="#" class="text-info " data-toggle="modal" data-target="#registerModal" data-dismiss="modal">Register here</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Login Modal End -->

<!-- Registration Modal Start (Modal Form đăng ký) -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true"
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
                    <form id="register-form" class="form" action="/home/register" method="post"  modelAttribute="khachHangDTO">
                        <div class="form-group">
                            <label for="registerUsername" class="text-info">Username:</label><br>
                            <input placeholder="Username" type="text" id="registerUsername" name="taiKhoan"
                                   class="form-control"  value="${khachHangDTO.taiKhoan}">
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
                                   class="form-control"  value="${khachHangDTO.matKhau}">
                            <small id="registerPasswordError" class="text-danger"></small>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" class="btn btn-info btn-md w-100" value="Register">
                        </div>
                        <div id="login-link" class="text-right">
                            <a href="#" class="text-info " data-toggle="modal" data-target="#loginModal" data-dismiss="modal">Back to Login</a>
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
<!-- Page Header End -->


<!-- Shop Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
            <!-- Price Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="price-all">
                        <label class="custom-control-label" for="price-all">All Price</label>
                        <span class="badge border font-weight-normal">1000</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-1">
                        <label class="custom-control-label" for="price-1">$0 - $100</label>
                        <span class="badge border font-weight-normal">150</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-2">
                        <label class="custom-control-label" for="price-2">$100 - $200</label>
                        <span class="badge border font-weight-normal">295</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-3">
                        <label class="custom-control-label" for="price-3">$200 - $300</label>
                        <span class="badge border font-weight-normal">246</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-4">
                        <label class="custom-control-label" for="price-4">$300 - $400</label>
                        <span class="badge border font-weight-normal">145</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="price-5">
                        <label class="custom-control-label" for="price-5">$400 - $500</label>
                        <span class="badge border font-weight-normal">168</span>
                    </div>
                </form>

            </div>
            <!-- Price End -->

            <!-- Color Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="color-all">
                        <label class="custom-control-label" for="price-all">All Color</label>
                        <span class="badge border font-weight-normal">1000</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-1">
                        <label class="custom-control-label" for="color-1">Black</label>
                        <span class="badge border font-weight-normal">150</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-2">
                        <label class="custom-control-label" for="color-2">White</label>
                        <span class="badge border font-weight-normal">295</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-3">
                        <label class="custom-control-label" for="color-3">Red</label>
                        <span class="badge border font-weight-normal">246</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-4">
                        <label class="custom-control-label" for="color-4">Blue</label>
                        <span class="badge border font-weight-normal">145</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="color-5">
                        <label class="custom-control-label" for="color-5">Green</label>
                        <span class="badge border font-weight-normal">168</span>
                    </div>
                </form>
            </div>
            <!-- Color End -->

            <!-- Size Start -->
            <div class="mb-5">
                <h5 class="font-weight-semi-bold mb-4">Filter by size</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="size-all">
                        <label class="custom-control-label" for="size-all">All Size</label>
                        <span class="badge border font-weight-normal">1000</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-1">
                        <label class="custom-control-label" for="size-1">XS</label>
                        <span class="badge border font-weight-normal">150</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-2">
                        <label class="custom-control-label" for="size-2">S</label>
                        <span class="badge border font-weight-normal">295</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-3">
                        <label class="custom-control-label" for="size-3">M</label>
                        <span class="badge border font-weight-normal">246</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-4">
                        <label class="custom-control-label" for="size-4">L</label>
                        <span class="badge border font-weight-normal">145</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="size-5">
                        <label class="custom-control-label" for="size-5">XL</label>
                        <span class="badge border font-weight-normal">168</span>
                    </div>
                </form>
            </div>
            <!-- Size End -->
        </div>
        <!-- Shop Sidebar End -->


        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search by name">
                                <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                </div>
                            </div>
                        </form>
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId"
                                    data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                Sort by
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                <a class="dropdown-item" href="#">Latest</a>
                                <a class="dropdown-item" href="#">Popularity</a>
                                <a class="dropdown-item" href="#">Best Rating</a>
                            </div>
                        </div>
                    </div>
                </div>

                <c:forEach varStatus="i" items="${pageSP.content}" var="sp">
                    <a href="/store/detail-san-pham/${sp.idCTSP}" style="text-decoration: none">
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
                                        <h6>${sp.giaBan} <span
                                                style="font-size: 16px; text-decoration: underline">đ</span></h6>
                                    </div>
                                    <a href="/store/detail-san-pham/${sp.idCTSP}" class="btn btn-sm text-dark p-0"><i
                                            class="fas fa-eye text-primary mr-1"></i>Chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>


                <div class="col-12 pb-1">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center mb-3">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->


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

<%--Validate form--%>
<script>
    //  // Hiển thị thông báo thất bại nếu đăng nhập thất bại
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
            }
            else if (password.length < 6) {
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
        var errorUsernameExit= '<%= request.getAttribute("errorUsernameExit") %>';

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
</body>
</html>