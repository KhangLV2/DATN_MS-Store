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


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        .dropdown-menu.show {
            display: block;
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
                    <a class="nav-link" href="/admin/ban-hang-tai-quay/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-shop" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Bán hàng tại quầy</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item"  style="background: linear-gradient(45deg, black, transparent)">
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
                            <a class="collapse-item" href="/admin/quan-ly-mau-sac">Màu sắc</a>
                            <a class="collapse-item" href="/admin/quan-ly-kich-thuoc">Kích thước</a>
                            <a class="collapse-item" href="/admin/quan-ly-kieu-tay">Kiểu tay</a>
                            <a class="collapse-item" href="/admin/quan-ly-chat-lieu">Chất liệu</a>
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
                <li class="nav-item"  style="background: linear-gradient(45deg, black, transparent)">
                    <a class="nav-link" href="/admin/hoa-don/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-journal-text" style="color: white; margin-left: 2px"></i>
                        <span style="font-weight: bold; margin-left: 6px">Quản lý hóa đơn</span></a>
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
                <h1 class="h3 mb-3 text-gray-800">Quản Lý Hóa Đơn</h1>


                <!-- Bộ lộc và tìm kiếm-->
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex align-items-center">
                        <i class="bi bi-funnel mr-3"></i>
                        <h6 class="m-0 font-weight-bold">Bộ Lọc</h6>
                    </div>
                    <div class="card-body">
                        <form class="row g-3" method="get" action="/admin/hoa-don/hien-thi" id="searchForm" onsubmit="return validateDates()">
                            <div class="col-md-6">
                                <label for="searchKeyword" class="form-label">Tìm kiếm</label>
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small" id="searchKeyword" name="keyword"
                                           placeholder="Nhập mã hóa đơn hoặc SĐT khách hàng" value="${param.keyword}"
                                           aria-label="Search" aria-describedby="basic-addon2">
                                </div>
                                <div id="searchKeywordError" class="text-danger"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputLoaiHoaDon" class="form-label">Loại Hóa Đơn</label>
                                <select id="inputLoaiHoaDon" class="form-select" name="loaiHoaDon">
                                    <option value="-1" ${param.loaiHoaDon == -1 ? 'selected' : ''}>Tất cả</option>
                                    <option value="0" ${param.loaiHoaDon == 0 ? 'selected' : ''}>Bán tại quầy</option>
                                    <option value="1" ${param.loaiHoaDon == 1 ? 'selected' : ''}>Bán online</option>
                                </select>
                            </div>

                            <div class="col-md-6 mt-3">
                                <label for="startDate" class="form-label">Ngày bắt đầu</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" value="${param.startDate}">
                                <div id="startDateError" class="text-danger"></div>
                            </div>
                            <div class="col-md-6 mt-3">
                                <label for="endDate" class="form-label">Ngày kết thúc</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" value="${param.endDate}">
                                <div id="endDateError" class="text-danger"></div>
                            </div>
                            <div class="col-md-12 mt-3 d-flex justify-content-end">
                                <input type="hidden" id="page" name="page" value="${param.page != null ? param.page : '0'}">
                                <button type="submit" class="btn btn-primary mr-2">Tìm kiếm</button>
                                <a href="/admin/hoa-don/hien-thi">
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
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="z-index: 1000;">
                                        ${countAll}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link position-relative" id="confirmation-tab" data-bs-toggle="tab"
                                        data-bs-target="#confirmation" type="button" role="tab"
                                        aria-controls="confirmation" aria-selected="false" data-status="confirmation">
                                    Chờ Xác Nhận
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="z-index: 1000;">
                                        ${countChoXacNhan}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link" id="delivery-tab" data-bs-toggle="tab"
                                        data-bs-target="#delivery" type="button" role="tab" aria-controls="delivery"
                                        aria-selected="false" data-status="delivery">
                                    Chờ Giao Hàng
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="z-index: 1000;">
                                        ${countChoGiaoHang}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link" id="delivering-tab" data-bs-toggle="tab"
                                        data-bs-target="#delivering" type="button" role="tab" aria-controls="delivering"
                                        aria-selected="false" data-status="delivering">
                                    Đang Vận Chuyển
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="z-index: 1000;">
                                        ${countDangGiaoHang}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link" id="accomplished-tab" data-bs-toggle="tab"
                                        data-bs-target="#accomplished" type="button" role="tab"
                                        aria-controls="accomplished" aria-selected="false" data-status="accomplished">
                                    Hoàn Thành
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="z-index: 1000;">
                                        ${countDaHoanThanh}
                                    </span>
                                </button>
                            </li>
                            <li class="nav-item position-relative" role="presentation">
                                <button class="nav-link" id="cancelled-tab" data-bs-toggle="tab"
                                        data-bs-target="#cancelled" type="button" role="tab" aria-controls="cancelled"
                                        aria-selected="false" data-status="cancelled">
                                    Đã Hủy
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="z-index: 1000;">
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
                                    <c:set var="stt" value="1" />
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <c:if test="${(hoaDon.loaiHoaDon == 0 && hoaDon.trangThai == 6) || (hoaDon.loaiHoaDon == 1 && hoaDon.trangThai != 0)}">
                                            <tr>
                                                <td>${stt}</td>
                                                <c:set var="stt" value="${stt + 1}" />
                                                <td>${hoaDon.ma}</td>
                                                <td>${hoaDon.nhanVien.hoTen}</td>
                                                <td>${hoaDon.khachHang.hoTen == null ? "Khách lẻ" : hoaDon.khachHang.hoTen }</td>
                                                <td>${hoaDon.khachHang.sdt}</td>
                                                <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-success' : 'bg-primary'}">
                                                        ${hoaDon.loaiHoaDon == 0 ? "Bán tại quầy" : "Bán online"}
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
                                                    <a href="/admin/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
                                                        <i class="bi bi-eye-fill"></i>
                                                    </a>
                                                </td>

                                            </tr>
                                        </c:if>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <%-- Phân trang của tất cả các hóa đơn  --%>
                                <div class="float-end">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${pageHD.hasPrevious()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a></li>
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
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a></li>
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
                                    <c:set var="stt" value="1" />
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${stt}</td> <!-- Hiển thị giá trị STT hiện tại -->
                                            <c:set var="stt" value="${stt + 1}" />
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td >
                                                    ${hoaDon.khachHang.hoTen == null ? "Khách lẻ" : hoaDon.khachHang.hoTen }
                                            </td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-success' : 'bg-primary'}">
                                                        ${hoaDon.loaiHoaDon == 0 ? "Bán tại quầy" : "Bán online"}
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
                                                <a href="/admin/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
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
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a></li>
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
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a></li>
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
                                    <c:set var="stt" value="1" />
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${stt}</td> <!-- Hiển thị giá trị STT hiện tại -->
                                            <c:set var="stt" value="${stt + 1}" />
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen == null ? "Khách lẻ" : hoaDon.khachHang.hoTen }</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-success' : 'bg-primary'}">
                                                        ${hoaDon.loaiHoaDon == 0 ? "Bán tại quầy" : "Bán online"}
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
                                                <a href="/admin/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
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
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a></li>
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
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a></li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="delivering" role="tabpanel" aria-labelledby="delivering-tab">
                                <%-- Danh sách hóa đơn đang vận chuyển--%>
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
                                    <c:set var="stt" value="1" />
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${stt}</td> <!-- Hiển thị giá trị STT hiện tại -->
                                            <c:set var="stt" value="${stt + 1}" />
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen == null ? "Khách lẻ" : hoaDon.khachHang.hoTen }</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-success' : 'bg-primary'}">
                                                        ${hoaDon.loaiHoaDon == 0 ? "Bán tại quầy" : "Bán online"}
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
                                                <a href="/admin/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
                                                    <i class="bi bi-eye-fill"></i>
                                                </a>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <%-- Phân trang của hóa đơn đang vận chuyển   --%>
                                <div class="float-end">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:if test="${pageHD.hasPrevious()}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a></li>
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
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a></li>
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
                                    <c:set var="stt" value="1" />
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${stt}</td> <!-- Hiển thị giá trị STT hiện tại -->
                                            <c:set var="stt" value="${stt + 1}" />
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen == null ? "Khách lẻ" : hoaDon.khachHang.hoTen }</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-success' : 'bg-primary'}">
                                                        ${hoaDon.loaiHoaDon == 0 ? "Bán tại quầy" : "Bán online"}
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
                                                <a href="/admin/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
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
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a></li>
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
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a></li>
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
                                        <th>Lý do </th>
                                        <th>Thao Tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:set var="stt" value="1" />
                                    <c:forEach var="hoaDon" items="${hoaDonPage}" varStatus="i">
                                        <tr>
                                            <td>${stt}</td> <!-- Hiển thị giá trị STT hiện tại -->
                                            <c:set var="stt" value="${stt + 1}" />
                                            <td>${hoaDon.ma}</td>
                                            <td>${hoaDon.nhanVien.hoTen}</td>
                                            <td>${hoaDon.khachHang.hoTen == null ? "Khách lẻ" : hoaDon.khachHang.hoTen }</td>
                                            <td>${hoaDon.khachHang.sdt}</td>
                                            <td>
                                                <span class="badge rounded-pill ${hoaDon.loaiHoaDon == 0 ? 'bg-success' : 'bg-primary'}">
                                                        ${hoaDon.loaiHoaDon == 0 ? "Bán tại quầy" : "Bán online"}
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
                                                    ${hoaDon.ghiChu}
                                            </td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <a href="/admin/hoa-don/detail/${hoaDon.id}" class="btn btn-warning">
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
                                                                         href="?page=${pageHD.number - 1}&status=${currentStatus}">&laquo;</a></li>
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
                                                                         href="?page=${pageHD.number + 1}&status=${currentStatus}">&raquo;</a></li>
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


<!-- Bootstrap core JavaScript-->
<script src="/view_admin/vendor/jquery/jquery.min.js"></script>
<script src="/view_admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/view_admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/view_admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->


<!-- Page level custom scripts -->
<!-- Page level custom scripts -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

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
    <c:if test="${not empty cancelSuccess}">
    Toast.fire({
        icon: "success",
        title: "${cancelSuccess}"
    });
    </c:if>




    // Hàm xử lý hiển thị bg-warning các tab
    document.addEventListener('DOMContentLoaded', function () {


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

            // Save the current status to localStorage
            localStorage.setItem('currentTabStatus', status);
        }

        // Clear any old localStorage value and set it to "all"
        localStorage.removeItem('currentTabStatus');
        localStorage.setItem('currentTabStatus', 'all');

        // Initial setup
        let status = getStatusFromUrl() || 'all';
        setStatusAndHighlightTab(status);

        // When clicking on a tab
        $('#myTab .nav-link').click(function () {
            // Remove the bg-warning class from all tabs
            $('#myTab .nav-link').removeClass('bg-warning');
            // Add the bg-warning class to the clicked tab
            $(this).addClass('bg-warning');

            // Update the URL without reloading the page
            let status = $(this).data('status');
            let url = new URL(window.location.href);
            url.searchParams.set('status', status);
            url.searchParams.set('page', '0'); // Reset the page to 0 when switching tabs
            history.pushState(null, '', url.toString());

            // Save the current status to localStorage
            localStorage.setItem('currentTabStatus', status);
        });

        // Handle data loading when tabs are clicked
        document.querySelectorAll('#myTab .nav-link').forEach(button => {
            button.addEventListener('click', function () {
                let status = this.getAttribute('data-status');
                let url = new URL(window.location.href);
                url.searchParams.set('status', status);
                url.searchParams.set('page', '0'); // Reset the page to 0 when switching tabs
                window.history.pushState({}, '', url.toString());
                window.location.href = url.toString(); // Load the new URL
            });
        });

        // When clicking on any a tag
        $('a').click(function () {
            // Save the current tab status before navigating away
            let currentTabStatus = $('#myTab .nav-link.bg-warning').data('status');
            localStorage.setItem('currentTabStatus', currentTabStatus);
        });
    });

    // Handle data loading when tabs are clicked
    document.querySelectorAll('#myTab .nav-link').forEach(button => {
        button.addEventListener('click', function () {
            let status = this.getAttribute('data-status');
            let url = new URL(window.location.href);
            url.searchParams.set('status', status);
            window.history.pushState({}, '', url.toString());
        });
    });

    // Xử lý load dữ liệu lên các tabs
    document.querySelectorAll('#myTab .nav-link').forEach(button => {
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


    // Validate Bộ lọc và tìm kiếm
    function validateDates() {
        const startDateInput = document.getElementById('startDate');
        const endDateInput = document.getElementById('endDate');
        const startDateError = document.getElementById('startDateError');
        const endDateError = document.getElementById('endDateError');
        const startDate = new Date(startDateInput.value);
        const endDate = new Date(endDateInput.value);
        const currentYear = new Date().getFullYear();

        let isValid = true;

        // Clear previous errors
        startDateInput.classList.remove('border-danger');
        endDateInput.classList.remove('border-danger');
        startDateError.textContent = '';
        endDateError.textContent = '';

        if (!startDateInput.value && !endDateInput.value) {
            return true; // No need to validate if both dates are not selected
        }

        if (startDateInput.value && endDateInput.value) {
            if (startDate.getFullYear() !== currentYear) {
                startDateInput.classList.add('border-danger');
                startDateError.textContent = 'Ngày bắt đầu chỉ được chọn trong năm nay.';
                isValid = false;
            }
            if (endDate.getFullYear() !== currentYear) {
                endDateInput.classList.add('border-danger');
                endDateError.textContent = 'Ngày kết thúc chỉ được chọn trong năm nay.';
                isValid = false;
            }
            if (endDate < startDate) {
                endDateInput.classList.add('border-danger');
                endDateError.textContent = 'Ngày kết thúc phải bằng hoặc sau ngày bắt đầu.';
                isValid = false;
            }
        } else if (startDateInput.value) {
            if (startDate.getFullYear() !== currentYear) {
                startDateInput.classList.add('border-danger');
                startDateError.textContent = 'Ngày bắt đầu chỉ được chọn trong năm nay.';
                isValid = false;
            }
            if (!endDateInput.value) {
                endDateInput.classList.add('border-danger');
                endDateError.textContent = 'Vui lòng chọn ngày kết thúc.';
                isValid = false;
            }
        } else if (endDateInput.value) {
            if (endDate.getFullYear() !== currentYear) {
                endDateInput.classList.add('border-danger');
                endDateError.textContent = 'Ngày kết thúc chỉ được chọn trong năm nay.';
                isValid = false;
            }
            if (!startDateInput.value) {
                startDateInput.classList.add('border-danger');
                startDateError.textContent = 'Vui lòng chọn ngày bắt đầu.';
                isValid = false;
            }
        }

        return isValid;
    }

    document.getElementById('startDate').addEventListener('focus', function() {
        this.classList.remove('border-danger');
        document.getElementById('startDateError').textContent = '';
    });

    document.getElementById('endDate').addEventListener('focus', function() {
        this.classList.remove('border-danger');
        document.getElementById('endDateError').textContent = '';
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