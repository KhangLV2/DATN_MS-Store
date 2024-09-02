<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" %>
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

    <title>MSStore_Quản lý hóa đơn</title>

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
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">--%>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar  Menu bên tay trái-->
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
            <a class="nav-link" href="/ban-hang-tai-quay/admin/ban-tai-quay">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Bán hàng tại quầy</span></a>
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
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <form class="form-inline">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                </form>

                <!-- Topbar Search  -->
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
                                 src="img/undraw_profile.svg">
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
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-3 text-gray-800">Quản Lý Hóa Đơn</h1>


                <!-- Bộ lộc và tìm kiếm-->
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex align-items-center">
                        <i class="bi bi-funnel mr-3"></i>
                        <h6 class="m-0 font-weight-bold">Bộ Lọc</h6>
                    </div>
                    <div class="card-body">
                        <form class="row g-3" method="get" action="/hoa-don/hien-thi" id="searchForm" onsubmit="return validateDates()">
                            <div class="col-md-6">
                                <label for="searchKeyword" class="form-label">Tìm kiếm</label>
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small" id="searchKeyword"
                                           name="keyword"
                                           placeholder="Nhập mã hóa đơn hoặc SĐT khách hàng" value="${param.keyword}"
                                           aria-label="Search" aria-describedby="basic-addon2">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputLoaiHoaDon" class="form-label">Loại Hóa Đơn</label>
                                <select id="inputLoaiHoaDon" class="form-select" name="loaiHoaDon">
                                    <option value="-1" ${param.loaiHoaDon == -1 ? 'selected' : ''}>Tất cả</option>
                                    <option value="0" ${param.loaiHoaDon == 0 ? 'selected' : ''}>Bán Online</option>
                                    <option value="1" ${param.loaiHoaDon == 1 ? 'selected' : ''}>Bán tại quầy</option>
                                </select>
                            </div>

                            <div class="col-md-6 mt-3">
                                <label for="startDate" class="form-label">Ngày bắt đầu</label>
                                <input type="date" class="form-control" id="startDate" name="startDate"
                                       value="${param.startDate}">
                            </div>
                            <div class="col-md-6 mt-3">
                                <label for="endDate" class="form-label">Ngày kết thúc</label>
                                <input type="date" class="form-control" id="endDate" name="endDate"
                                       value="${param.endDate}">

                            </div>
                            <div class="col-md-12 mt-3 d-flex justify-content-end">
                                <input type="hidden" id="page" name="page"
                                       value="${param.page != null ? param.page : '0'}">
                                <button type="submit" class="btn btn-success mr-2">Tìm kiếm</button>
                                <a href="/hoa-don/hien-thi">
                                    <button type="button" class="btn btn-danger">Làm Mới</button>
                                </a>
                            </div>
                        </form>
                    </div>
                </div>


                <!-- Danh sách hóa đơn -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex align-items-center">
                        <i class="bi bi-card-list mr-3"></i>
                        <h6 class="m-0 font-weight-bold">Danh Sách Hóa Đơn</h6>
                    </div>
                    <div class="card-body">

                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all"
                                        type="button" role="tab" aria-controls="all" aria-selected="true"
                                        data-status="all">
                                    Tất Cả
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                          style="z-index: 1000;">
                                        ${countAll}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link position-relative" id="confirmation-tab" data-bs-toggle="tab"
                                        data-bs-target="#confirmation" type="button" role="tab"
                                        aria-controls="confirmation" aria-selected="false" data-status="confirmation">
                                    Chờ Xác Nhận
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                          style="z-index: 1000;">
                                        ${countChoXacNhan}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link" id="confirmed-tab" data-bs-toggle="tab"
                                        data-bs-target="#confirmed" type="button" role="tab" aria-controls="confirmed"
                                        aria-selected="false" data-status="confirmed">
                                    Đã Xác Nhận
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                          style="z-index: 1000;">
                                        ${countDaXacNhan}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link" id="delivery-tab" data-bs-toggle="tab"
                                        data-bs-target="#delivery" type="button" role="tab" aria-controls="delivery"
                                        aria-selected="false" data-status="delivery">
                                    Chờ Giao Hàng
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                          style="z-index: 1000;">
                                        ${countChoGiaoHang}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link" id="delivered-tab" data-bs-toggle="tab"
                                        data-bs-target="#delivered" type="button" role="tab" aria-controls="delivered"
                                        aria-selected="false" data-status="delivered">
                                    Đã Giao Hàng
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                          style="z-index: 1000;">
                                        ${countDangGiaoHang}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link" id="accomplished-tab" data-bs-toggle="tab"
                                        data-bs-target="#accomplished" type="button" role="tab"
                                        aria-controls="accomplished" aria-selected="false" data-status="accomplished">
                                    Đã Hoàn Thành
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                          style="z-index: 1000;">
                                        ${countDaHoanThanh}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link" id="cancelled-tab" data-bs-toggle="tab"
                                        data-bs-target="#cancelled" type="button" role="tab" aria-controls="cancelled"
                                        aria-selected="false" data-status="cancelled">
                                    Đã Hủy
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                          style="z-index: 1000;">
                                        ${countDaHuy}
                                    </span>
                                </button>
                            </li>
                        </ul>


                        <div class="tab-content mt-3" id="myTabContent">
                            <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
                                <%--  Danh sách tất cả các hóa đơn   --%>
                                <table class="table table-bordered " width="100%" cellspacing="0">
                                    <thead class="">
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã Hóa Đơn</th>
                                        <th>Tên Nhân Viên</th>
                                        <th>Tên Khách Hàng</th>
                                        <th>SDT Khách Hàng</th>
                                        <th>Loại Hóa Đơn</th>
                                        <th>Tổng Tiền</th>
                                        <th>Ngày Tạo</th>
                                        <th>Trạng Thái</th>
                                        <th>Thao Tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${i.index + 1}</td>
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen}</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-primary' : 'bg-success'}">
                                                        ${hoaDon.loaiHoaDon == 1 ? "Bán tại quầy" : "Bán online"}
                                                </span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${hoaDon.tongTien}" type="currency"
                                                                  currencySymbol="₫" groupingUsed="true"/>
                                            </td>
                                            <td>${hoaDon.ngayTao}</td>
                                            <td>
                                                  <span class="badge rounded-pill ${hoaDon.maMau}">
                                                          ${hoaDon.trangThaiText}
                                                  </span>
                                            </td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
                                                    <i class="bi bi-eye-fill"></i>
                                                </a>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <%-- Phân trang của tất cả các hóa đơn  --%>
                                <div class="float-end">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <!-- Kiểm tra nếu có trang trước đó -->
                                            <c:if test="${pageHD.hasPrevious()}">
                                                <c:url var="prevPageUrl" value="">
                                                    <c:param name="page" value="${pageHD.number - 1}"/>
                                                    <c:param name="keyword" value="${param.keyword}"/>
                                                    <c:param name="loaiHoaDon" value="${param.loaiHoaDon}"/>
                                                    <c:param name="startDate" value="${param.startDate}"/>
                                                    <c:param name="endDate" value="${param.endDate}"/>
                                                </c:url>
                                                <li class="page-item">
                                                    <a class="page-link" href="${prevPageUrl}">&laquo;</a>
                                                </li>
                                            </c:if>

                                            <!-- Kiểm tra nếu có tổng số trang lớn hơn 0 -->
                                            <c:if test="${pageHD.totalPages > 0}">
                                                <!-- Duyệt qua các trang -->
                                                <c:forEach var="i" begin="0" end="${pageHD.totalPages - 1}">
                                                    <c:url var="pageUrl" value="">
                                                        <c:param name="page" value="${i}"/>
                                                        <c:param name="keyword" value="${param.keyword}"/>
                                                        <c:param name="loaiHoaDon" value="${param.loaiHoaDon}"/>
                                                        <c:param name="startDate" value="${param.startDate}"/>
                                                        <c:param name="endDate" value="${param.endDate}"/>
                                                    </c:url>
                                                    <li class="page-item ${pageHD.number == i ? 'active' : ''}">
                                                        <a class="page-link" href="${pageUrl}">${i + 1}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:if>

                                            <!-- Kiểm tra nếu có trang tiếp theo -->
                                            <c:if test="${pageHD.hasNext()}">
                                                <c:url var="nextPageUrl" value="">
                                                    <c:param name="page" value="${pageHD.number + 1}"/>
                                                    <c:param name="keyword" value="${param.keyword}"/>
                                                    <c:param name="loaiHoaDon" value="${param.loaiHoaDon}"/>
                                                    <c:param name="startDate" value="${param.startDate}"/>
                                                    <c:param name="endDate" value="${param.endDate}"/>
                                                </c:url>
                                                <li class="page-item">
                                                    <a class="page-link" href="${nextPageUrl}">&raquo;</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="confirmation" role="tabpanel"
                                 aria-labelledby="confirmation-tab">
                                <%-- Danh sách hóa đơn chờ xác nhận     --%>
                                <table class="table table-bordered " width="100%" cellspacing="0">
                                    <thead class="">
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã Hóa Đơn</th>
                                        <th>Tên Nhân Viên</th>
                                        <th>Tên Khách Hàng</th>
                                        <th>SDT Khách Hàng</th>
                                        <th>Loại Hóa Đơn</th>
                                        <th>Tổng Tiền</th>
                                        <th>Ngày Tạo</th>
                                        <th>Trạng Thái</th>
                                        <th>Thao Tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${i.index + 1}</td>
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen}</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-primary' : 'bg-success'}">
                                                        ${hoaDon.loaiHoaDon == 1 ? "Bán tại quầy" : "Bán online"}
                                                </span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${hoaDon.tongTien}" type="currency"
                                                                  currencySymbol="₫" groupingUsed="true"/>
                                            </td>
                                            <td>${hoaDon.ngayTao}</td>
                                            <td>
                                                  <span class="badge rounded-pill ${hoaDon.maMau}">
                                                          ${hoaDon.trangThaiText}
                                                  </span>
                                            </td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
                                                    <i class="bi bi-eye-fill"></i>
                                                </a>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <%-- Phân trang của hóa đơn chờ xác nhận  --%>
                                <div class="float-end">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${pageHD.hasPrevious()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${pageHD.totalPages > 0}">
                                                <c:forEach var="i" begin="0" end="${pageHD.totalPages - 1}">
                                                    <li class="page-item ${pageHD.number == i ? 'active' : ''}">
                                                        <a class="page-link"
                                                           href="?page=${i}&status=${currentStatus}">${i + 1}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${pageHD.hasNext()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="confirmed" role="tabpanel" aria-labelledby="confirmed-tab">
                                <%-- Danh sách hóa đơn đã xác nhận     --%>
                                <table class="table table-bordered " width="100%" cellspacing="0">
                                    <thead class="">
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã Hóa Đơn</th>
                                        <th>Tên Nhân Viên</th>
                                        <th>Tên Khách Hàng</th>
                                        <th>SDT Khách Hàng</th>
                                        <th>Loại Hóa Đơn</th>
                                        <th>Tổng Tiền</th>
                                        <th>Ngày Tạo</th>
                                        <th>Trạng Thái</th>
                                        <th>Thao Tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${i.index + 1}</td>
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen}</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-primary' : 'bg-success'}">
                                                        ${hoaDon.loaiHoaDon == 1 ? "Bán tại quầy" : "Bán online"}
                                                </span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${hoaDon.tongTien}" type="currency"
                                                                  currencySymbol="₫" groupingUsed="true"/>
                                            </td>
                                            <td>${hoaDon.ngayTao}</td>
                                            <td>
                                                  <span class="badge rounded-pill ${hoaDon.maMau}">
                                                          ${hoaDon.trangThaiText}
                                                  </span>
                                            </td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
                                                    <i class="bi bi-eye-fill"></i>
                                                </a>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <%-- Phân trang của hóa đơn đã xác nhận    --%>
                                <div class="float-end">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${pageHD.hasPrevious()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${pageHD.totalPages > 0}">
                                                <c:forEach var="i" begin="0" end="${pageHD.totalPages - 1}">
                                                    <li class="page-item ${pageHD.number == i ? 'active' : ''}">
                                                        <a class="page-link"
                                                           href="?page=${i}&status=${currentStatus}">${i + 1}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${pageHD.hasNext()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="delivery" role="tabpanel" aria-labelledby="delivery-tab">
                                <%-- Danh sách hóa đơn chờ giao hàng    --%>
                                <table class="table table-bordered " width="100%" cellspacing="0">
                                    <thead class="">
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã Hóa Đơn</th>
                                        <th>Tên Nhân Viên</th>
                                        <th>Tên Khách Hàng</th>
                                        <th>SDT Khách Hàng</th>
                                        <th>Loại Hóa Đơn</th>
                                        <th>Tổng Tiền</th>
                                        <th>Ngày Tạo</th>
                                        <th>Trạng Thái</th>
                                        <th>Thao Tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${i.index + 1}</td>
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen}</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-primary' : 'bg-success'}">
                                                        ${hoaDon.loaiHoaDon == 1 ? "Bán tại quầy" : "Bán online"}
                                                </span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${hoaDon.tongTien}" type="currency"
                                                                  currencySymbol="₫" groupingUsed="true"/>
                                            </td>
                                            <td>${hoaDon.ngayTao}</td>
                                            <td>
                                                  <span class="badge rounded-pill ${hoaDon.maMau}">
                                                          ${hoaDon.trangThaiText}
                                                  </span>
                                            </td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
                                                    <i class="bi bi-eye-fill"></i>
                                                </a>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <%-- Phân trang của hóa đơn chờ giao   --%>
                                <div class="float-end">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${pageHD.hasPrevious()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${pageHD.totalPages > 0}">
                                                <c:forEach var="i" begin="0" end="${pageHD.totalPages - 1}">
                                                    <li class="page-item ${pageHD.number == i ? 'active' : ''}">
                                                        <a class="page-link"
                                                           href="?page=${i}&status=${currentStatus}">${i + 1}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${pageHD.hasNext()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="delivered" role="tabpanel" aria-labelledby="delivered-tab">
                                <%-- Danh sách hóa đơn đã giao hàng     --%>
                                <table class="table table-bordered " width="100%" cellspacing="0">
                                    <thead class="">
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã Hóa Đơn</th>
                                        <th>Tên Nhân Viên</th>
                                        <th>Tên Khách Hàng</th>
                                        <th>SDT Khách Hàng</th>
                                        <th>Loại Hóa Đơn</th>
                                        <th>Tổng Tiền</th>
                                        <th>Ngày Tạo</th>
                                        <th>Trạng Thái</th>
                                        <th>Thao Tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${i.index + 1}</td>
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen}</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-primary' : 'bg-success'}">
                                                        ${hoaDon.loaiHoaDon == 1 ? "Bán tại quầy" : "Bán online"}
                                                </span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${hoaDon.tongTien}" type="currency"
                                                                  currencySymbol="₫" groupingUsed="true"/>
                                            </td>
                                            <td>${hoaDon.ngayTao}</td>
                                            <td>
                                                  <span class="badge rounded-pill ${hoaDon.maMau}">
                                                          ${hoaDon.trangThaiText}
                                                  </span>
                                            </td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
                                                    <i class="bi bi-eye-fill"></i>
                                                </a>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <%-- Phân trang của hóa đơn đã giao hàng   --%>
                                <div class="float-end">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${pageHD.hasPrevious()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${pageHD.totalPages > 0}">
                                                <c:forEach var="i" begin="0" end="${pageHD.totalPages - 1}">
                                                    <li class="page-item ${pageHD.number == i ? 'active' : ''}">
                                                        <a class="page-link"
                                                           href="?page=${i}&status=${currentStatus}">${i + 1}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${pageHD.hasNext()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="accomplished" role="tabpanel"
                                 aria-labelledby="accomplished-tab">
                                <%-- Danh sách hóa đơn đã hoàn thành     --%>
                                <table class="table table-bordered " width="100%" cellspacing="0">
                                    <thead class="">
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã Hóa Đơn</th>
                                        <th>Tên Nhân Viên</th>
                                        <th>Tên Khách Hàng</th>
                                        <th>SDT Khách Hàng</th>
                                        <th>Loại Hóa Đơn</th>
                                        <th>Tổng Tiền</th>
                                        <th>Ngày Tạo</th>
                                        <th>Trạng Thái</th>
                                        <th>Thao Tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${i.index + 1}</td>
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen}</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-primary' : 'bg-success'}">
                                                        ${hoaDon.loaiHoaDon == 1 ? "Bán tại quầy" : "Bán online"}
                                                </span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${hoaDon.tongTien}" type="currency"
                                                                  currencySymbol="₫" groupingUsed="true"/>
                                            </td>
                                            <td>${hoaDon.ngayTao}</td>
                                            <td>
                                                  <span class="badge rounded-pill ${hoaDon.maMau}">
                                                          ${hoaDon.trangThaiText}
                                                  </span>
                                            </td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
                                                    <i class="bi bi-eye-fill"></i>
                                                </a>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <%-- Phân trang của đơn đã hoàn thành   --%>
                                <div class="float-end">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${pageHD.hasPrevious()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${pageHD.totalPages > 0}">
                                                <c:forEach var="i" begin="0" end="${pageHD.totalPages - 1}">
                                                    <li class="page-item ${pageHD.number == i ? 'active' : ''}">
                                                        <a class="page-link"
                                                           href="?page=${i}&status=${currentStatus}">${i + 1}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${pageHD.hasNext()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="cancelled" role="tabpanel" aria-labelledby="cancelled-tab">
                                <%-- Danh sách hóa đơn đã hủy     --%>
                                <table class="table table-bordered " width="100%" cellspacing="0">
                                    <thead class="">
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã Hóa Đơn</th>
                                        <th>Tên Nhân Viên</th>
                                        <th>Tên Khách Hàng</th>
                                        <th>SDT Khách Hàng</th>
                                        <th>Loại Hóa Đơn</th>
                                        <th>Tổng Tiền</th>
                                        <th>Ngày Tạo</th>
                                        <th>Trạng Thái</th>
                                        <th>Thao Tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${i.index + 1}</td>
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen}</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-primary' : 'bg-success'}">
                                                        ${hoaDon.loaiHoaDon == 1 ? "Bán tại quầy" : "Bán online"}
                                                </span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${hoaDon.tongTien}" type="currency"
                                                                  currencySymbol="₫" groupingUsed="true"/>
                                            </td>
                                            <td>${hoaDon.ngayTao}</td>
                                            <td>
                                                  <span class="badge rounded-pill ${hoaDon.maMau}">
                                                          ${hoaDon.trangThaiText}
                                                  </span>
                                            </td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
                                                    <i class="bi bi-eye-fill"></i>
                                                </a>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <%-- Phân trang của hóa đơn đã hủy    --%>
                                <div class="float-end">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${pageHD.hasPrevious()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${pageHD.totalPages > 0}">
                                                <c:forEach var="i" begin="0" end="${pageHD.totalPages - 1}">
                                                    <li class="page-item ${pageHD.number == i ? 'active' : ''}">
                                                        <a class="page-link"
                                                           href="?page=${i}&status=${currentStatus}">${i + 1}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${pageHD.hasNext()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

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
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

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
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/datatables-demo.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


    $(document).ready(function () {
        // Function to get status from URL
        function getStatusFromUrl() {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get('status');
        }

        // Function to set and highlight the correct tab
        function setStatusAndHighlightTab(status) {
            if (status === null || status === '' || status === 'null') {
                status = 'all';
            }

            // Remove the bg-warning class from all tabs
            $('#myTab .nav-link').removeClass('bg-warning');

            // Highlight the appropriate tab
            if (status === 'all') {
                $('#all-tab').addClass('bg-warning');
            } else {
                $('#myTab .nav-link[data-status="' + status + '"]').addClass('bg-warning').tab('show');
            }
        }

        // Initial setup
        let status = getStatusFromUrl();
        setStatusAndHighlightTab(status);

        // When clicking on a tab
        $('#myTab .nav-link').click(function () {
            // Remove the bg-warning class from all tabs
            $('#myTab .nav-link').removeClass('bg-warning');
            // Add the bg-warning class to the clicked tab
            $(this).addClass('bg-warning');
        });

        // When clicking on any a tag
        $('a').click(function () {
            status = getStatusFromUrl();
            if (status === null) {
                status = 'all';
            }
            setStatusAndHighlightTab('all');
        });
    });

    // Xử lý load dữ liệu lên các tabs
    document.querySelectorAll('.nav-link').forEach(button => {
        button.addEventListener('click', function () {
            let status = this.getAttribute('data-status');
            let url = new URL(window.location.href);
            url.searchParams.set('status', status);
            window.location.href = url.toString();
        });
    });

    // Reset lại form tìm kiếm và lọc
    function resetForm() {
        document.getElementById("searchKeyword").value = "";
        document.getElementById("inputLoaiHoaDon").selectedIndex = 0;
        document.getElementById("startDate").value = "";
        document.getElementById("endDate").value = "";

        // Lấy trang hiện tại
        var currentUrl = window.location.href;
        var cleanUrl = currentUrl.split('?')[0]; // Lấy phần URL trước dấu '?'

        // Lấy tham số page nếu có
        var params = new URLSearchParams(window.location.search);
        var pageParam = params.get('page');

        // Nếu có tham số page, thêm lại vào URL
        if (pageParam) {
            cleanUrl += '?page=' + pageParam;
        }

        // Đặt lại URL
        window.location.href = cleanUrl;
    }
</script>

<script>
    function validateDates() {
        var startDate = document.getElementById("startDate").value;
        var endDate = document.getElementById("endDate").value;

        if (startDate && endDate && startDate > endDate) {
            Swal.fire({
                icon: 'error',
                text: 'Ngày bắt đầu không được lớn hơn ngày kết thúc.',
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer);
                    toast.addEventListener('mouseleave', Swal.resumeTimer);
                }
            });
            return false;
        }
        return true;
    }
</script>


</body>

</html>