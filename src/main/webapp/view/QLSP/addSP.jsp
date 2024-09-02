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
            <a class="nav-link" href="/ban-hang-tai-quay/admin/ban-tai-quay">
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
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">${nv.hoTen}</span>
                            <img class="img-profile rounded-circle"
                                 src="/imageUser/${nv.anhDaiDien}">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="/store/tai-khoan-cua-toi">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Tài khoản của tôi
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/store/dang-xuat" id="dang-xuat" data-toggle="modal"
                               data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Đăng xuất
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>


            <!-- Bán hàng tại quầy -->
            <div class="container-fluid bg-white">
                <div class="">
                    <div class="row">
                        <h3 class="">Thêm nhiều sản phẩm & sản phẩm chi tiết</h3>
                    </div>
                    <div class="" style="overflow-y: auto; height: 80vh;">
                        <div class="mb-3">
                            <div class="row" style="gap: 10px;">
                                <div class="col col-md-12">
                                    <div class="d-flex" style="gap: 10px;">
                                        <p style="width: 80px;">Tên SP:</p>
                                        <input type="text" id="tensp"
                                               class="w-full p-2  rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                               placeholder="Nhập tên sản phẩm">
                                    </div>
                                </div>

                                <div class="d-flex gap-5">
                                    <div class="d-flex" style="width: fit-content">
                                        <p class="mt-2" style="width: 80px;">Chất liệu: </p>
                                        <div class="icon-container">
                                            <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                               data-bs-target="#ModalHotAddCL" id="iconHotAddChatLieu"
                                               style="font-size: 25px"></i>
                                        </div>
                                        <div class="d-flex" id="chatLieuBox">
                                            <div class="dropdown">
                                                <button class="btn btn-outline-secondary dropdown-toggle"
                                                        type="button"
                                                        id="lblChatLieuAdd" style="width: 150px;"
                                                        data-bs-toggle="dropdown"
                                                        aria-expanded="false">
                                                    Chọn chất liệu
                                                </button>
                                                <ul class="dropdown-menu" id="cboChatLieuAdd"
                                                    aria-labelledby="dropdownMenuButton4">
                                                </ul>
                                                <p style="color: red;" id="cboChatLieuAddErr"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex " style="width: fit-content">
                                        <p class="mt-2" style="width: 80px;">Kiểu tay: </p>
                                        <div class="d-flex gap-2" id="kieuTayBox">
                                            <div class="icon-container">
                                                <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                                   data-bs-target="#ModalHotAddKTA"
                                                   id="iconHotAddKieuTay"
                                                   style="font-size: 25px"></i>
                                            </div>
                                            <div class="dropdown">
                                                <button class="btn btn-outline-secondary dropdown-toggle"
                                                        type="button"
                                                        id="lblKieuTayAdd" style="width: 150px;"
                                                        data-bs-toggle="dropdown"
                                                        aria-expanded="false">
                                                    Chọn kiểu tay
                                                </button>
                                                <ul class="dropdown-menu" id="cboKieuTayAdd"
                                                    aria-labelledby="dropdownMenuButton5">
                                                </ul>
                                                <p style="color: red;" id="cboKieuTayAddErr"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col col-md-6">

                                </div>

                                <div class="col col-md-12">
                                    <div class="d-flex">
                                        <p class="mt-2" style="width: 80px;">Màu sắc: </p>
                                        <div class="icon-container">
                                            <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                               data-bs-target="#ModalHotAddMS" id="iconHotAddMauSac"
                                               style="font-size: 25px"></i>
                                        </div>
                                        <div class="d-flex flex-wrap gap-2" id="mauSacBox">

                                        </div>
                                        <div class="icon-container">
                                            <i class=" bi bi-plus col-3" id="iconAddMoreCboMauSac"
                                               style="font-size: 25px"></i>
                                        </div>
                                        <div class="icon-container">
                                            <i class=" bi bi-dash col-3" id="iconRemoveMoreCboMauSac"
                                               style="font-size: 25px"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="col col-md-12">
                                    <div class="d-flex">
                                        <p class="mt-2" style="width: 80px;">Kích thước: </p>
                                        <div class="icon-container">
                                            <i class=" bi bi-folder-plus col-3" data-bs-toggle="modal"
                                               data-bs-target="#ModalHotAddKT"
                                               id="iconHotAddKichThuoc"
                                               style="font-size: 25px"></i>
                                        </div>
                                        <div class="d-flex flex-wrap gap-2" id="kichThuocBox">

                                        </div>
                                        <div class="icon-container">
                                            <i class=" bi bi-plus col-3" id="iconAddMoreCboKichThuoc"
                                               style="font-size: 25px"></i>
                                        </div>
                                        <div class="icon-container">
                                            <i class=" bi bi-dash col-3" id="iconRemoveMoreCboKichThuoc"
                                               style="font-size: 25px"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <table class="table table-hover mt-3">
                                    <thead>
                                    <tr>
                                        <th style="font-size: 12px;">STT</th>
                                        <th style="font-size: 12px;">Màu sắc</th>
                                        <th style="font-size: 12px;">Kích thước</th>
                                        <th style="font-size: 12px;">Chất liệu</th>
                                        <th style="font-size: 12px;">Kiểu tay</th>
                                        <th style="font-size: 12px;">Số lượng</th>
                                        <th style="font-size: 12px;">Giá bán</th>
                                        <th style="font-size: 12px;">Trạng thái</th>
                                        <th style="font-size: 12px;">Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbl_ds_spctAdd">

                                    </tbody>
                                </table>
                            </div>
                            <button id="saveAddBtn" class="btn btn-primary me-5">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-row-reverse">
                <button id="btnAdd" class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#ModalAdd">Thêm
                    nhanh
                </button>
            </div>
            <div class="d-flex flex-row-reverse">
                <button onclick="testDataMaping(event)" class="btn btn-success me-2">test</button>
            </div>
            <div class="d-flex flex-row-reverse">
                <button id="btnAddEncap" class="btn btn-success me-2">Thêm sản phẩm</button>
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

        <!-- ModalSPEdit-->
        <div class="modal fade" id="ModalEdit" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h3 class="modal-title" id="exampleModalLabel4">Chỉnh sửa sản phẩm</h3>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex gap-5">
                        <div class="border">
                            <img id="hinhAnhEditDisplay" width="200" height="200" alt="">
                        </div>
                        <div>
                            <form id="uploadFormEdit" method="post" enctype="multipart/form-data" action="/upload">
                                <div class="mb-3">
                                    <label for="tenSPEdit" class="form-label">Tên sản phẩm</label>
                                    <input type="text" class="form-control" id="tenSPEdit" aria-describedby="emailHelp"
                                           value="">
                                    <p style="color: red;" id="tenSPEditErr"></p>
                                </div>
                                <div class="mb-3">
                                    <label for="hinhAnhEdit" class="form-label">Hình ảnh</label>
                                    <input type="file" name="file" class="form-control" id="hinhAnhEdit" value="">
                                    <p style="color: red;" id="hinhAnhEditErr"></p>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch" id="trangThaiEdit"
                                           checked>
                                    <label class="form-check-label" for="trangThaiEdit" id="trangThaiLabeledit">Trạng
                                        thái</label>
                                </div>
                                <button id="saveEditBtn" type="submit" class="btn btn-primary">Lưu</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--End modal --%>
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

    // change sttlbl addl
    const inputElementadd = document.getElementById("trangThaiAdd");
    const labelElementadd = document.getElementById("trangThaiLabeladd");

    function updateLabeladd() {
        if (inputElementadd.checked) {
            labelElementadd.textContent = "Đang hoạt động";
        } else {
            labelElementadd.textContent = "Dừng hoạt động";
        }
    }

    inputElementadd.addEventListener("change", updateLabeladd);
    updateLabeladd();
    // change sttlbl edit
    const inputElementedit = document.getElementById("trangThaiEdit");
    const labelElementedit = document.getElementById("trangThaiLabeledit");

    function updateLabeledit() {
        if (inputElementedit.checked) {
            labelElementedit.textContent = "Đang hoạt động";
        } else {
            labelElementedit.textContent = "Dừng hoạt động";
        }
    }

    inputElementedit.addEventListener("change", updateLabeledit);
    //end change sttlbl edit
    updateLabeledit();
    document.querySelectorAll('.delete-button2').forEach(button => {
        button.addEventListener('click', function () {
            const form = this.closest('.delete-form');
            Swal.fire({
                title: 'Bạn có muốn hủy không??',
                text: "Dữ liệu này sẽ được lưu trữ lại để đối chiếu!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Đồng ý'
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            });
        });
    });
    <%--    --%>
</script>
<%--pooldata--%>
<script>
     let spct ={
         idSp:"",
         idMauSac:"",
         idKichThuoc:"",
         idChatLieu:"",
         idKieuTay:"",
         moTa:"",
         soLuong:"",
         giaNhap:"",
         giaBan:"",
         trangThai:""
     };
     let dataPending = [];

</script>
<%--endPool--%>
<%--loadingcbo--%>
<script>
    const lblMauSacAdd = document.getElementById("lblMauSacAdd");
    const lblKichThuocAdd = document.getElementById("lblKichThuocAdd");
    const lblChatLieuAdd = document.getElementById("lblChatLieuAdd");
    const lblKieuTayAdd = document.getElementById("lblKieuTayAdd");
    const iconAddMoreCboMauSac = document.getElementById("iconAddMoreCboMauSac");
    const iconAddMoreCboKichThuoc = document.getElementById("iconAddMoreCboKichThuoc");
    const iconRemoveMoreCboMauSac = document.getElementById("iconRemoveMoreCboMauSac");
    const iconRemoveMoreCboKichThuoc = document.getElementById("iconRemoveMoreCboKichThuoc");
    let idMauSacAdd = "";
    let idKichThuocAdd = "";
    let idChatLieuAdd = "";
    let idKieuTayAdd = "";
    let howManyCboMauSac = 1;
    let howManyCboKichThuoc = 1;
    let howManyCboMauSacMemo = 0;
    let howManyCboKichThuocMemo = 0;
    function refresh(e) {
        e.preventDefault();
        idMauSacAdd = "";
        idKichThuocAdd = "";
        idChatLieuAdd = "";
        idKieuTayAdd = "";
        document.getElementById("lblMauSacAdd").textContent = "Chọn màu sắc";
        document.getElementById("lblKichThuocAdd").textContent = "Chọn kích thước";
        lblChatLieuAdd.textContent = "Chọn chất liệu";
        lblKieuTayAdd.textContent = "Chọn kiểu tay";
        loadDSSPCT(currentPage);
    }

    function setMauSacAdd(msString, indx) {
        const ms = JSON.parse(msString.replace(/&quot;/g, '"'));
        idMauSacAdd = ms.id;
        document.getElementById("lblMauSacAdd"+indx).textContent = ms.ten;
        console.log('Selected mau sac ID:', idMauSacAdd);
        console.log('data set index: ', indx);
        // You can add more logic here to handle the selected value
    }

    function setKichThuocAdd(ktString, indx) {
        const kt = JSON.parse(ktString.replace(/&quot;/g, '"'));
        idKichThuocAdd = kt.id;
        document.getElementById("lblKichThuocAdd"+indx).textContent = kt.ten;
        console.log('Selected kich thuoc ID:', idKichThuocAdd);
        console.log("test data set:", indx);
        // You can add more logic here to handle the selected value
    }

    function setChatLieuAdd(clString) {
        const cl = JSON.parse(clString.replace(/&quot;/g, '"'));
        idChatLieuAdd = cl.id;
        lblChatLieuAdd.textContent = cl.ten;
        console.log('Selected chat lieu ID:', idChatLieu);
        //loadpool
        // You can add more logic here to handle the selected value
    }

    function setKieuTayAdd(ktString) {
        const kt = JSON.parse(ktString.replace(/&quot;/g, '"'));
        idKieuTayAdd = kt.id;
        lblKieuTayAdd.textContent = kt.ten;
        console.log('Selected kieu tay ID modal:', idKieuTay);
        //concathtml here
        // You can add more logic here to handle the selected value
    }

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
                let htmlCboAdd = '';
                resp.map((cl, i) => {
                    const clString = JSON.stringify(cl).replace(/"/g, '&quot;');
                    // htmlSearch += '<li><a class="dropdown-item" onclick="setChatLieu(\'' + clString + '\')">' + cl.ten + '</a></li>';
                    htmlCboAdd += '<li><a class="dropdown-item" onclick="setChatLieuAdd(\'' + clString + '\')">' + cl.ten + '</a></li>';
                    // htmlCboModalEdit += '<li><a class="dropdown-item" onclick="setChatLieuModalEdit(\'' + clString + '\')">' + cl.ten + '</a></li>';
                });
                $("#cboChatLieuAdd").html(htmlCboAdd);
                // $("#cboChatLieuModalEdit").html(htmlCboModalEdit);
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
                let htmlCboAdd = '';
                resp.map((kt, i) => {
                    const kieuTayString = JSON.stringify(kt).replace(/"/g, '&quot;');
                    // htmlSearch += '<li><a class="dropdown-item"  onclick="setKieuTay(\'' + kieuTayString + '\')">' + kt.ten + '</a></li>';
                    // htmlCboEdit += '<li><a class="dropdown-item"  onclick="setKieuTayModalEdit(\'' + kieuTayString + '\')">' + kt.ten + '</a></li>';
                    htmlCboAdd += '<li><a class="dropdown-item"  onclick="setKieuTayAdd(\'' + kieuTayString + '\')">' + kt.ten + '</a></li>';
                });
                $("#cboKieuTayAdd").html(htmlCboAdd);
                // $("#cboKieuTayModalEdit").html(htmlCboModalEdit);
            });
    }
    loadCboKieuTay();

    const loadCboMauSac = () => {
        let datatest = "data testing";

        let data = [];
        fetch("/mau-sac/index", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let htmlSearch = '';
                let htmlCboModalEdit = '';
                let htmlSet = {indx: 0, html: ""};
                let htmlCboAdd = [];
                resp.map((ms, i) => {
                    const msString = JSON.stringify(ms).replace(/"/g, '&quot;');
                    // htmlSearch += '<li><a class="dropdown-item"  onclick="setMauSac(\'' + msString + '\')">' + ms.ten + '</a></li>';
                    // htmlCboModalEdit += '<li><a class="dropdown-item"  onclick="setMauSacModalEdit(\'' + msString + '\')">' + ms.ten + '</a></li>'
                    if (i == 0) {
                        console.log("just one time")
                        for (let a = 0; a < howManyCboMauSac; a++) {
                            console.log("test index: ", a);
                            htmlSet = {indx: 0, html: ""};
                            htmlSet.html = '<li><a class="dropdown-item"  onclick="setMauSacAdd(\'' + msString + '\', ' + a + ')">' + ms.ten + '</a></li>';
                            htmlSet.indx = a;
                            htmlCboAdd.push(htmlSet);
                            console.log("test array :", htmlCboAdd)
                        }
                    } else {
                        for (let b = 0; b < htmlCboAdd.length; b++) {
                            console.log("count loop: ", b);
                            htmlCboAdd[b].html += '<li><a class="dropdown-item" onclick="setMauSacAdd(\'' + msString + '\', ' + htmlCboAdd[b].indx + ')">' + ms.ten + '</a></li>';
                        }
                    }
                });
                // $("#cboMauSac").html(htmlSearch);
                for (let i = 0; i < htmlCboAdd.length; i++) {
                    console.log("test render mausac cbo");
                    $("#cboMauSacAdd" + i).html(htmlCboAdd.at(i).html);
                }
            }).catch(error => console.error('Error loading data:', error));
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
                let htmlSet = {indx: 0, html: ""};
                let htmlCboAdd = [];
                resp.map((kt, i) => {
                    const ktString = JSON.stringify(kt).replace(/"/g, '&quot;');
                    // htmlSearch += '<li><a class="dropdown-item" onclick="setKichThuoc(\'' + ktString + '\')">' + kt.ten + '</a></li>';
                    // htmlCboModalEdit += '<li><a class="dropdown-item" onclick="setKichThuocModalEdit(\'' + ktString + '\')">' + kt.ten + '</a></li>';
                    if (i == 0) {
                        console.log("just one time")
                        for (let a = 0; a < howManyCboKichThuoc; a++) {
                            console.log("test index: ", a);
                            htmlSet = {indx: 0, html: ""};
                            htmlSet.html = '<li><a class="dropdown-item" onclick="setKichThuocAdd(\'' + ktString + '\', ' + a + ')">' + kt.ten + '</a></li>';
                            htmlSet.indx = a;
                            htmlCboAdd.push(htmlSet);
                            console.log("test array :", htmlCboAdd)
                        }
                    } else {
                        for (let b = 0; b < htmlCboAdd.length; b++) {
                            console.log("count loop: ", b);
                            htmlCboAdd[b].html += '<li><a class="dropdown-item" onclick="setKichThuocAdd(\'' + ktString + '\', ' + htmlCboAdd[b].indx + ')">' + kt.ten + '</a></li>';
                        }
                    }
                });
                // $("#cboKichThuocModalEdit").html(htmlCboModalEdit);
                for (let i = 0; i < htmlCboAdd.length; i++) {
                    $("#cboKichThuocAdd" + i).html(htmlCboAdd.at(i).html);
                }
            });
    }
    loadCboKichThuoc();

    const loadTotalCboMauSac = () => {
        const htmlDropdown = document.getElementById("mauSacBox");
        let newHtmlContent = '';
        for (let i = howManyCboMauSacMemo; i < howManyCboMauSac; i++) {
            newHtmlContent += '<div class="dropdown">' +
                '<button class="btn btn-outline-secondary dropdown-toggle" ' +
                'type="button" ' +
                'id="lblMauSacAdd' + i + '" style="width: 150px;" ' +
                'data-bs-toggle="dropdown" ' +
                'aria-expanded="false">' +
                'Chọn màu sắc' +
                '</button>' +
                '<ul class="dropdown-menu" id="cboMauSacAdd' + i + '" ' +
                'aria-labelledby="dropdownMenuButton2">' +
                '</ul>' +
                '<p style="color: red;" id="cboMauSacAddErr' + i + '"></p>' +
                '</div>';
        }
        howManyCboMauSacMemo = howManyCboMauSac;
        htmlDropdown.insertAdjacentHTML('beforeend',newHtmlContent);
    }
    loadTotalCboMauSac();

    const loadTotalCboKichThuoc = () => {
        const htmlDropdown = document.getElementById("kichThuocBox");
        let newHtmlContent = '';  // Temporary variable to hold new HTML content
        for (let i = howManyCboKichThuocMemo; i < howManyCboKichThuoc; i++) {
            newHtmlContent += '<div class="dropdown">' +
                '<button class="btn btn-outline-secondary dropdown-toggle" ' +
                'type="button" ' +
                'id="lblKichThuocAdd' + i + '" style="width: 150px;" ' +
                'data-bs-toggle="dropdown" ' +
                'aria-expanded="false">' +
                'Chọn kích thước' +
                '</button>' +
                '<ul class="dropdown-menu" id="cboKichThuocAdd' + i + '" ' +
                'aria-labelledby="dropdownMenuButton2">' +
                '</ul>' +
                '<p style="color: red;" id="cboKichThuocAddErr' + i + '"></p>' +
                '</div>';
        }
        howManyCboKichThuocMemo = howManyCboKichThuoc;
        htmlDropdown.insertAdjacentHTML('beforeend', newHtmlContent); // Add the new HTML content
    };
    loadTotalCboKichThuoc();
    // iconAdd
    iconAddMoreCboMauSac.addEventListener('click', function (e) {
        e.preventDefault();
        console.log("icon add more");
        howManyCboMauSac++;
        loadTotalCboMauSac();
        loadCboMauSac();
    });
    iconAddMoreCboKichThuoc.addEventListener('click', function (e) {
        e.preventDefault();
        console.log("icon add more");
        howManyCboKichThuoc++;
        loadTotalCboKichThuoc();
        loadCboKichThuoc();
    });
    // iconRemove
    iconRemoveMoreCboMauSac.addEventListener('click', function (e) {
        e.preventDefault();
        const htmlDropdown = document.getElementById("mauSacBox");
        htmlDropdown.removeChild(htmlDropdown.lastChild);
        howManyCboMauSacMemo--;
        howManyCboMauSac--;
        loadCboMauSac();
    });
    iconRemoveMoreCboKichThuoc.addEventListener('click', function (e) {
        e.preventDefault();
        const htmlDropdown = document.getElementById("kichThuocBox");
        htmlDropdown.removeChild(htmlDropdown.lastChild);
        howManyCboKichThuocMemo--;
        howManyCboKichThuoc--;
        loadCboKichThuoc();
    });

</script>
<%--end loadingcbo--%>
<script>
    let idSPLocal = "";
    let currentPage = 1;
    let totalPage = 0;
    const loadDSSP = (pageParams) => {
        // get api + scpt.id
        let datatest = "data testing";
        fetch("/san-pham/index" + "?page=" + pageParams, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let html = '';
                resp.map((sp, i) => {
                    const maSanPham = sp.ma || 'N/A';
                    const tenSanPham = sp.ten || 'N/A';
                    const hinhAnh = sp.hinhAnh || 'N/A';
                    const ngayTao = sp.ngayTao || 'N/A';
                    const trangThai = sp.trangThai == 1 ? "Hoạt động" : "Dừng hđ";
                    html += '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td><img src="' + hinhAnh + '" alt="Image" class="img-fluid" /></td>' +
                        '<td>' + maSanPham + '</td>' +
                        '<td>' + tenSanPham + '</td>' +
                        '<td>' + ngayTao + '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<button id="editSPBtn_' + sp.id + '" class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#ModalEdit">Chỉnh sửa</button>' +
                        '<button id="detailSPBtn_' + sp.id + '" class="btn btn-danger">Chi tiết</button>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                $("#tbl_ds_sp").html(html)
            });
    }

    function testDataMapping() {

    }

    function setActive(element, page) {
        // Remove active class from all pagination items
        let items = document.querySelectorAll('.page-item');
        items.forEach(item => item.classList.remove('active'));
        element.parentElement.classList.add('active');
        currentPage = page;
        updateButtons();
        loadDSSP(currentPage);
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
            loadDSSP(currentPage);
            if (newIndex > 0 && newIndex < items.length - 1) {
                setActive(items[newIndex].querySelector('a'));
            }
        }
    }

    updateButtons();
    const loadTotalPagination = (currentPage) => {
        fetch("/san-pham/count", {
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
    loadDSSP(currentPage);
    loadTotalPagination(currentPage);
    let tenSpEdit = document.getElementById("tenSPEdit");
    let hinhAnhDisplay = document.getElementById("hinhAnhEditDisplay");
    let trangThaiEdit = document.getElementById("trangThaiEdit");
    $(document).on('click', "button[id^='editSPBtn_']", e => {
        e.preventDefault();
        const queryString = window.location.pathname;
        const pathParts = queryString.split('/');
        const pathVariable = pathParts[pathParts.length - 1];
        const spid = e.currentTarget.id.replace("editSPBtn_", "");
        idSPLocal = spid;
        fetch("/san-pham/detail/" + spid, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                tenSpEdit.value = resp.ten;
                console.log("test link image: " + resp.hinhAnh);
                hinhAnhDisplay.src = "/image/" + resp.hinhAnh;
                if (resp.trangThai == 1) {
                    trangThaiEdit.checked = true;
                    labelElementedit.textContent = "Đang hoạt động";
                } else {
                    trangThaiEdit.checked = false;
                    labelElementedit.textContent = "Dừng hoạt động";
                }
            });
    });

    $(document).on('click', "button[id^='detailSPBtn_']", e => {
        e.preventDefault();
        const queryString = window.location.pathname;
        const pathParts = queryString.split('/');
        const pathVariable = pathParts[pathParts.length - 1];
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
    const addBtn = document.querySelectorAll('#addBtn');
    const editSPBtn = document.querySelectorAll('#editSPBtn');
    const saveEditBtn = document.querySelectorAll('#saveEditBtn');
    const saveAddBtn = document.querySelectorAll('#saveAddBtn');
    addBtn.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            console.log("test check btn");
            var idHD = document.getElementsByName("idHD")[0].value;
            var idKH = document.getElementsByName("idKH")[0].value;
            var idKhuyenMai = document.getElementsByName("idKhuyenMai")[0].value;
            var tongTien = document.getElementsByName("tongTien")[0].value;
            var thongBao = document.getElementById("errTraLai");
            var moneyGiven = parseInt(document.getElementById("tienKhachDua").value);
            var thongBao = document.getElementById("errTraLai");
            console.log("====================== id hd:", idHD);
            console.log("====================== id kh:", idKH);
            console.log("====================== id khuyen mai:", idKhuyenMai);
            console.log("====================== tong tien:", tongTien);
            console.log("====================== money given:", moneyGiven);
            if (tongTien <= moneyGiven && !isNaN(tongTien)) {
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
                            idHD: idHD,
                            idKhuyenMai: idKhuyenMai,
                            idKH: idKH,
                            tongTien: tongTien
                        };
                        fetch(`/san-pham/save/`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(data)
                        }).then(() => {
                            Swal.fire(
                                'Đã thanh toán!',
                                'Dữ liệu đã được ghi nhận.',
                                'success'
                            ).then(() => {
                                window.location.href = '/ban-hang-tai-quay';
                            });
                            button.closest('tr').remove();
                        });
                        button.closest('tr').remove();
                        thongBao.textContent = "";
                    }
                });
            } else {
                thongBao.textContent = "Số tiền khách đưa phải lớn hơn hoặc bằng tổng tiền.";
            }
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
            var tenSP = document.getElementById('tenSPAdd').value;
            var hinhAnh = document.getElementById('hinhAnhAdd').value;
            var trangThairaw = document.getElementById('trangThaiAdd').checked;
            var tenSperr = document.getElementById("tenSPAddErr");
            var hinhAnhErr = document.getElementById("hinhAnhAddErr");
            let trangThai = 0;
            let sttCheck = 0;
            console.log("====================== ten sp:", tenSP);
            console.log("====================== hinh anh:", getFileName(hinhAnh));
            console.log("====================== trang thai:", trangThairaw);
            if (trangThairaw == true) {
                trangThai = 1;
            } else {
                trangThai = 0;
            }
            if (validateNull(tenSP)) {
                tenSperr.textContent = "Vui lòng nhập tên sản phẩm";
                sttCheck = 0;
            } else {
                tenSperr.textContent = "";
                sttCheck++;
            }
            if (validateNull(hinhAnh)) {
                hinhAnhErr.textContent = "Vui lòng chọn hình ảnh";
                sttCheck = 0;
            } else {
                hinhAnhErr.textContent = "";
                sttCheck++;
            }

            if (sttCheck == 2) {
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
                            ten: tenSP,
                            trangThai: trangThai,
                            hinhAnh: getFileName(hinhAnh)
                        };
                        var formData = new FormData($('#uploadFormAdd')[0]); // Use FormData to get all form data
                        // Handle file upload via AJAX

                        $.ajax({
                            url: '/upload',
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
                        fetch(`/san-pham/save`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(data)
                        }).then(() => {
                            Swal.fire(
                                'Đã thanh toán!',
                                'Dữ liệu đã được ghi nhận.',
                                'success'
                            ).then(() => {
                                fetch("/san-pham/count", {
                                    headers: {
                                        'Accept': 'application/json',
                                        'Content-Type': 'application/json'
                                    }
                                }).then(response => response.json())
                                    .then(resp => {
                                        loadDSSP(Math.ceil(resp / 20));
                                        currentPage = Math.ceil(resp / 20);
                                        loadTotalPagination(currentPage);
                                    }).catch(error => {
                                    console.error('Error fetching pagination data:', error);
                                    // Handle fetch error
                                });
                            });
                            button.closest('tr').remove();
                        });
                        button.closest('tr').remove();
                    }
                });
            } else {

            }
        });
    });

    function validateNull(param) {
        if (param === "" || param === undefined) {
            return true;
        } else {
            return false;
        }
    }

    saveEditBtn.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            console.log("test check btn");
            var tenSP = document.getElementById('tenSPEdit').value;
            var hinhAnh = document.getElementById('hinhAnhEdit').value;
            var trangThaiRaw = document.getElementById('trangThaiEdit').checked;
            var tenSperr = document.getElementById("tenSPEditErr");
            var hinhAnhErr = document.getElementById("hinhAnhEditErr");
            let trangThai = 0;
            let sttCheck = 0;
            console.log("====================== ten sp:", tenSP);
            console.log("====================== hinh anh:", hinhAnh);

            if (trangThaiRaw == true) {
                trangThai = 1;
            } else {
                trangThai = 0;
            }
            if (validateNull(tenSP)) {
                tenSperr.textContent = "Vui lòng nhập tên sản phẩm";
                sttCheck = 0;
            } else {
                tenSperr.textContent = "";
                sttCheck++;
            }
            if (validateNull(hinhAnh)) {
                hinhAnhErr.textContent = "Vui lòng chọn hình ảnh";
                sttCheck = 0;
            } else {
                hinhAnhErr.textContent = "";
                sttCheck++;
            }
            if (sttCheck == 2) {
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
                            ten: tenSP,
                            hinhAnh: getFileName(hinhAnh),
                            trangThai: trangThai
                        };
                        var formData = new FormData($('#uploadFormEdit')[0]); // Use FormData to get all form data
                        // Handle file upload via AJAX
                        console.log("form data: ", $('#uploadFormEdit')[0]);
                        $.ajax({
                            url: '/upload',
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
                        fetch(`/san-pham/update/` + idSPLocal, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(data)
                        }).then(() => {
                            Swal.fire(
                                'Đã thanh toán!',
                                'Dữ liệu đã được ghi nhận.',
                                'success'
                            ).then(() => {
                                loadDSSP(currentPage);
                            });
                        });
                    }
                });
            } else {
                thongBao.textContent = "Số tiền khách đưa phải lớn hơn hoặc bằng tổng tiền.";
            }
        });
    });

</script>
<script>
    $(document).ready(function () {
        $('#saveAddBtn').on('click', function (event) {

            // Optionally, submit the form normally after AJAX request (if needed)
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
</html>