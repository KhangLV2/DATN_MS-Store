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

    <title>MSStore_Thống kê</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/view_admin/css/sb-admin-2.min.css" rel="stylesheet">

    <%--Link Ajax --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <%--    Thư viện Char Js để làm biểu đồ--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Bootstrap Bundle with Popper -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">--%>
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">--%>


    <style>

        body {
            overflow-y: scroll; /* Luôn luôn hiển thị thanh cuộn dọc */
        }


        .modal-dialog {
            max-height: 80vh; /* Ensures modal does not overflow the viewport height */
            overflow-y: auto; /* Allows scrolling inside the modal if necessary */
        }

        .stat-section {
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .stat-section.today {
            background-color: #8ecae6;
        }

        .stat-section.this-week {
            background-color: #219ebc;
        }

        .stat-section.this-month {
            background-color: #28a745;
        }

        .stat-section.this-year {
            background-color: #ffb703;
        }

        .stat-section.custom {
            background-color: #0981b9;
            display: none;
        }

        .stat-section h3 {
            font-size: 1.25em;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .stat-section h3 i {
            margin-right: 8px;
        }

        .stat-details {
            display: flex;
            justify-content: space-around;
            text-align: center;
        }

        .stat-details div {
            flex: 1;
            margin: 0 10px;
        }

        .stat-details p {
            margin: 5px 0;
        }

        .stat-value {
            font-size: 1em;
            font-weight: bold;
        }

        .stat-value#today-revenue,
        .stat-value#week-revenue,
        .stat-value#month-revenue,
        .stat-value#year-revenue {
            font-size: 1.5em;
            font-weight: bold;
        }


        .form-control.with-title:focus + .input-title {
            color: #adb5bd;
        }

        .btn-outline-primary:hover {
            color: #fff;
        }

        #wrapper {
            background-color: #f8f9fc;
            width: 100%;
            overflow-x: hidden;
        }

        #pie-chart {
            width: 100%;
            height: 100%;
            max-height: 300px; /* Adjust height as necessary */
        }

        .border-card {
            border: 1px solid #ddd;
        }


        .bg-light-gray {
            background-color: #f5f5f5; /* Màu xám nhạt */
        }

        .table tbody tr:nth-child(even) {
            background-color: #f9f9f9; /* Màu nền nhạt cho các hàng chẵn */
        }

        .table tbody tr:nth-child(odd) {
            background-color: #ffffff; /* Màu nền trắng cho các hàng lẻ */
        }

        .table th {
            background-color: orange; /* Màu nền cho tiêu đề bảng */
            color: white; /* Màu chữ trắng cho tiêu đề bảng */
        }

        .table td {
            /*border: 1px solid #ddd;*/
            font-size: 15px
        }


        .chart-card {
            display: flex;
            justify-content: center;
            align-items: center;
            /*height: 100vh; */
            padding-bottom: 50px;
        }

        .chart-container {
            width: 100%;
            max-width: 1100px; /* Adjust max-width as needed */
            text-align: center; /* Center the title */
        }

        #myChart {
            width: 100%;
            height: 800px; /* Adjust height as needed */
        }

        .btn.active {
            background-color: #007bff; /* Hoặc màu bạn muốn */
            color: white;
        }


        /*    Csss Modal*/
        /* Hide modal backdrop */
        /*.modal-backdrop {*/
        /*    display: none !important;*/
        /*}*/

        .position-relative {
            position: relative;
        }

        .position-absolute {
            position: absolute;
            color: red;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }



        #customLayout{
            display: block;
        }

        /*Css Top sản phẩm bán chạy*/
        /* Ensure the card body has a fixed layout */
        .card-body {
            display: flex;
            flex-direction: column;
            min-height: 300px; /* Adjust this height as needed */
            position: relative;
            background-color: #f8f9fa; /* or any background color you prefer */
        }

        /* Header styling */
        .card-body .card-header {
            position: sticky;
            top: 0;
            background-color: #f8f9fa; /* Match the card body background */
            z-index: 1;
        }

        /* Ensure the table takes up remaining space and handles overflow */
        .table-container {
            flex: 1;
            overflow-y: auto;
            overflow-x: hidden;
            padding-bottom: 1rem; /* Adjust padding if necessary */
        }

        /* Pagination fixed to the bottom */
        .custom-pagination {
            position: absolute;
            bottom: 1rem;
            right: 1rem;
            background-color: #f8f9fa;
            padding: 0rem 1rem;
            box-sizing: border-box;
        }

        .top-sell{
            margin: 20px 0px;
        }

    </style>
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
        <c:choose>
            <c:when test="${sessionScope.userRole == 'Quản lý'}">
                <!-- Nav Item - Charts -->
                <li class="nav-item" style="background: linear-gradient(45deg, black, transparent)">
                    <a class="nav-link" href="/admin/thong-ke/view" style="display: flex; align-items: center">
                        <i class="bi bi-graph-up" style="color: white;margin-left: 2px"></i>
                        <span style="font-weight: bold; margin-left: 6px">Thống kê doanh thu</span></a>
                </li>

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/ban-hang-tai-quay/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-shop" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Bán hàng tại quầy</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item" >
                    <a class="nav-link" href="/admin/hoa-don/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-journal-text" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Quản lý hóa đơn</span></a>
                </li>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item" style="">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Quản lý sản phẩm</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="/admin/quan-ly-san-pham">Sản phẩm</a>
                            <a class="collapse-item" href="/admin/quan-ly-thuoc-tinh">Màu sắc</a>
                            <a class="collapse-item" href="/admin/quan-ly-thuoc-tinh">Kích thước</a>
                            <a class="collapse-item" href="/admin/quan-ly-thuoc-tinh">Kiểu tay</a>
                            <a class="collapse-item" href="/admin/quan-ly-thuoc-tinh">Chất liệu</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item" >
                    <a class="nav-link" href="/admin/quan-ly-nhan-vien/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-person-bounding-box" style=" margin-left: 2px"></i>
                        <span style=" margin-left: 6px">Quản lý nhân viên</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/quan-ly-khach-hang/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-person-bounding-box" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Quản lý khách hàng</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/quan-ly-khuyen-mai" style="display: flex; align-items: center">
                        <i class="bi bi-gift" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Quản lý khuyến mãi</span></a>
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
                <li class="nav-item">
                    <a class="nav-link" href="/admin/ban-hang-tai-quay/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-shop" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Bán hàng tại quầy</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item" >
                    <a class="nav-link" href="/admin/hoa-don/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-journal-text" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Quản lý hóa đơn</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/quan-ly-khach-hang/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-person-bounding-box" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Quản lý khách hàng</span></a>
                </li>
            </c:otherwise>
        </c:choose>
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
                            <a class="dropdown-item" href="/qlnv/tai-khoan-cua-toi/${nv.id}">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Thông tin cá nhân
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/qlnv/dang-xuat" id="dang-xuat" data-toggle="modal"
                               data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Đăng xuất
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="mt-4" id="">
                    <div class="row">
                        <div class="col-12">

                            <!-- Phần đầu thống kê -->
                            <!-- Phần đầu -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="stat-section today">
                                        <h3 class="text-center">
                                            <i class="bi bi-calendar-day"></i>Hôm nay
                                        </h3>
                                        <p class="stat-value text-center">
                                            <fmt:formatNumber value="${today.doanhThu}" type="currency"
                                                              currencySymbol="₫"/>
                                        </p>
                                        <div class="stat-details">
                                            <div>
                                                <p>Sản phẩm</p>
                                                <p class="stat-value">${today.soLuongSanPhamDaBan}</p>
                                            </div>
                                            <div>
                                                <p>Thành công</p>
                                                <p class="stat-value">${today.donHangThanhCong}</p>
                                            </div>
                                            <div>
                                                <p>Đơn hủy</p>
                                                <p class="stat-value">${today.donHangDaHuy}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 pr-2">
                                    <div class="stat-section this-week">
                                        <h3 class="text-center">
                                            <i class="bi bi-calendar-week"></i>Tuần này
                                        </h3>
                                        <p class="stat-value text-center">
                                            <fmt:formatNumber value="${week.doanhThu}" type="currency"
                                                              currencySymbol="₫"/>
                                        </p>
                                        <div class="stat-details">
                                            <div>
                                                <p>Sản phẩm</p>
                                                <p class="stat-value">${week.soLuongSanPhamDaBan}</p>
                                            </div>
                                            <div>
                                                <p>Thành công</p>
                                                <p class="stat-value">${week.donHangThanhCong}</p>
                                            </div>
                                            <div>
                                                <p>Đơn hủy</p>
                                                <p class="stat-value">${week.donHangDaHuy}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="stat-section this-month">
                                        <h3 class="text-center">
                                            <i class="bi bi-calendar3"></i>Tháng này
                                        </h3>
                                        <p class="stat-value text-center">
                                            <fmt:formatNumber value="${month.doanhThu}" type="currency"
                                                              currencySymbol="₫"/>
                                        </p>
                                        <div class="stat-details">
                                            <div>
                                                <p>Sản phẩm</p>
                                                <p class="stat-value">${month.soLuongSanPhamDaBan}</p>
                                            </div>
                                            <div>
                                                <p>Thành công</p>
                                                <p class="stat-value">${month.donHangThanhCong}</p>
                                            </div>
                                            <div>
                                                <p>Đơn hủy</p>
                                                <p class="stat-value">${month.donHangDaHuy}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="stat-section this-year">
                                        <h3 class="text-center">
                                            <i class="bi bi-calendar4"></i>Năm này
                                        </h3>
                                        <p class="stat-value text-center">
                                            <fmt:formatNumber value="${year.doanhThu}" type="currency"
                                                              currencySymbol="₫"/>
                                        </p>
                                        <div class="stat-details">
                                            <div>
                                                <p>Sản phẩm</p>
                                                <p class="stat-value">${year.soLuongSanPhamDaBan}</p>
                                            </div>
                                            <div>
                                                <p>Thành công</p>
                                                <p class="stat-value">${year.donHangThanhCong}</p>
                                            </div>
                                            <div>
                                                <p>Đơn hủy</p>
                                                <p class="stat-value">${year.donHangDaHuy}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${formSuccess}">
                                <div class="row ">
                                    <div class="col-md-12">
                                        <div class="stat-section custom" id="customLayout">
                                            <h3 class="text-center">
                                                <i class="bi bi-calendar2-week"></i> Bộ Lọc
                                            </h3>
                                            <p class="stat-value text-center" id="custom-revenue">
                                                <fmt:formatNumber value="${customStats.doanhThu}" type="currency"
                                                                  currencySymbol="₫"/>
                                            </p>
                                            <div class="stat-details">
                                                <div>
                                                    <p>Sản phẩm</p>
                                                    <p class="stat-value"
                                                       id="custom-products">${customStats.soLuongSanPhamDaBan}</p>
                                                </div>
                                                <div>
                                                    <p>Thành công</p>
                                                    <p class="stat-value"
                                                       id="custom-success">${customStats.donHangThanhCong}</p>
                                                </div>
                                                <div>
                                                    <p>Đơn hủy</p>
                                                    <p class="stat-value" id="custom-cancel">${customStats.donHangDaHuy}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <!-- Phần giữa -->
                            <div class="">
                                <div class=" mb-5">
                                    <div class="mb-5">
                                        <%--                                        <h5 class="ml-3 pt-2">Bộ lọc</h5>--%>
                                        <div class="d-flex align-items-center justify-content-end ">
                                            <div class="col-md-1">
                                                <button id="btn-filter"
                                                        type="button"
                                                        class="btn btn-outline-dark btn-block btn-sm font-weight-bold active"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#filterModal"
                                                >
                                                    Bộ lọc
                                                </button>
                                            </div>

                                            <div class="col-md-1">
                                                <button id="btn-today"
                                                        type="button"
                                                        class="btn btn-outline-primary btn-block btn-sm font-weight-bold"
                                                >
                                                    Ngày
                                                </button>
                                            </div>
                                            <div class="col-md-1">
                                                <button id="btn-week"
                                                        type="button"
                                                        class="btn btn-outline-info btn-block btn-sm font-weight-bold"
                                                >
                                                    Tuần
                                                </button>
                                            </div>
                                            <div class="col-md-1">
                                                <button id="btn-month"
                                                        type="button"
                                                        class="btn btn-outline-success btn-block btn-sm font-weight-bold"
                                                >
                                                    Tháng
                                                </button>
                                            </div>
                                            <div class="col-md-1">
                                                <button id="btn-year"
                                                        type="button"
                                                        class="btn btn-outline-warning btn-block btn-sm font-weight-bold"
                                                >
                                                    Năm
                                                </button>
                                            </div>

                                            <!-- Nút để mở modal -->
                                            <div class="col-md-1">
                                                <button id="btn-custom"
                                                        type="button"
                                                        class="btn btn-outline-secondary btn-block btn-sm font-weight-bold"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#customModal"
                                                >
                                                    Tùy chỉnh
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%-- Modal Bộ Lọc--%>
                            <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <form action="/admin/thong-ke/tuy-chinh" method="post" id="filterForm">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="filterModalTitle">Tùy chỉnh ngày</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="d-flex align-items-end">
                                                    <div class="flex-fill me-2">
                                                        <div class="form-group mb-0 position-relative">
                                                            <label for="start_date" class="form-label">Từ ngày</label>
                                                            <input name="startDate" type="date" class="form-control" id="start_date" />
                                                            <div id="start_date_error" class="text-danger position-absolute" style="top: 100%; left: 0; display: none;">
                                                                Vui lòng nhập ngày bắt đầu.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="flex-fill me-2">
                                                        <div class="form-group mb-0 position-relative">
                                                            <label for="end_date" class="form-label">Đến ngày</label>
                                                            <input name="endDate" type="date" class="form-control" id="end_date" />
                                                            <div id="end_date_error" class="text-danger position-absolute" style="top: 100%; left: 0; display: none;">

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="flex-shrink-1">
                                                        <button type="submit" class="btn btn-primary btn-sm font-weight-bold" id="btn_search">
                                                            Tìm kiếm
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>


                            <%--- Modal tùy chỉnh--%>
                            <div class="modal fade" id="customModal" tabindex="-1" aria-labelledby="customModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="customModalLabel">Tùy chỉnh ngày</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="date-range-form">
                                                <div class="d-flex align-items-end">
                                                    <div class="flex-fill me-2">
                                                        <div class="form-group mb-0 position-relative">
                                                            <label for="start-date" class="form-label">Từ ngày</label>
                                                            <input type="date" class="form-control" id="start-date" name="startDate" />
                                                            <div id="start-date-error" class="text-danger position-absolute" style="top: 100%; left: 0; display: none;"></div>
                                                        </div>
                                                    </div>
                                                    <div class="flex-fill me-2">
                                                        <div class="form-group mb-0 position-relative">
                                                            <label for="end-date" class="form-label">Đến ngày</label>
                                                            <input type="date" class="form-control" id="end-date" name="endDate" />
                                                            <div id="end-date-error" class="text-danger position-absolute" style="top: 100%; left: 0; display: none;"></div>
                                                        </div>
                                                    </div>
                                                    <div class="flex-shrink-1">
                                                        <button type="submit" class="btn btn-primary btn-sm font-weight-bold">Tìm kiếm</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <%-- Biểu đồ thống kê--%>
                            <div>
                                <div class="card chart-card">
                                    <div class="card-body chart-container">
                                        <h3 id="chart-title" class="text-center mt-3">Biểu Đồ Thống Kê Hóa Đơn Và Sản
                                            Phẩm Tháng Này </h3>
                                        <canvas id="myChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <%--                 Table--%>
                            <div class="top-sell">
                                <div class="row">
                                    <!-- Top Selling Products Column -->
                                    <div id="top-selling-products" class="col-md-6">
                                        <div class="card custom-card bg-white">
                                            <div class="card-body py-5 px-2 bg-light-gray flex-fill">
                                                <div class="card-header">
                                                    <h5 class="text-center mb-4">Top Sản Phẩm Bán Chạy Theo Tháng</h5>
                                                </div>
                                                <div class="table-container">
                                                    <table class="table custom-table">
                                                        <thead>
                                                        <tr>
                                                            <th scope="col" style="background: orange; color: white">STT</th>
                                                            <th scope="col" style="background: orange; color: white">Mã sản phẩm</th>
                                                            <th scope="col" style="background: orange; color: white">Thông tin sản phẩm</th>
                                                            <th scope="col" style="background: orange; color: white">Giá bán</th>
                                                            <th scope="col" style="background: orange; color: white">Số lượng đã bán</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="product" items="${topSellingProducts.content}" varStatus="i">
                                                            <tr>
                                                                <td class="text-center">${i.index + 1}</td>
                                                                <td>${product.maSanPham}</td>
                                                                <td>${product.tenSanPham}</td>
                                                                <td><fmt:formatNumber value="${product.giaBan}" type="currency" currencySymbol="₫" groupingUsed="true"/></td>
                                                                <td class="text-center">${product.soLuong}</td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!-- Pagination -->
                                                <div class="custom-pagination">
                                                    <nav aria-label="Page navigation example">
                                                        <ul class="pagination">
                                                            <li class="page-item ${topSellingProducts.hasPrevious() ? '' : 'disabled'}">
                                                                <a class="page-link" href="?page=${topSellingProducts.hasPrevious() ? topSellingProducts.number - 1 : '#'}&status=${currentStatus}">&laquo;</a>
                                                            </li>
                                                            <c:if test="${topSellingProducts.totalPages > 0}">
                                                                <c:forEach var="i" begin="0" end="${topSellingProducts.totalPages - 1}">
                                                                    <li class="page-item ${topSellingProducts.number == i ? 'active' : ''}">
                                                                        <a class="page-link" href="?page=${i}&status=${currentStatus}">${i + 1}</a>
                                                                    </li>
                                                                </c:forEach>
                                                            </c:if>
                                                            <li class="page-item ${topSellingProducts.hasNext() ? '' : 'disabled'}">
                                                                <a class="page-link" href="?page=${topSellingProducts.hasNext() ? topSellingProducts.number + 1 : '#'}&status=${currentStatus}">&raquo;</a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Products Running Low Column -->
                                    <div id="products-running-low" class="col-md-6">
                                        <div class="card custom-card bg-white">
                                            <div class="card-body py-5 px-2 bg-light-gray flex-fill">
                                                <div class="card-header">
                                                    <h5 class="text-center mb-4">Sản Phẩm Sắp Hết Hàng</h5>
                                                </div>
                                                <div class="table-container">
                                                    <table id="productsTable" class="table custom-table">
                                                        <thead>
                                                        <tr>
                                                            <th scope="col" style="background: orange; color: white">STT</th>
                                                            <th scope="col" style="background: orange; color: white">Mã sản phẩm</th>
                                                            <th scope="col" style="background: orange; color: white">Thông tin sản phẩm</th>
                                                            <th scope="col" style="background: orange; color: white">Giá bán</th>
                                                            <th scope="col" style="background: orange; color: white">Số lượng</th>
                                                            <th scope="col" style="background: orange; color: white">Kích thước</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody class="tbody">
                                                        <c:forEach var="product" varStatus="i" items="${pageSPSapHetHang.content}">
                                                            <tr>
                                                                <td class="text-center">${i.index + 1}</td>
                                                                <td>${product.idSanPham.ma}</td>
                                                                <td>${product.idSanPham.ten} - ${product.idMauSac.ten}</td>
                                                                <td><fmt:formatNumber value="${product.giaBan}" type="currency" currencySymbol="₫" groupingUsed="true"/></td>
                                                                <td class="text-center">${product.soLuong}</td>
                                                                <td class="text-center">${product.idKichThuoc.ten}</td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!-- Pagination -->
                                                <div class="custom-pagination">
                                                    <nav aria-label="Page navigation example">
                                                        <ul class="pagination">
                                                            <li class="page-item ${pageSPSapHetHang.hasPrevious() ? '' : 'disabled'}">
                                                                <a class="page-link" href="?page=${pageSPSapHetHang.hasPrevious() ? pageSPSapHetHang.number - 1 : '#'}&status=${currentStatus}">&laquo;</a>
                                                            </li>
                                                            <c:if test="${pageSPSapHetHang.totalPages > 0}">
                                                                <c:forEach var="i" begin="0" end="${pageSPSapHetHang.totalPages - 1}">
                                                                    <li class="page-item ${pageSPSapHetHang.number == i ? 'active' : ''}">
                                                                        <a class="page-link" href="?page=${i}&status=${currentStatus}">${i + 1}</a>
                                                                    </li>
                                                                </c:forEach>
                                                            </c:if>
                                                            <li class="page-item ${pageSPSapHetHang.hasNext() ? '' : 'disabled'}">
                                                                <a class="page-link" href="?page=${pageSPSapHetHang.hasNext() ? pageSPSapHetHang.number + 1 : '#'}&status=${currentStatus}">&raquo;</a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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




<%--CDN DataTable--%>
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


<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>





<!-- Page level custom scripts -->


<script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>


<script>




    // Validate Form Bộ Lọc
    document.addEventListener('DOMContentLoaded', (event) => {
        const filterForm = document.getElementById('filterForm');
        const startDateInput = document.getElementById('start_date');
        const endDateInput = document.getElementById('end_date');
        const startDateError = document.getElementById('start_date_error');
        const endDateError = document.getElementById('end_date_error');

        function clearError(input, errorElement) {
            input.classList.remove('border-danger');
            errorElement.style.display = 'none';
        }

        startDateInput.addEventListener('click', () => clearError(startDateInput, startDateError));
        endDateInput.addEventListener('click', () => clearError(endDateInput, endDateError));

        filterForm.addEventListener('submit', (event) => {
            let valid = true;

            // Clear previous error messages
            clearError(startDateInput, startDateError);
            clearError(endDateInput, endDateError);

            // Validate start date
            if (!startDateInput.value) {
                startDateError.textContent = 'Vui lòng nhập ngày bắt đầu.';
                startDateError.style.display = 'block';
                startDateInput.classList.add('border-danger');
                valid = false;
            }

            // Validate end date
            if (!endDateInput.value) {
                endDateError.textContent = 'Vui lòng nhập ngày kết thúc.';
                endDateError.style.display = 'block';
                endDateInput.classList.add('border-danger');
                valid = false;
            } else if (startDateInput.value && endDateInput.value < startDateInput.value) {
                endDateError.textContent = 'Ngày kết thúc phải sau ngày bắt đầu.';
                endDateError.style.display = 'block';
                endDateInput.classList.add('border-danger');
                valid = false;
            }

            // If not valid, prevent form submission
            if (!valid) {
                event.preventDefault();
            }
        });
    });

    // Mở giao diện bộ lọc
    document.addEventListener('DOMContentLoaded', function () {
        const filterButtons = document.querySelectorAll('#btn-today, #btn-week, #btn-month, #btn-year, #btn-custom');
        const filterButton = document.getElementById('btn-filter');
        const customLayout = document.getElementById('customLayout');

        if (filterButton && customLayout) {
            filterButton.addEventListener('click', function () {
                customLayout.style.display = 'block';
            });
        }
        // Thêm sự kiện click cho các nút bộ lọc nếu chúng tồn tại
        if (filterButtons.length > 0) {
            filterButtons.forEach(button => {
                button.addEventListener('click', function () {
                    if (customLayout) {
                        customLayout.style.display = 'none';
                    }
                });
            });
        } else {
            console.error('No filter buttons found');
        }
    });


    // Biểu đồ cột thống ke hóa đơn và sản phẩm





    document.addEventListener("DOMContentLoaded", function () {
        const ctx = document.getElementById('myChart').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [], // Placeholder for initial labels
                datasets: [
                    {
                        label: 'Hóa đơn',
                        data: [],
                        backgroundColor: 'rgba(54, 162, 235, 0.7)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Sản phẩm',
                        data: [],
                        backgroundColor: 'rgba(255, 206, 86, 0.7)',
                        borderColor: 'rgba(255, 206, 86, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                scales: {
                    x: {
                        ticks: {
                            maxRotation: 45,
                            minRotation: 45
                        }
                    },
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Số lượng',
                            color: '#000',
                            font: {
                                size: 13
                            }
                        }
                    }
                }
            }
        });

        function fetchData(url, title) {
            return fetch(url)
                .then(response => response.json())
                .then(data => {
                    if (Array.isArray(data) && data.length > 0) {
                        updateChart(data);
                    } else {
                        updateChart([{ day: new Date().toLocaleDateString('en-GB'), soLuongHoaDon: 0, soLuongSanPham: 0 }]);
                    }
                    updateTitle(title);
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                    updateChart([{ day: new Date().toLocaleDateString('en-GB'), soLuongHoaDon: 0, soLuongSanPham: 0 }]);
                    updateTitle(title);
                });
        }

        function updateChart(data) {
            const days = data.map(item => new Date(item.day).toLocaleDateString('en-GB'));
            const soLuongHoaDon = data.map(item => item.soLuongHoaDon);
            const soLuongSanPham = data.map(item => item.soLuongSanPham);

            myChart.data.labels = days;
            myChart.data.datasets[0].data = soLuongHoaDon;
            myChart.data.datasets[1].data = soLuongSanPham;
            myChart.update();
        }

        function updateTitle(title) {
            document.getElementById('chart-title').textContent = title;
        }

        function setActiveButton(id) {
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(btn => btn.classList.remove('active'));
            document.getElementById(id).classList.add('active');
        }

        // Event listeners for buttons
        document.getElementById('btn-filter').addEventListener('click', () => {
            setActiveButton('btn-filter');
        });

        document.getElementById('btn-today').addEventListener('click', () => {
            setActiveButton('btn-today');
            fetchData('/api/thong-ke/ngay-hien-tai', 'Biểu Đồ Thống Kê Hóa Đơn Và Sản Phẩm Ngày Hôm Nay');
        });

        document.getElementById('btn-week').addEventListener('click', () => {
            setActiveButton('btn-week');
            const startDate = new Date();
            const endDate = new Date();
            startDate.setDate(startDate.getDate() - 7);
            fetchData(`/api/thong-ke/tuan-hien-tai?startDate=${startDate.toISOString()}&endDate=${endDate.toISOString()}`, 'Biểu Đồ Thống Kê Hóa Đơn Và Sản Phẩm Tuần Này');
        });

        document.getElementById('btn-month').addEventListener('click', () => {
            setActiveButton('btn-month');
            fetchData('/api/thong-ke/thang-hien-tai', 'Biểu Đồ Thống Kê Hóa Đơn Và Sản Phẩm Tháng Này');
        });

        document.getElementById('btn-year').addEventListener('click', () => {
            setActiveButton('btn-year');
            fetchData('/api/thong-ke/nam-hien-tai', 'Biểu Đồ Thống Kê Hóa Đơn Và Sản Phẩm Năm Nay');
        });

        document.getElementById('btn-custom').addEventListener('click', () => {
            setActiveButton('btn-custom');
        });

        // Event listener for form submission
        // Hiển thị dữ liệu lên biểu đồ tùy chỉnh
        $(document).ready(function () {
            function clearError(input, errorElement) {
                input.removeClass('border-danger');
                errorElement.hide();
            }

            $('#start-date').on('click', function () {
                clearError($(this), $('#start-date-error'));
            });

            $('#end-date').on('click', function () {
                clearError($(this), $('#end-date-error'));
            });

            $('#date-range-form').on('submit', function (event) {
                event.preventDefault();
                const formData = new FormData(this);
                const startDate = formData.get('startDate');
                const endDate = formData.get('endDate');
                let valid = true;

                // Clear previous error messages
                clearError($('#start-date'), $('#start-date-error'));
                clearError($('#end-date'), $('#end-date-error'));

                // Validate start date
                if (!startDate) {
                    $('#start-date-error').text('Vui lòng nhập ngày bắt đầu.').show();
                    $('#start-date').addClass('border-danger');
                    valid = false;
                }

                // Validate end date
                if (!endDate) {
                    $('#end-date-error').text('Vui lòng nhập ngày kết thúc.').show();
                    $('#end-date').addClass('border-danger');
                    valid = false;
                } else if (startDate && endDate < startDate) {
                    $('#end-date-error').text('Ngày kết thúc phải sau ngày bắt đầu.').show();
                    $('#end-date').addClass('border-danger');
                    valid = false;
                }

                // If not valid, prevent form submission
                if (!valid) {
                    return;
                }

                // Save custom date range to localStorage
                localStorage.setItem('customStartDate', startDate);
                localStorage.setItem('customEndDate', endDate);

                // If valid, proceed with AJAX request
                $.ajax({
                    url: `/admin/thong-ke/tu-ngay-den-ngay`,
                    type: 'GET',
                    data: {
                        startDate: startDate,
                        endDate: endDate
                    },

                    success: function (data) {
                        updateChart(data);
                        document.querySelector('.modal-backdrop').style.display = 'none';
                        $('#customModal').modal('hide');
                        $('#chart-title').text('Biểu Đồ Thống Kê Hóa Đơn Và Sản Phẩm Tùy Chỉnh');

                        // Reload page to show custom data
                    },
                    error: function (xhr, status, error) {
                        console.error('Error fetching data:', error);
                    }
                });
            });
        });

        // Load initial data based on custom date range if available
        fetchData('/api/thong-ke/thang-hien-tai', 'Biểu Đồ Thống Kê Hóa Đơn Và Sản Phẩm Tháng Này');
        setActiveButton('btn-month');
    });




    //Đăng xuất
    document.getElementById('dang-xuat').addEventListener('click', function (event) {
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
                    window.location.href = "/admin/dang-nhap-view";
                });
            }
        });
    });


</script>




</body>

</html>