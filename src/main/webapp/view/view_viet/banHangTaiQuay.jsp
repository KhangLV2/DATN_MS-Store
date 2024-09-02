<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--    Thêm thư viện SweetAlert2 để thiển thị thông báo--%>
<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MSStore_Tại quầy</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/view_admin/css/sb-admin-2.min.css" rel="stylesheet">

    <%--Link Ajax --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">


    <style>
        .table-scroll{
            height: 340px;
            overflow: scroll;
        }

        ::-webkit-scrollbar {
            width: 10px;
            background-color: lightgray;
        }

        ::-webkit-scrollbar-thumb {
            background-color: rgb(238, 234, 234);
            border-radius: 5px;
        }
    </style>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">MS - Store</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <c:choose>
            <c:when test="${sessionScope.userRole == 'Quản lý'}">
                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="/ban-hang-tai-quay">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Bán hàng tại quầy</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/ban-hang-tai-quay/admin/ban-tai-quay">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Thống kê doanh thu</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/hoa-don/hien-thi">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Quản lý đơn hàng</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/hoa-don/hien-thi">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Quản lý hóa đơn</span></a>
                </li>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Quản lý sản phẩm</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="buttons.html">Màu sắc, kích thước các thứ</a>
                            <a class="collapse-item" href="cards.html">Cards</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/store/quan-ly-nhan-vien">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Quản lý nhân viên</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/store/quan-ly-khach-hang">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Quản lý khách hàng</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="/ban-hang-tai-quay">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Bán hàng tại quầy</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/hoa-don/hien-thi">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Quản lý hóa đơn</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Quản lý khách hàng</span></a>
                </li>
            </c:otherwise>
        </c:choose>

    </ul>

    <!--   -----------   -->
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                               aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell fa-fw"></i>
                            <!-- Counter - Alerts -->
                            <span class="badge badge-danger badge-counter">3+</span>
                        </a>
                        <!-- Dropdown - Alerts -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">
                                Alerts Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 12, 2019</div>
                                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-success">
                                        <i class="fas fa-donate text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 7, 2019</div>
                                    $290.29 has been deposited into your account!
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-warning">
                                        <i class="fas fa-exclamation-triangle text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 2, 2019</div>
                                    Spending Alert: We've noticed unusually high spending for your account.
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                        </div>
                    </li>

                    <!-- Nav Item - Messages -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-envelope fa-fw"></i>
                            <!-- Counter - Messages -->
                            <span class="badge badge-danger badge-counter">7</span>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="messagesDropdown">
                            <h6 class="dropdown-header">
                                Message Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                         alt="...">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div class="font-weight-bold">
                                    <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                        problem I've been having.
                                    </div>
                                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                         alt="...">
                                    <div class="status-indicator"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">I have the photos that you ordered last month, how
                                        would you like them sent to you?
                                    </div>
                                    <div class="small text-gray-500">Jae Chun · 1d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                         alt="...">
                                    <div class="status-indicator bg-warning"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Last month's report looks great, I am very happy with
                                        the progress so far, keep up the good work!
                                    </div>
                                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                         alt="...">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                        told me that people say this to all dogs, even if they aren't good...
                                    </div>
                                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">${nv.hoTen} | ${nv.idCV.ten}</span>
                            <img class="img-profile rounded-circle"
                                 src="/imageUser/${nv.anhDaiDien}">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="/store/tai-khoan-cua-toi/${nv.id}">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Tài khoản của tôi
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/store/dang-xuat" id="dang-xuat" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Đăng xuất
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>


            <!-- Bán hàng tại quầy -->
            <div class="container-fluid">
                <div class="container">
                    <div class="row">
                        <div class="col-8">
                            <div>
                                <h3 class="float-start">Hóa đơn</h3>
                                <form action="/ban-hang-tai-quay/add-hoa-don" method="post" style="float: right;" class="float-end">
                                    <button type="submit" class="btn btn-success">+ Tạo hóa đơn</button>
                                </form>
                            </div>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã hóa đơn</th>
                                    <th>Nhân viên</th>
                                    <th>Khách hàng</th>
                                    <th>Ngày tạo</th>
                                    <th>Trạng thái</th>
                                    <th>Chi tiết</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach varStatus="i" items="${listHoaDon}" var="hoaDon">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td>${hoaDon.ma}</td>
                                        <td>${hoaDon.idNhanVien.hoTen}</td>
                                        <td>
                                            <c:if test="${hoaDon.idKhachHang.id==null}">Khách lẻ</c:if>
                                            <c:if test="${hoaDon.idKhachHang.id!=null}">${hoaDon.idKhachHang.hoTen}</c:if>
                                        </td>
                                        <td>${hoaDon.ngayTao}</td>
                                        <td>${hoaDon.trangThai==0?"Chua thanh toan":"Da thanh toan"}</td>
                                        <td>
                                            <a href="/ban-hang-tai-quay/detail-hoa-don/${hoaDon.id}"
                                               class="btn btn-primary">
                                                <i class="bi bi-eye-fill"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!-- Giỏ hàng -->
                            <h3>Giỏ hàng</h3>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã Hóa Đơn</th>
                                    <th>Mã SP</th>
                                    <th>Tên SP</th>
                                    <th colspan="2">Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Thành tiền</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody id="tbl_hd_cho">
<%--                                <c:forEach varStatus="i" items="${listHDCT}" var="hdct">--%>
<%--                                    <tr>--%>
<%--                                        <td>${i.index+1}</td>--%>
<%--                                        <td>${hdct.idHoaDon.ma}</td>--%>
<%--                                        <td>${hdct.idCTSP.idSanPham.ma}</td>--%>
<%--                                        <td>${hdct.idCTSP.idSanPham.ten}</td>--%>
<%--                                        <td style="display: flex; align-items: center;">--%>
<%--                                            <form class="d-flex" method="post" action="/ban-hang-tai-quay/update-sl/${hdct.idCTSP.id}">--%>
<%--                                                <input type="hidden" name="idHoaDon" value="${hoaDon.id}">--%>
<%--                                                <input class="form-control me-2" type="text" name="soLuong" value="${hdct.soLuong}" style="width: 45px">--%>
<%--                                                <button class="btn btn-light" type="submit">--%>
<%--                                                    <i class="bi bi-pencil"></i>--%>
<%--                                                </button>--%>
<%--                                            </form>--%>

<%--                                        </td>--%>
<%--                                        <td>${hdct.donGia}</td>--%>
<%--                                        <td>${hdct.soLuong*hdct.donGia}</td>--%>
<%--                                        <td>--%>
<%--                                            <form action="/ban-hang-tai-quay/delete-hdct/${hdct.id}" method="post">--%>
<%--                                                <input type="hidden" name="idHoaDon" value="${hoaDon.id}">--%>
<%--                                                <button class="btn btn-danger" type="submit">Delete</button>--%>
<%--                                            </form>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>
                                </tbody>
                            </table>
                        </div>

                        <div class="col-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">HÓA ĐƠN</h5>
                                    <form method="POST" action="/ban-hang-tai-quay/thanh-toan/${hoaDon.id}">
                                        <div class="row mb-3">
                                            <label class="col-sm-4 col-form-label">Mã hóa đơn</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" value="${hoaDon.ma}"/>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-4 col-form-label">Ngày tạo</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="ngayTao"
                                                       value="${hoaDon.ngayTao}">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-4 col-form-label">Tên khách hàng</label>
                                            <div class="col-sm-5">

                                                <c:if test="${hoaDon.idKhachHang.id==null}">

                                                    <input type="text" class="form-control"  value="Khách lẻ" readonly>
                                                </c:if>

                                                <c:if test="${hoaDon.idKhachHang.id!=null}">
                                                    <input type="text" class="form-control"  value="${hoaDon.idKhachHang.hoTen}" readonly>
                                                </c:if>

                                                <%--                                                <input type="text" class="form-control"  value="${hoaDon.idKhachHang.hoTen}" readonly>--%>
                                            </div>

                                            <%--   Modal thêm nhanh khách hàng--%>
                                            <a class="col-sm-1 " data-bs-toggle="modal" data-bs-target="#exampleModal2"
                                               style="padding-right: 0px;margin-top: 7px">
                                                <i class="bi bi-person-plus" style="font-size: 25px;padding: 0px"></i>
                                            </a>

                                            <a class="col-sm-1" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                               href="#" style="padding-right: 0px;margin-top: 7px">
                                                <i class=" bi bi-folder-plus col-3" style="font-size: 25px;padding: 0px"></i>
                                            </a>
                                        </div>

                                        <div class="row mb-3">
                                            <label class="col-sm-4 col-form-label">Mã giảm giá</label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control"
                                                       value="${hoaDon.idKhuyenMai.ma}" readonly>
                                            </div>
                                            <%--  Modal chọn mã giảm giá  --%>
                                            <a class="col-sm-3 btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3"
                                               style="height: 38px;width: 79px;">
                                                + Chọn
                                            </a>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-4 col-form-label">Sđt</label>
                                            <div class="col-sm-5">

                                                <c:if test="${hoaDon.idKhachHang.id==null}">

                                                    <input type="text" class="form-control"  value="Khách lẻ" readonly>
                                                </c:if>

                                                <c:if test="${hoaDon.idKhachHang.id!=null}">
                                                    <input type="text" class="form-control"  value="${hoaDon.idKhachHang.sdt}" readonly>
                                                </c:if>

                                                <%--                                                <input type="text" class="form-control"  value="${hoaDon.idKhachHang.hoTen}" readonly>--%>
                                            </div>

                                            <%--   Modal thêm nhanh khách hàng--%>
                                            <a class="col-sm-1 " data-bs-toggle="modal" data-bs-target="#exampleModal2"
                                               style="padding-right: 0px;margin-top: 7px">
                                                <i class="bi bi-person-plus" style="font-size: 25px;padding: 0px"></i>
                                            </a>

                                            <a class="col-sm-1" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                               href="#" style="padding-right: 0px;margin-top: 7px">
                                                <i class=" bi bi-folder-plus col-3" style="font-size: 25px;padding: 0px"></i>
                                            </a>
                                        </div>

                                        <div class="row mb-3">
                                            <label class="col-sm-4 col-form-label">Tổng tiền</label>
                                            <div class="col-sm-8">
                                                <input id="tongTien" type="number" class="form-control"
                                                       value="${tongTien-hoaDon.idKhuyenMai.soTienGiam}"
                                                       value="${tongTien}"
                                                       readonly/>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-4 col-form-label">Tiền khách đưa</label>
                                            <div class="col-sm-6">
                                                <input id="tienKhachDua" class="form-control" type="number" required>
                                                <span id="errTraLai" style="color: red"></span>
                                            </div>

                                            <i id="calculateChangeButton" class=" col-sm-2 bi bi-chevron-double-down"
                                               style="font-size: 20px" onclick="calculateChange()"></i>

                                        </div>

                                        <div class="row mb-3">
                                            <label class="col-sm-4 col-form-label">Trả lại</label>
                                            <div class="col-sm-8">
                                                <input id="tienTraLai" type="number" class="form-control" required
                                                       readonly>

                                            </div>
                                        </div>
                                        <div class="row mb-3 mt-4 justify-content-end text-end">
                                            <div class="col-sm-10">
                                                <button type="submit" class="btn btn-success ">THANH TOÁN</button>
                                            </div>
                                        </div>
                                    </form>
                                    <!-- End General Form Elements -->
                                </div>
                            </div><!-- End Recent Activity -->
                        </div>
                    </div>


                    <%--          --%>
                    <div class="row">
                        <div class="col col-12">
                            <!-- Sản phẩm -->
                            <h3>Chi tiết sản phẩm</h3>

                            <div class="row">
                                <div class="col col-5">
                                    <form method="post" action="/ban-hang-tai-quay/search">
                                        <div class="input-group mb-3">
                                            <input type="text" name="search" class="form-control"
                                                   placeholder="Tìm kiếm theo mã sản phẩm, màu sắc,..."
                                                   aria-label="Recipient's username" aria-describedby="button-addon2">
                                            <button class="btn btn-primary" type="submit" id="button-addon2">Tìm kiếm
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>


                            <form method="post" action="/ban-hang-tai-quay/filter">
                                <div class="row">
                                    <div class="col col-md-2">
                                        <div class="input-group mb-3">
                                            <div class="dropdown">
                                                <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                        id="dropdownMenuButton1" data-bs-toggle="dropdown"
                                                        aria-expanded="false">
                                                    Chọn sản phẩm
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                                    <c:forEach items="${listSanPham}" var="sanPham">
                                                        <li><a class="dropdown-item"
                                                               href="/ban-hang-tai-quay/locSPCTBySanPham/${sanPham.id}">${sanPham.ten}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col col-md-2">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                                                Chọn màu sắc
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                                                <c:forEach items="${listMauSac}" var="mauSac">
                                                    <li><a class="dropdown-item" href="/ban-hang-tai-quay/locSPCTByMauSac/${mauSac.id}">${mauSac.ten}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col col-md-2">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton3" data-bs-toggle="dropdown" aria-expanded="false">
                                                Chọn kích thước
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
                                                <c:forEach items="${listKichThuoc}" var="kichThuoc">
                                                    <li><a class="dropdown-item" href="/ban-hang-tai-quay/locSPCTByKichThuoc/${kichThuoc.id}">${kichThuoc.ten}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col col-md-2">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton4" data-bs-toggle="dropdown" aria-expanded="false">
                                                Chọn chất liệu
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton4">
                                                <c:forEach items="${listChatLieu}" var="chatLieu">
                                                    <li><a class="dropdown-item" href="/ban-hang-tai-quay/locSPCTByChatLieu/${chatLieu.id}">${chatLieu.ten}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col col-md-2">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton5" data-bs-toggle="dropdown" aria-expanded="false">
                                                Chọn kiểu tay
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton5">
                                                <c:forEach items="${listKieuTay}" var="kieuTay">
                                                    <li><a class="dropdown-item" href="/ban-hang-tai-quay/locSPCTByKieuTay/${kieuTay.id}">${kieuTay.ten}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                    <%--                                    <div class="col col-2">--%>
                                    <%--                                        <button type="submit" class="btn btn-primary float-start">Lọc</button>--%>
                                    <%--                                        <a href="/ban-hang-tai-quay/ban-tai-quay" class="btn btn-danger float-start">Hủy</a>--%>
                                    <%--                                    </div>--%>

                                </div>
                            </form>


                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã</th>
                                    <th>Tên SP</th>
                                    <th>Màu sắc</th>
                                    <th>Kích thước</th>
                                    <th>Chất liệu</th>
                                    <th>Kiểu tay</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Trạng thái</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody id="tbl_ds_spct">

                                </tbody>
                            </table>
                            <div class="float-end">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <c:if test="${listCTSP.number > 0}">
                                            <li class="page-item"><a class="page-link"
                                                                     href="/ban-hang-tai-quay?page=${listCTSP.number - 1}">Trước</a>
                                            </li>
                                        </c:if>
                                        <li class="page-item"><a class="page-link" href="#">${listCTSP.number + 1}</a>
                                        </li>
                                        <c:if test="${listCTSP.number+1 < listCTSP.totalPages}">
                                            <li class="page-item"><a class="page-link"
                                                                     href="/ban-hang-tai-quay?page=${listCTSP.number + 1}">Sau</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
            <!--  Kết thúc bán hàng tại quầy  -->

        </div>

        <!-- Modal mã giảm giá -->
        <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false" >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h5 class="modal-title" id="exampleModalLabel2">Mã giảm giá</h5>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Tên</th>
                                <th>Giảm tối đa</th>
                                <%--                                <th>Áp dụng</th>--%>
                                <th>Chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listKM}" var="km">
                                <tr>
                                    <td>${km.ma}</td>
                                    <td>${km.ten}</td>
                                    <td>${km.soTienGiam}</td>
                                        <%--                                    <td>--%>
                                        <%--                                        <c:if test="${km.soTienGiam==200}">--%>
                                        <%--                                           2.000.000 VNĐ--%>
                                        <%--                                        </c:if>--%>
                                        <%--                                        <c:if test="${km.soTienGiam==100}">--%>
                                        <%--                                            1.000.000 VNĐ--%>
                                        <%--                                        </c:if>--%>
                                        <%--                                        <c:if test="${km.soTienGiam==20}">--%>
                                        <%--                                            500.000 VNĐ--%>
                                        <%--                                        </c:if>--%>
                                        <%--                                    </td>--%>
                                    <td>
                                        <form action="/ban-hang-tai-quay/find-khuyen-mai/${km.id}" method="post">
                                            <input type="hidden" name="idHoaDon" value="${hoaDon.id}">
                                                <%--                                            <input type="hidden" name="maHoaDon" value="${hoaDon.ma}">--%>
                                                <%--                                            <input type="hidden" class="form-control" name="ngayTao" value="${hoaDon.ngayTao}">--%>
                                            <button class="btn btn-primary" type="submit">
                                                <i class="bi bi-plus-square"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>

        <%--        Modal thêm nhanh khách hàng--%>

        <!-- Modal khách hàng -->
        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h5 class="modal-title" id="exampleModalLabel3">Thêm khách hàng</h5>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form method="post" action="/ban-hang-tai-quay/create">
                            <div class="mb-3 mt-3">
                                <label for="email" class="form-label">Họ tên khách hàng:</label>
                                <input type="text" class="form-control" id="email" name="hoTen">
                            </div>
                            <div class="mb-3">
                                <label for="pwd" class="form-label">Số điện thoại:</label>
                                <input type="text" class="form-control" id="pwd" name="sdt">
                            </div>

                            <input type="hidden" name="idHoaDon" value="${hoaDon.id}">

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>

        <!-- Modal khách hàng -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false" >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h5 class="modal-title" id="exampleModalLabel4">Danh sách khách hàng</h5>
                        </div>

                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>


                    </div>
                    <div class="modal-body">
                        <input oninput="searchByName(this)" type="text" name="txt" class="form-control" placeholder="Tìm kiếm theo tên khách hàng,số điện thoại"
                               aria-label="Recipient's username" aria-describedby="button-addon2" style="margin-bottom: 20px">

                        <div class="table-scroll">
                            <table class="table table-hover" id="contentAjax">
                                <thead>
                                <tr>
                                    <th>Tên khách hàng</th>
                                    <th>Số điện thoại</th>
                                    <th>Chọn</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pageData.content}" var="kh">
                                    <tr>
                                        <td>${kh.hoTen}</td>
                                        <td>${kh.sdt}</td>
                                        <td>
                                            <form action="/ban-hang-tai-quay/find-kh/${kh.id}" method="post">
                                                <input type="hidden" name="idHoaDon" value="${hoaDon.id}">
                                                <input type="hidden" name="maHoaDon" value="${hoaDon.ma}">
                                                <input type="hidden" class="form-control" name="ngayTao" value="${hoaDon.ngayTao}">
                                                <button class="btn btn-primary" type="submit">
                                                    <i class="bi bi-plus-square"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <%--                Phân trang--%>

                        <%--                        <div>--%>
                        <%--                            <ul class="pagination">--%>
                        <%--                                <c:if test="${pageData.number>0}">--%>
                        <%--                                    <li class="page-item" ><a id="modalLink" class="page-link" href="/ban-hang-tai-quay/detail-hoa-don/${hoaDon.id}?page=${pageData.number - 1}" >Previous</a></li>--%>
                        <%--                                </c:if>--%>
                        <%--                                <c:forEach begin="1" end="${total}" var="i">--%>
                        <%--                                    <li class="page-item ${pageData.number==i-1?"active":""}"><a id="modalLinkYoutube" href="/ban-hang-tai-quay/detail-hoa-don/${hoaDon.id}?page=${i-1}" id="modalLink2" class="page-link">${i}</a></li>--%>
                        <%--                                </c:forEach>--%>

                        <%--                                <c:if test="${pageData.number<total-1}">--%>
                        <%--                                    <li class="page-item"><a class="page-link" href="/ban-hang-tai-quay/detail-hoa-don/${hoaDon.id}?page=${pageData.number + 1}" id="modalLink3" >Next</a></li>--%>
                        <%--                                </c:if>--%>
                        <%--                            </ul>--%>
                        <%--                        </div>--%>

                    </div>
                </div>
            </div>
        </div>
        <%--End--%>
        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>MS - Store</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>

</div>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<%--<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"--%>
<%--     aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel1">Bạn có chắc chắn muốn đăng xuất không?</h5>--%>
<%--                <button class="close" type="button" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">×</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">Chọn "Đăng xuất" bạn sẽ thoát khỏi trang này!</div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>--%>
<%--                <a class="btn btn-primary" href="/store/dang-xuat">Đăng xuất</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<!-- Bootstrap core JavaScript-->
<script src="/view_admin/vendor/jquery/jquery.min.js"></script>
<script src="/view_admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/view_admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/view_admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/view_admin/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/view_admin/js/demo/chart-area-demo.js"></script>
<script src="/view_admin/js/demo/chart-pie-demo.js"></script>

</body>

<script>
    const loadDsHDCT = (idHD) => {
        // get api + scpt.id
        let datatest = "data testing";
        fetch("/ban-hang-tai-quay/api/lst-hdct/${idHD}", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let html = '';
                resp.map((hdct,i)=>{
                    const text = "html${hdct.id}";
                    const id = hdct.id || 'N/A';
                    const maSanPham = hdct.idCTSP && hdct.idCTSP.idSanPham ? hdct.idCTSP.idSanPham.ma : 'N/A';
                    const tenSanPham = hdct.idCTSP && hdct.idCTSP.idSanPham ? hdct.idCTSP.idSanPham.ten : 'N/A';
                    const soLuong = hdct ? hdct.soLuong : 'N/A';
                    const giaBan = hdct.idCTSP ? hdct.idCTSP.giaBan : 'N/A';
                    const thanhTien = soLuong*giaBan;
                    const maHD = hdct.idHoaDon ? hdct.idHoaDon.ma : 'N/A';
                    const idCTSP = hdct.idCTSP ? hdct.idCTSP.id : 'N/A';
                    const idHoaDon = hdct.idHoaDon ? hdct.idHoaDon.id : 'N/A';
                    html +=  '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' + maHD + '</td>'+
                        '<td>' + maSanPham + '</td>' +
                        '<td>' + tenSanPham + '</td>' +
                        '<td colspan="2" style="display: flex; align-items: center;">' +
                        '<form class="d-flex" method="post" action="/ban-hang-tai-quay/update-sl/' + (idCTSP) + '">' +
                        '<input type="hidden" name="idHoaDon" value="' + idHoaDon + '">' +
                        '<input class="form-control me-2" type="text" name="soLuong" value="' + (soLuong) + '" style="width: 45px">' +
                        '<button class="btn btn-light" type="submit">' +
                        '<i class="bi bi-pencil"></i>' +
                        '</button>' +
                        '</form>' +
                        '</td>' +
                        '<td>' + giaBan + '</td>' +
                        '<td>' + thanhTien + '</td>' +
                        '<td>' +
                        '<td>' +
                        '<form action="/ban-hang-tai-quay/delete-hdct/' + id + '" method="post">' +
                        '<input type="hidden" name="idHoaDon" value="' + idHoaDon + '">' +
                        '<button class="btn btn-danger" type="submit">Delete</button>' +
                        '</form>' +
                        '</td>' +//editing
                        '</td>' +
                        '</tr>';
                });
                $("#tbl_hd_cho").html(html)
            });
    }
    const loadDsCTSP = () => {
        // get api + scpt.id
        let datatest = "data testing";
        fetch("/ban-hang-tai-quay/api/lst-spct", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let html = '';
                resp.map((spct,i)=>{
                    const maSanPham = spct.idSanPham && spct.idSanPham.ma || 'N/A';
                    const tenSanPham = spct.idSanPham && spct.idSanPham.ten || 'N/A';
                    const tenMauSac = spct.idMauSac && spct.idMauSac.ten || 'N/A';
                    const tenKichThuoc = spct.idKichThuoc && spct.idKichThuoc.ten || 'N/A';
                    const tenChatLieu = spct.idChatLieu && spct.idChatLieu.ten || 'N/A';
                    const tenKieuTay = spct.idKieuTay && spct.idKieuTay.ten || 'N/A';
                    const soLuong = spct.soLuong || 'N/A';
                    const giaBan = spct.giaBan || 'N/A';
                    const trangThai = spct.trangThai == 1 ? "Còn hàng" : "Hết hàng";
                    html += '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' + maSanPham + '</td>' +
                        '<td>' + tenSanPham + '</td>' +
                        '<td>' + tenMauSac + '</td>' +
                        '<td>' + tenKichThuoc + '</td>' +
                        '<td>' + tenChatLieu + '</td>' +
                        '<td>' + tenKieuTay + '</td>' +
                        '<td>' + soLuong + '</td>' +
                        '<td>' + giaBan + '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td><button id="add_sp_gio_hang_' + spct.id + '" class="btn btn-success">+</button></td>' +
                        '</tr>';
                });
                $("#tbl_ds_spct").html(html)
            });
    }
    loadDsHDCT();
    loadDsCTSP();
    $(document).on('click', "button[id^='add_sp_gio_hang_']", e => {
        e.preventDefault();
        const queryString = window.location.pathname;
        const pathParts = queryString.split('/');
        const variable1 = pathParts[pathParts.length - 1];
        const spctid = e.currentTarget.id.replace("add_sp_gio_hang_", "");
        const apiGet = "/ban-hang-tai-quay/api/get-spct/"+spctid;
        let spctLocal = [];
        fetch(apiGet, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                console.log("test response spct: ", resp);
                spctLocal =resp;
                const apiAdd = "/ban-hang-tai-quay/api/add-hdct/"+variable1+"/"+spctid+"/"+resp.giaBan;
                fetch(apiAdd, {
                    method: "post",
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    }
                }).then( (response) => {
                    console.log(response);
                    loadDsHDCT(variable1);
                    loadDsCTSP()
                });
            });
        console.log("test spct local: ", spctLocal);

    })
    function searchByName(param){
        var txtSearch = param.value;
        console.log(txtSearch);
        $.ajax({
            url: "/ban-hang-tai-quay/search/${hoaDon.id}",
            type: "POST",
            data: {
                txt:txtSearch
            },
            success: function (data) {
                // var row = document.getElementById("content");
                // row.innerHTML = data;
                $('#contentAjax').empty()
                $('#contentAjax').append(data);

                console.log(data);
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    <%--    --%>
    function calculateChange() {
        var tongTien = parseInt('${tongTien}');
        var tienKhachDua = parseInt(document.getElementById('tienKhachDua').value);
        console.log(tongTien);
        console.log(tienKhachDua);

        var tienTraLai = tienKhachDua - tongTien;
        console.log(tienTraLai);
        var thongBao = document.getElementById("errTraLai");
        if (isNaN(tienKhachDua)) {
            thongBao.textContent = "Vui lòng nhập số tiền hợp lệ.";
            return false;
        }

        if (tienKhachDua == "" || tienKhachDua < tongTien) {
            function calculateChange() {
                var tongTien = parseFloat('${tongTien}');
                var tienKhachDua = parseFloat(document.getElementById('tienKhachDua').value);
                var tienTraLai = tienKhachDua - tongTien;
                var thongBao = document.getElementById("errTraLai");
                if (isNaN(tienKhachDua)) {
                    thongBao.textContent = "Vui lòng nhập số tiền hợp lệ.";
                    // alert('Vui lòng nhập số tiền hợp lệ.');
                    return false;
                }

                if (tienKhachDua < tongTien) {
                    thongBao.textContent = "Số tiền khách đưa phải lớn hơn hoặc bằng tổng tiền.";
                    // alert('Số tiền khách đưa phải lớn hơn hoặc bằng tổng tiền.');
                    document.getElementById('tienTraLai').value = "";
                    return false;
                }

                // Hiển thị số tiền trả lại trong trường "Trả lại"

                document.getElementById('tienTraLai').value = tienTraLai;
                thongBao.textContent="";
                return true;
            }

            <%--function validatePayment() {--%>
            <%--    var tienKhachDua = document.getElementById("tienKhachDua").value;--%>
            <%--    var tongTien = parseFloat('${tongTien}');--%>
            <%--    if (tienKhachDua === "" || tienKhachDua < tongTien) {--%>
            <%--        thongBao.textContent = thongBao.textContent = "Vui lòng nhập số tiền khách đưa hợp lệ."--%>
            <%--        // alert("Vui lòng nhập số tiền khách đưa hợp lệ.");--%>
            <%--        document.getElementById('tienTraLai').value = "";--%>
            <%--        return false;--%>
            <%--    }--%>
            <%--    thongBao.textContent="";--%>
            <%--    return true;--%>
            <%--}--%>

            document.getElementById('tienTraLai').value = tienTraLai.toFixed(2);
        }

        function validatePayment() {
            var tienKhachDua = document.getElementById("tienKhachDua").value;
            var tongTien = parseFloat('${tongTien}');
            if (tienKhachDua === "" || tienKhachDua < tongTien) {
                thongBao.textContent = thongBao.textContent = "Vui lòng nhập số tiền khách đưa hợp lệ."
                // alert("Vui lòng nhập số tiền khách đưa hợp lệ.");
                document.getElementById('tienTraLai').value = "";
                return false;
            }
            return true;
        }

        function validateBeforeAddToCart() {
            // Kiểm tra xem hóa đơn đã được chọn chưa
            var selectedInvoiceId = document.getElementById("selectedInvoiceId").value;

            if (selectedInvoiceId === "") {
                alert("Vui lòng chọn hóa đơn trước khi thêm sản phẩm vào giỏ hàng.");
                return false; // Ngăn chặn sự kiện click nút "+"
            }

            return true; // Cho phép thêm sản phẩm vào giỏ hàng nếu đã chọn hóa đơn
        }
    }
</script>
<script>
    // Hiển thị thông báo thêm thành công hoặc thất bại sử dụng thư viện Sweet Alert2
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

    <c:if test="${not empty success}">
    Toast.fire({
        icon: "success",
        title: "${success}"
    });
    </c:if>

    <c:if test="${not empty error}">
    Toast.fire({
        icon: "error",
        title: "${error}"
    });
    </c:if>

    <c:if test="${not empty errorBillMax}">
    Toast.fire({
        icon: "warning",
        title: "${errorBillMax}"
    });
    </c:if>

    //Đăng xuất
    document.getElementById('dang-xuat').addEventListener('click', function(event) {
        event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

        Swal.fire({
            title: "Bạn có chắc chắn muốn đăng xuất không?",
            text: "Bạn sẽ không thể hoàn tác hành động này!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Đăng xuất!"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Đã đăng xuất!",
                    text: "Bạn đã đăng xuất thành công.",
                    icon: "success"
                }).then(() => {
                    // Điều hướng tới URL đăng xuất sau khi người dùng xác nhận
                    window.location.href = "/store/dang-nhap-view";
                });
            }
        });
    });



    // document.addEventListener("DOMContentLoaded", function () {
    //     const addButton = document.querySelector(".btn-bill");
    //     const currentHoaDonCount = parseInt(document.getElementById("currentHoaDonCount").value);
    //
    //     addButton.addEventListener("click", function (event) {
    //         event.preventDefault();
    //
    //         if (currentHoaDonCount >= 4) {
    //             Swal.fire({
    //                 icon: "warning",
    //                 title: "Bạn chỉ có thể tạo tối đa 5 đơn hàng",
    //                 toast: true,
    //                 position: "top-end",
    //                 showConfirmButton: false,
    //                 timer: 3000,
    //                 timerProgressBar: true
    //             });
    //         } else {
    //             document.getElementById("addHoaDonForm").submit();
    //         }
    //     });
    // });
</script>
</html>