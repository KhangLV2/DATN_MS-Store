<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600...700,700i"
            rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="index.html">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Thống kê doanh thu</span></a>
        </li>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="/store/admin/ban-tai-quay">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Bán hàng tại quầy</span></a>
        </li>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Quản lý đơn hàng</span></a>
        </li>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="charts.html">
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
            <a class="nav-link" href="charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Quản lý nhân viên</span></a>
        </li>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Quản lý khách hàng</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

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
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                            <img class="img-profile rounded-circle"
                                 src="/view_admin/img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Settings
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Activity Log
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>

            <div>
                <a href="/ban-hang-tai-quay">
                    <i class="bi bi-house-door"></i>
                </a>
            </div>
            <!-- Bán hàng tại quầy -->
            <div class="container-fluid">
                <div class="container">
                    <div class="row">
                        <div class="col-8">
                            <div>
                                <h3 class="float-start">Hóa đơn</h3>
                                <form action="/ban-hang-tai-quay/add-hoa-don" method="post" style="float: right;"
                                      class="float-end">
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
                                        <td>${hoaDon.idNhanVien.ten}</td>
                                        <td>${hoaDon.idKhachHang.ten}</td>
                                        <td>${hoaDon.ngayTao}</td>
                                        <td>${hoaDon.trangThai==0?"Chua thanh toan":"Da thanh toan"}</td>
                                        <td>
                                            <a href="/ban-hang-tai-quay/detail-hoa-don/${hoaDon.id}"
                                               class="btn btn-warning"><i class="bi bi-eye"></i></a>
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
                                    <%--                                    <th>ID Hóa Đơn</th>--%>
                                    <th>Mã SP</th>
                                    <th>Tên SP</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Thành tiền</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${hoaDon.id != null}">
                                    <c:forEach varStatus="i" items="${listHDCT}" var="hdct">
                                        <tr>
                                            <td>${i.index+1}</td>
                                                <%--                                        <td>${hdct.idHoaDon.ma}</td>--%>
                                            <td>${hdct.idCTSP.idSanPham.ma}</td>
                                            <td>${hdct.idCTSP.idSanPham.ten}</td>
                                            <td style="display: flex; align-items: center;">
                                                <form action="/ban-hang-tai-quay/giam-so-luong/${hdct.idCTSP.id}" method="post">
                                                    <input type="hidden" name="idHoaDon" value="${hoaDon.id}">
                                                    <button class="btn btn-light"
                                                            style="display: flex; width: 35px; height: 30px; align-items: center; justify-content: center"
                                                            type="submit"><i class="bi bi-caret-left"></i></button>
                                                </form>
                                                    ${hdct.soLuong}
                                                <form action="/ban-hang-tai-quay/them-so-luong/${hdct.idCTSP.id}" method="post">
                                                    <input type="hidden" name="idHoaDon" value="${hoaDon.id}">
                                                    <button class="btn btn-light"
                                                            style="display: flex; width: 35px; height: 30px; align-items: center; justify-content: center"
                                                            type="submit"><i class="bi bi-caret-right"></i></button>
                                                </form>
                                            </td>
                                            <td>${hdct.donGia}</td>
                                            <td>${hdct.soLuong*hdct.donGia}</td>
                                            <td>
                                                <form action="/ban-hang-tai-quay/delete/${hdct.id}" method="get">
                                                    <input type="hidden" name="idHoaDon" value="${hoaDon.id}">
                                                    <button class="btn btn-danger"
                                                            style="display: flex; width: 35px; height: 30px; align-items: center; justify-content: center"
                                                            type="submit"><i class="bi bi-trash"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>

                            <%--                            Lọc và tìm kiếm--%>
                            <form method="post" action="/store/filter">
                                <div class="row">
                                    <div class="col col-md-2">
                                        <select class="form-select form-select-sm mb-3"
                                                aria-label=".form-select-lg example" name="idSanPham">
                                            <option value="${null}" selected>Chọn sản phẩm</option>
                                            <c:forEach items="${listSanPham}" var="sanPham">
                                                <option value="${sanPham.id}">${sanPham.ten}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col col-md-2">
                                        <select class="form-select form-select-sm mb-3"
                                                aria-label=".form-select-lg example" name="idMauSac">
                                            <c:forEach var="mauSac" items="${listMauSac}">
                                                <option value="${mauSac.id}">${mauSac.ten}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col col-md-2">
                                        <select class="form-select form-select-sm mb-3"
                                                aria-label=".form-select-lg example" name="idKichThuoc">
                                            <option value="${null}" selected>Chọn kích thước</option>
                                            <c:forEach items="${listKichThuoc}" var="kichThuoc">
                                                <option value="${kichThuoc.id}">${kichThuoc.ten}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col col-md-2">
                                        <select class="form-select form-select-sm mb-3"
                                                aria-label=".form-select-lg example" name="idChatLieu">
                                            <option value="${null}" selected>Chọn chất liệu</option>
                                            <c:forEach items="${listChatLieu}" var="chatLieu">
                                                <option value="${chatLieu.id}">${chatLieu.ten}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col col-md-2">
                                        <select class="form-select form-select-sm mb-3"
                                                aria-label=".form-select-lg example" name="idKieuTay">
                                            <option value="${null}" selected>Chọn kiểu tay</option>
                                            <c:forEach items="${listKieuTay}" var="kieuTay">
                                                <option value="${kieuTay.id}">${kieuTay.ten}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col col-2">
                                        <button type="submit" class="btn btn-primary float-start">Lọc</button>
                                        <a href="/store/ban-tai-quay" class="btn btn-danger float-start">Hủy</a>
                                    </div>

                                </div>
                            </form>
                            <!-- Sản phẩm -->
                            <h3>Chi tiết sản phẩm</h3>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã</th>
                                    <th>Tên SP</th>
                                    <th>Màu sắc</th>
                                    <th>Kích thước</th>
                                    <th>Chất liệu</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach varStatus="i" items="${listCTSP}" var="spct">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td>${spct.idSanPham.ma}</td>
                                        <td>${spct.idSanPham.ten}</td>
                                        <td>${spct.idMauSac.ten}</td>
                                        <td>${spct.idKichThuoc.ten}</td>
                                        <td>${spct.idChatLieu.ten}</td>
                                        <td>${spct.soLuong}</td>
                                        <td>${spct.giaBan}</td>
                                        <td>
                                            <form action="/ban-hang-tai-quay/add-san-pham/${spct.id}" method="post"
                                                  onsubmit="return validateBeforeAddToCart();">
                                                <input type="hidden" name="idHoaDon" value="${hoaDon.id}"
                                                       id="selectedInvoiceId">
                                                <button class="btn btn-success" type="submit">+</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>

                        </div>
                        <div class="col-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">HÓA ĐƠN</h5>
                                    <form method="POST" action="/ban-hang-tai-quay/thanh-toan/${hoaDon.id}">
                                        <div class="row mb-3">
                                            <label class="col-sm-4 col-form-label">ID hóa đơn</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" value="${hoaDon.id}"/>
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
                                            <label class="col-sm-4 col-form-label">Sđt khách hàng</label>
                                            <div class="col-sm-6">
                                                <select path="idKhachHang" class="form-select"
                                                        aria-label="Default select example" name="idKhachHang">
                                                    <c:forEach items="${listKH}" var="khachHang">

                                                        <option value="${khachHang.id}" ${hoaDon.idKhachHang.sdt==khachHang.sdt?"selected":""}>${khachHang.sdt}</option>

                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <a class="col-sm-2" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                               href="#">
                                                <i class=" bi bi-folder-plus col-3" style="font-size: 25px;"></i>
                                            </a>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-4 col-form-label">Tổng tiền</label>
                                            <div class="col-sm-8">
                                                <input id="tongTien" type="number" class="form-control"
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
                            <!--  -->
                        </div>
                    </div>
                </div>


            </div>
            <!--  Kết thúc bán hàng tại quầy  -->

        </div>

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
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

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

    <c:if test="${not empty error}">
    Toast.fire({
        icon: "error",
        title: "${error}"
    });
    </c:if>


</script>

</html>