<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

    <title>MSStore - Áo sơ mi nam</title>

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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


    <style>
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
                        <span>Quản lý hóa đơn</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/doi-hang-view">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Trả hàng</span></a>
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
                    <a class="nav-link" href="/qlnv/quan-ly-nhan-vien">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Quản lý nhân viên</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/qlkh/quan-ly-khach-hang">
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
                    <a class="nav-link" href="/qlkh/quan-ly-khach-hang">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Quản lý khách hàng</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle1"></button>
                </div>
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


            <!-- Quản lý đổi hàng -->
            <div class="container-fluid">
                <div class="container">
                    <div>
                        <h5 class="card-title mb-3"><i class="bi bi-card-list"
                                                       style="font-size: 28px; margin-right: 10px"></i>Quản lý đổi hàng
                        </h5>
                    </div>

                    <div class="row">
                        <div class="card">
                            <div class="card-header">
                                Thông tin khách hàng
                            </div>
                            <div class="card-body">

                                <%--    Hóa đơn    --%>
                                <div class="row">
                                    <div class="col col-2" style="display: grid">
                                        <span class="mb-3">Mã hóa đơn: </span>
                                        <span class="mb-3">Tên khách hàng: </span>
                                        <span class="mb-3">Số điện thoại: </span>
                                        <span class="mb-3">Địa chỉ: </span>
                                        <span>Ghi chú: </span>
                                    </div>

                                    <div class="col col-4" style="display: grid">
                                        <span class="mb-3 text-danger fw-bold"> ${hoaDon.maHD} </span>
                                        <c:if test="${hoaDon.hoTen == null}">
                                            <span class="mb-3"> Khách lẻ </span>
                                            <span class="mb-3"> ... </span>
                                        </c:if>
                                        <c:if test="${hoaDon.hoTen != null}">
                                            <span class="mb-3"> ${hoaDon.hoTen} </span>
                                            <span class="mb-3"> ${hoaDon.sdt} </span>
                                        </c:if>
                                        <c:if test="${hoaDon.diaChiChiTiet == null}"><span
                                                class="mb-3"> ... </span></c:if>
                                        <c:if test="${hoaDon.diaChiChiTiet != null}"><span
                                                class="mb-3">${hoaDon.diaChiChiTiet} - ${hoaDon.idPhuongXa} - ${hoaDon.idQuanHuyen} - ${hoaDon.idTinhThanh}</span></c:if>

                                        <c:if test="${hoaDon.ghiChu == null}"> <span> ... </span> </c:if>
                                        <c:if test="${hoaDon.ghiChu != null}"> <span>${hoaDon.ghiChu}</span> </c:if>
                                    </div>

                                    <div class="col col-2" style="display: grid">
                                        <span class="mb-3">Ngày thanh toán: </span>
                                        <span class="mb-3">Ngày giao hàng: </span>
                                        <span class="mb-3">Ngày nhận hàng: </span>
                                        <span class="mb-3">Trạng thái: </span>
                                        <span>Loại: </span>
                                    </div>

                                    <div class="col col-4" style="display: grid">
                                        <c:if test="${ngayThanhToan == null}"><span class="mb-3"> ... </span></c:if>
                                        <c:if test="${ngayThanhToan != null}"><span
                                                class="mb-3"> ${ngayThanhToan} </span></c:if>

                                        <c:if test="${ngayShip == null}"><span class="mb-3"> ... </span></c:if>
                                        <c:if test="${ngayShip != null}"><span class="mb-3"> ${ngayShip} </span></c:if>

                                        <c:if test="${ngayNhan == null}"><span class="mb-3"> ... </span></c:if>
                                        <c:if test="${ngayNhan != null}"><span class="mb-3"> ${ngayNhan} </span></c:if>

                                        <c:if test="${hoaDon.trangThai == 6}">
                                                <span class="mb-3 badge rounded-pill bg-info text-dark"
                                                      style="width: 115px; color: white">Thành công</span>
                                        </c:if>
                                        <c:if test="${hoaDon.loaiHoaDon == 0}">
                                            <span class="badge rounded-pill bg-primary"
                                                  style="width: 115px;">OFFLINE</span>
                                        </c:if>
                                        <c:if test="${hoaDon.loaiHoaDon == 1}">
                                            <span class="badge rounded-pill bg-primary"
                                                  style="width: 115px;">ONLINE</span>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="margin-top: 25px">
                        <div class="card">
                            <div class="card-header">
                                <span>Thông tin đơn hàng</span>

                                <c:if test="${soNgayTraHang > 7}">
                                    <button disabled class="btn btn-primary float-end">
                                        <i class="bi bi-arrow-repeat"style="margin-right: 8px" ></i>
                                        Đổi hàng tất cả
                                    </button>
                                </c:if>
                                <c:if test="${soNgayTraHang <= 7}">
                                    <button class="btn btn-primary float-end"><i class="bi bi-arrow-repeat"
                                                                                 style="margin-right: 8px" ></i>Đổi hàng tất cả
                                    </button>
                                </c:if>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th scope="col"
                                            style="background: orange; color: white; border-radius: 10px 0px 0px 0px">
                                            STT
                                        </th>
                                        <th scope="col" style="background: orange; color: white">Ảnh</th>
                                        <th scope="col" style="background: orange; color: white">Thông tin sản phẩm</th>
                                        <th scope="col" style="background: orange; color: white">Số lượng</th>
                                        <th scope="col" style="background: orange; color: white">Đơn giá</th>
                                        <th scope="col" style="background: orange; color: white">Tổng tiền</th>
                                        <th scope="col" style="background: orange; color: white">Trạng thái</th>
                                        <th scope="col"
                                            style="background: orange; color: white; border-radius: 0px 10px 0px 0px">
                                            Thao tác
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach varStatus="i" items="${listCTHD}" var="cthd">
                                        <tr>
                                            <th>${i.index + 1}</th>
                                            <td><img src="/image/${cthd.hinhAnh1}" style="width: 60px;"></td>
                                            <td>${cthd.tenSanPham} [${cthd.tenKichThuoc} - ${cthd.tenMauSac}]</td>
                                            <td>${cthd.soLuong}</td>
                                            <td><fmt:formatNumber value="${cthd.donGia}" type="currency" currencySymbol="₫"/></td>
                                            <td><fmt:formatNumber value="${cthd.soLuong * cthd.donGia}" type="currency" currencySymbol="₫"/></td>
                                            <c:if test="${cthd.trangThai == 1}">
                                                <td><span class="badge rounded-pill bg-success">Thành công</span></td>
                                            </c:if>
                                            <c:if test="${cthd.trangThai == 2}">
                                                <td><span class="badge rounded-pill bg-danger">Hoàn hàng</span></td>
                                            </c:if>
                                            <td>
                                                <c:if test="${soNgayTraHang > 7}">
                                                    <button disabled class="btn" type="button" style="background: cadetblue;"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#exampleModal${cthd.idCTHD}"><i
                                                            class="bi bi-arrow-repeat"></i></button>
                                                </c:if>
                                                <c:if test="${cthd.soLuong == 1}">
                                                    <c:if test="${soNgayTraHang <= 7}">
                                                        <form method="post" action="/admin/san-pham-tra/${cthd.idCTHD}">
                                                            <input type="hidden" name="soLuongTra" value="1" />
                                                            <button class="btn" type="submit" style="background: cadetblue;">
                                                                <i class="bi bi-arrow-repeat"></i></button>
                                                        </form>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${cthd.soLuong > 1}">
                                                    <c:if test="${soNgayTraHang <= 7}">
                                                        <button class="btn" type="button" style="background: cadetblue;"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#exampleModal${cthd.idCTHD}"><i
                                                                class="bi bi-arrow-repeat"></i></button>
                                                    </c:if>
                                                </c:if>
                                            </td>
                                        </tr>

                                        <%--    Modal loại đổi hàng    --%>
                                        <form method="post" action="/admin/san-pham-tra/${cthd.idCTHD}">
                                            <div class="modal fade" id="exampleModal${cthd.idCTHD}" tabindex="-1"
                                                 aria-labelledby="exampleModalLabel${cthd.idCTHD}" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel${cthd.idCTHD}">Số
                                                                lượng trả hàng</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">

                                                            <div style="display: flex; align-items: center; justify-content: center">
                                                                <span style="margin-right: 20px">Số lượng: </span>
                                                                <input class="form-control w-50" type="number"
                                                                       name="soLuongTra" id="soLuongTra" min="1" max="${cthd.soLuong}"/>
                                                            </div>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-bs-dismiss="modal">Đóng
                                                            </button>
                                                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                    <%--       Thông tin đơn trả hàng       --%>
                    <div class="row" style="margin-top: 25px">
                        <div class="col col-8" style="padding-left: 0px">
                            <div class="card">
                                <div class="card-header">
                                    <span class="font-weight-bold">Thông tin đơn hàng trả</span>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col"
                                                style="background: orange; color: white; border-radius: 10px 0px 0px 0px">
                                                STT
                                            </th>
                                            <th scope="col" style="background: orange; color: white">Ảnh</th>
                                            <th scope="col" style="background: orange; color: white">Thông tin sản phẩm</th>
                                            <th scope="col" style="background: orange; color: white">Số lượng</th>
                                            <th scope="col" style="background: orange; color: white">Đơn giá</th>
                                            <th scope="col" style="background: orange; color: white">Tổng tiền</th>
                                            <th scope="col"
                                                style="background: orange; color: white; border-radius: 0px 10px 0px 0px">
                                                Thao tác
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach varStatus="i" items="${listCTHDByTT}" var="cthd">
                                            <tr>
                                                <th>${i.index + 1}</th>
                                                <td><img src="/image/${cthd.hinhAnh1}" style="width: 60px;"></td>
                                                <td>${cthd.tenSanPham} [${cthd.tenKichThuoc} - ${cthd.tenMauSac}]</td>
                                                <td>${cthd.soLuong}</td>
                                                <td><fmt:formatNumber value="${cthd.donGia}" type="currency" currencySymbol="₫"/></td>
                                                <td><fmt:formatNumber value="${cthd.soLuong * cthd.donGia}" type="currency" currencySymbol="₫"/></td>
                                                <td>
                                                    <a href="/amdin/xoa-san-pham-cho-tra"><button class="btn btn-danger"><i class="bi bi-trash3"></i></button></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="col col-4" style="padding: 0px">
                            <div class="card">
                                <div class="card-header">
                                    <span class="font-weight-bold">Thông tin thanh toán</span>
                                </div>
                                <div class="card-body">
                                    <form method="post" action="">
                                        <div class="row">
                                            <div class="col col-6" style="display: grid">
                                                <span class="mb-3 fw-bold">Tổng giá hàng gốc: </span>
                                                <span class="mb-3 fw-bold">Khuyến mãi đã sử dụng: </span>
                                                <span class="mb-3 fw-bold">Tiền ship: </span>
                                                <span class="fw-bold">Tổng tiền thanh toán: </span>
                                            </div>
                                            <div class="col col-6" style="display: grid">
                                                <span class="mb-3 fw-bold ms-4"> <fmt:formatNumber value="${hoaDon.tongTien}" type="currency" currencySymbol="₫"/> </span>
                                                <c:if test="${hoaDon.soTienGiamKM == null}">
                                                    <span class="mb-3 fw-bold ms-4"> 0 </span>
                                                </c:if>
                                                <c:if test="${hoaDon.soTienGiamKM != null}">
                                                    <span class="mb-3 fw-bold ms-4"> <fmt:formatNumber value="${hoaDon.soTienGiamKM}" type="currency" currencySymbol="₫"/> </span>
                                                </c:if>
                                                <span class="mb-3 fw-bold ms-4"> 0 VND </span>
                                                <c:if test="${hoaDon.soTienGiamKM == null}">
                                                    <span class="fw-bold ms-4"> <fmt:formatNumber value="${hoaDon.tongTien}" type="currency" currencySymbol="₫"/></span>
                                                </c:if>
                                                <c:if test="${hoaDon.soTienGiamKM != null}">
                                                    <span class="fw-bold ms-4"><fmt:formatNumber value="${hoaDon.tongTien - hoaDon.soTienGiamKM}" type="currency" currencySymbol="₫"/> </span>
                                                </c:if>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col col-6" style="display: grid">
                                                <span class="mb-3 fw-bold">Số lượng hàng trả: </span>
                                                <span class="mb-3 fw-bold">Tổng tiền trả khách: </span>
                                            </div>
                                            <div class="col col-6" style="display: grid">
                                                <span class="mb-3 fw-bold ms-4"> 2 </span>
                                                <span class="mb-3 fw-bold ms-4"> 230$ </span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <span class="fw-bold">Ghi chú: </span>
                                            <div class="form-check ms-4">
                                                <input class="form-check-input" type="radio" name="traHang" id="doiSanPham" checked>
                                                <label class="form-check-label" for="doiSanPham">
                                                    Nhầm sản phẩm (kích thước, màu sắc,...)
                                                </label>
                                            </div>
                                            <div class="form-check ms-4">
                                                <input class="form-check-input" type="radio" name="traHang" id="doiLoi">
                                                <label class="form-check-label" for="doiLoi">
                                                    Sản phẩm lỗi (Rách, thiếu cúc,...)
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row mt-5">
                                            <div class="text-center">
                                                <button class="btn" style="background: orange; width: 99%; font-weight: bold; font-size: 18px; color: white">Trả hàng</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <!--  Kết thúc quản lý đổi hàng  -->

        </div>


        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>MSStore - Áo sơ mi nam</span>
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

    function showToast(type, message) {
        Toast.fire({
            icon: type,
            title: message
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
</html>