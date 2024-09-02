<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <%--    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">--%>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <%--In ra file PDF    --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


    <style>


        <%--     Css phiếu hóa đơn   --%>
        .invoice {
            width: 21cm; /* A4 width */
            min-height: 29.7cm; /* A4 height */
            padding: 1cm;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            width: 100px; /* Adjust width as needed */
            height: auto;
        }

        .separator {
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }

        .custom-card-body {
            max-height: 400px;
            overflow-y: auto;
        }

        .custom-table {
            margin-bottom: 0;
        }

        .custom-card-body {
            max-height: 400px; /* Đặt chiều cao tối đa của card-body */
            overflow-y: auto;
            scrollbar-width: thin; /* Độ rộng của thanh cuộn */
        }

        /* Tùy chỉnh thumb của thanh cuộn */
        .custom-card-body::-webkit-scrollbar-thumb {
            background-color: #6c757d; /* Màu sắc của thumb */
            border-radius: 8px; /* Độ cong viền của thumb */
        }

        /* Tùy chỉnh track của thanh cuộn */
        .custom-card-body::-webkit-scrollbar-track {
            background: #f1f1f1; /* Màu sắc phần track */
        }

        /* Ẩn nút cuộn lên và xuống */
        .custom-card-body::-webkit-scrollbar-button {
            display: none;
        }

        /* Tùy chỉnh thumb của thanh cuộn khi hover */
        .custom-card-body::-webkit-scrollbar-thumb:hover {
            background-color: #555;
        }

        /* Tùy chỉnh thumb của thanh cuộn khi ấn giữ */
        .custom-card-body::-webkit-scrollbar-thumb:active {
            background-color: #333;
        }

        /*Tùy chỉnh phần step quản lý đơn hàng*/
        .stepper-horizontal {
            display: flex;
            justify-content: space-evenly; /* Adjust spacing between steps */
            align-items: center;
            position: relative;
            margin-bottom: 40px;
        }

        .stepper-horizontal.single-step .step {
            flex: 1; /* Đảm bảo mỗi bước chiếm không gian bằng nhau */
        }

        .stepper-horizontal.single-step .step:first-child {
            margin-left: 0; /* Đặt margin-left thành 0 khi chỉ có một step */
        }

        .stepper-horizontal .step {
            text-align: center;
            position: relative;
            flex: 1; /* Đảm bảo mỗi bước chiếm không gian bằng nhau */
        }

        .stepper-horizontal .step:not(:first-child) {
            margin-left: 10px; /* Khoảng cách giữa các step */
        }

        .step-wrapper {
            display: flex;
            align-items: center;
        }

        .step-icon-wrapper {
            background-color: #007bff;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 10px auto;
            border: 2px solid #007bff;
        }

        .step-icon {
            font-size: 24px;
            color: #fff;
        }

        .step-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .step-date {
            font-size: 14px;
            color: #6c757d;
        }

        .step-arrow {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 10px;
        }

        .step-arrow i {
            color: #007bff;
            font-size: 40px; /* Adjust arrow size */
        }

        /* Connector between steps */
        .connector {
            height: 2px;
            background-color: #adb5bd;
            position: absolute;
            top: 25px;
            left: 50%;
            z-index: -1;
            width: calc(100% - 50px);
        }

        .step + .connector {
            left: calc(50% - 25px);
        }

        /* Hide element */
        .hide {
            display: none;
        }

        #addProductModal .modal-xl {
            max-width: 1100px !important;
        }

        #addProductModal .modal-body {
            max-height: 600px; /* Đặt chiều cao tối đa của phần thân modal */
            overflow-y: auto; /* Cho phép cuộn nếu nội dung vượt quá chiều cao */
        }

        .form-select {
            width: 100%;
        }

        @page {
            size: A4;
            margin: 0;
        }


        .table-scroll {
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


        #printOverlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        #printFrame {
            width: 0;
            height: 0;
            border: none;
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
                <li class="nav-item">
                    <a class="nav-link" href="/admin/thong-ke/view" style="display: flex; align-items: center">
                        <i class="bi bi-graph-up" style="margin-left: 2px"></i>
                        <span style=" margin-left: 6px">Thống kê doanh thu</span></a>
                </li>

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/ban-hang-tai-quay/hien-thi"
                       style="display: flex; align-items: center">
                        <i class="bi bi-shop" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Bán hàng tại quầy</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item" style="background: linear-gradient(45deg, black, transparent)">
                    <a class="nav-link" href="/admin/hoa-don/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-journal-text" style="color: white; margin-left: 2px"></i>
                        <span style="font-weight: bold; margin-left: 6px">Quản lý hóa đơn</span></a>
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
                <li class="nav-item">
                    <a class="nav-link" href="/admin/quan-ly-nhan-vien/hien-thi"
                       style="display: flex; align-items: center">
                        <i class="bi bi-person-bounding-box" style=" margin-left: 2px"></i>
                        <span style=" margin-left: 6px">Quản lý nhân viên</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/quan-ly-khach-hang/hien-thi"
                       style="display: flex; align-items: center">
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
                    <a class="nav-link" href="/admin/ban-hang-tai-quay/hien-thi"
                       style="display: flex; align-items: center">
                        <i class="bi bi-shop" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Bán hàng tại quầy</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item" style="background: linear-gradient(45deg, black, transparent)">
                    <a class="nav-link" href="/admin/hoa-don/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-journal-text" style="color: white; margin-left: 2px"></i>
                        <span style="font-weight: bold; margin-left: 6px">Quản lý hóa đơn</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/quan-ly-khach-hang/hien-thi"
                       style="display: flex; align-items: center">
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
                <div class="d-flex justify-content-end">
                    <!-- Nút in ra phiếu hóa đơn khi giao hàng theo dạng file PDF -->
                    <%--                    <c:if test="${hoaDonDTO.loaiHoaDon == 1 && hoaDonDTO.trangThai != 1 }">--%>
                    <%--                        <div class="d-flex ms-auto">--%>
                    <%--                            <button id="printDeliveryButton" class="btn btn-primary my-3" onclick="openPrintDeliveryModal()">--%>
                    <%--                                <i class="bi bi-printer"></i> In hóa đơn--%>
                    <%--                            </button>--%>
                    <%--                        </div>--%>
                    <%--                    </c:if>--%>
                </div>

                <%--Bảng theo dõi hóa đơn--%>
                <div class="card mb-3">
                    <div class="card-header">
                        <h5 class="card-title">Quản lý đơn hàng:</h5>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <%-- Hiển thị stepper cho bán hàng tại quầy (LoaiHD == 0) --%>
                            <c:when test="${hoaDonDTO.loaiHoaDon == 0}">
                                <div class="stepper-horizontal" id="stepper_offline">
                                    <div class="step" id="step_offline_1">
                                        <div class="step-icon-wrapper">
                                            <i class="bi bi-card-text step-icon"></i>
                                        </div>
                                        <div class="step-title">Tạo hóa đơn</div>
                                        <div class="step-date">${hoaDonDTO.ngayTao}</div>
                                        <div class="connector"></div>
                                    </div>
                                    <div class="step-arrow">
                                        <i class="bi bi-arrow-right"></i>
                                    </div>
                                    <div class="step" id="step_offline_2">
                                        <div class="step-icon-wrapper">
                                            <i class="bi bi-check-circle step-icon"></i>
                                        </div>
                                        <div class="step-title">Đã hoàn thành</div>
                                        <div class="step-date">${hoaDonDTO.ngayThanhToan}</div>
                                    </div>
                                </div>
                            </c:when>
                            <%-- Hiển thị stepper cho bán hàng online (LoaiHD != 0) --%>
                            <c:otherwise>
                                <div class="stepper-horizontal" id="stepper_online">
                                    <c:forEach var="step" items="${listLichSuHoaDonDTO}" varStatus="status">


                                        <div class="step-wrapper">
                                            <div class="step ${status.index == 0 ? 'active' : ''}"
                                                 id="step_online_${step.index}">
                                                <div class="step-icon-wrapper">
                                                    <c:choose>
                                                        <c:when test="${step.trangThai eq 'Chờ xác nhận'}">
                                                            <i class="bi bi-hourglass-split step-icon"></i>
                                                        </c:when>
                                                        <c:when test="${step.trangThai eq 'Chờ giao hàng'}">
                                                            <i class="bi bi-truck step-icon"></i>
                                                        </c:when>
                                                        <c:when test="${step.trangThai eq 'Đang vận chuyển'}">
                                                            <i class="bi bi-box-seam step-icon"></i>
                                                        </c:when>
                                                        <c:when test="${step.trangThai eq 'Hoàn Thành'}">
                                                            <i class="bi bi-credit-card-2-back step-icon"></i>
                                                        </c:when>
                                                        <c:when test="${step.trangThai eq 'Hủy đơn hàng'}">
                                                            <i class="bi bi-x-circle-fill step-icon"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="bi bi-hourglass-split step-icon"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="step-title">${step.trangThai}</div>
                                                <div class="step-date">${step.thoiGian}</div>
                                            </div>

                                        </div>

                                        <div class="">
                                            <c:if test="${status.index != listLichSuHoaDonDTO.size() - 1}">
                                                <div class="step-arrow">
                                                    <i class="bi bi-arrow-right"></i>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:otherwise>

                        </c:choose>


                    </div>

                    <div class="card-footer">
                        <div class="d-flex justify-content-between align-items-center">
                            <c:if test="${hoaDonDTO.loaiHoaDon == 1 && (hoaDonDTO.trangThai != 6 && hoaDonDTO.trangThai != 7)}">
                                <div class="d-flex">
                                    <c:if test="${hoaDonDTO.trangThai != 6}">
                                        <c:choose>
                                            <c:when test="${hoaDonDTO.trangThai == 1}">
                                                <button type="button" class="btn btn-primary me-2"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#confirmModal" id="btnXacNhan"
                                                        name="btnXacNhan">
                                                    Xác nhận
                                                </button>
                                            </c:when>
                                            <c:when test="${hoaDonDTO.trangThai == 2}">
                                                <button type="button" class="btn btn-primary me-2"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#confirmModal" id="btnChoGiaoHang"
                                                        name="btnChoGiaoHang">
                                                    Chờ giao hàng
                                                </button>
                                            </c:when>
                                            <c:when test="${hoaDonDTO.trangThai == 3}">
                                                <button type="button" class="btn btn-primary me-2"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#confirmModal" id="btnDangGiaoHang"
                                                        name="btnDangGiaoHang">
                                                    Đang vận chuyển
                                                </button>
                                            </c:when>
                                            <c:when test="${hoaDonDTO.trangThai == 4}">
                                                <button type="button" class="btn btn-primary me-2"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#confirmModal" id="btnHoanThanh"
                                                        name="btnHoanThanh">
                                                    Hoàn thành
                                                </button>
                                            </c:when>
                                        </c:choose>

                                        <button type="button" class="btn btn-danger me-1" id="cancelButton"
                                                data-bs-toggle="modal"
                                                data-bs-target="#cancelModal"
                                                <c:if test="${hoaDonDTO.trangThai != 1 && hoaDonDTO.trangThai != 3 }">
                                                    disabled
                                                </c:if>

                                        >
                                            Hủy đơn
                                        </button>
                                    </c:if>

                                        <%--                                    <c:if test="${hoaDonDTO.trangThai != 1 && hoaDonDTO.trangThai != 6}">--%>
                                        <%--                                        <button type="button" class="btn btn-warning ml-1" data-bs-toggle="modal"--%>
                                        <%--                                                data-bs-target="#undoModal">--%>
                                        <%--                                            Hoàn tác--%>
                                        <%--                                        </button>--%>
                                        <%--                                    </c:if>--%>
                                </div>
                            </c:if>

                            <div class="ms-auto">
                                <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                        data-bs-target="#historyModal">
                                    <i class="bi bi-clock-history text-white"></i> Lịch sử
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal xác nhận -->
                <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form id="confirmForm" method="post" action="/admin/hoa-don/xac-nhan/${hoaDonDTO.id}">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalLabel">Xác nhận đơn hàng</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="trangThai" value="${hoaDonDTO.trangThai + 1}">
                                    <div class="mb-3">
                                        <label for="moTa" class="form-label">Mô tả</label>
                                        <textarea placeholder="Nhập nội dung mô tả..." class="form-control" id="moTa"
                                                  name="moTa" rows="3"></textarea>
                                        <div id="moTaError" class="text-danger" style="display: none;">Vui lòng điền mô
                                            tả.
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                                    </button>
                                    <button type="submit" class="btn btn-primary" id="confirmButtonInModal">Xác nhận
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <!-- Modal hoàn tác -->
                <div class="modal fade" id="undoModal" tabindex="-1" aria-labelledby="undoModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form id="undoForm" method="post" action="/hoa-don/hoan-tac/${hoaDonDTO.id}">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="undoModalLabel">Hoàn tác đơn hàng</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="trangThai" value="${hoaDonDTO.trangThai - 1}">
                                    <div class="mb-3">
                                        <label for="moTaUndo" class="form-label">Mô tả</label>
                                        <textarea placeholder="Nhập nội dung mô tả..." class="form-control"
                                                  id="moTaUndo" name="moTa" rows="3"></textarea>
                                        <div id="moTaUndoError" class="text-danger" style="display: none;">Vui lòng điền
                                            mô tả.
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                                    </button>
                                    <button type="submit" class="btn btn-warning">Hoàn tác</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <!-- Modal hủy hóa đơn -->
                <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form id="cancelForm" method="post" action="/admin/hoa-don/huy/${hoaDonDTO.id}">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="cancelModalLabel">Hủy đơn hàng</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="trangThai" value="${hoaDonDTO.trangThai + 1}">
                                    <div class="mb-3">
                                        <label for="moTa" class="form-label">Lý do hủy đơn hàng</label>
                                        <textarea class="form-control" id="moTaHuyDon" name="lyDo" rows="3"></textarea>
                                        <div id="reasonError" class="text-danger" style="display: none;">Vui lòng điền
                                            lý do hủy đơn hàng
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                                    </button>
                                    <button type="button" class="btn btn-primary" id="confirmCancelBtn">Xác nhận
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <!-- Modal lịch sử hóa đơn-->
                <div class="modal fade" id="historyModal" tabindex="-1" aria-labelledby="historyModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog  modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="historyModalLabel">Lịch sử hóa đơn</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped table-hover">
                                    <thead class="table-primary">
                                    <tr>
                                        <th>STT</th>
                                        <th>Trạng thái</th>
                                        <th>Thời gian</th>
                                        <th>Người xác nhận</th>
                                        <th>Ghi chú</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="lichSuHD" varStatus="i" items="${listLichSuHoaDonDTO}">
                                        <tr>
                                            <td>${i.index + 1}</td>
                                            <td>${lichSuHD.trangThai}</td>
                                            <td>${lichSuHD.thoiGian}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty lichSuHD.hoTen and not empty lichSuHD.chucVu}">
                                                        ${lichSuHD.hoTen} - ${lichSuHD.chucVu}
                                                    </c:when>
                                                    <c:otherwise></c:otherwise>
                                                </c:choose>
                                            </td>

                                            <td>${lichSuHD.ghiChu}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            </div>
                        </div>
                    </div>
                </div>


                <%--    Bảng lịch sử thanh toán--%>


                <div class="card mb-3">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title mb-0">Lịch sử thanh toán:</h5>


                        <%--                        <c:if test="${hoaDonDTO.loaiHoaDon == 1 && hoaDonDTO.trangThai == 4}">--%>
                        <%--                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"--%>
                        <%--                                    data-bs-target="#paymentModal"--%>
                        <%--                                    <c:if test="${hoaDonDTO.trangThai == 6}">--%>
                        <%--                                        disabled--%>
                        <%--                                    </c:if>--%>
                        <%--                            >--%>
                        <%--                                <i class="bi bi-plus-lg"></i> Thanh Toán--%>
                        <%--                            </button>--%>
                        <%--                        </c:if>--%>
                    </div>

                    <div class="card-body">
                        <table class="table table-bordered" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <%--                                                    <th>Mã GD</th>--%>
                                <th>Số tiền</th>
                                <th>Trạng thái</th>
                                <th>Thời gian</th>
                                <th>Phương thức thanh toán</th>
                                <th>Người xác nhận</th>
                                <th>Ghi chú</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:if test="${(hoaDonDTO.phuongThucThanhToan == 1 || (hoaDonDTO.phuongThucThanhToan == 0 && hoaDonDTO.trangThai == 6))}">
                                <tr>
                                    <td>1</td>
                                    <td><fmt:formatNumber value="${tongTienThanhToan}" type="currency"
                                                          currencySymbol="₫"
                                                          groupingUsed="true"/>
                                    </td>
                                    <td>
                                    <span class="badge rounded-pill bg-success">
                                        Thành công
                                    </span>
                                    </td>
                                    <td>
                                            ${hoaDonDTO.ngayThanhToan}
                                    </td>
                                    <td>
                                        <span class="badge rounded-pill bg-primary">${hoaDonDTO.phuongThucThanhToan == 0 ? "Tiền mặt" :"Chuyển khoản"}</span>
                                    </td>

                                    <td>
                                            ${hoaDonDTO.nhanVien.hoTen}
                                    </td>
                                    <td>
                                            ${hoaDonDTO.ghiChu}
                                    </td>
                                </tr>
                            </c:if>

                            </tbody>

                        </table>

                    </div>

                </div>


                <!-- Modal thanh toán -->
                <!-- Payment Modal -->
                <div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="paymentModalLabel">Thanh toán</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="/admin/hoa-don/xac-nhan-thanh-toan" method="post">
                                    <input type="hidden" name="id" value="${hoaDonDTO.id}">
                                    <div class="mb-3">
                                        <label for="totalAmountInput" class="form-label">Tổng tiền:</label>
                                        <input name=""
                                               value="<fmt:formatNumber value="${hoaDonDTO.tongTien}" type="currency" currencySymbol="₫"/>"
                                               disabled type="text" class="form-control" id="totalAmountInput"
                                               placeholder="">
                                    </div>
                                    <div class="mb-3">
                                        <label for="paidAmountInput" class="form-label">Tiền khách đưa:</label>
                                        <input type="text" class="form-control" id="paidAmountInput" name="tongTien"
                                               placeholder="Nhập số tiền khách đưa ">
                                    </div>
                                    <div class="mb-3 d-flex align-items-center">
                                        <label class="form-label me-3">Hình thức:</label>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="phuongThucThanhToan"
                                                   id="cashRadio" value="0" checked>
                                            <label class="form-check-label" for="cashRadio">Tiền mặt</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="phuongThucThanhToan"
                                                   id="transferRadio" value="1">
                                            <label class="form-check-label" for="transferRadio">Chuyển khoản</label>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="noteInput" class="form-label">Ghi chú:</label>
                                        <textarea class="form-control" id="noteInput" name="ghiChu" rows="3"></textarea>
                                    </div>
                                    <div class="d-flex justify-content-end mb-3">
                                        <label class="form-label me-2">Số tiền:</label>
                                        <fmt:formatNumber value="${hoaDonDTO.tongTien}" type="currency"
                                                          currencySymbol="₫"/>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy
                                        </button>
                                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <%--                <!-- Thông tin đơn hàng -->--%>
                <div class="row d-flex align-items-stretch">
                    <div class="col-7 mb-3 d-flex align-items-stretch">
                        <div class="card w-100 h-100">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="m-0 font-weight-bold">Thông tin đơn hàng: ${hoaDonDTO.ma}</h5>

                                <c:if test="${hoaDonDTO.loaiHoaDon == 1}">
<%--                                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"--%>
<%--                                            data-bs-target="#updateModal"--%>
<%--                                            <c:if test="${hoaDonDTO.trangThai != 1 && hoaDonDTO.trangThai != 3}">--%>
<%--                                                disabled--%>
<%--                                            </c:if>>--%>
<%--                                        Thay đổi--%>
<%--                                    </button>--%>
                                </c:if>
                            </div>

                            <div class="card-body">
                                <%--   Thông tin chi tiết hóa đơn --%>
                                <div>
                                    <c:choose>
                                        <%--Hiển thị thông tin bán hàng tại quày--%>
                                        <c:when test="${hoaDonDTO.loaiHoaDon == 0 }">
                                            <div class="row mt-1">
                                                <div class="col-6">
                                                    <div>
                                                        <p class="fw-bold mb-1 pb-3 small ">Trạng thái:
                                                            <span class="badge rounded-pill ${hoaDonDTO.maMau}">
                                                                    ${hoaDonDTO.trangThaiText}
                                                            </span>

                                                        </p>
                                                        <p class="fw-bold mb-1 pb-3 small">Tên khách hàng: <span
                                                                class="fw-normal">${khachHang.hoTen == null ? "Khách lẻ" : khachHang.hoTen }</span>
                                                        </p>


                                                        <c:choose>
                                                            <c:when test="${diaChiKhachHang.id != null}">
                                                                <p class="fw-bold mb-1 pb-3 small">Địa chỉ:
                                                                    <span id="address" class="fw-normal">
                                                             ${diaChiKhachHang.diaChiChiTiet}, ${diaChiKhachHang.idPhuongXa}, ${diaChiKhachHang.idQuanHuyen}, ${diaChiKhachHang.idTinhThanh}
                                                              </span>
                                                                </p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p class="fw-bold mb-1 pb-3 small">Địa chỉ:
                                                                    <span id="AddressOffline" class="fw-normal">
                                                                            ${diaChiKhachHang.diaChiChiTiet}

                                                                    </span>
                                                                </p>
                                                            </c:otherwise>
                                                        </c:choose>


                                                        <p class="fw-bold mb-1 pb-3 small">Ghi chú:
                                                            <span
                                                                    class="fw-normal">${giaoHangDTO.ghiChu}</span>
                                                        </p>

                                                        <c:if test="${hoaDonDTO.loaiHoaDon == 0}">
                                                            <p class="fw-bold mb-1 small">Người tạo: <span
                                                                    class="fw-normal">${hoaDonDTO.nhanVien.hoTen}</span>
                                                            </p>
                                                        </c:if>


                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <p class="fw-bold mb-1 pb-3 small">Loại hóa đơn: <span
                                                            class=" fw-normal badge rounded-pill ${hoaDonDTO.loaiHoaDon == 0 ? 'bg-success' : 'bg-primary'}">
                                                            ${hoaDonDTO.loaiHoaDon == 0 ? "Bán tại quầy" :"Bán online"}</span>
                                                    </p>
                                                    <p class="fw-bold mb-1 pb-3 small">Phương thức thanh toán: <span
                                                            class="fw-normal badge rounded-pill bg-primary">${hoaDonDTO.phuongThucThanhToan == 0 ? "Tiền mặt" : "Chuyển khoản"}</span>
                                                    </p>
                                                    <p class="fw-bold mb-1 pb-3 small">Số điện thoại: <span
                                                            class="fw-normal">${khachHang.sdt == null ? "" : khachHang.sdt}</span>
                                                    </p>


                                                    <p class="fw-bold mb-1 pb-3 small">Email:
                                                        <span
                                                                class="fw-normal"> ${khachHang.email == null ? "" : khachHang.email}
                                                        </span>
                                                    </p>
                                                    <p class="fw-bold mb-1 pb-3 small">Ngày tạo: <span
                                                            class="fw-normal">${hoaDonDTO.ngayTao}</span></p>
                                                </div>
                                            </div>

                                        </c:when>
                                        <c:otherwise>
                                            <div class="row mt-1">
                                                <div class="col-6">
                                                    <div>
                                                        <p class="fw-bold mb-1 pb-3 small ">Trạng thái:
                                                            <span class="badge rounded-pill ${hoaDonDTO.maMau}">
                                                                    ${hoaDonDTO.trangThaiText}
                                                            </span>

                                                        </p>
                                                        <p class="fw-bold mb-1 pb-3 small">Tên người nhận: <span
                                                                class="fw-normal">${giaoHangDTO.tenNguoiNhan == null ? "Khách lẻ" : giaoHangDTO.tenNguoiNhan }</span>
                                                        </p>
                                                        <p class="fw-bold mb-1 pb-3 small">Địa chỉ:
                                                            <span id="fullAddressOnline" class="fw-normal">
                                                        ${giaoHangDTO.diaChiChiTiet}, ${giaoHangDTO.idPhuongXa}, ${giaoHangDTO.idQuanHuyen}, ${giaoHangDTO.idTinhThanh}
                                                    </span>
                                                        </p>
                                                        <p class="fw-bold mb-1 pb-3 small">Ghi chú:
                                                            <span
                                                                    class="fw-normal">${giaoHangDTO.ghiChu}</span>
                                                        </p>
                                                        <c:choose>
                                                            <c:when test="${hoaDonDTO.loaiHoaDon == 1}">
                                                                <p class="fw-bold mb-1 small">Phí vận chuyển:
                                                                    <span class="fw-normal" id="phiShipHoaDon">
                                                             <fmt:formatNumber
                                                                     value="${giaoHangDTO.phiShip == null ? 0 : giaoHangDTO.phiShip }"
                                                                     type="currency"
                                                                     currencySymbol="₫" groupingUsed="true"/>
                                                        </span></p>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <p class="fw-bold mb-1 pb-3 small">Loại hóa đơn: <span
                                                            class=" fw-normal badge rounded-pill ${hoaDonDTO.loaiHoaDon == 0 ? 'bg-success' : 'bg-primary'}">
                                                            ${hoaDonDTO.loaiHoaDon == 0 ? "Bán tại quầy" :"Bán online"}</span>
                                                    </p>
                                                    <p class="fw-bold mb-1 pb-3 small">Phương thức thanh toán: <span
                                                            class="fw-normal badge rounded-pill bg-primary">${hoaDonDTO.phuongThucThanhToan == 0 ? "Tiền mặt" : "Chuyển khoản"}</span>
                                                    </p>
                                                    <p class="fw-bold mb-1 pb-3 small">Số điện thoại: <span
                                                            class="fw-normal">${giaoHangDTO.sdtNguoiNhan == null ? "" : giaoHangDTO.sdtNguoiNhan}</span>
                                                    </p>


                                                    <p class="fw-bold mb-1 pb-3 small">Email:
                                                        <span
                                                                class="fw-normal"> ${hoaDonDTO.khachHang.email == null ? "" : hoaDonDTO.khachHang.email}
                                                        </span>
                                                    </p>
                                                    <p class="fw-bold mb-1 pb-3 small">Ngày tạo: <span
                                                            class="fw-normal">${hoaDonDTO.ngayTao}</span></p>


                                                </div>
                                            </div>

                                        </c:otherwise>
                                    </c:choose>


                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- Chi phí của đơn hàng--%>
                    <div class="col-5 mb-3 d-flex align-items-stretch">
                        <div class="card w-100 h-100">
                            <div class="card-header">
                                <h5 class="card-title">Chi phí đơn hàng</h5>
                            </div>
                            <div class="card-body">
                                <c:set var="giamGia"
                                       value="${hoaDonDTO.khuyenMai.soTienGiam != null ? hoaDonDTO.khuyenMai.soTienGiam : 0}"/>
                                <c:set var="tongTien" value="${tongTienDonHang != null ? tongTienDonHang : 0}"/>
                                <c:set var="phiVanChuyen"
                                       value="${giaoHangDTO.phiShip != null ? giaoHangDTO.phiShip : 0}"/>
                                <div class="row">
                                    <div class="col-12">
                                        <p class="fw-bold mb-1 pb-3 small d-flex justify-content-between">
                                            <span>Tổng tiền đơn hàng:</span>
                                            <span class="text-danger" id="tongTienValue" data-tongtien="${tongTien}">
                            <fmt:formatNumber value="${tongTien}" type="currency" currencySymbol="₫"
                                              groupingUsed="true"/>
                        </span>
                                        </p>

                                        <p class="fw-bold mb-1 pb-3 small d-flex justify-content-between">
                                            <span>Phí vận chuyển:</span>
                                            <span class="fw-normal " name="phiShip" id="phiVanChuyen"
                                                  data-phiship="${phiVanChuyen}">
                                                <fmt:formatNumber value="${phiVanChuyen}" type="currency"
                                                                  currencySymbol="₫"
                                                                  groupingUsed="true"/>
                                            </span>
                                            <input type="text" hidden value="${phiVanChuyen}" name="phiShip">

                                        </p>

                                        <p class="fw-bold mb-1 pb-3 small d-flex justify-content-between">
                                            <span>Phiếu giảm giá:</span>
                                            <span class="fw-normal" id="phieuGiamGia" data-giamgia="${giamGia}">
                                                ${hoaDonDTO.khuyenMai.ma == null ? "N/A" : hoaDonDTO.khuyenMai.ma}
                                            </span>
                                        </p>

                                        <p class="fw-bold mb-1 pb-3 small d-flex justify-content-between">
                                            <span>Giảm giá:</span>
                                            <span class="fw-normal" id="giamGia">
                            <fmt:formatNumber value="${giamGia}" type="currency" currencySymbol="₫"
                                              groupingUsed="true"/>
                        </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p class="fw-bold mb-1 pb-3 small d-flex justify-content-between">
                                    <span>Tổng tiền thanh toán:</span>

                                    <c:if test="${tongTienThanhToan>hoaDonDTO.khuyenMai.soTienGiam}">
                                         <span class="text-danger" id="tongTienThanhToanValue">
                    <c:set var="tongTienThanhToan" value="${tongTienThanhToan}"/>
                    <fmt:formatNumber value="${tongTienThanhToan}" type="currency" currencySymbol="₫"
                                      groupingUsed="true"/>
                </span>
                                    </c:if>

                                    <c:if test="${tongTienThanhToan<hoaDonDTO.khuyenMai.soTienGiam}">
                                         <span class="text-danger" >
                                             0đ
                                    </span>
                                    </c:if>

                                </p>
                            </div>
                        </div>
                    </div>


                    <!-- End Recent Activity -->
                </div>
            </div>

            <!-- Modal cập nhật thông tin khách hàng -->
            <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateModalLabel">Cập nhật thông tin khách hàng</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="updateForm" method="post" action="/hoa-don/cap-nhat/${hoaDonDTO.id}">
                                <input type="hidden" name="tenTinhThanh" id="tenTinhThanh">
                                <input type="hidden" name="tenQuanHuyen" id="tenQuanHuyen">
                                <input type="hidden" name="tenPhuongXa" id="tenPhuongXa">


                                <div class="mb-3">
                                    <label for="hoTen" class="form-label">Họ tên:</label>
                                    <input type="text" class="form-control" id="hoTen" name="tenNguoiNhan"
                                           value="${giaoHangDTO.tenNguoiNhan}">
                                    <div id="hoTenError" class="text-danger"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="sdt" class="form-label">Số điện thoại:</label>
                                    <input type="text" class="form-control" id="sdt" name="sdtNguoiNhan"
                                           value="${giaoHangDTO.sdtNguoiNhan}">
                                    <div id="sdtError" class="text-danger"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="diaChiChiTiet" class="form-label">Địa chỉ cụ thể:</label>
                                    <input type="text" class="form-control" id="diaChiChiTiet" name="diaChiChiTiet"
                                           value="${giaoHangDTO.diaChiChiTiet}">
                                    <div id="diaChiChiTietError" class="text-danger"></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <label for="tinh" class="form-label">Tỉnh/Thành Phố:</label>
                                        <select class="form-select" id="tinh" name="idTinhThanh"
                                                title="Chọn tỉnh thành">
                                            <!-- Options populated dynamically -->
                                            <option value="${giaoHangDTO.idTinhThanh}">${giaoHangDTO.idTinhThanh}</option>
                                        </select>
                                        <div id="tinhError" class="text-danger"></div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="huyen" class="form-label">Quận/Huyện:</label>
                                        <select class="form-select" id="huyen" name="idQuanHuyen"
                                                title="Chọn quận huyện">
                                            <!-- Options populated dynamically -->
                                            <option value="${giaoHangDTO.idQuanHuyen}">${giaoHangDTO.idQuanHuyen}</option>
                                        </select>
                                        <div id="huyenError" class="text-danger"></div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="xa" class="form-label">Phường/Xã:</label>
                                        <select class="form-select" id="xa" name="idPhuongXa" title="Chọn phường xã">
                                            <!-- Options populated dynamically -->
                                            <%--                                            <option value="" selected>Chọn phường xã</option>--%>
                                            <option value="${giaoHangDTO.idPhuongXa}">${giaoHangDTO.idPhuongXa}</option>
                                        </select>
                                        <div id="xaError" class="text-danger"></div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="phiShip" class="form-label">Phí ship</label>
                                    <input type="number" class="form-control" id="phiShip" name="phiShip"
                                           value="${giaoHangDTO.phiShip}">
                                    <div id="phiShipError" class="text-danger"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="ghiChu" class="form-label">Ghi chú</label>
                                    <textarea class="form-control" id="ghiChu"
                                              name="ghiChu">${giaoHangDTO.ghiChu}</textarea>
                                    <div id="ghiChuError" class="text-danger"></div>
                                </div>
                            </form>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary" id="updateButton">Cập nhật</button>
                        </div>
                    </div>
                </div>
            </div>


            <%-- Thông tin sản phẩm đã mua           --%>
            <div class="card shadow mb-4 mx-2" id="custom-card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="m-0 font-weight-bold">Thông tin sản phẩm đã mua</h5>
                    <c:if test="${hoaDonDTO.loaiHoaDon == 1 && hoaDonDTO.phuongThucThanhToan != 1}">
                        <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal"
                                data-bs-target="#addProductModal"
                                <c:if test="${hoaDonDTO.trangThai != 1 && hoaDonDTO.trangThai != 3 }">
                                    disabled
                                </c:if>
                        >
                            <i class="bi bi-plus text-white"></i>
                            Thêm sản phẩm
                        </button>
                    </c:if>
                </div>

                <div class="card-body custom-card-body">
                    <table class="table table-bordered custom-table">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Ảnh sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá sản phẩm</th>
                            <th>Màu sắc</th>
                            <th>Kích thước</th>
                            <th>Số lượng</th>
                            <th>Tổng Tiền</th>
                            <c:if test="${hoaDonDTO.loaiHoaDon == 1 && hoaDonDTO.phuongThucThanhToan != 1}">
                                <th>Thao tác</th>
                            </c:if>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="chiTiet" items="${listHDCT}" varStatus="i">
                            <tr class="product-row">
                                <td>${i.index + 1}</td>
                                <td>
                                    <c:set var="hinhAnh" value="${hinhAnhMap[chiTiet.idCTSP.id]}"/>
                                    <c:choose>
                                        <c:when test="${not empty hinhAnh.hinhAnh1}">
                                            <img src="/image/${hinhAnh.hinhAnh1}" alt="Ảnh sản phẩm" width="50">
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>${chiTiet.idCTSP.idSanPham.ten} - ${chiTiet.idCTSP.idSanPham.ma} </td>
                                <td class="total-amount" id="total-${chiTiet.idCTSP.id} ">
                                    <span class="text-danger" id="donGiaSanPham">
                                         <fmt:formatNumber value="${chiTiet.donGia}" type="currency"
                                                           currencySymbol="₫" groupingUsed="true"/>
                                    </span>
                                </td>
                                <td>${chiTiet.idCTSP.idMauSac.ten}</td>
                                <td>${chiTiet.idCTSP.idKichThuoc.ten}</td>
                                <td>
                                    <c:if test="${hoaDonDTO.loaiHoaDon == 0}">
                                        ${chiTiet.soLuong}
                                    </c:if>
                                    <c:if test="${hoaDonDTO.loaiHoaDon == 1}">
                                        <c:choose>
                                            <c:when test="${hoaDonDTO.phuongThucThanhToan == 1}">
                                                <input type="number" id="soLuong-${chiTiet.idCTSP.id}"
                                                       value="${chiTiet.soLuong}"
                                                       data-id="${chiTiet.idCTSP.id}" data-hoadon="${hoaDonDTO.id}"
                                                       class="form-control form-control-sm" style="width: 100px;"
                                                       min="1" disabled>
                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${hoaDonDTO.trangThai != 1 && hoaDonDTO.trangThai != 3}">
                                                        <input type="number" id="soLuong-${chiTiet.idCTSP.id}"
                                                               value="${chiTiet.soLuong}"
                                                               data-id="${chiTiet.idCTSP.id}"
                                                               data-hoadon="${hoaDonDTO.id}"
                                                               class="form-control form-control-sm"
                                                               style="width: 100px;"
                                                               min="1" disabled>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="number" id="soLuong-${chiTiet.idCTSP.id}"
                                                               value="${chiTiet.soLuong}"
                                                               data-id="${chiTiet.idCTSP.id}"
                                                               data-hoadon="${hoaDonDTO.id}"
                                                               class="form-control form-control-sm"
                                                               style="width: 100px;"
                                                               min="1">
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>

                                </td>
                                <td class="text-danger fw-bold" id="tongTienSanPham-${chiTiet.idCTSP.id}">
                                    <c:set var="tongTienSanPham" value="${chiTiet.donGia * chiTiet.soLuong}"></c:set>
                                    <span class="text-danger fw-bold">
                                         <fmt:formatNumber value="${tongTienSanPham}" type="currency"
                                                           currencySymbol="₫" groupingUsed="true"/>
                                    </span>
                                </td>
                                <c:if test="${hoaDonDTO.loaiHoaDon == 1 && hoaDonDTO.phuongThucThanhToan == 0}">
                                    <td>
                                        <c:choose>
                                            <c:when test="${hoaDonDTO.trangThai != 1 && hoaDonDTO.trangThai != 3}">
                                                <button type="button" class="btn btn-outline-warning"
                                                        id="editBtn-${chiTiet.idCTSP.id}" disabled>
                                                    <i class="bi bi-arrow-clockwise" style="font-size: 1.0em;"></i>
                                                </button>
                                                <button type="button" class="btn btn-outline-danger"
                                                        id="deleteBtn-${chiTiet.idCTSP.id}" disabled>
                                                    <i class="bi bi-trash-fill" style="font-size: 1.3em;"></i>
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="btn btn-outline-warning  update-sl"
                                                        id="editBtn-${chiTiet.idCTSP.id}" data-id="${chiTiet.idCTSP.id}"
                                                        data-hoadon="${hoaDonDTO.id}">
                                                    <i class="bi bi-arrow-clockwise" style="font-size: 1.0em; "></i>
                                                </button>

                                                <c:if test="${!(loaiHoaDon == 1 && phuongThucThanhToan == 1)}">

                                                    <button type="button"
                                                            class="btn btn-outline-danger btn-sm delete-product"
                                                            data-id="${chiTiet.idCTSP.id}" data-hoadon="${hoaDonDTO.id}"
                                                            id="deleteBtn-${chiTiet.idCTSP.id}">
                                                        <i class="bi bi-trash-fill" style="font-size: 1.3em;"></i>
                                                    </button>

                                                </c:if>

                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->


        <%--  Modal thêm sản phẩm vào hóa đơn--%>
        <div class="modal fade" name="addProductModal" id="addProductModal" tabindex="-1"
             aria-labelledby="addProductModalLabel" aria-hidden="true" data-bs-backdrop="static"
             data-bs-keyboard="false">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addProductModalLabel">Thêm sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <input type="text" hidden value="${hoaDonDTO.id}" name="idHoaDon">
                        <input type="text" hidden value="${giaoHangDTO.phiShip}" name="phiShip">


                        <!-- Phần input tìm kiếm và các select -->
                        <%--                        <div class="mb-3 p-3" style="background-color: #f0f0f0;">--%>
                        <!-- Phần input tìm kiếm và nút tìm kiếm -->
                        <%--                            <div class="d-flex align-items-center">--%>
                        <%--                                <input type="text" class="form-control" name="search" id="searchInput"--%>
                        <%--                                       placeholder="Nhập từ khóa tìm kiếm..." style="width: 750px;">--%>
                        <%--                                <button class="btn btn-primary mx-3" type="button" id="searchButton">Tìm kiếm</button>--%>
                        <%--                                <button class="btn btn-danger mx-2" type="button" id="refreshButton">Làm mới</button>--%>
                        <%--                            </div>--%>

                        <!-- Các select -->
                        <%-- Lọc theo thuộc tính                             --%>
                        <%--                            <form method="post" action="/hoa-don/filter">--%>
                        <%--                                <div class="row mt-3">--%>
                        <%--                                    <div class="col-md-3">--%>
                        <%--                                        <label for="colorSelect" class="form-label">Màu sắc</label>--%>
                        <%--                                        <select class="form-select" id="colorSelect">--%>
                        <%--                                            <option value="">Tất cả</option> <!-- Option cho tất cả -->--%>
                        <%--                                            <c:forEach var="mauSac" items="${listMauSac}">--%>
                        <%--                                                <option value="${mauSac.id}">${mauSac.ten}</option>--%>
                        <%--                                            </c:forEach>--%>
                        <%--                                        </select>--%>
                        <%--                                    </div>--%>
                        <%--                                    <div class="col-md-3">--%>
                        <%--                                        <label for="sizeSelect" class="form-label">Kích thước</label>--%>
                        <%--                                        <select class="form-select" id="sizeSelect">--%>
                        <%--                                            <option value="">Tất cả</option> <!-- Option cho tất cả -->--%>
                        <%--                                            <c:forEach var="kichThuoc" items="${listKichThuoc}">--%>
                        <%--                                                <option value="${kichThuoc.id}">${kichThuoc.ten}</option>--%>
                        <%--                                            </c:forEach>--%>
                        <%--                                        </select>--%>
                        <%--                                    </div>--%>
                        <%--                                    <div class="col-md-3">--%>
                        <%--                                        <label for="materialSelect" class="form-label">Chất liệu</label>--%>
                        <%--                                        <select class="form-select" id="materialSelect">--%>
                        <%--                                            <option value="">Tất cả</option> <!-- Option cho tất cả -->--%>
                        <%--                                            <c:forEach var="chatLieu" items="${listChatLieu}">--%>
                        <%--                                                <option value="${chatLieu.id}">${chatLieu.ten}</option>--%>
                        <%--                                            </c:forEach>--%>
                        <%--                                        </select>--%>
                        <%--                                    </div>--%>
                        <%--                                    <div class="col-md-3">--%>
                        <%--                                        <label for="sleeveSelect" class="form-label">Kiểu tay</label>--%>
                        <%--                                        <select class="form-select" id="sleeveSelect">--%>
                        <%--                                            <option value="">Tất cả</option> <!-- Option cho tất cả -->--%>
                        <%--                                            <c:forEach var="kieuTay" items="${listKieuTay}">--%>
                        <%--                                                <option value="${kieuTay.id}">${kieuTay.ten}</option>--%>
                        <%--                                            </c:forEach>--%>
                        <%--                                        </select>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </form>--%>

                        <%--                        </div>--%>

                        <!-- Bảng thông tin sản phẩm -->
                        <table class="table table-hover table-bordered custom-table ">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên sản phẩm</th>
                                <th>Ảnh sản phẩm</th>
                                <th>Màu sắc</th>
                                <th>Kích thước</th>
                                <th>Số lượng</th>
                                <th>Đơn giá</th>
                                <th>Trạng thái</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody id="chiTietSanPhamTableBody">
                            <c:forEach var="product" items="${listCTSP.content}" varStatus="status">
                                <tr data-id="${product.id}">
                                <c:if test="${product.soLuong > 0 }">
                                    <td>${status.index + 1}</td>
                                    <td>${product.idSanPham.ten} - ${product.idSanPham.ma}

                                    </td>
                                    <td>
                                        <c:set var="hinhAnh" value="${hinhAnhMapCTSP[product.id]}"/>
                                        <c:choose>
                                            <c:when test="${not empty hinhAnh}">
                                                <img src="/image/${hinhAnh.hinhAnh1}" alt="Ảnh sản phẩm" width="50">
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${product.idMauSac.ten}</td>
                                    <td>${product.idKichThuoc.ten}</td>
                                    <td data-quantity="${product.soLuong}">${product.soLuong}</td>

                                    <td>
                                        <fmt:formatNumber value="${product.giaBan}"
                                                          type="currency"
                                                          currencySymbol="₫"
                                                          groupingUsed="true"
                                        />
                                    </td>
                                    <td>
                                        <span
                                                class=" fw-normal badge rounded-pill ${product.trangThai == 0 ? 'bg-danger' : 'bg-success'}">
                                                ${product.trangThai == 0 ? "Hết hàng" : "Còn hàng"}
                                        </span>
                                    </td>
                                    <td>
                                        <!-- Thao tác, ví dụ như nút sửa, xóa -->
                                        <a href="/admin/hoa-don/them-san-pham/${product.id}?idHoaDon=${hoaDonDTO.id}">
                                            <button class="btn btn-primary btn-sm">Chọn</button>
                                        </a>
                                    </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <div class="modal-footer">
                        <div class="float-end" id="pagination">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <!-- Thêm phân trang nếu cần -->
                                    <c:if test="${pageCTSP.hasPrevious()}">
                                        <li class="page-item"><a class="page-link"
                                                                 href="?page=${pageCTSP.number - 1}">&laquo;</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${pageCTSP.totalPages > 0}">
                                        <c:forEach var="i" begin="0" end="${pageCTSP.totalPages - 1}">
                                            <li class="page-item ${pageCTSP.number == i ? 'active' : ''}">
                                                <a class="page-link" href="?page=${i}">${i + 1}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${pageCTSP.hasNext()}">
                                        <li class="page-item"><a class="page-link"
                                                                 href="?page=${pageCTSP.number + 1}">&raquo;</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--       In phiếu giao hàng--%>
        <div id="printOverlay">
            <iframe id="printFrame"></iframe>
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
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="/view_admin/vendor/jquery/jquery.min.js"></script>
<script src="/view_admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/view_admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/view_admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<%--<script src="/view_admin/vendor/chart.js/Chart.min.js"></script>--%>

<!-- Page level custom scripts -->
<%--<script src="/view_admin/js/demo/chart-area-demo.js"></script>--%>
<%--<script src="/view_admin/js/demo/chart-pie-demo.js"></script>--%>

<!-- Page level custom scripts -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    var token = '108bdaef-8395-11ee-af43-6ead57e9219a';
    var tongTien = ${tongTienDonHang};
    var soLuongGioHang = ${soLuongGioHang};
    var giamGia = ${giamGia};

    // Function to get JSON with token
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

    //start debug
    // Hàm tính lại phí ship và tổng tiền thanh toán
    function calculateShippingAndTotal(tongTien, soLuongGioHang, giamGia) {
        // Get necessary values
        var idQuanHuyenTest = ${diaChiKhachHang.idQH};
        var idPhuongXaTest = ${diaChiKhachHang.idPX};
        <%--var soLuongGioHang = ${soLuongGioHang};--%>
        // var tongTien = parseFloat($('#tongTienValue').data('tongtien')) || 0;
        // Nếu tổng tiền hàng về 0
        if (tongTien <= 0) {
            $('#tongTienThanhToanValue').text(new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(0));
            $('#phiVanChuyen').text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(0));
            $('#phiShipHoaDon').text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(0));
            $('#giamGia').text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(giamGia));
            return; // Không cần thực hiện các bước tính phí ship
        }

        // Calculate weight
        var khoiLuong = soLuongGioHang * 200;
        console.log("Tổng sl: ", soLuongGioHang);
        console.log("Tổng kl: ", khoiLuong);

        // Step 1: Get the service_id
        getJSONWithToken('https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services?shop_id=1244&to_district=' + idQuanHuyenTest + '&from_district=3440', function (data_maDV) {
            var service_id = data_maDV.data[0].service_id;
            console.log("API maDV: ", service_id);

            // Step 2: Calculate shipping fee based on service_id and other parameters
            getJSONWithToken('https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee?service_id=' + service_id + '&insurance_value=' + tongTien + '&from_district_id=3440&to_district_id=' + idQuanHuyenTest + '&to_ward_code=' + idPhuongXaTest + '&height=15&length=15&weight=' + khoiLuong + '&width=15', function (data_total) {

                var firstFee = data_total.data.total;
                console.log("API Response: ", firstFee); // Log the shipping fee
                // Calculate the new total
                var newTotal = tongTien + firstFee - giamGia;

                // Update the total amount in the DOM
                $('#tongTienThanhToanValue').text(new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(newTotal));
                $('#phiVanChuyen').text(new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(firstFee));
                $('#phiShipHoaDon').text(new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(firstFee));
                $('#giamGia').text(new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(giamGia));

            });
        });
    }

    // Initial calculation on page load
    calculateShippingAndTotal(tongTien, soLuongGioHang, giamGia);
    //end debug
    // Hàm trả về phí ship
    function tinhPhiShip(tongTien, soLuongGioHang, giamGia, callback) {
        // Get necessary values
        var idQuanHuyenTest = ${diaChiKhachHang.idQH};
        var idPhuongXaTest = ${diaChiKhachHang.idPX};

        // If total amount is zero or less
        if (tongTien <= 0) {
            callback(0); // Return 0 shipping fee if no items
            return;
        }

        // Calculate weight
        var khoiLuong = soLuongGioHang * 200;
        console.log("Tổng sl: ", soLuongGioHang);
        console.log("Tổng kl: ", khoiLuong);

        // Step 1: Get the service_id
        getJSONWithToken('https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services?shop_id=1244&to_district=' + idQuanHuyenTest + '&from_district=3440', function (data_maDV) {
            var service_id = data_maDV.data[0].service_id;
            console.log("API maDV: ", service_id);

            // Step 2: Calculate shipping fee based on service_id and other parameters
            getJSONWithToken('https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee?service_id=' + service_id + '&insurance_value=' + tongTien + '&from_district_id=3440&to_district_id=' + idQuanHuyenTest + '&to_ward_code=' + idPhuongXaTest + '&height=15&length=15&weight=' + khoiLuong + '&width=15', function (data_total) {

                var firstFee = data_total.data.total;
                console.log("API Response: ", firstFee); // Log the shipping fee

                /// continue
                // Return the shipping fee via callback
                callback(firstFee);
            });
        });
    }
    let newPhiShip = 0;
    function getPhiVanChuyenValue() {
        var spanElement = document.getElementById('phiVanChuyen');
        var displayedValue = spanElement.textContent || spanElement.innerText;
        // Remove the currency symbol (₫) and commas
        var numericValue = displayedValue.replace(/[₫,]/g, '').trim();
        // Convert the cleaned string to a number
        var numberValue = parseFloat(numericValue);
        // Multiply by 100 to convert to integer value
        var integerValue = Math.round(numberValue * 1000);
        // Output the result
        console.log("Converted value:", integerValue);
        newPhiShip = integerValue;
        const queryString = window.location.pathname;
        const pathParts = queryString.split('/');
        const pathVariable = pathParts[pathParts.length - 1];
        fetch(`/san-pham/update-phiship?idHoaDon=`+ pathVariable+`&newPhiShip=`+integerValue, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
    }
    // Call the function every second (1000 milliseconds)
    setInterval(getPhiVanChuyenValue, 1000);


</script>

<script>

    //Bến phí ship toàn cục
    var firstFee = 0;

    // Hiển thị thông báo thành công nếu xác nhận đơn hàng thành công
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

    <%--    Thông báo cập nhật trạng thi hóa đơn thành công--%>
    <c:if test="${not empty confirmSuccess}">
    Toast.fire({
        icon: "success",
        title: "${confirmSuccess}"
    });
    </c:if>

    <%--Thêm sản phẩm vào giỏ hàng thành công--%>
    <c:if test="${not empty addProductSuccess}">
    Toast.fire({
        icon: "success",
        title: "${addProductSuccess}"
    });
    </c:if>


    <%--    Thông báo cập nhật thông tin khách hàng thành công--%>
    <c:if test="${not empty successMessage}">
    Toast.fire({
        icon: "success",
        title: "${successMessage}"
    });
    </c:if>

    <%--    Thông báo lỗi sản phẩm chi tiết--%>
    <c:if test="${not empty errorProductDetail}">
    Toast.fire({
        icon: "error",
        title: "${errorProductDetail}"
    });
    </c:if>

    <%--    Thông báo cập nhật trạng thi hóa đơn thất bại --%>
    <c:if test="${not empty confirmError}">
    Toast.fire({
        icon: "error",
        title: "${confirmError}"
    });
    </c:if>

    <%--    Thông báo hủy hóa đơn thất bại --%>
    <c:if test="${not empty errorMessage}">
    Toast.fire({
        icon: "error",
        title: "${errorMessage}"
    });
    </c:if>

    <%--    Thong báo trường hợp Duplicate đơn hàng--%>
    <c:if test="${not empty confirmError}">
    Toast.fire({
        icon: "error",
        title: "${confirmError}"
    });
    </c:if>

    <c:if test="${not empty cancelSuccess}">
    Toast.fire({
        icon: "success",
        title: "${cancelSuccess}"
    });
    </c:if>

    // $(document).ready(function () {
    //     $('#userDropdown .fas').on('click', function (e) {
    //         e.stopPropagation();
    //         $(this).closest('.nav-link').dropdown('toggle');
    //     });
    // });


    // Nút in hóa đơn để giao hàng
    function openPrintDeliveryModal() {
        const overlay = document.getElementById('printOverlay');
        const iframe = document.getElementById('printFrame');

        if (!overlay || !iframe) {
            console.error("Overlay or iframe element not found.");
            return;
        }

        overlay.style.display = 'flex';
        iframe.onload = function () {
            iframe.contentWindow.focus();
            iframe.contentWindow.print();
            overlay.style.display = 'none';
        };

        iframe.src = '/admin/hoa-don/in-phieu-giao-hang';
        // Xóa sessionStorage sau khi in
        sessionStorage.removeItem('printAfterReload');
    }


    // Kiểm tra nếu có sessionStorage để in sau khi reload
    window.onload = function () {
        const printAfterReload = sessionStorage.getItem('printAfterReload');
        const firstLoad = sessionStorage.getItem('firstLoad');
        const hasErrorString = "${not empty errorProductDetail}".trim();
        const confirmErrorString = "${not empty confirmError}".trim();

        // Kiểm tra nếu có lỗi
        const hasError = hasErrorString.toLowerCase() === 'true' || confirmErrorString.toLowerCase() === 'true';

        // Nếu không có lỗi và printAfterReload là true thì mở máy in
        if (printAfterReload === 'true' && !hasError) {
            openPrintDeliveryModal();
        }


        // Đánh dấu lần tải trang đầu tiên
        sessionStorage.setItem('firstLoad', 'false');
    };

    document.getElementById('confirmForm').addEventListener('submit', function (event) {
        event.preventDefault(); // Ngăn form submit mặc định để xử lý logic riêng

        // Lấy giá trị trạng thái từ Controller
        const trangThai = parseInt('${hoaDonDTO.trangThai}');
        const trangThaiMoi = trangThai + 2;

        // Đảm bảo trangThai và trangThaiMoi là số nguyên
        if (isNaN(trangThai) || isNaN(trangThaiMoi)) {
            console.error("Invalid trạngThai or trạngThaiMoi");
            sessionStorage.setItem('printAfterReload', 'false');
            return;
        }

        // Lưu trạng thái vào sessionStorage để kiểm tra sau khi reload
        // Kiểm tra lỗi từ Controller
        const hasErrorString = "${not empty errorProductDetail}".trim();
        const hasError = hasErrorString.toLowerCase() === 'true';

        // Lưu trạng thái vào sessionStorage để kiểm tra sau khi reload
        if (trangThai === 1 && trangThaiMoi === 3 && !hasError) {
            sessionStorage.setItem('printAfterReload', 'true');
        } else {
            sessionStorage.setItem('printAfterReload', 'false');
        }
        // Submit form
        this.submit();
    });

    // Mở máy in sau khi update thành công
    document.getElementById('confirmForm').onsubmit = function () {
        // Lấy giá trị trạng thái từ Controller
        const trangThai = parseInt('${hoaDonDTO.trangThai}');
        const trangThaiMoi = trangThai + 2;

        if (trangThai === 1 && trangThaiMoi === 3) {
            sessionStorage.setItem('printAfterReload', 'true');
        } else {
            sessionStorage.setItem('printAfterReload', 'false');
        }
        // Kiểm tra lỗi từ Controller
        const hasErrorString = "${not empty errorProductDetail}".trim();
        const hasError = hasErrorString.toLowerCase() === 'true';

        if (hasError) {
            sessionStorage.setItem('printAfterReload', 'false');
        }

    };

    document.getElementById('cancelForm').addEventListener('submit', function (event) {
        event.preventDefault(); // Ngăn form submit mặc định để xử lý logic riêng
        // Submit form
        this.submit();
    });


    // Validate ô input mô tả xác nhận
    $(document).ready(function () {
        // Validate form xác nhận
        $('#confirmForm').submit(function (event) {
            // Ngăn chặn submit mặc định
            event.preventDefault();

            var moTa = $('#moTa').val().trim();

            var hasError = false;
            if (moTa === '' || moTa == null) {
                $('#moTaError').text('Vui lòng điền mô tả.').show();
                $('#moTa').addClass('border-danger');
                hasError = true;
            } else {
                $('#moTaError').hide();
                $('#moTa').removeClass('border-danger');
            }

            // Nếu không có lỗi, cho phép submit form
            if (!hasError) {
                this.submit();
            }
        });

        // Ẩn lỗi khi người dùng click vào trường input
        $('#moTa').focus(function () {
            $('#moTaError').hide();
            $(this).removeClass('border-danger');
        });
    });

    // Đợi khi modal được hiển thị
    $('#confirmModal').on('shown.bs.modal', function () {
        // Đặt giá trị của textarea là rỗng khi modal được hiển thị
        document.getElementById('moTa').value = '';
    });


    // Validate form thay đổi thông tin khách hàng
    $(document).ready(function () {

        // Hàm cập nhật giá trị vào các trường hiển thị
        function updateValues() {
            // Lấy giá trị từ các phần tử HTML
            var tongTien = parseFloat($('#tongTienValue').data('tongtien')) || 0;
            var phiVanChuyen = parseFloat($('#phiVanChuyen').data('phiship')) || 0;
            var giamGia = parseFloat($('#giamGia').data('giamgia')) || 0;

            // Tính tổng tiền thanh toán
            var tongTienThanhToan = tongTien + phiVanChuyen - giamGia;
            // Cập nhật giá trị vào các phần tử trong HTML
            $('#tongTienValue').text(new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(tongTien));
            $('#tongTienThanhToanValue').text(new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(tongTienThanhToan));
        }

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


        $('#updateModal').on('show.bs.modal', function () {
            var modalId = $(this).attr('id');
            var provinceSelect = $("#" + modalId + " select[name='idTinhThanh']");
            var districtSelect = $("#" + modalId + " select[name='idQuanHuyen']");
            var wardSelect = $("#" + modalId + " select[name='idPhuongXa']");
            var addressInput = $("#" + modalId + " input[name='diaChiChiTiet']");


            addressInput.on('click', function () {
                // Xóa các giá trị đã chọn trước đó
                provinceSelect.html('<option value="">Chọn Tỉnh/Thành Phố</option>');
                districtSelect.html('<option value="">Chọn Quận/Huyện</option>');
                wardSelect.html('<option value="">Chọn Phường/Xã</option>');

                // Yêu cầu người dùng chọn lại Tỉnh/Thành Phố
                getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', function (data_tinh) {
                    data_tinh.data.sort(function (a, b) {
                        return a.ProvinceID - b.ProvinceID;
                    });
                    $.each(data_tinh.data, function (key_tinh, val_tinh) {
                        provinceSelect.append('<option value="' + val_tinh.ProvinceID + '">' + val_tinh.ProvinceName + '</option>');
                    });

                    provinceSelect.off('change').on('change', function () {
                        var idtinh = $(this).val();

                        // Lấy quận/huyện dựa trên tỉnh thành đã chọn
                        getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=' + idtinh, function (data_quan) {
                            districtSelect.html('<option value="">Chọn Quận/Huyện</option>');
                            wardSelect.html('<option value="">Chọn Phường/Xã</option>');
                            $.each(data_quan.data, function (key_quan, val_quan) {
                                districtSelect.append('<option value="' + val_quan.DistrictID + '">' + val_quan.DistrictName + '</option>');
                            });

                            districtSelect.off('change').on('change', function () {
                                var idquan = $(this).val();

                                getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=' + idquan, function (data_phuong) {
                                    wardSelect.html('<option value="">Chọn Phường/Xã</option>');
                                    $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                        wardSelect.append('<option value="' + val_phuong.WardCode + '">' + val_phuong.WardName + '</option>');
                                    });


                                });
                            });
                        });
                    });
                });
            });


            // Gọi API để lấy danh sách tỉnh/thành phố
            getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', function (data_tinh) {
                // provinceSelect.html('<option value="">Chọn Tỉnh/Thành Phố</option>');
                // Đổ danh sách tỉnh/thành phố vào dropdown
                data_tinh.data.sort(function (a, b) {
                    return a.ProvinceID - b.ProvinceID;
                });
                $.each(data_tinh.data, function (key_tinh, val_tinh) {
                    provinceSelect.append('<option value="' + val_tinh.ProvinceID + '">' + val_tinh.ProvinceName + '</option>');
                });

                provinceSelect.change(function () {
                    var idtinh = $(this).val();

                    // Lấy quận/huyện dựa trên tỉnh thành đã chọn
                    getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=' + idtinh, function (data_quan) {
                        districtSelect.html('<option value="">Chọn Quận/Huyện</option>');
                        wardSelect.html('<option value="">Chọn Phường/Xã</option>');
                        $.each(data_quan.data, function (key_quan, val_quan) {
                            districtSelect.append('<option value="' + val_quan.DistrictID + '">' + val_quan.DistrictName + '</option>');
                        });

                        districtSelect.change(function () {
                            var idquan = $(this).val();
                            getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=' + idquan, function (data_phuong) {
                                wardSelect.html('<option value="">Chọn Phường/Xã</option>');
                                $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                    wardSelect.append('<option value="' + val_phuong.WardCode + '">' + val_phuong.WardName + '</option>');
                                });
                            });

                            // Cập nhật thông tin thay đổi lại phí ship
                            wardSelect.change(function () {
                                // calculateShippingAndTotal(tongTien,soLuongGioHang,giamGia);
                                calculateShippingAndTotal(tongTien, soLuongGioHang, giamGia, function (phiShip) {
                                    // Update the shipping fee in the input field
                                    $('#phiShip').val(phiShip);

                                    // You can also calculate the total and update other fields here
                                });
                            });
                        });
                    });
                });
            });
        });

        $('#updateButton').click(function () {
            $('#updateForm').submit();
        });

        $('#updateForm').submit(function (e) {
            e.preventDefault(); // Prevent default form submission

            // Clear previous error messages
            $('.text-danger').text('');
            $('.form-control, .form-select').removeClass('border-danger');

            // Example validation
            var isValid = true;
            var hoTen = $('#hoTen');
            var hoTenValue = hoTen.val().trim();
            var hoTenError = $('#hoTenError');


            if (hoTenValue === '') {
                hoTen.addClass('border-danger');
                hoTenError.text('Vui lòng nhập vào trường họ tên').addClass('text-danger');
                isValid = false;
            } else if (hoTenValue.length < 5) {
                hoTen.addClass('border-danger');
                hoTenError.text('Họ tên phải có độ dài trên 5 ký tự').addClass('text-danger');
                isValid = false;
            } else if (hoTenValue.length > 50) {
                hoTen.addClass('border-danger');
                hoTenError.text('Họ tên không được vượt quá độ dài 50 ký tự').addClass('text-danger');
                isValid = false;
            } else if (/[0-9]/.test(hoTenValue)) {  // Kiểm tra ký tự số
                hoTen.addClass('border-danger');
                hoTenError.text('Họ tên không được chứa số').addClass('text-danger');
                isValid = false;
            } else if (!isValidFullName(hoTenValue)) {
                hoTen.addClass('border-danger');
                hoTenError.text('Họ tên không được chứa ký tự đặc biệt').addClass('text-danger');
                isValid = false;
            }

            // Hàm kiểm tra định dạng họ tên
            function isValidFullName(fullName) {
                var regex = /^[a-zA-ZÀ-ỹ\s]+$/;
                return regex.test(fullName);
            }


            // Validate trường dữ liệu điện thoại
            if ($('#sdt').val().trim() === '') {
                isValid = false;
                $('#sdt').addClass('border-danger');
                $('#sdtError').text('Vui lòng nhập số điện thoại').addClass('text-danger');
            } else {
                var phonePattern = /^(03|05|07|08|09)+([0-9]{8})$/;
                if (!phonePattern.test($('#sdt').val().trim())) {
                    isValid = false;
                    $('#sdt').addClass('border-danger');
                    $('#sdtError').text('Số điện thoại không hợp lệ').addClass('text-danger');
                }
            }

            // Kiểm tra địa chỉ cụ thể
            var diaChiChiTiet = $('#diaChiChiTiet');
            var diaChiChiTietValue = diaChiChiTiet.val().trim();
            var diaChiChiTietError = $('#diaChiChiTietError');

            // Validate trường dữ liệu địa chỉ cụ thể
            diaChiChiTiet.removeClass('border-danger');
            diaChiChiTietError.text('');

            if (diaChiChiTietValue === '') {
                isValid = false;
                diaChiChiTiet.addClass('border-danger');
                diaChiChiTietError.text('Vui lòng nhập địa chỉ cụ thể').addClass('text-danger');
            } else if (diaChiChiTietValue.length < 5) {
                isValid = false;
                diaChiChiTiet.addClass('border-danger');
                diaChiChiTietError.text('Địa chỉ cụ thể phải có độ dài trên 5 ký tự').addClass('text-danger');
            } else if (diaChiChiTietValue.length > 100) {
                isValid = false;
                diaChiChiTiet.addClass('border-danger');
                diaChiChiTietError.text('Địa chỉ cụ thể không được vượt quá 100 ký tự').addClass('text-danger');
            } else if (/^[0-9\s]+$/.test(diaChiChiTietValue)) {
                isValid = false;
                diaChiChiTiet.addClass('border-danger');
                diaChiChiTietError.text('Địa chỉ cụ thể phải chứa cả ký tự chữ và ký tự số').addClass('text-danger');

            } else if (!isValidAddress(diaChiChiTietValue)) {
                isValid = false;
                diaChiChiTiet.addClass('border-danger');
                diaChiChiTietError.text('Địa chỉ cụ thể không được chứa ký tự đặc biệt').addClass('text-danger');
            } else if (!/[a-zA-Z]/.test(diaChiChiTietValue) || !/[0-9]/.test(diaChiChiTietValue)) {
                isValid = false;
                diaChiChiTiet.addClass('border-danger');
                diaChiChiTietError.text('Địa chỉ cụ thể phải chứa cả ký tự chữ và ký tự số').addClass('text-danger');
            } else {
                // If all conditions are passed, the input is valid
                diaChiChiTiet.removeClass('border-danger');
                diaChiChiTietError.text('').removeClass('text-danger');
            }

            // Hàm kiểm tra định dạng họ tên
            function isValidAddress(address) {
                var regex = /^[a-zA-ZÀ-ỹ0-9\s]+$/;
                return regex.test(address);
            }

            // Validate phí ship
            var phiShip = $('#phiShip');
            var phiShipValue = phiShip.val().trim();
            var phiShipError = $('#phiShipError');
            // Mức phí ship tối đa (200.000 VNĐ)
            var maxShipFee = 200000;

            if (phiShipValue === '') {
                isValid = false;
                phiShip.addClass('border-danger');
                phiShipError.text('Vui lòng nhập phí ship').addClass('text-danger');
            } else if (!/^\d+$/.test(phiShipValue)) {
                isValid = false;
                phiShip.addClass('border-danger');
                phiShipError.text('Phí ship phải là số hợp lệ. Không được chứa ký tự chữ hoặc ký tự đặc biệt').addClass('text-danger');
            } else if (parseInt(phiShipValue, 10) <= 0) {
                isValid = false;
                phiShip.addClass('border-danger');
                phiShipError.text('Phí ship phải là số dương và lớn hơn 0').addClass('text-danger');
            } else if (parseInt(phiShipValue, 10) > maxShipFee) {
                isValid = false;
                phiShip.addClass('border-danger');
                phiShipError.text('Phí ship không được vượt quá 200.000 VNĐ').addClass('text-danger');
            } else {
                phiShip.removeClass('border-danger');
                phiShipError.text('').removeClass('text-danger');
            }

            //Validate trường dữ liệu ghi chú
            var ghiChu = $('#ghiChu');
            var ghiChuValue = ghiChu.val().trim();
            var ghiChuError = $('#ghiChuError');

            if (ghiChuValue !== '') {
                // Kiểm tra độ dài tối thiểu (ít nhất 5 ký tự)
                if (ghiChuValue.length < 5) {
                    isValid = false;
                    ghiChu.addClass('border-danger');
                    ghiChuError.text('Ghi chú phải có độ dài ít nhất 5 ký tự').addClass('text-danger');
                }
                // Kiểm tra độ dài tối đa (không quá 200 ký tự)
                else if (ghiChuValue.length > 200) {
                    isValid = false;
                    ghiChu.addClass('border-danger');
                    ghiChuError.text('Ghi chú không được vượt quá 200 ký tự').addClass('text-danger');
                }
                // Kiểm tra nếu chứa ký tự đặc biệt
                else if (!/^[a-zA-ZÀ-ỹ0-9\s]+$/.test(ghiChuValue)) {
                    isValid = false;
                    ghiChu.addClass('border-danger');
                    ghiChuError.text('Ghi chú không được chứa ký tự đặc biệt').addClass('text-danger');
                }

                // Kiểm tra nếu ghi chú chứa toàn số
                else if (/^[0-9\s]+$/.test(ghiChuValue)) {
                    isValid = false;
                    ghiChu.addClass('border-danger');
                    ghiChuError.text('Ghi chú không được phép chứa toàn số').addClass('text-danger');
                }
                // Kiểm tra nếu ghi chú không chứa số
                else if (!/[a-zA-Z]/.test(ghiChuValue) && /[0-9]/.test(ghiChuValue)) {
                    isValid = false;
                    ghiChu.addClass('border-danger');
                    ghiChuError.text('Ghi chú phải chứa ký tự chữ').addClass('text-danger');
                }
            }

            // Validate tỉnh huyện xã
            const tinh = $("#tinh").val().trim();
            const huyen = $("#huyen").val().trim();
            const xa = $("#xa").val().trim();

            // Validate Tỉnh/Thành Phố
            if (!tinh) {
                isValid = false;
                $("#tinhError").text("Vui lòng chọn tỉnh/thành phố");
            } else {
                $("#tinhError").text("");
            }

            // Validate Quận/Huyện
            if (!huyen) {
                isValid = false;
                $("#huyenError").text("Vui lòng chọn quận/huyện");
            } else {
                $("#huyenError").text("");
            }

            // Validate Phường/Xã
            if (!xa) {
                isValid = false;
                $("#xaError").text("Vui lòng chọn phường/xã");
            } else {
                $("#xaError").text("");
            }


            $('#tenTinhThanh').val($('#tinh option:selected').text());
            $('#tenQuanHuyen').val($('#huyen option:selected').text());
            $('#tenPhuongXa').val($('#xa option:selected').text());

            if (isValid) {
                // Store the updated data in the updatedData object
                updatedData = {
                    idTinhThanh: $('#tinh').val(),
                    idQuanHuyen: $('#huyen').val(),
                    idPhuongXa: $('#xa').val(),
                };
                updateValues();
                // Submit the form via AJAX or standard form submission
                this.submit();
            } else {
                $(".modal-body").scrollTop(0);
                updateValues();
            }
        });


        // Clear errors when input/select value changes
        $('#hoTen, #sdt, #diaChiChiTiet, #tinh, #huyen, #xa, #phiShip,#ghiChu').on('input click change', function () {
            var errorId = '#' + $(this).attr('id') + 'Error';
            $(this).removeClass('border-danger');
            $(errorId).text('');
        });


    });


    // Nút hoàn tác
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('undoForm').addEventListener('submit', function (event) {
            var moTaUndo = document.getElementById('moTaUndo');
            var moTaUndoError = document.getElementById('moTaUndoError');
            if (moTaUndo.value.trim() === '') {
                moTaUndoError.style.display = 'block';
                event.preventDefault();
            } else {
                moTaUndoError.style.display = 'none';
            }
        });
    });


    // Thêm Confirm trước khi xác nhận đơn hàng ở Modal xác nhận
    $(document).ready(function () {
        $('#confirmButtonInModal').click(function (e) {
            e.preventDefault(); // Ngăn chặn hành vi mặc định của nút Xác nhận

            var moTa = $('#moTa').val().trim();
            if (moTa === "") {
                $('#moTaError').show();
            } else {
                $('#moTaError').hide();
                // $('#confirmModal').fadeOut('normal', function() {
                //     $(this).modal('hide');
                // });

                Swal.fire({
                    title: 'Xác Nhận',
                    text: 'Xác nhận đơn hàng?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Xác nhận',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // $('#confirmModal').modal('hide'); // Đóng modal
                        // Sau khi đóng modal, gửi form
                        $('#confirmForm').off('submit').submit();
                    }
                });
            }
        });
    });


    // Thêm Confirm trước khi  hủy đơn hàng ở Modal hủy đơn hàng
    $(document).ready(function () {
        $('#confirmCancelBtn').click(function (e) {
            e.preventDefault(); // Ngăn chặn hành vi mặc định của nút Xác nhận

            var moTa = $('#moTaHuyDon').val().trim();
            if (moTa === "") {
                $('#reasonError').show();
            } else {
                $('#reasonError').hide();

                Swal.fire({
                    title: 'Xác nhận',
                    text: 'Bạn có chắc chắn muốn hủy đơn hàng?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Xác nhận',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#cancelForm').submit();// Gửi form sau khi xác nhận hủy đơn
                    }
                });
            }
        });
    });


</script>


<%--Chức năng xóa sản phẩm chi tiết khỏi chi tiết hóa đơn--%>

<script>
    $(document).ready(function () {
        $('.delete-product').click(function () {
            var idCTSP = $(this).data('id');
            var idHoaDon = $(this).data('hoadon');
            var productRow = $(this).closest('tr'); // Get the row of the product being deleted

            Swal.fire({
                title: 'Bạn chắc chắn muốn xóa sản phẩm này?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Xóa',
                cancelButtonText: 'Hủy',
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: 'GET',
                        url: '/admin/hoa-don/xoa-san-pham/' + idCTSP,
                        data: {
                            idHoaDon: idHoaDon
                        },
                        success: function (response) {
                            if (response.error) {
                                Toast.fire({
                                    title: response.error,
                                    icon: 'error'
                                });
                            } else {
                                // Xóa hàng trong table
                                productRow.remove();

                                // Cập nhật lại số lượng trong ChiTiet San Pham
                                $('#chiTietSanPhamTableBody tr').each(function () {
                                    var rowProductId = $(this).data('id'); // Get the ID from the row
                                    if (rowProductId === idCTSP) { // Compare with the deleted product ID
                                        $(this).find('td[data-quantity]').text(response.newQuantity).attr('data-quantity', response.newQuantity);
                                    }
                                });

                                // Cập nhật lại tổng tiền và tổng tiền thanh toán
                                var newTotalPrice = response.tongTien;
                                var newQuantity = response.totalSoLuong;
                                var giamGia = response.giamGia;
                                var phieuGiamGia = response.phieuGiamGia;

                                const formatCurrency = (amount) => new Intl.NumberFormat('vi-VN', {
                                    style: 'currency',
                                    currency: 'VND',
                                    currencyDisplay: 'code'
                                }).format(amount).replace('VND', '₫');
                                $('#tongTienValue').text(formatCurrency(newTotalPrice));
                                //Cập nhật lại phí ship và tổng tiền

                                calculateShippingAndTotal(newTotalPrice, newQuantity, giamGia);
                                $('#phieuGiamGia').text(phieuGiamGia);

                                // Show success message
                                Toast.fire({
                                    title: 'Xóa sản phẩm khỏi giỏ hàng thành công',
                                    icon: 'success'
                                });


                            }
                        },
                        error: function () {
                            Toast.fire({
                                title: 'Đã xảy ra lỗi khi xóa sản phẩm',
                                icon: 'error'
                            });
                        }
                    });


                }
            });
        });

    });
</script>


<%--Chức năng cập nhat so luong chi tiet san pham trong hoa don chi tiet--%>
<script>

    $(document).ready(function () {
        console.log('Document ready');

        // Bắt sự kiện khi người dùng click vào nút cập nhật số lượng
        $('.update-sl').click(function () {

            var idCTSP = $(this).data('id');
            var idHoaDon = $(this).data('hoadon');
            var newQuantity = parseInt($('#soLuong-' + idCTSP).val().trim(), 10);

            console.log('idCTSP:', idCTSP, 'idHoaDon:', idHoaDon, 'newQuantity:', newQuantity);

            // Validate input
            if (isNaN(newQuantity) || newQuantity <= 0) {
                Toast.fire({
                    title: 'Số lượng không hợp lệ',
                    icon: 'error'
                });
                return;
            }

            // Gửi Ajax request để cập nhật số lượng
            $.ajax({
                type: 'GET',
                url: '/admin/hoa-don/cap-nhat-so-luong-san-pham/' + idCTSP,
                data: {
                    idHoaDon: idHoaDon,
                    soLuong: newQuantity
                },
                success: function (response) {
                    if (response.error) {
                        Toast.fire({
                            title: response.error,
                            icon: 'error'
                        });

                        // Nếu có newQuantity trong response, cập nhật ô input với số lượng tối đa
                        if (response.newQuantity !== undefined) {
                            $('#soLuong-' + idCTSP).val(response.newQuantity);
                        }
                    } else {


                        // Update the quantity and total amount in the UI
                        const formatCurrency = (amount) => new Intl.NumberFormat('vi-VN', {
                            style: 'currency',
                            currency: 'VND',
                            currencyDisplay: 'code'
                        }).format(amount).replace('VND', '₫');

                        let newTotalPrice = response.tongTien;
                        var newQuantity = response.totalSoLuong;
                        var giamGia = response.giamGia;
                        var phieuGiamGia = response.phieuGiamGia;
                        $('#tongTienValue').text(formatCurrency(newTotalPrice));
                        $('#phieuGiamGia').text(phieuGiamGia);

                        const parseCurrency = (value) => parseFloat(value.replace(/[^\d.-]+/g, ''));

                        // Tính lại tổng tiền
                        calculateShippingAndTotal(newTotalPrice, newQuantity, giamGia);

                        // Lặp qua danh sách sản phẩm chi tiết hóa đơn để cập nhật lại số lượng và tổng tiền
                        response.listHDCT.forEach(item => {
                            const itemTotal = item.donGia * item.soLuong;
                            $('#soLuong-' + item.idCTSP.id).val(item.soLuong);
                            $('#total-' + item.idCTSP.id).text(formatCurrency(itemTotal));
                            $('#tongTienSanPham-' + item.idCTSP.id).text(formatCurrency(itemTotal));
                        });

                        // Thêm class 'text-danger' và 'fw-bold' vào các giá trị tổng tiền
                        $('#tongTienValue, #tongTienThanhToanValue').addClass('text-danger fw-bold');

                        // Hiển thị thông báo cập nhật thành công
                        Toast.fire({
                            title: 'Cập nhật số lượng sản phẩm thành công',
                            icon: 'success'
                        });

                        // Cập nhật danh sách sản phẩm trong modal
                        $('#chiTietSanPhamTableBody tr').each(function () {
                            var rowProductId = $(this).data('id'); // Get the ID from the row
                            if (rowProductId === idCTSP) { // Compare with the deleted product ID
                                $(this).find('td[data-quantity]').text(response.newQuantity).attr('data-quantity', response.newQuantity);
                            }
                        });
                    }
                },
                error: function (xhr) {
                    let errorMsg = xhr.responseJSON && xhr.responseJSON.error ? xhr.responseJSON.error : 'Đã xảy ra lỗi khi cập nhật số lượng';
                    Toast.fire({
                        title: errorMsg,
                        icon: 'error'
                    });
                }
            });
        });
    });


</script>


<%--Chức năng lọc và tìm kiếm và phân trang trong Modal thêm sản phẩm--%>
<script>
    //Lọc màu sắc
    $(document).ready(function () {
        $('#colorSelect').on('change', function () {
            var productId = $(this).val();
            $.ajax({
                url: "/hoa-don/locSPCTByMauSac/" + productId,
                type: 'GET',
                data: {id: productId},
                success: function (data) {
                    $('#contentModalAddProduct').empty()
                    $('#contentModalAddProduct').append(data);
                }
            });
        });
    });


    //Lọc kích thước
    $(document).ready(function () {
        $('#sizeSelect').on('change', function () {
            var productId = $(this).val();
            alert(productId);
            $.ajax({
                url: "/hoa-don/locSPCTByKichThuoc/" + productId,
                type: 'GET',
                data: {id: productId},
                success: function (data) {
                    $('#contentModalAddProduct').empty()
                    $('#contentModalAddProduct').append(data);
                }
            });
        });
    });

    //Lọc chất liệu
    $(document).ready(function () {
        $('#materialSelect').on('change', function () {
            var productId = $(this).val();
            $.ajax({
                url: "/hoa-don/locSPCTByChatLieu/" + productId,
                type: 'GET',
                data: {id: productId},
                success: function (data) {
                    $('#contentModalAddProduct').empty()
                    $('#contentModalAddProduct').append(data);
                }
            });
        });
    });

    //Lọc theo kiểu tay
    $(document).ready(function () {
        $('#sleeveSelect').on('change', function () {
            var productId = $(this).val();
            $.ajax({
                url: "/hoa-don/locSPCTByKieuTay/${hoaDon.id}/" + productId,
                type: 'GET',
                data: {id: productId},
                success: function (data) {
                    $('#contentModalAddProduct').empty()
                    $('#contentModalAddProduct').append(data);
                }
            });
        });
    });


    function bindEvents() {
        $('#colorSelect').on('change', function () {
            var colorId = $(this).val();
            updateModalContent("/hoa-don/locSPCTByMauSac/" + colorId);
        });

        $('#sizeSelect').on('change', function () {
            var sizeId = $(this).val();
            updateModalContent("/hoa-don/locSPCTByKichThuoc/" + sizeId);
        });

        $('#materialSelect').on('change', function () {
            var materialId = $(this).val();
            updateModalContent("/hoa-don/locSPCTByChatLieu/" + materialId);
        });

        $('#sleeveSelect').on('change', function () {
            var sleeveId = $(this).val();
            updateModalContent("/hoa-don/locSPCTByKieuTay/" + sleeveId);
        });

        $('#searchButton').on('click', function () {
            var searchQuery = $('#searchInput').val();
            updateModalContent("/hoa-don/searchSPCT/{id}?search=" + searchQuery);
        });

        $('#refreshButton').on('click', function () {
            updateModalContent("/hoa-don/searchSPCT/{id}?search=");
        });

        // Bind events to the add buttons
        $('.addProductBtn').on('click', function () {
            var productId = $(this).data('product-id');
            // Add your logic to handle adding the product
            alert('Product ' + productId + ' added!');
        });
    }

    bindEvents(); // Initial binding

    function updateModalContent(url) {
        $.ajax({
            type: "GET",
            url: url,
            success: function (data) {
                $('#modalContent').html(data); // Thay đổi nội dung của modal
                bindEvents(); // Sau khi cập nhật nội dung, tái kết nối các sự kiện
            },
            error: function (xhr, status, error) {
                console.error("Error while fetching data:", error);
                // Xử lý lỗi, ví dụ như hiển thị thông báo lỗi cho người dùng
            }
        });
    }


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