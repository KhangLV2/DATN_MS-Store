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

    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .table-scroll {
            height: 340px;
            overflow: scroll;
        }

        .table-scroll2 {
            height: 460px;
            overflow: scroll;
        }

        ::-webkit-scrollbar {
            width: 10px;
            background-color: light grey;
        }

        ::-webkit-scrollbar-thumb {
            background-color: rgb(238, 234, 234);
            border-radius: 5px;
        }

        .button-container {
            display: flex;
            gap: 10px; /* Tạo khoảng cách giữa các button */
        }

        #button {
            flex: none; /* Đảm bảo kích thước button không thay đổi */
        }

        th, td {
            text-align: center;
        }

    </style>

    <style>
        .icon-container i {
            transition: color 0.3s ease;
        }

        .icon-container i:hover {
            color: #4e73df; /* Change this to your desired hover color */
        }
    </style>

    <style>
        .fit-img {
            width: 100%;
            height: auto;
        }

        .hover-effect {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .hover-effect:hover {
            transform: scale(1.05); /* Slightly increase the size */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add a shadow */
        }

        .click-effect {
            transition: transform 0.1s ease;
            cursor: pointer;
        }

        .click-effect:active {
            transform: scale(0.95); /* Slightly decrease the size to mimic a button press */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Add a shadow */
        }

        .image-container {
            position: relative;
            width: 200px; /* Adjust as needed */
            height: 270px; /* Adjust as needed */
        }

        .file-input-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }
    </style>

    <%--    tooltip style--%>
    <style>
        #tooltip {
            position: relative;
            display: inline-block;
            cursor: pointer;
        }

        #tooltip #tooltiptext {
            visibility: hidden;
            width: 120px;
            background-color: black;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 125%; /* Position above the tooltip element */
            left: 50%;
            margin-left: -60px; /* Center the tooltip */
            opacity: 0;
            transition: opacity 0.3s;
        }

        #tooltip:hover #tooltiptext {
            visibility: visible;
            opacity: 1;
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
                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/thong-ke/view" style="display: flex; align-items: center">
                        <i class="bi bi-graph-up" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Thống kê doanh thu</span></a>
                </li>

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/ban-hang-tai-quay" style="display: flex; align-items: center">
                        <i class="bi bi-shop" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Bán hàng tại quầy</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/hoa-don/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-journal-text" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Quản lý hóa đơn</span></a>
                </li>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item" style="background: linear-gradient(45deg, black, transparent)">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="bi bi-diagram-3" style="font-size: 1.2rem; color: #fff;"></i>
                        <span style="color: #fff;">Quản lý sản phẩm</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="/admin/quan-ly-san-pham">Sản phẩm</a>
                            <a class="collapse-item" href="/admin/quan-ly-mau-sac">Màu sắc</a>
                            <a class="collapse-item" href="/admin/quan-ly-kich-thuoc">Kích thước</a>
                            <a class="collapse-item" href="/admin/quan-ly-kieu-tay">Kiểu tay</a>
                            <a class="collapse-item" href="/admin/quan-ly-chat-lieu">Chất liệu</a>
                        </div>
                    </div>
                </li>
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/quan-ly-nhan-vien/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-person-bounding-box" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Quản lý nhân viên</span></a>
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
            </c:when>
            <c:otherwise>
                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/thong-ke/view" style="display: flex; align-items: center">
                        <i class="bi bi-graph-up" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Thống kê doanh thu</span></a>
                </li>

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="/ban-hang-tai-quay" style="display: flex; align-items: center">
                        <i class="bi bi-shop" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Bán hàng tại quầy</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <!-- Nav Item - Pages Collapse Menu -->
                <!-- Nav Item - Charts -->

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/qlkh/quan-ly-khach-hang" style="display: flex; align-items: center">
                        <i class="bi bi-person-bounding-box" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Quản lý khách hàng</span></a>
                </li>

                <!-- Nav Item - Charts -->

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
            </c:otherwise>
        </c:choose>
    </ul>
    <!-- End of Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->


                    <!-- Nav Item - Alerts -->

                    <!-- Nav Item - Messages -->

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
                            <a class="dropdown-item" href="/qlnv/dang-xuat" id="dang-xuat">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Đăng xuất
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- Bán hàng tại quầy -->
            <div class="container-fluid bg-white">
                <div class="row">
                    <div class="mt-3">
                        <h4 class="">Quản lý sản phẩm chi tiết</h4>
                        <div class="d-flex gap-4 mt-3">
                            <img id="hinhAnhSP" src="path_to_your_image.jpg" class="rounded border"
                                 width="150" height="200" alt="Product Image">
                            <div id="product-details">
                                <div class="d-flex">
                                    <h5 class="m-0" style="width: 150px;">Tên sản phẩm:</h5>
                                    <h5 class="m-0 font-weight-normal" id="tenSP"></h5>
                                </div>
                                <div class="d-flex">
                                    <h5 class="mt-3" style="width: 150px;">Mã sản phẩm:</h5>
                                    <h5 class="mt-3 font-weight-normal" id="maSP"></h5>
                                </div>
                                <div class="d-flex">
                                    <h5 class="mt-2" style="width: 150px;">Ngày tạo:</h5>
                                    <h5 class="mt-2 font-weight-normal" id="ngayTaoSP"></h5>
                                </div>
                                <div class="d-flex">
                                    <h5 class="mt-2" style="width: 150px;">Trạng thái:</h5>
                                    <h5 class="mt-2 font-weight-normal" id="trangThaiSP"></h5>
                                </div>
                                <div class="d-flex mt-2" style="height: 40px"  id="cboChatLieuArea">
                                    <h5 class="mt-2" style="width: 150px">Chất liệu:&nbsp&nbsp</h5>
                                    <div class="dropdown">
                                        <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                id="lblChatLieuModalEdit" style="width: 150px"
                                                data-bs-toggle="dropdown"
                                                aria-expanded="false">
                                            Chọn chất liệu
                                        </button>
                                        <ul class="dropdown-menu" id="cboChatLieuModalEdit"
                                            aria-labelledby="dropdownMenuButton4">
                                        </ul>
                                        <p style="color: red;" id="cboChatLieuModalEditErr"></p>
                                    </div>
                                    <div class="icon-container">
                                        <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                           data-bs-target="#ModalHotAddCL" style="font-size: 25px"></i>
                                    </div>
                                </div>
                                <div class="d-flex mt-2" style="height: 40px" id="cboKieuTayArea">
                                    <h5 class="mt-2" style="width: 150px">Kiểu tay:&nbsp&nbsp</h5>
                                    <div class="dropdown">
                                        <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                id="lblKieuTayModalEdit" style="width: 150px;"
                                                data-bs-toggle="dropdown"
                                                aria-expanded="false">
                                            Chọn kiểu tay
                                        </button>
                                        <ul class="dropdown-menu" id="cboKieuTayModalEdit"
                                            aria-labelledby="dropdownMenuButton5">
                                        </ul>
                                        <p style="color: red;" id="cboKieuTayModalEditErr"></p>
                                    </div>
                                    <div class="icon-container">
                                        <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                           data-bs-target="#ModalHotAddKTA" style="font-size: 25px"></i>
                                    </div>
                                </div>
                                <p style="display: none" id="kieuTayMemo"></p>
                                <p style="display: none" id="chatLieuMemo"></p>
                            </div>
                        </div>
                    </div>
                    <h5 class="mt-3">Danh sách sản phẩm chi tiết: </h5>
                    <div class="mt-3">
                        <div class="row ms-2">
                            <div class="col col-md-1" style="height: 20px">
                                <h6 class="mt-2">Đơn giá: </h6>
                            </div>
                            <div class="mb-4 pb-4 col col-md-2" style="height: 20px">
                                <section class="range-slider container">
                                    <span class="output outputOne"></span>
                                    <span class="output outputTwo"></span>
                                    <span class="full-range"></span>
                                    <span class="incl-range"></span>
                                    <input name="rangeOne" type="range">
                                    <input name="rangeTwo" type="range">
                                </section>
                            </div>
                        </div>

                        <div class="row ms-2">
                            <div class="col col-md-2">
                                <div class="dropdown">
                                    <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                            id="lblMauSac" style="width: 150px;" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                        Chọn màu sắc
                                    </button>
                                    <ul class="dropdown-menu" id="cboMauSac"
                                        aria-labelledby="dropdownMenuButton2">
                                    </ul>
                                </div>
                            </div>
                            <div class="col col-md-2">
                                <div class="dropdown" style="width: 200px;">
                                    <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                            id="lblKichThuoc" style="width: 150px;" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                        Chọn kích thước
                                    </button>
                                    <ul class="dropdown-menu" id="cboKichThuoc"
                                        aria-labelledby="dropdownMenuButton3">
                                    </ul>
                                </div>
                            </div>
                            <div class="col col-md-2">
                                <div class="dropdown" style="width: 200px;">
                                    <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                            id="lblTrangThaiSearch" style="width: 150px;" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                        Trạng thái
                                    </button>
                                    <ul class="dropdown-menu" id="cboTrangThai"
                                        aria-labelledby="dropdownMenuButton3">
                                        <li><a class="dropdown-item" onclick="setTrangThaiSearch(1)">Hoạt động</a></li>
                                        <li><a class="dropdown-item" onclick="setTrangThaiSearch(0)">Dừng hoạt động</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col col-md-3 d-flex gap-3 ms-5">
                                <button id="btnSearch" class="btn btn-success me-2" style="height: 40px"
                                        onclick="search(event)">
                                    Tìm kiếm
                                </button>
                                <button id="btnRef" class="btn btn-success me-2" style="height: 40px; width: 90px"
                                        onclick="refresh(event)">
                                    Refresh
                                </button>
                            </div>
                        </div>
                    </div>
                    <table class="table table-hover mt-3">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Hình ảnh</th>
                            <th>Màu sắc</th>
                            <th>Kích thước</th>
                            <th>Số lượng</th>
                            <th>Giá nhập</th>
                            <th>Giá bán</th>
                            <th>Mô tả</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody id="tbl_ds_spct">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="d-flex flex-row-reverse">
            <button id="btnAdd" class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#ModalAdd">Thêm
                mới
            </button>
        </div>
        <div class="col-12 pb-1">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center mb-3">
                    <li class="page-item" id="prev">
                        <Button class="page-link" onclick="navigate(-1,event)">Previous</Button>
                    </li>
                    <div class="d-flex" id="paginationBody">
                    </div>
                    <li class="page-item" id="next">
                        <Button class="page-link" onclick="navigate(1,event)">Next</Button>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- AddModal-->
    <div class="modal fade" id="ModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
         data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <h3 class="modal-title">Thêm mới sản phẩm chi tiết</h3>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="overflow-y: auto; height: 80vh;">
                    <div class="mb-3">
                        <form id="uploadFormAdd" method="post" enctype="multipart/form-data" action="/uploads">
                            <div class="row">
                                <div class="d-flex mb-2" style="gap: 20px;">
                                    <h5 class="" style="width: 600px">Tên sản phẩm:&nbsp&nbsp<span
                                            id="tenSPModalAdd"></span>
                                    </h5>
                                    <h5 class="">Ngày tạo:&nbsp&nbsp<span id="ngayTaoModalAdd"></span>
                                    </h5>
                                </div>
                                <div class="col col-md-3">
                                    <div class="d-flex">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                    id="lblMauSacModalAdd" style="width: 150px;"
                                                    data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                Chọn màu sắc
                                            </button>
                                            <ul class="dropdown-menu" id="cboMauSacModalAdd"
                                                aria-labelledby="dropdownMenuButton2">
                                            </ul>
                                            <p style="color: red;" id="cboMauSacModalAddErr"></p>
                                        </div>
                                        <div class="icon-container">
                                            <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                               data-bs-target="#ModalHotAddMS" id="iconHotAddMSModalAdd"
                                               style="font-size: 25px"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col col-md-3">
                                    <div class="d-flex">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                    id="lblKichThuocModalAdd" style="width: 150px;"
                                                    data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                Chọn kích thước
                                            </button>
                                            <ul class="dropdown-menu" id="cboKichThuocModalAdd"
                                                aria-labelledby="dropdownMenuButton3">
                                            </ul>
                                            <p style="color: red;" id="cboKichThuocModalAddErr"></p>
                                        </div>
                                        <div class="icon-container">
                                            <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                               data-bs-target="#ModalHotAddKT" id="iconHotAddKTModalAdd"
                                               style="font-size: 25px"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col col-md-3" id="chatLieuBoxModalAdd">
                                    <div class="d-flex">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                    id="lblChatLieuModalAdd" style="width: 150px;"
                                                    data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                Chọn chất liệu
                                            </button>
                                            <ul class="dropdown-menu" id="cboChatLieuModalAdd"
                                                aria-labelledby="dropdownMenuButton4">
                                            </ul>
                                            <p style="color: red;" id="cboChatLieuModalAddErr"></p>
                                        </div>
                                        <div class="icon-container">
                                            <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                               data-bs-target="#ModalHotAddCL" id="iconHotAddCLModalAdd"
                                               style="font-size: 25px"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col col-md-3" id="kieuTayBoxModalAdd">
                                    <div class="d-flex">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                    id="lblKieuTayModalAdd" style="width: 150px;"
                                                    data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                Chọn kiểu tay
                                            </button>
                                            <ul class="dropdown-menu" id="cboKieuTayModalAdd"
                                                aria-labelledby="dropdownMenuButton5">
                                            </ul>
                                            <p style="color: red;" id="cboKieuTayModalAddErr"></p>
                                        </div>
                                        <div class="icon-container">
                                            <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                               data-bs-target="#ModalHotAddKTA" id="iconHotAddKTAModalAdd"
                                               style="font-size: 25px"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col col-md-4">
                                    <label for="soLuongModalAdd" class="form-label">Số lượng</label>
                                    <input type="number" name="file" class="form-control" id="soLuongModalAdd"
                                           value="">
                                    <p style="color: red;" id="soLuongModalAddErr"></p>
                                </div>
                                <div class="col col-md-4">
                                    <label for="giaNhapModalAdd" class="form-label">Giá nhập</label>
                                    <input type="number" name="file" class="form-control" id="giaNhapModalAdd"
                                           value="">
                                    <p style="color: red;" id="giaNhapModalAddErr"></p>
                                </div>
                                <div class="col col-md-4">
                                    <label for="giaBanModalAdd" class="form-label">Giá bán</label>
                                    <input type="number" name="file" class="form-control" id="giaBanModalAdd"
                                           value="">
                                    <p style="color: red;" id="giaBanModalAddErr"></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col col-md-6">
                                    <label for="moTaModalAdd" class="form-label">Mô tả</label>
                                    <textarea class="form-control custom-textarea" style="width: 550px;"
                                              id="moTaModalAdd" name="moTa"></textarea>
                                    <p style="color: red;" id="moTaModalAddErr"></p>
                                </div>
                                <div class="col col-md-3 d-flex justify-content-center align-items-center">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" role="switch"
                                               id="trangThaiModalAdd"
                                               checked>
                                        <label class="form-check-label" for="trangThaiLabelModalEdit"
                                               id="trangThaiLabelModalAdd">Trạng
                                            thái</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col col-md-3 hover-effect click-effect image-container">
                                    <img width="200" height="200"
                                         src="/image-icon/pendingIMG.png"
                                         alt="" class="fit-img" id="hinhAnh1DisplayModalAdd">
                                    <p class="text-center">Hình ảnh 1</p>
                                    <input type="file" id="fileHinhAnh1ModalAdd" class="file-input-overlay"
                                           accept="image/*"/>
                                </div>

                                <div class="col col-md-3 hover-effect click-effect image-container">
                                    <img width="200" height="200"
                                         src="/image-icon/pendingIMG.png"
                                         alt="" class="fit-img" id="hinhAnh2DisplayModalAdd">
                                    <p class="text-center">Hình ảnh 2</p>
                                    <input type="file" id="fileHinhAnh2ModalAdd" class="file-input-overlay"
                                           accept="image/*"/>
                                </div>

                                <div class="col col-md-3 hover-effect click-effect image-container">
                                    <img width="200" height="200"
                                         src="/image-icon/pendingIMG.png"
                                         alt="" class="fit-img" id="hinhAnh3DisplayModalAdd">
                                    <p class="text-center">Hình ảnh 3</p>
                                    <input type="file" id="fileHinhAnh3ModalAdd" class="file-input-overlay"
                                           accept="image/*"/>
                                </div>
                            </div>
                            <button id="saveAddBtn" class="btn btn-primary me-5 mt-5" style="width: 100px">Lưu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--End modal --%>
    <!-- EditModal-->
    <div class="modal fade" id="ModalEdit" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
         data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <h3 class="modal-title" id="exampleModalLabel4">Chỉnh sửa sản phẩm chi tiết</h3>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="overflow-y: auto; height: 80vh;">
                    <div class="mb-3">
                        <form id="uploadFormEdit" method="post" enctype="multipart/form-data"
                              action="/hinh-anh/upload">
                            <div class="row">
                                <div class="d-flex mb-2" style="gap: 20px;">
                                    <h5 class="" style="width: 600px">Tên sản phẩm:&nbsp&nbsp<span
                                            id="tenSPModalEdit"></span>
                                    </h5>
                                    <h5 class="">Ngày tạo:&nbsp&nbsp<span id="ngayTaoModalEdit"></span>
                                    </h5>
                                </div>
                                <div class="col col-md-3">
                                    <div class="d-flex">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                    id="lblMauSacModalEdit" style="width: 150px;"
                                                    data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                Chọn màu sắc
                                            </button>
                                            <ul class="dropdown-menu" id="cboMauSacModalEdit"
                                                aria-labelledby="dropdownMenuButton2">
                                            </ul>
                                            <p style="color: red;" id="cboMauSacModalEditErr"></p>
                                        </div>
                                        <div class="icon-container">
                                            <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                               data-bs-target="#ModalHotAddMS" style="font-size: 25px"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col col-md-3">
                                    <div class="d-flex">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                    id="lblKichThuocModalEdit" style="width: 150px;"
                                                    data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                Chọn kích thước
                                            </button>
                                            <ul class="dropdown-menu" id="cboKichThuocModalEdit"
                                                aria-labelledby="dropdownMenuButton3">
                                            </ul>
                                            <p style="color: red;" id="cboKichThuocModalEditErr"></p>
                                        </div>
                                        <div class="icon-container">
                                            <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                               data-bs-target="#ModalHotAddKT" style="font-size: 25px"></i>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col col-md-4">
                                    <label for="soLuongModalEdit" class="form-label">Số lượng</label>
                                    <input type="number" name="file" class="form-control" id="soLuongModalEdit"
                                           value="">
                                    <p style="color: red;" id="soLuongModalEditErr"></p>
                                </div>
                                <div class="col col-md-4">
                                    <label for="giaNhapModalEdit" class="form-label">Giá nhập</label>
                                    <input type="number" name="file" class="form-control" id="giaNhapModalEdit"
                                           value="">
                                    <p style="color: red;" id="giaNhapModalEditErr"></p>
                                </div>
                                <div class="col col-md-4">
                                    <label for="giaBanModalEdit" class="form-label">Giá bán</label>
                                    <input type="number" name="file" class="form-control" id="giaBanModalEdit"
                                           value="">
                                    <p style="color: red;" id="giaBanModalEditErr"></p>
                                </div>
                                <div class="col col-md-6">
                                    <label for="moTaModalEdit" class="form-label">Mô tả</label>
                                    <textarea class="form-control custom-textarea" style="width: 550px;"
                                              id="moTaModalEdit" name="moTa"></textarea>
                                    <p style="color: red;" id="moTaModalEditErr"></p>
                                </div>
                                <div class="col col-md-3 d-flex justify-content-center align-items-center">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" role="switch"
                                               id="trangThaiModalEdit"
                                               checked>
                                        <label class="form-check-label" for="trangThaiLabelModalEdit"
                                               id="trangThaiLabelModalEdit">Trạng
                                            thái</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col col-md-3 hover-effect click-effect image-container">
                                    <img width="200" height="200"
                                         src="/image-icon/pendingIMG.png"
                                         alt="" class="fit-img" id="hinhAnh1DisplayModalEdit">
                                    <p class="text-center">Hình ảnh 1</p>
                                    <input type="file" name="hinhAnh1File" id="fileHinhAnh1ModalEdit"
                                           class="file-input-overlay"/>
                                </div>
                                <div class="col col-md-3 hover-effect click-effect image-container">
                                    <img width="200" height="200"
                                         src="/image-icon/pendingIMG.png"
                                         alt="" class="fit-img" id="hinhAnh2DisplayModalEdit">
                                    <p class="text-center">Hình ảnh 2</p>
                                    <input type="file" name="hinhAnh2File" id="fileHinhAnh2ModalEdit"
                                           class="file-input-overlay"/>
                                </div>
                                <div class="col col-md-3 hover-effect click-effect image-container">
                                    <img width="200" height="200"
                                         src="/image-icon/pendingIMG.png"
                                         alt="" class="fit-img" id="hinhAnh3DisplayModalEdit">
                                    <p class="text-center">Hình ảnh 3</p>
                                    <input type="file" name="hinhAnh3File" id="fileHinhAnh3ModalEdit"
                                           class="file-input-overlay"/>
                                </div>
                            </div>
                            <button id="saveEditBtn" class="btn btn-primary mt-5" style="width: 100px">Lưu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--End modal --%>

    <!-- EditAllModal-->
    <div class="modal fade" id="ModalEditAll" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
         data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <h3 class="modal-title" id="exampleModalLabel5">Chỉnh sửa sản phẩm chi tiết</h3>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="overflow-y: auto; height: 80vh;">
                    <div class="mb-3">
                        <div class="">
                            <form id="uploadFormEditAll" method="post" enctype="multipart/form-data"
                                  action="/hinh-anh/upload">
                                <div class="row">
                                    <div class="d-flex mb-2" style="gap: 20px;">
                                        <h5 class="" style="width: 600px">Tên sản phẩm:&nbsp&nbsp<span
                                                id="tenSPModalEditAll"></span>
                                        </h5>
                                        <h5 class="">Ngày tạo:&nbsp&nbsp<span id="ngayTaoModalEditAll"></span>
                                        </h5>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col col-md-4" id="soLuongContainer">
                                        <label id="lblSoLuongModalEditAll" for="soLuongModalEdit"
                                               class="form-label">Số lượng</label>
                                        <input type="number" name="file" class="form-control"
                                               id="soLuongModalEditAll"
                                               value="">
                                        <p style="color: red;" id="soLuongModalEditErrAll"></p>
                                    </div>
                                    <div class="col col-md-4" id="giaNhapContainer">
                                        <label id="lblGiaNhapModalEditAll" for="giaNhapModalEdit"
                                               class="form-label">Giá nhập</label>
                                        <input type="number" name="file" class="form-control"
                                               id="giaNhapModalEditAll"
                                               value="">
                                        <p style="color: red;" id="giaNhapModalEditErrAll"></p>
                                    </div>
                                    <div class="col col-md-4" id="giaBanContainer">
                                        <label id="lblGiaBanModalEditAll" for="giaBanModalEdit" class="form-label">Giá
                                            bán</label>
                                        <input type="number" name="file" class="form-control"
                                               id="giaBanModalEditAll"
                                               value="">
                                        <p style="color: red;" id="giaBanModalEditErrAll"></p>
                                    </div>
                                    <div class="col col-md-6" id="moTaContainer">
                                        <label for="moTaModalEdit" class="form-label">Mô tả</label>
                                        <textarea class="form-control custom-textarea" style="width: 550px;"
                                                  id="moTaModalEditAll" name="moTa"></textarea>
                                        <p style="color: red;" id="moTaModalEditErrAll"></p>
                                    </div>
                                    <div class="col col-md-3 " id="trangThaiContainer">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch"
                                                   id="trangThaiModalEditAll"
                                                   checked>
                                            <label class="form-check-label" for="trangThaiLabelModalEdit"
                                                   id="trangThaiLabelModalEditAll">Trạng
                                                thái</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-3 hover-effect click-effect image-container"
                                         id="hinhAnh1Container">
                                        <img width="200" height="200"
                                             src="/image-icon/pendingIMG.png"
                                             alt="" class="fit-img" id="hinhAnh1DisplayModalEditAll">
                                        <p class="text-center">Hình ảnh 1</p>
                                        <input type="file" name="hinhAnh1File" id="fileHinhAnh1ModalEditAll"
                                               class="file-input-overlay"/>
                                    </div>
                                    <div class="col col-md-3 hover-effect click-effect image-container"
                                         id="hinhAnh2Container">
                                        <img width="200" height="200"
                                             src="/image-icon/pendingIMG.png"
                                             alt="" class="fit-img" id="hinhAnh2DisplayModalEditAll">
                                        <p class="text-center">Hình ảnh 2</p>
                                        <input type="file" name="hinhAnh2File" id="fileHinhAnh2ModalEditAll"
                                               class="file-input-overlay"/>
                                    </div>
                                    <div class="col col-md-3 hover-effect click-effect image-container"
                                         id="hinhAnh3Container">
                                        <img width="200" height="200"
                                             src="/image-icon/pendingIMG.png"
                                             alt="" class="fit-img" id="hinhAnh3DisplayModalEditAll">
                                        <p class="text-center">Hình ảnh 3</p>
                                        <input type="file" name="hinhAnh3File" id="fileHinhAnh3ModalEditAll"
                                               class="file-input-overlay"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <button id="saveEditAllBtn" class="btn btn-primary" style="width: 100px">Lưu</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--End modal --%>


    <!-- ModalHotAddMS -->
    <div class="modal fade" id="modalHotAddMS" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
         data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <h5 class="modal-title" id="exampleModalLabel1">Thêm nhanh màu săc</h5>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3 mt-3">
                        <label for="tenModalHotAddMS" class="form-label">Tên màu sắc:</label>
                        <input type="text" class="form-control" id="tenModalHotAddMS">
                    </div>
                    <div class="text-center">
                        <button class="btn btn-primary" id="btnModalHotAddMS">Lưu</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--        end modal hot add ms--%>

    <!-- ModalHotAddKT -->
    <div class="modal fade" id="modalHotAddKT" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
         data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <h5 class="modal-title" id="exampleModalLabel2">Thêm nhanh kích thước</h5>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3 mt-3">
                        <label for="tenModalHotAddKT" class="form-label">Tên kích thước:</label>
                        <input type="text" class="form-control" id="tenModalHotAddKT">
                    </div>
                    <div class="text-center">
                        <button class="btn btn-primary" id="btnModalHotAddKT">Lưu</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--        end modal hot add cl--%>
    <!-- ModalHotAddCL -->
    <div class="modal fade" id="modalHotAddCL" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
         data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <h5 class="modal-title">Thêm nhanh chất liệu</h5>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3 mt-3">
                        <label for="tenModalHotAddCL" class="form-label">Tên chất liệu:</label>
                        <input type="text" class="form-control" id="tenModalHotAddCL">
                    </div>
                    <div class="text-center">
                        <button class="btn btn-primary" id="btnModalHotAddCL">Lưu</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--        end modal hot add cl--%>
    <!-- ModalHotAddKTA -->
    <div class="modal fade" id="modalHotAddKTA" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
         data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <h5 class="modal-title">Thêm nhanh kiểu tay</h5>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3 mt-3">
                        <label for="tenModalHotAddKTA" class="form-label">Tên kiểu tay:</label>
                        <input type="text" class="form-control" id="tenModalHotAddKTA">
                    </div>
                    <div class="text-center">
                        <button class="btn btn-primary" id="btnModalHotAddKTA">Lưu</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--        end modal hot add kta--%>

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
                <h5 class="modal-title" id="exampleModalLabel3">Ready to Leave?</h5>
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
    let idSPCTLocal = "";
    let idMauSacHolder = "";
    let currentPage = 1;
    let totalPage = 0;
    const queryString = window.location.pathname;
    const pathParts = queryString.split('/');
    const pathVariable = pathParts[pathParts.length - 1];
    let idMauSac = "";
    let idKichThuoc = "";
    let idChatLieu = "";
    let idKieuTay = "";
    let idTrangThai = "";
    let tenSPLocal = "";
    let ngayTaoSPLocal = "";
    const lblMauSac = document.getElementById("lblMauSac");
    const lblKichThuoc = document.getElementById("lblKichThuoc");
    const lblChatLieu = document.getElementById("lblChatLieu");
    const lblKieuTay = document.getElementById("lblKieuTay");
    let idMauSacModalEdit = "";
    let idKichThuocModalEdit = "";
    let idChatLieuModalEdit = "";
    let idKieuTayModalEdit = "";
    let soLuongModalEdit = document.getElementById("soLuongModalEdit");
    let giaNhapModalEdit = document.getElementById("giaNhapModalEdit");
    let giaBanModalEdit = document.getElementById("giaBanModalEdit");
    let ghiChuModalEdit = document.getElementById("moTaModalEdit");
    let trangThaiModalEditRaw = document.getElementById("trangThaiModalEdit");
    const trangThaiLabelModalEdit = document.getElementById("trangThaiLabelModalEdit");

    let soLuongModalEditAll = document.getElementById("soLuongModalEditAll");
    let giaNhapModalEditAll = document.getElementById("giaNhapModalEditAll");
    let giaBanModalEditAll = document.getElementById("giaBanModalEditAll");
    let moTaModalEditAll = document.getElementById("moTaModalEditAll");
    let trangThaiModalEditAll = document.getElementById("trangThaiModalEditAll");

    const lblMauSacModalEdit = document.getElementById("lblMauSacModalEdit");
    const lblKichThuocModalEdit = document.getElementById("lblKichThuocModalEdit");
    const lblChatLieuModalEdit = document.getElementById("lblChatLieuModalEdit");
    const lblKieuTayModalEdit = document.getElementById("lblKieuTayModalEdit");
    let idMauSacModalAdd = "";
    let idKichThuocModalAdd = "";
    let idChatLieuModalAdd = "";
    let idKieuTayModalAdd = "";
    let soLuongModalAdd = document.getElementById("soLuongModalAdd");
    let giaNhapModalAdd = document.getElementById("giaNhapModalAdd");
    let giaBanModalAdd = document.getElementById("giaBanModalAdd");
    let ghiChuModalAdd = document.getElementById("moTaModalAdd");
    let trangThaiModalAddRaw = document.getElementById("trangThaiModalAdd");
    const trangThaiLabelModalAdd = document.getElementById("trangThaiLabelModalAdd");

    const lblMauSacModalAdd = document.getElementById("lblMauSacModalAdd");
    const lblKichThuocModalAdd = document.getElementById("lblKichThuocModalAdd");
    const lblChatLieuModalAdd = document.getElementById("lblChatLieuModalAdd");
    const lblKieuTayModalAdd = document.getElementById("lblKieuTayModalAdd");

    const tenModalHotAddMS = document.getElementById("tenModalHotAddMS");
    const tenModalHotAddKT = document.getElementById("tenModalHotAddKT");
    const tenModalHotAddCL = document.getElementById("tenModalHotAddCL");
    const tenModalHotAddKTA = document.getElementById("tenModalHotAddKTA");
    const btnAddMS = document.getElementById("btnModalHotAddMS");
    const btnAddKT = document.getElementById("btnModalHotAddKT");
    const btnAddCL = document.getElementById("btnModalHotAddCL");
    const btnAddKTA = document.getElementById("btnModalHotAddKTA");

    const fileHinhAnh1ModalAdd = document.getElementById('fileHinhAnh1ModalAdd');
    const fileHinhAnh2ModalAdd = document.getElementById('fileHinhAnh2ModalAdd');
    const fileHinhAnh3ModalAdd = document.getElementById('fileHinhAnh3ModalAdd');

    const fileHinhAnh1ModalEdit = document.getElementById('fileHinhAnh1ModalEdit');
    const fileHinhAnh2ModalEdit = document.getElementById('fileHinhAnh2ModalEdit');
    const fileHinhAnh3ModalEdit = document.getElementById('fileHinhAnh3ModalEdit');

    const fileHinhAnh1ModalEditAll = document.getElementById('fileHinhAnh1ModalEditAll');
    const fileHinhAnh2ModalEditAll = document.getElementById('fileHinhAnh2ModalEditAll');
    const fileHinhAnh3ModalEditAll = document.getElementById('fileHinhAnh3ModalEditAll');
    let fileHinhAnh1ModalEditObject = null;

    const hinhAnh1DisplayModalAdd = document.getElementById('hinhAnh1DisplayModalAdd');
    const hinhAnh2DisplayModalAdd = document.getElementById('hinhAnh2DisplayModalAdd');
    const hinhAnh3DisplayModalAdd = document.getElementById('hinhAnh3DisplayModalAdd');

    const hinhAnh1DisplayModalEdit = document.getElementById('hinhAnh1DisplayModalEdit');
    const hinhAnh2DisplayModalEdit = document.getElementById('hinhAnh2DisplayModalEdit');
    const hinhAnh3DisplayModalEdit = document.getElementById('hinhAnh3DisplayModalEdit');

    const hinhAnh1DisplayModalEditAll = document.getElementById('hinhAnh1DisplayModalEditAll');
    const hinhAnh2DisplayModalEditAll = document.getElementById('hinhAnh2DisplayModalEditAll');
    const hinhAnh3DisplayModalEditAll = document.getElementById('hinhAnh3DisplayModalEditAll');

</script>
<script>
    // filefunc
    fileHinhAnh1ModalAdd.addEventListener('change', function (e) {
        const files = e.target.files;
        console.log("test change data: ", files);
        if (files.length > 0) {
            const file = files[0];
            console.log("File selected: ", file);
            console.log("file cmp: ", fileHinhAnh1ModalAdd.files[0]);
            const imgURL = URL.createObjectURL(fileHinhAnh1ModalAdd.files[0]);
            hinhAnh1DisplayModalAdd.src = imgURL;
        }
    });
    fileHinhAnh2ModalAdd.addEventListener('change', function (e) {
        const files = e.target.files;
        console.log("test change data: ", files);
        if (files.length > 0) {
            const file = files[0];
            console.log("File selected: ", file);
            console.log("file cmp: ", fileHinhAnh2ModalAdd.files[0]);
            const imgURL = URL.createObjectURL(fileHinhAnh2ModalAdd.files[0]);
            hinhAnh2DisplayModalAdd.src = imgURL;
        }
    });
    fileHinhAnh3ModalAdd.addEventListener('change', function (e) {
        const files = e.target.files;
        console.log("test change data: ", files);
        if (files.length > 0) {
            const file = files[0];
            console.log("File selected: ", file);
            console.log("file cmp: ", fileHinhAnh3ModalAdd.files[0]);
            const imgURL = URL.createObjectURL(fileHinhAnh3ModalAdd.files[0]);
            hinhAnh3DisplayModalAdd.src = imgURL;
        }
    });
    fileHinhAnh1ModalEdit.addEventListener('change', function (e) {
        const files = e.target.files;
        console.log("test change data: ", files);
        if (files.length > 0) {
            const file = files[0];
            console.log("File selected: ", file);
            console.log("file cmp: ", fileHinhAnh1ModalEdit.files[0]);
            fileHinhAnh1ModalEditObject = fileHinhAnh1ModalEdit.files[0];
            const imgURL = URL.createObjectURL(fileHinhAnh1ModalEdit.files[0]);
            hinhAnh1DisplayModalEdit.src = imgURL;
        }
    });
    fileHinhAnh2ModalEdit.addEventListener('change', function (e) {
        const files = e.target.files;
        console.log("test change data: ", files);
        if (files.length > 0) {
            const file = files[0];
            console.log("File selected: ", file);
            console.log("file cmp: ", fileHinhAnh2ModalEdit.files[0]);
            const imgURL = URL.createObjectURL(fileHinhAnh2ModalEdit.files[0]);
            hinhAnh2DisplayModalEdit.src = imgURL;
        }
    });
    fileHinhAnh3ModalEdit.addEventListener('change', function (e) {
        const files = e.target.files;
        console.log("test change data: ", files);
        if (files.length > 0) {
            const file = files[0];
            console.log("File selected: ", file);
            console.log("file cmp: ", fileHinhAnh3ModalEdit.files[0]);
            const imgURL = URL.createObjectURL(fileHinhAnh3ModalEdit.files[0]);
            hinhAnh3DisplayModalEdit.src = imgURL;
        }
    });
    //form edit all
    fileHinhAnh1ModalEditAll.addEventListener('change', function (e) {
        const files = e.target.files;
        console.log("test change data: ", files);
        if (files.length > 0) {
            const file = files[0];
            console.log("File selected: ", file);
            console.log("file cmp: ", fileHinhAnh1ModalEditAll.files[0]);
            fileHinhAnh1ModalEditAllObject = fileHinhAnh1ModalEditAll.files[0];
            const imgURL = URL.createObjectURL(fileHinhAnh1ModalEditAll.files[0]);
            hinhAnh1DisplayModalEditAll.src = imgURL;
        }
    });
    fileHinhAnh2ModalEditAll.addEventListener('change', function (e) {
        const files = e.target.files;
        console.log("test change data: ", files);
        if (files.length > 0) {
            const file = files[0];
            console.log("File selected: ", file);
            console.log("file cmp: ", fileHinhAnh2ModalEditAll.files[0]);
            const imgURL = URL.createObjectURL(fileHinhAnh2ModalEditAll.files[0]);
            hinhAnh2DisplayModalEditAll.src = imgURL;
        }
    });
    fileHinhAnh3ModalEditAll.addEventListener('change', function (e) {
        const files = e.target.files;
        console.log("test change data: ", files);
        if (files.length > 0) {
            const file = files[0];
            console.log("File selected: ", file);
            console.log("file cmp: ", fileHinhAnh3ModalEditAll.files[0]);
            const imgURL = URL.createObjectURL(fileHinhAnh3ModalEditAll.files[0]);
            hinhAnh3DisplayModalEditAll.src = imgURL;
        }
    });
</script>
<script>
    // change sttlbl add
    function updateLabeladd() {
        if (trangThaiModalAddRaw.checked) {
            trangThaiLabelModalAdd.textContent = "Đang hoạt động";
        } else {
            trangThaiLabelModalAdd.textContent = "Dừng hoạt động";
        }
    }
    trangThaiModalAddRaw.addEventListener("change", updateLabeladd);
    updateLabeladd();
    function updateLabeledit() {
        if (trangThaiModalEditRaw.checked) {
            trangThaiLabelModalEdit.textContent = "Đang hoạt động";
        } else {
            trangThaiLabelModalEdit.textContent = "Dừng hoạt động";
        }
    }
    trangThaiModalEditRaw.addEventListener("change", updateLabeledit);
    updateLabeledit();
    function setMauSac(msString) {
        const ms = JSON.parse(msString.replace(/&quot;/g, '"'));
        idMauSac = ms.id;
        lblMauSac.textContent = ms.ten;
        console.log('Selected mau sac ID:', idMauSac);
        // You can add more logic here to handle the selected value
    }

    function setKichThuoc(ktString) {
        const kt = JSON.parse(ktString.replace(/&quot;/g, '"'));
        idKichThuoc = kt.id;
        lblKichThuoc.textContent = kt.ten;
        console.log('Selected kich thuoc ID:', idKichThuoc);
        // You can add more logic here to handle the selected value
    }

    function setChatLieu(clString) {
        const cl = JSON.parse(clString.replace(/&quot;/g, '"'));
        idChatLieu = cl.id;
        lblChatLieu.textContent = cl.ten;
        console.log('Selected chat lieu ID:', idChatLieu);
        // You can add more logic here to handle the selected value
    }

    function setKieuTay(ktString) {
        const kt = JSON.parse(ktString.replace(/&quot;/g, '"'));
        idKieuTay = kt.id;
        lblKieuTay.textContent = kt.ten;
        console.log('Selected kieu tay ID modal:', idKieuTay);
        // You can add more logic here to handle the selected value
    }

    function setTrangThaiSearch(status) {
        let lblTrangThai = document.getElementById('lblTrangThaiSearch');
        if (status === 1) {
            lblTrangThai.textContent = "Hoạt động";
            idTrangThai =1 ;
        } else {
            lblTrangThai.textContent = "Dừng hoạt động";
            idTrangThai =0;
        }
    }

    function setMauSacModalEdit(msString) {
        const ms = JSON.parse(msString.replace(/&quot;/g, '"'));
        idMauSacModalEdit = ms.id;
        lblMauSacModalEdit.textContent = ms.ten;
        console.log('Selected mau sac ID modal edit:', idMauSacModalEdit);
        // You can add more logic here to handle the selected value
    }

    function setKichThuocModalEdit(ktString) {
        const kt = JSON.parse(ktString.replace(/&quot;/g, '"'));
        idKichThuocModalEdit = kt.id;
        lblKichThuocModalEdit.textContent = kt.ten;
        console.log('Selected kich thuoc ID modal edit:', idKichThuocModalEdit);
        // You can add more logic here to handle the selected value
    }

    function setChatLieuModalEdit(clString) {
        const cl = JSON.parse(clString.replace(/&quot;/g, '"'));
        idChatLieuModalEdit = cl.id;
        lblChatLieuModalEdit.textContent = cl.ten;
        fetch(`/chi-tiet-sp/update-all-ChatLieu?idSanPham=` + pathVariable + `&idChatLieu=` + cl.id, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                if (response.ok) {
                    return response.json(); // or response.text() if you expect a textual response
                } else {
                    throw new Error('Network response was not ok');
                }
            })
            .then(data => {
                // Successfully processed the request
                Swal.fire(
                    'Đã sửa thành công!',
                    'Dữ liệu đã được ghi nhận.',
                    'success'
                ).then(() => {
                    loadDSSPCT(currentPage);
                });
            })
            .catch(error => {
                // Handle errors here
                console.error('There was a problem with the fetch operation:', error);
                Swal.fire(
                    'Lỗi!',
                    'Đã có lỗi xảy ra khi ghi nhận dữ liệu.',
                    'error'
                );
            });
        console.log('Selected chat lieu ID modal Edit:', idChatLieuModalEdit);
        // You can add more logic here to handle the selected value
    }

    function setKieuTayModalEdit(ktString) {
        const kt = JSON.parse(ktString.replace(/&quot;/g, '"'));
        idKieuTayModalEdit = kt.id;
        lblKieuTayModalEdit.textContent = kt.ten;
        fetch(`/chi-tiet-sp/update-all-KieuTay?idSanPham=` + pathVariable + `&idKieuTay=` + kt.id, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                if (response.ok) {
                    return response.json(); // or response.text() if you expect a textual response
                } else {
                    throw new Error('Network response was not ok');
                }
            })
            .then(data => {
                // Successfully processed the request
                Swal.fire(
                    'Đã sửa thành công!',
                    'Dữ liệu đã được ghi nhận.',
                    'success'
                ).then(() => {
                    loadDSSPCT(currentPage);
                });
            })
            .catch(error => {
                // Handle errors here
                console.error('There was a problem with the fetch operation:', error);
                Swal.fire(
                    'Lỗi!',
                    'Đã có lỗi xảy ra khi ghi nhận dữ liệu.',
                    'error'
                );
            });
        console.log('Selected kieu tay ID modal edit:', idKieuTayModalEdit);
        // You can add more logic here to handle the selected value
    }

    function setMauSacModalAdd(msString) {
        const ms = JSON.parse(msString.replace(/&quot;/g, '"'));
        idMauSacModalAdd = ms.id;
        lblMauSacModalAdd.textContent = ms.ten;
        console.log('Selected mau sac ID modal add:', idMauSacModalAdd);
        // You can add more logic here to handle the selected value
    }

    function setKichThuocModalAdd(ktString) {
        const kt = JSON.parse(ktString.replace(/&quot;/g, '"'));
        idKichThuocModalAdd = kt.id;
        lblKichThuocModalAdd.textContent = kt.ten;
        console.log('Selected kich thuoc ID modal Add:', idKichThuocModalAdd);
        // You can add more logic here to handle the selected value
    }

    function setChatLieuModalAdd(clString) {
        const cl = JSON.parse(clString.replace(/&quot;/g, '"'));
        idChatLieuModalAdd = cl.id;
        lblChatLieuModalAdd.textContent = cl.ten;
        console.log('Selected chat lieu ID modal add:', idChatLieuModalAdd);
        // You can add more logic here to handle the selected value
    }

    function setKieuTayModalAdd(ktString) {
        const kt = JSON.parse(ktString.replace(/&quot;/g, '"'));
        idKieuTayModalAdd = kt.id;
        lblKieuTayModalAdd.textContent = kt.ten;
        console.log('Selected kieu tay ID modal add:', idKieuTayModalAdd);
        // You can add more logic here to handle the selected value
    }

    const loadSP = () => {
        fetch("/san-pham/detail/" + pathVariable, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                tenSPLocal = resp.ten;
                ngayTaoSPLocal = resp.ngayTao;
                document.getElementById("tenSPModalEdit").textContent = tenSPLocal;
                document.getElementById("tenSPModalAdd").textContent = tenSPLocal;
                document.getElementById("tenSPModalEditAll").textContent = tenSPLocal;
                document.getElementById("ngayTaoModalAdd").textContent = ngayTaoSPLocal;
                document.getElementById("ngayTaoModalEdit").textContent = ngayTaoSPLocal;
                document.getElementById("ngayTaoModalEditAll").textContent = ngayTaoSPLocal;
                let trangThaiSP = "";
                var imagePath = resp.hinhAnh;
                var defaultImage = '/image-icon/placeholder.jpg';
                if (resp.trangThai == 1) {
                    trangThaiSP = "Hoạt động";
                    document.getElementById("trangThaiSP").style.color = "blue";
                } else {
                    trangThaiSP = "Dừng hoạt động";
                    document.getElementById("trangThaiSP").style.color = "red";
                }
                $('#hinhAnhSP').attr('src', imagePath ? '/image/' + imagePath : defaultImage);
                $('#tenSP').text(resp.ten);
                $('#maSP').text(resp.ma);
                $('#ngayTaoSP').text(resp.ngayTao);
                $('#trangThaiSP').text(trangThaiSP);
            });
    }
    loadSP();

    const renderDropdownOrNot = () => {
        fetch("/san-pham/count-spct-byIdSP?idSP=" + pathVariable, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                if (resp > 0) {
                    document.getElementById("chatLieuBoxModalAdd").style.display = "none";
                    document.getElementById("kieuTayBoxModalAdd").style.display = "none";
                    document.getElementById('cboChatLieuArea').style.pointerEvents = 'auto';
                    document.getElementById('cboKieuTayArea').style.pointerEvents = 'auto';
                } else {
                    document.getElementById("chatLieuBoxModalAdd").style.display = "block";
                    document.getElementById("kieuTayBoxModalAdd").style.display = "block";
                    document.getElementById('cboChatLieuArea').style.pointerEvents = 'none';
                    document.getElementById('cboKieuTayArea').style.pointerEvents = 'none';
                }
            })
            .catch(error => {
                console.error('Error fetching count data:', error);
            });
    }
    // Call the function to execute it
    renderDropdownOrNot();

    const loadCboMauSac = () => {
        let datatest = "data testing";
        fetch("/mau-sac/index", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let htmlSearch = '';
                let htmlCboModalEdit = '';
                let htmCboModalAdd = '';
                resp.map((ms, i) => {
                    const msString = JSON.stringify(ms).replace(/"/g, '&quot;');
                    htmlSearch += '<li><a class="dropdown-item"  onclick="setMauSac(\'' + msString + '\')">' + ms.ten + '</a></li>';
                    htmlCboModalEdit += '<li><a class="dropdown-item"  onclick="setMauSacModalEdit(\'' + msString + '\')">' + ms.ten + '</a></li>'
                    htmCboModalAdd += '<li><a class="dropdown-item"  onclick="setMauSacModalAdd(\'' + msString + '\')">' + ms.ten + '</a></li>'
                });
                $("#cboMauSac").html(htmlSearch);
                $("#cboMauSacModalAdd").html(htmCboModalAdd);
                $("#cboMauSacModalEdit").html(htmlCboModalEdit);
            });
    }
    loadCboMauSac();
    const loadCboKichThuoc = () => {
        let datatest = "data testing";
        fetch("/kich-thuoc/index", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let htmlSearch = '';
                let htmlCboModalEdit = '';
                let htmlCboModalAdd = '';
                resp.map((kt, i) => {
                    const ktString = JSON.stringify(kt).replace(/"/g, '&quot;');
                    htmlSearch += '<li><a class="dropdown-item" onclick="setKichThuoc(\'' + ktString + '\')">' + kt.ten + '</a></li>';
                    htmlCboModalEdit += '<li><a class="dropdown-item" onclick="setKichThuocModalEdit(\'' + ktString + '\')">' + kt.ten + '</a></li>';
                    htmlCboModalAdd += '<li><a class="dropdown-item" onclick="setKichThuocModalAdd(\'' + ktString + '\')">' + kt.ten + '</a></li>';
                });
                $("#cboKichThuoc").html(htmlSearch);
                $("#cboKichThuocModalAdd").html(htmlCboModalAdd);
                $("#cboKichThuocModalEdit").html(htmlCboModalEdit);
            });
    }
    loadCboKichThuoc();
    const loadCboChatLieu = () => {
        let datatest = "data testing";
        fetch("/chat-lieu/index", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let htmlSearch = '';
                let htmlCboModalEdit = '';
                let htmlCboModalAdd = '';
                resp.map((cl, i) => {
                    const clString = JSON.stringify(cl).replace(/"/g, '&quot;');
                    htmlSearch += '<li><a class="dropdown-item" onclick="setChatLieu(\'' + clString + '\')">' + cl.ten + '</a></li>';
                    htmlCboModalAdd += '<li><a class="dropdown-item" onclick="setChatLieuModalAdd(\'' + clString + '\')">' + cl.ten + '</a></li>';
                    htmlCboModalEdit += '<li><a class="dropdown-item" onclick="setChatLieuModalEdit(\'' + clString + '\')">' + cl.ten + '</a></li>';
                });
                $("#cboChatLieu").html(htmlSearch)
                $("#cboChatLieuModalAdd").html(htmlCboModalAdd);
                $("#cboChatLieuModalEdit").html(htmlCboModalEdit);
            });
    }
    loadCboChatLieu();
    const loadCboKieuTay = () => {
        let datatest = "data testing";
        fetch("/kieu-tay/index", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let htmlSearch = '';
                let htmlCboModalEdit = '';
                let htmlCboModalAdd = '';
                resp.map((kt, i) => {
                    const kieuTayString = JSON.stringify(kt).replace(/"/g, '&quot;');
                    htmlSearch += '<li><a class="dropdown-item"  onclick="setKieuTay(\'' + kieuTayString + '\')">' + kt.ten + '</a></li>';
                    htmlCboModalEdit += '<li><a class="dropdown-item"  onclick="setKieuTayModalEdit(\'' + kieuTayString + '\')">' + kt.ten + '</a></li>';
                    htmlCboModalAdd += '<li><a class="dropdown-item"  onclick="setKieuTayModalAdd(\'' + kieuTayString + '\')">' + kt.ten + '</a></li>';
                });
                $("#cboKieuTay").html(htmlSearch);
                $("#cboKieuTayModalAdd").html(htmlCboModalAdd);
                $("#cboKieuTayModalEdit").html(htmlCboModalEdit);
            });
    }
    loadCboKieuTay();
    const loadDSSPCT = (pageParams) => {
        // get api + scpt.id
        let datatest = "data testing";
        let mauSacMemo = "";
        fetch("/chi-tiet-sp/detail-byidsp-all/" + pathVariable + "?page=" + pageParams, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let html = '';
                resp.map((spct, i) => {
                    const trangThai = spct.trangThai == 1
                        ? '<p style="font-weight: bold; color: blue">Hoạt động</p>'
                        : '<p style="font-weight: bold; color: red">Dừng HĐ</p>';
                    const mauSac = spct.idMauSac.ten || 'N/A';
                    const kichThuoc = spct.idKichThuoc.ten || 'N/A';
                    const chatLieu = spct.idChatLieu.ten || 'N/A';
                    const kieuTay = spct.idKieuTay.ten || 'N/A';
                    const soLuong = spct.soLuong || 'N/A';
                    const giaBan = spct.giaBan || 'N/A';
                    const giaNhap = spct.giaNhap || 'N/A';
                    const moTa = spct.moTa || 'N/A';
                    var hinhAnh = spct.hinhAnh;
                    var fallbackImage = '/image-icon/placeholder.jpg';
                    if (spct.idMauSac.ten != mauSacMemo) {
                        let labelms = spct.idMauSac.ten;
                        console.log("Mau sac memo: ", spct.idMauSac.ten);
                        $('#lblChatLieuModalEdit').text(chatLieu);
                        $('#lblKieuTayModalEdit').text(kieuTay);
                        $('#chatLieuMemo').val(spct.idChatLieu.id);
                        $('#kieuTayMemo').val(spct.idKieuTay.id);
                        idChatLieuModalEdit = spct.idChatLieu.id;
                        idKieuTayModalEdit = spct.idKieuTay.id;
                        html +=
                            '<tr>' +
                            '<td>' +
                            '<h5 class="">' + spct.idMauSac.ten + '<h5>' +
                            '</td>' +
                            '<td><input class="mt-2" style="width: 20px;height: 20px" type="checkbox" id="cbHinhAnh_' + spct.idMauSac.id + '"></td>' +
                            '<td>' + '</td>' +
                            '<td>' + '</td>' +
                            '<td><input class="mt-2" style="width: 20px;height: 20px" type="checkbox" id="cbSoLuong_' + spct.idMauSac.id + '"></td>' +
                            '<td><input class="mt-2" style="width: 20px;height: 20px" type="checkbox" id="cbGiaNhap_' + spct.idMauSac.id + '"></td>' +
                            '<td><input class="mt-2" style="width: 20px;height: 20px" type="checkbox" id="cbGiaBan_' + spct.idMauSac.id + '"></td>' +
                            '<td><input class="mt-2" style="width: 20px;height: 20px" type="checkbox" id="cbMoTa_' + spct.idMauSac.id + '"></td>' +
                            '<td><input class="mt-2" style="width: 20px;height: 20px" type="checkbox" id="cbTrangThai_' + spct.idMauSac.id + '"></td>' +
                            '<td>' +
                            '<button id="editAllSPCTBtn_' + spct.idMauSac.id + '" class="btn btn-primary me-2">Sửa theo màu</button>' +
                            '</td>' +
                            '</tr>';
                    }
                    html += '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td><img src="' + (hinhAnh ? "/image/" + hinhAnh : fallbackImage) +
                        '" alt="Image" style="width: 50px; height: 60px" class="img-fluid rounded border" /></td>' +
                        '<td>' + mauSac + '</td>' +
                        '<td>' + kichThuoc + '</td>' +
                        '<td>' + soLuong + '</td>' +
                        '<td>' + giaNhap + '</td>' +
                        '<td>' + giaBan + '</td>' +
                        '<td>' +
                        '<div  id="tooltip">Xem' +
                        '<span id="tooltiptext">' + moTa + '</span>' +
                        '</div>' +
                        '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<button id="editSPCTBtn_' + spct.id + '" class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#ModalEdit">Sửa</button>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                    mauSacMemo = spct.idMauSac.ten;
                });
                $("#tbl_ds_spct").html(html)
            });
    }

    function search(e) {
        e.preventDefault();
        console.log('data mau sac ID:', idMauSac);
        console.log('data kich thuoc ID:', idKichThuoc);
        console.log('data chat lieu ID:', idChatLieu);
        console.log('data kieu tay ID:', idKieuTay);
        console.log('debug trang thai: ', idTrangThai);
        console.log('data sp local ID:', idSPCTLocal);
        fetch("/chi-tiet-sp/search" + "?idSanPham=" + pathVariable + "&idMauSac=" + idMauSac + "&idKichThuoc=" + idKichThuoc + "&idChatLieu=" + idChatLieu + "&idKieuTay=" + idKieuTay + "&giaBanMin=" + minGiaBanSearch + "&giaBanMax=" + maxGiaBanSearch + "&trangThai="+idTrangThai + "&page=", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let html = '';
                resp.map((spct, i) => {
                    const trangThai = spct.trangThai == 1
                        ? '<p style="font-weight: bold; color: blue">Hoạt động</p>'
                        : '<p style="font-weight: bold; color: red">Dừng HĐ</p>';
                    const mauSac = spct.idMauSac.ten || 'N/A';
                    const kichThuoc = spct.idKichThuoc.ten || 'N/A';
                    const chatLieu = spct.idChatLieu.ten || 'N/A';
                    const kieuTay = spct.idKieuTay.ten || 'N/A';
                    const soLuong = spct.soLuong || 'N/A';
                    const giaBan = spct.giaBan || 'N/A';
                    const giaNhap = spct.giaNhap || 'N/A';
                    const moTa = spct.moTa || 'N/A';
                    var hinhAnh = spct.hinhAnh;
                    var fallbackImage = '/image-icon/placeholder.jpg';
                    html += '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td><img src="' + (hinhAnh ? "/image/" + hinhAnh : fallbackImage) +
                        '" alt="Image" style="width: 50px; height: 60px" class="img-fluid rounded border" /></td>' +
                        '<td>' + mauSac + '</td>' +
                        '<td>' + kichThuoc + '</td>' +
                        '<td>' + soLuong + '</td>' +
                        '<td>' + giaNhap + '</td>' +
                        '<td>' + giaBan + '</td>' +
                        '<td>' +
                        '<div  id="tooltip">Xem' +
                        '<span id="tooltiptext">' + moTa + '</span>' +
                        '</div>' +
                        '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<button id="editSPCTBtn_' + spct.id + '" class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#ModalEdit">Sửa</button>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                $("#tbl_ds_spct").html(html)
            });
    }

    function refresh(e) {
        e.preventDefault();
        idMauSac = "";
        idKichThuoc = "";
        idChatLieu = "";
        idKieuTay = "";
        idTrangThai = "";
        minGiaBanSearch = "";
        maxGiaBanSearch = "";
        lblMauSac.textContent = "Chọn màu sắc";
        lblKichThuoc.textContent = "Chọn kích thước";
        document.getElementById("lblTrangThaiSearch").textContent = "Trạng thái";
        loadDSSPCT(currentPage);
    }

    function setActive(element, page) {
        // Remove active class from all pagination items
        let items = document.querySelectorAll('.page-item');
        items.forEach(item => item.classList.remove('active'));
        element.parentElement.classList.add('active');
        currentPage = page;
        updateButtons();
        loadDSSPCT(currentPage);
    }

    function updateButtons() {
        let items = document.querySelectorAll('.page-item');
        let activeIndex = Array.from(items).findIndex(item => item.classList.contains('active'));
        document.getElementById('prev').classList.toggle('disabled', activeIndex === 1);
        document.getElementById('next').classList.toggle('disabled', activeIndex === items.length - 2);
    }

    function navigate(direction, e) {
        e.preventDefault();
        if (totalPage > 1) {
            let items = document.querySelectorAll('.page-item');
            let activeIndex = Array.from(items).findIndex(item => item.classList.contains('active'));
            let newIndex = activeIndex + direction;
            currentPage = newIndex
            loadDSSPCT(currentPage);
            if (newIndex > 0 && newIndex < items.length - 1) {
                setActive(items[newIndex].querySelector('a'));
            }
        }
    }

    updateButtons();

    const loadTotalPagination = (currentPage) => {
        fetch("/chi-tiet-sp/count-byidsp/" + pathVariable, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let html = '';
                // Check if resp is a number and greater than 0
                if (typeof resp === 'number' && resp > 0) {
                    totalPage = Math.ceil(resp / 20);
                    for (let i = 1; i <= Math.ceil(resp / 20); i++) {
                        const activeClass = (i === currentPage) ? 'active' : '';
                        html += '<li class="page-item ' + activeClass + '"><a class="page-link" href="#" onclick="setActive(this, ' + i + ')">' + i + '</a></li>';
                    }
                } else {
                    // Handle case where resp is not a valid number or is <= 0
                    html = '<li class="page-item"><a class="page-link" href="#">No pages found</a></li>';
                }
                $("#paginationBody").html(html);
            }).catch(error => {
            console.error('Error fetching pagination data:', error);
            // Handle fetch error
        });
    }

    loadDSSPCT(currentPage);
    loadTotalPagination(currentPage);
    $(document).on('click', "button[id^='editSPCTBtn_']", e => {
        e.preventDefault();
        const queryString = window.location.pathname;
        const pathParts = queryString.split('/');
        const pathVariable = pathParts[pathParts.length - 1];
        const spctid = e.currentTarget.id.replace("editSPCTBtn_", "");
        idSPCTLocal = spctid;
        fetch("/chi-tiet-sp/detail/" + spctid, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                lblMauSacModalEdit.textContent = resp.idMauSac.ten;
                lblKichThuocModalEdit.textContent = resp.idKichThuoc.ten;
                lblChatLieuModalEdit.textContent = resp.idChatLieu.ten;
                lblKieuTayModalEdit.textContent = resp.idKieuTay.ten;
                idMauSacModalEdit = resp.idMauSac.id;
                idKichThuocModalEdit = resp.idKichThuoc.id;
                idChatLieuModalEdit = resp.idChatLieu.id;
                idKieuTayModalEdit = resp.idKieuTay.id;
                ghiChuModalEdit.value = resp.moTa;
                soLuongModalEdit.value = resp.soLuong;
                giaNhapModalEdit.value = resp.giaNhap;
                giaBanModalEdit.value = resp.giaBan;
                if (resp.trangThai == 1) {
                    trangThaiModalEditRaw.checked = true;
                    trangThaiLabelModalEdit.textContent = "Đang hoạt động";
                } else {
                    trangThaiModalEditRaw.checked = false;
                    trangThaiLabelModalEdit.textContent = "Dừng hoạt động";
                }
            });
        console.log("spct id: ", spctid);
        fetch("/hinh-anh/detail-byidspct/" + spctid, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                console.log("hinhanh1 : ", resp.hinhAnh1);
                console.log("hinhanh2 : ", resp.hinhAnh2);
                console.log("hinhanh3 : ", resp.hinhAnh3);
                hinhAnh1DisplayModalEdit.src = resp.hinhAnh1 ? "/image/" + resp.hinhAnh1 : "/image-icon/pendingIMG.png";
                hinhAnh2DisplayModalEdit.src = resp.hinhAnh2 ? "/image/" + resp.hinhAnh2 : "/image-icon/pendingIMG.png";
                hinhAnh3DisplayModalEdit.src = resp.hinhAnh3 ? "/image/" + resp.hinhAnh3 : "/image-icon/pendingIMG.png";
            });
    });

    $(document).on('click', "button[id^='editAllSPCTBtn_']", e => {
        e.preventDefault();
        idMauSacHolder = "";
        const idMauSac = e.currentTarget.id.replace("editAllSPCTBtn_", "");
        idMauSacHolder = idMauSac;
        console.log("id mau sac:", idMauSac);
        console.log("test id mau sac holder: ", idMauSacHolder);
        console.log("checkbox so luong btn: ", document.getElementById("cbSoLuong_" + idMauSac).checked);
        console.log("checkbox gia nhap btn: ", document.getElementById("cbSoLuong_" + idMauSac).checked);
        console.log("checkbox gia ban  btn: ", document.getElementById("cbSoLuong_" + idMauSac).checked);
        console.log("checkbox mo ta btn: ", document.getElementById("cbSoLuong_" + idMauSac).checked);
        console.log("checkbox trang thai btn: ", document.getElementById("cbTrangThai_" + idMauSac).checked);
        console.log("file hinh anh modal edit all: ", hinhAnh1DisplayModalEdit.src)
        let countCheckBox = 0;

        if (!document.getElementById("cbHinhAnh_" + idMauSac).checked) {
            document.getElementById("hinhAnh1Container").style.display = "none";
            document.getElementById("hinhAnh2Container").style.display = "none";
            document.getElementById("hinhAnh3Container").style.display = "none";
        } else {
            countCheckBox++
            document.getElementById("hinhAnh1Container").style.display = "block";
            document.getElementById("hinhAnh2Container").style.display = "block";
            document.getElementById("hinhAnh3Container").style.display = "block";
        }
        if (!document.getElementById("cbSoLuong_" + idMauSac).checked) {
            document.getElementById("soLuongContainer").style.display = "none";
        } else {
            countCheckBox++
            document.getElementById("soLuongContainer").style.display = "block";
        }
        if (!document.getElementById("cbGiaNhap_" + idMauSac).checked) {
            document.getElementById("giaNhapContainer").style.display = "none";
        } else {
            countCheckBox++
            document.getElementById("giaNhapContainer").style.display = "block";
        }
        if (!document.getElementById("cbGiaBan_" + idMauSac).checked) {
            document.getElementById("giaBanContainer").style.display = "none";
        } else {
            countCheckBox++
            document.getElementById("giaBanContainer").style.display = "block";
        }
        if (!document.getElementById("cbMoTa_" + idMauSac).checked) {
            document.getElementById("moTaContainer").style.display = "none";
        } else {
            countCheckBox++
            document.getElementById("moTaContainer").style.display = "block";
        }
        if (!document.getElementById("cbTrangThai_" + idMauSac).checked) {
            console.log("test is true: ");
            document.getElementById("trangThaiContainer").style.display = "none";
        } else {
            countCheckBox++
            document.getElementById("trangThaiContainer").style.display = "block";
        }
        if (countCheckBox > 0) {
            $('#ModalEditAll').modal('show');
        } else {
            Swal.fire({
                icon: 'error',
                text: 'Vui lòng chọn trước khi sửa !',
            })
            console.log("please fill check box");
        }
    });

    $(document).on('click', "button[id^='detailSPBtn_']", e => {
        e.preventDefault();
        const spid = e.currentTarget.id.replace("detailSPBtn_", "");
        console.log("====================test id button detail: ", spid);
        window.location.href = '/qlsp/' + spid;
        // fetch(apiGet, {
        //     headers: {
        //         'Accept': 'application/json',
        //         'Content-Type': 'application/json'
        //     }
        // }).then(response => response.json())
        //     .then(resp => {
        //         console.log("test response spct: ", resp);
        //         spctLocal =resp;
        //         const apiAdd = "/san-pham/update/"+spid;
        //         fetch(apiAdd, {
        //             method: "post",
        //             headers: {
        //                 'Accept': 'application/json',
        //                 'Content-Type': 'application/json'
        //             }
        //         }).then( (response) => {
        //             console.log(response);
        //             loadDSSP();
        //         });
        //     });
    });
    const addBtn = document.querySelectorAll('#btnAdd');
    const editSPCTBtn = document.querySelectorAll('#editSPCTBtn');
    const saveEditBtn = document.querySelectorAll('#saveEditBtn');
    const saveEditAllBtn = document.querySelector('#saveEditAllBtn');
    const saveAddBtn = document.querySelectorAll('#saveAddBtn');
    addBtn.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            hinhAnh1DisplayModalAdd.src = "/image-icon/pendingIMG.png";
            hinhAnh2DisplayModalAdd.src = "/image-icon/pendingIMG.png";
            hinhAnh3DisplayModalAdd.src = "/image-icon/pendingIMG.png";
        });
    });

    function getFileName(fullPath) {
        // Check for the last occurrence of the backslash or forward slash
        var startIndex = Math.max(fullPath.lastIndexOf('\\'), fullPath.lastIndexOf('/'));
        // Extract the file name
        var fileName = fullPath.substring(startIndex + 1);
        return fileName;
    }

    saveAddBtn.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            console.log("test check btn");
            console.log("id spct local: ", idSPCTLocal);

            // Determine modal status
            const trangThaiModalAdd = trangThaiModalAddRaw.checked ? 1 : 0;

            // Validate form
            if (validateModalAdd() === 5) {
                Swal.fire({
                    title: 'Xác nhận?',
                    text: "Dữ liệu sẽ được lưu lại!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ok!',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Prepare data for saving
                        console.log("test save add :",document.getElementById("lblChatLieuModalEdit").textContent );
                        console.log("test save add :",idKieuTayModalAdd );
                        console.log("test save add :",idKieuTayModalAdd );
                        if(document.getElementById("lblChatLieuModalEdit").textContent.trim() === "Chọn chất liệu"){
                            console.log("do set html");
                            document.getElementById("chatLieuMemo").value = idChatLieuModalAdd;
                            document.getElementById("kieuTayMemo").value = idKieuTayModalAdd;
                        }
                        const data = {
                            idSp: pathVariable,
                            idMauSac: idMauSacModalAdd,
                            idKichThuoc: idKichThuocModalAdd,
                            idChatLieu: document.getElementById("chatLieuMemo").value,
                            idKieuTay: document.getElementById("kieuTayMemo").value,
                            moTa: ghiChuModalAdd ? ghiChuModalAdd.value : null,
                            soLuong: soLuongModalAdd.value,
                            giaNhap: giaNhapModalAdd.value,
                            giaBan: giaBanModalAdd.value,
                            trangThai: trangThaiModalAdd
                        };

                        console.log("data json: ", data);

                        fetch(`/chi-tiet-sp/save`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(data)
                        }).then(response => response.json())
                            .then(resp => {
                                console.log("test resp =================: ", resp);
                                renderDropdownOrNot();
                                if (resp !== null && resp.id) {
                                    // Prepare image data after successful response
                                    const dataHinhAnh = {
                                        idSPCT: resp.id,
                                        hinhAnh1: fileHinhAnh1ModalAdd.value ? getFileName(fileHinhAnh1ModalAdd.value) : "",
                                        hinhAnh2: fileHinhAnh2ModalAdd.value ? getFileName(fileHinhAnh2ModalAdd.value) : "",
                                        hinhAnh3: fileHinhAnh3ModalAdd.value ? getFileName(fileHinhAnh3ModalAdd.value) : "",
                                        trangThai: "1"
                                    };
                                    fetch(`/hinh-anh/save`, {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/json'
                                        },
                                        body: JSON.stringify(dataHinhAnh)
                                    }).then(() => {
                                        // Success message after saving images
                                        Swal.fire(
                                            'Đã lưu thành công!',
                                            'Dữ liệu đã được ghi nhận.',
                                            'success'
                                        ).then(() => {
                                            // Reload the data
                                            loadDSSPCT(currentPage);

                                            // Upload files using FormData
                                            const formData = new FormData($('#uploadFormAdd')[0]);
                                            $.ajax({
                                                url: '/uploads',
                                                type: 'POST',
                                                data: formData,
                                                processData: false,
                                                contentType: false,
                                                success: function (response) {
                                                    console.log("save image success ");
                                                },
                                                error: function (xhr, status, error) {
                                                    console.log("save image error");
                                                }
                                            });
                                        });
                                    });
                                } else {
                                    // Handle failed response
                                    Swal.fire(
                                        'Lỗi!',
                                        'Dữ liệu đã tồn tại',
                                        'error'
                                    );
                                }
                            }).catch(error => {
                            console.error('Error:', error);
                            Swal.fire(
                                'Lỗi!',
                                'Dữ liệu đã tồn tại',
                                'error'
                            );
                        });
                    }
                });
            } else {
                console.log("validate failed");
            }
        });
    });


    btnAddMS.addEventListener('click', function (e) {
        e.preventDefault();
        console.log("test check btn");
        console.log("id spct local: ", idSPCTLocal);
        let trangThaiModalAdd = 0;
        // if (trangThaiModalAddRaw.checked == true) {
        //     trangThaiModalAdd = 1;
        // } else {
        //     trangThaiModalAdd = 0;
        // }
        console.log("test ms :", tenModalHotAddMS.value);
        console.log("test validate null: ", validateNull(tenModalHotAddMS.value));
        if (!validateNull(tenModalHotAddMS.value)) {
            Swal.fire({
                title: 'Xác nhận?',
                text: "Dữ liệu sẽ được lưu lại!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ok!',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    const data = {
                        ten: tenModalHotAddMS.value,
                        trangThai: "1"
                    };
                    console.log("data json: ", data);
                    fetch(`/mau-sac/save`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(data)
                    }).then(() => {
                        Swal.fire(
                            'Đã lưu thành công!',
                            'Dữ liệu đã được ghi nhận.',
                            'success'
                        ).then(() => {
                            loadCboMauSac();
                            loadDSSPCT(currentPage);
                        });
                    });
                }
            });
        } else {

        }
    });

    btnAddKT.addEventListener('click', function (e) {
        e.preventDefault();
        console.log("test check btn");
        console.log("id spct local: ", idSPCTLocal);
        let trangThaiModalAdd = 0;
        // if (trangThaiModalAddRaw.checked == true) {
        //     trangThaiModalAdd = 1;
        // } else {
        //     trangThaiModalAdd = 0;
        // }
        if (!validateNull(tenModalHotAddKT.value)) {
            Swal.fire({
                title: 'Xác nhận?',
                text: "Dữ liệu sẽ được lưu lại!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ok!',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    const data = {
                        ten: tenModalHotAddKT.value,
                        trangThai: "1"
                    };
                    console.log("data json: ", data);
                    fetch(`/kich-thuoc/save`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(data)
                    }).then(() => {
                        Swal.fire(
                            'Đã lưu thành công!',
                            'Dữ liệu đã được ghi nhận.',
                            'success'
                        ).then(() => {
                            loadCboKichThuoc();
                            loadDSSPCT(currentPage);
                        });
                    });
                }
            });
        } else {

        }
    });

    btnAddCL.addEventListener('click', function (e) {
        e.preventDefault();
        console.log("test check btn");
        console.log("id spct local: ", idSPCTLocal);
        let trangThaiModalAdd = 0;
        // if (trangThaiModalAddRaw.checked == true) {
        //     trangThaiModalAdd = 1;
        // } else {
        //     trangThaiModalAdd = 0;
        // }
        if (!validateNull(tenModalHotAddCL.value)) {
            Swal.fire({
                title: 'Xác nhận?',
                text: "Dữ liệu sẽ được lưu lại!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ok!',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    const data = {
                        ten: tenModalHotAddCL.value,
                        trangThai: "1"
                    };
                    console.log("data json: ", data);
                    fetch(`/chat-lieu/save`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(data)
                    }).then(() => {
                        Swal.fire(
                            'Đã lưu thành công!!',
                            'Dữ liệu đã được ghi nhận.',
                            'success'
                        ).then(() => {
                            loadCboChatLieu();
                            loadDSSPCT(currentPage);
                        });
                    });
                }
            });
        } else {

        }
    });

    btnAddKTA.addEventListener('click', function (e) {
        e.preventDefault();
        console.log("test check btn");
        console.log("id spct local: ", idSPCTLocal);
        let trangThaiModalAdd = 0;
        // if (trangThaiModalAddRaw.checked == true) {
        //     trangThaiModalAdd = 1;
        // } else {
        //     trangThaiModalAdd = 0;
        // }
        if (!validateNull(tenModalHotAddKTA.value)) {
            Swal.fire({
                title: 'Xác nhận?',
                text: "Dữ liệu sẽ được lưu lại!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ok!',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    const data = {
                        ten: tenModalHotAddKTA.value,
                        trangThai: "1"
                    };
                    console.log("data json: ", data);
                    fetch(`/kieu-tay/save`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(data)
                    }).then(() => {
                        Swal.fire(
                            'Đã lưu thành công!',
                            'Dữ liệu đã được ghi nhận.',
                            'success'
                        ).then(() => {
                            loadCboKieuTay();
                            loadDSSPCT(currentPage);
                        });
                    });
                }
            });
        } else {

        }
    });

    $(document).on('click', "input[id^='trangThaiAtTbl_']", e => {
        e.preventDefault;
        const spctid = e.currentTarget.id.replace("trangThaiAtTbl_", "");
        console.log("test spctid:" + spctid);
        console.log("test button id: " + document.getElementById(e.currentTarget.id).checked);
    });

    function validateNull(param) {
        if (param === "" || param === undefined) {
            return true;
        } else {
            return false;
        }
    }

    function validateModalEdit() {
        let checkCount = 0;
        var cboMauSacModalEditErr = document.getElementById("cboMauSacModalEditErr");
        var cboKichThuocModalEditErr = document.getElementById("cboKichThuocModalEditErr");
        var cboChatLieuModalEditErr = document.getElementById("cboChatLieuModalEditErr");
        var cboKieuTayModalEditErr = document.getElementById("cboKieuTayModalEditErr");
        var soLuongModalEditErr = document.getElementById("soLuongModalEditErr");
        var giaNhapModalEditErr = document.getElementById("giaNhapModalEditErr");
        var giaBanModalEditErr = document.getElementById("giaBanModalEditErr");
        console.log("so luong test:", soLuongModalEdit.value);
        console.log("so luong test:", giaBanModalEdit.value);
        console.log("so luong test:", giaNhapModalEdit.value);

        if (idMauSacModalEdit == "") {
            cboMauSacModalEditErr.textContent = "Vui lòng chọn màu sắc ";
            checkCount = 0;
        } else {
            cboMauSacModalEditErr.textContent = "";
            checkCount++;
        }
        if (idKichThuocModalEdit == "") {
            cboKichThuocModalEditErr.textContent = "Vui lòng chọn kích thước";
            checkCount = 0
        } else {
            cboKichThuocModalEditErr.textContent = "";
            checkCount++;
        }
        if (idChatLieuModalEdit == "") {
            cboChatLieuModalEditErr.textContent = "Vui lòng chọn chất liệu";
            checkCount = 0;
        } else {
            cboChatLieuModalEditErr.textContent = "";
            checkCount++;
        }
        if (idKieuTayModalEdit == "") {
            cboKieuTayModalEditErr.textContent = "Vui lòng chọn kiểu tay";
            checkCount = 0;
        } else {
            cboKieuTayModalEditErr.textContent = "";
            checkCount++;
        }
        if (validateNull(soLuongModalEdit.value)) {
            soLuongModalEditErr.textContent = "Vui lòng nhập số lượng";
            checkCount = 0;
        } else {
            if (soLuongModalEdit.value <= 0) {
                soLuongModalEditErr.textContent = "Số lượng phải lơn hơn 0";
                checkCount = 0
            } else {
                soLuongModalEditErr.textContent = "";
                checkCount++;
            }
        }
        if (validateNull(giaNhapModalEdit.value)) {
            giaNhapModalEditErr.textContent = "Vui lòng nhập giá nhập";
            checkCount = 0;
        } else {
            if (giaNhapModalEdit.value <= 0) {
                giaNhapModalEditErr.textContent = "Giá nhập phải lớn hơn 0";
                checkCount = 0;
            } else {
                giaNhapModalEditErr.textContent = "";
                checkCount++;
            }
        }
        if (validateNull(giaBanModalEdit.value)) {
            giaBanModalEditErr.textContent = "Vui lòng nhập giá bán";
            checkCount = 0;
        } else {
            if (giaBanModalEdit.value <= 0) {
                giaBanModalEditErr.textContent = "Giá bán phải lớn hơn 0";
                checkCount = 0;
            } else {
                giaBanModalEditErr.textContent = "";
                checkCount++;
            }
        }
        console.log("check count: ", checkCount);
        return checkCount;
    }

    function validateModalAdd() {
        let checkCount = 0;
        var cboMauSacModalAddErr = document.getElementById("cboMauSacModalAddErr");
        var cboKichThuocModalAddErr = document.getElementById("cboKichThuocModalAddErr");
        var cboChatLieuModalAddErr = document.getElementById("cboChatLieuModalAddErr");
        var cboKieuTayModalAddErr = document.getElementById("cboKieuTayModalAddErr");
        var soLuongModalAddErr = document.getElementById("soLuongModalAddErr");
        var giaNhapModalAddErr = document.getElementById("giaNhapModalAddErr");
        var giaBanModalAddErr = document.getElementById("giaBanModalAddErr");
        console.log("so luong test:", soLuongModalAdd.value);
        console.log("so luong test:", giaBanModalAdd.value);
        console.log("so luong test:", giaNhapModalAdd.value);

        if (idMauSacModalAdd == "") {
            cboMauSacModalAddErr.textContent = "Vui lòng chọn màu sắc ";
            checkCount = 0;
        } else {
            cboMauSacModalAddErr.textContent = "";
            checkCount++;
        }
        if (idKichThuocModalAdd == "") {
            cboKichThuocModalAddErr.textContent = "Vui lòng chọn kích thước";
            checkCount = 0
        } else {
            cboKichThuocModalAddErr.textContent = "";
            checkCount++;
        }
        if (validateNull(soLuongModalAdd.value)) {
            soLuongModalAddErr.textContent = "Vui lòng nhập số lượng";
            checkCount = 0;
        } else {
            if (soLuongModalAdd.value <= 0) {
                soLuongModalAddErr.textContent = "Số lượng phải lơn hơn 0";
                checkCount = 0
            } else {
                soLuongModalAddErr.textContent = "";
                checkCount++;
            }
        }
        if (validateNull(giaNhapModalAdd.value)) {
            giaNhapModalAddErr.textContent = "Vui lòng nhập giá nhập";
            checkCount = 0;
        } else {
            if (giaNhapModalAdd.value <= 0) {
                giaNhapModalAddErr.textContent = "Giá nhập phải lớn hơn 0";
                checkCount = 0;
            } else {
                giaNhapModalAddErr.textContent = "";
                checkCount++;
            }
        }
        if (validateNull(giaBanModalAdd.value)) {
            giaBanModalAddErr.textContent = "Vui lòng nhập giá bán";
            checkCount = 0;
        } else {
            if (giaBanModalAdd.value <= 0) {
                giaBanModalAddErr.textContent = "Giá bán phải lớn hơn 0";
                checkCount = 0;
            } else {
                giaBanModalAddErr.textContent = "";
                checkCount++;
            }
        }
        console.log("check count: ", checkCount);
        return checkCount;
    }

    function getFileName(fullPath) {
        // Check for the last occurrence of the backslash or forward slash
        var startIndex = Math.max(fullPath.lastIndexOf('\\'), fullPath.lastIndexOf('/'));
        // Extract the file name
        var fileName = fullPath.substring(startIndex + 1);
        return fileName;
    }

    saveEditBtn.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            console.log("test check btn");
            console.log("id spct local: ", idSPCTLocal);
            let trangThaiModalEdit = 0;
            if (trangThaiModalEditRaw.checked == true) {
                trangThaiModalEdit = 1;
            } else {
                trangThaiModalEdit = 0;
            }
            if (validateModalEdit() == 7) {
                Swal.fire({
                    title: 'Xác nhận?',
                    text: "Dữ liệu sẽ được lưu lại!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ok!',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        const data = {
                            idMauSac: idMauSacModalEdit,
                            idKichThuoc: idKichThuocModalEdit,
                            idChatLieu: idChatLieuModalEdit,
                            idKieuTay: idKieuTayModalEdit,
                            moTa: ghiChuModalEdit ? ghiChuModalEdit.value : null,
                            soLuong: soLuongModalEdit.value,
                            giaNhap: giaNhapModalEdit.value,
                            giaBan: giaBanModalEdit.value,
                            trangThai: trangThaiModalEdit
                        };
                        const dataHinhAnh = {
                            hinhAnh1: !(fileHinhAnh1ModalEdit.value == "") ? getFileName(fileHinhAnh1ModalEdit.value) : getFileName(fileHinhAnh1ModalEdit.src),
                            hinhAnh2: !(fileHinhAnh2ModalEdit.value == "") ? getFileName(fileHinhAnh2ModalEdit.value) : getFileName(fileHinhAnh1ModalEdit.src),
                            hinhAnh3: !(fileHinhAnh3ModalEdit.value == "") ? getFileName(fileHinhAnh3ModalEdit.value) : getFileName(fileHinhAnh3ModalEdit.src),
                            trangThai: "1"
                        }
                        console.log("data hinh anh: ", dataHinhAnh);
                        console.log("data json: ", data);
                        console.log("data params file: ", formData);
                        fetch(`/chi-tiet-sp/update/` + idSPCTLocal, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(data)
                        }).then(() => {
                            Swal.fire(
                                'Đã lưu thành công!',
                                'Dữ liệu đã được ghi nhận.',
                                'success'
                            ).then(() => {
                                loadDSSPCT(currentPage);
                            });
                        });
                        fetch(`/hinh-anh/update-byidctsp/` + idSPCTLocal, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(dataHinhAnh)
                        }).then(() => {
                            Swal.fire(
                                'Đã lưu thành công!',
                                'Dữ liệu đã được ghi nhận.',
                                'success'
                            ).then(() => {
                            });
                        });
                        var formData = new FormData($('#uploadFormEdit')[0]);
                        $.ajax({
                            url: '/uploads',
                            type: 'POST',
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function (response) {
                                console.log("save image success ");
                            },
                            error: function (xhr, status, error) {
                                console.log("save image =error");
                            }
                        });
                    }
                });
            } else {

            }
        });
    });

    //continue
    saveEditAllBtn.addEventListener('click', function (e) {
        e.preventDefault();
        console.log("test check btn");
        console.log("id spct local: ", idSPCTLocal);
        console.log("=============================================t=====est display switch: ", document.getElementById("trangThaiContainer").style.display);
        let trangThaiValue = "";
        if (document.getElementById("trangThaiContainer").style.display === "none") {
            console.log("=============================================test display switch: ");
            trangThaiValue = "";
        } else {
            if (trangThaiModalEditAll.checked) {
                trangThaiValue = 1;
            } else if (!trangThaiModalEditAll.checked) {
                trangThaiValue = 0;
            }
        }
        if (1 > 0) {
            Swal.fire({
                title: 'Xác nhận?',
                text: "Dữ liệu sẽ được lưu lại!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ok!',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    const data = {
                        moTa: moTaModalEditAll ? moTaModalEditAll.value : "",
                        soLuong: soLuongModalEditAll ? soLuongModalEditAll.value : "",
                        giaNhap: giaNhapModalEditAll ? giaNhapModalEditAll.value : "",
                        giaBan: giaBanModalEditAll ? giaBanModalEditAll.value : "",
                        trangThai: trangThaiValue,
                        hinhAnh1: !(fileHinhAnh1ModalEditAll.value == "") ? getFileName(fileHinhAnh1ModalEditAll.value) : getFileName(fileHinhAnh1ModalEditAll.src),
                        hinhAnh2: !(fileHinhAnh2ModalEditAll.value == "") ? getFileName(fileHinhAnh2ModalEditAll.value) : getFileName(fileHinhAnh1ModalEditAll.src),
                        hinhAnh3: !(fileHinhAnh3ModalEditAll.value == "") ? getFileName(fileHinhAnh3ModalEditAll.value) : getFileName(fileHinhAnh3ModalEditAll.src),
                    };
                    console.log("data json: ", data);
                    console.log("id mau sac holder:", idMauSacHolder);
                    console.log("data params file: ", formData);
                    fetch(`/chi-tiet-sp/update-dynamic` + "?idSanPham=" + pathVariable + "&idMauSac=" + idMauSacHolder + "&moTa=" + data.moTa + "&soLuong=" + data.soLuong + "&giaNhap=" + data.giaNhap + "&giaBan=" + data.giaBan + "&trangThai=" + data.trangThai + "&hinhAnh1=" + data.hinhAnh1 + "&hinhAnh2=" + data.hinhAnh2 + "&hinhAnh3=" + data.hinhAnh3, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }).then(() => {
                        Swal.fire(
                            'Đã lưu thành công!',
                            'Dữ liệu đã được ghi nhận.',
                            'success'
                        ).then(() => {
                            loadDSSPCT(currentPage);
                        });
                    });
                    if (fileHinhAnh1ModalEditAll.value != "" || fileHinhAnh2ModalEditAll != "" || fileHinhAnh3ModalEditAll.value != "") {
                        var formData = new FormData($('#uploadFormEditAll')[0]);
                        $.ajax({
                            url: '/uploads',
                            type: 'POST',
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function (response) {
                                console.log("save image success ");
                            },
                            error: function (xhr, status, error) {
                                console.log("save image =error");
                            }
                        });
                    }
                }
            });
        } else {
        }
    });

</script>
<%--handle range slider--%>
<script>
    // Giả sử sliderConfig được lấy từ controller
    let minGiaBanSearch = "";
    let maxGiaBanSearch = "";
    let minValue = "";
    let maxValue = "";
    var rangeOne = document.querySelector('input[name="rangeOne"]');
    var rangeTwo = document.querySelector('input[name="rangeTwo"]');
    var outputOne = document.querySelector('.outputOne');
    var outputTwo = document.querySelector('.outputTwo');
    var inclRange = document.querySelector('.incl-range');
    const sliderConfig = {
        min: "",
        max: ""
    };

    fetch("/san-pham/min-max-price?idSP=" + pathVariable, {
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }
    })
        .then(response => response.json())
        .then(resp => {
            if (Array.isArray(resp) && resp.length === 2) {
                if (resp[1] > resp[0]) {
                    sliderConfig.min = resp[0];
                    sliderConfig.max = resp[1];
                    rangeOne.min = sliderConfig.min;
                    rangeOne.max = sliderConfig.max;
                    rangeTwo.min = sliderConfig.min;
                    rangeTwo.max = sliderConfig.max;
                    rangeOne.value = sliderConfig.min;
                    rangeTwo.value = sliderConfig.max;
                } else {
                    sliderConfig.min = 0;
                    sliderConfig.max = resp[1];
                    rangeOne.min = sliderConfig.min;
                    rangeOne.max = sliderConfig.max;
                    rangeTwo.min = sliderConfig.min;
                    rangeTwo.max = sliderConfig.max;
                    rangeOne.value = sliderConfig.min;
                    rangeTwo.value = sliderConfig.max;
                }
                updateView();
                syncSliders();
            } else {
                console.error('Unexpected response format:', resp);
            }
        })
        .catch(error => {
            console.error('Error fetching min-max price data:', error);
            // Handle fetch error, possibly show an alert or retry
        });

    // Gán giá trị min và max cho các slider
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
        console.log("min value : ", minGiaBanSearch);
        console.log("max value : ", maxGiaBanSearch);
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
        minGiaBanSearch = rangeOne.value;
        maxGiaBanSearch = rangeTwo.value;
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


<script>
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
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const soLuongInput = document.getElementById('soLuongModalEditAll');
        const giaNhapInput = document.getElementById('giaNhapModalEditAll');
        const giaBanInput = document.getElementById('giaBanModalEditAll');

        function preventInvalidInput(input) {
            input.addEventListener('keydown', function (e) {
                // Prevent the `-` and `0` keys from being pressed at the beginning
                if ((e.key === '-' || e.key === '0') && input.value.length === 0) {
                    e.preventDefault();
                }
            });

            // Optional: Prevent the user from pasting invalid values
            input.addEventListener('paste', function (e) {
                const pasteData = e.clipboardData.getData('text');
                if (pasteData.startsWith('-') || pasteData.startsWith('0')) {
                    e.preventDefault();
                }
            });

            // Prevent invalid numbers on input change
            input.addEventListener('input', function () {
                if (input.value.startsWith('-') || input.value.startsWith('0')) {
                    input.value = input.value.replace(/^-|^0+/, '');
                }
                if (input.value < 0) {
                    input.value = Math.abs(input.value);
                }
            });
        }

        preventInvalidInput(soLuongInput);
        preventInvalidInput(giaNhapInput);
        preventInvalidInput(giaBanInput);
    });


</script>




</html>