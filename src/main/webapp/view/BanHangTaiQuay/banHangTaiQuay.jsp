<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


    <style>
        .table-scroll{
            height: 365px;
            overflow: scroll;
        }

        .table-scroll2{
            height: 460px;
            overflow: scroll;
        }

        .table-scroll3{
            height: 370px;
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

        .button-container {
            display: flex;
            gap: 10px; /* Tạo khoảng cách giữa các button */
        }

        #button {
            flex: none; /* Đảm bảo kích thước button không thay đổi */
        }
        th,td{
            text-align: center;
        }

        .hidden {
            display: none;
        }

        .highlight {
            font-weight: bold;
            background-color: #f0f0f0; /* Optional: Adds a background color */
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
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/admin/thong-ke/view" style="display: flex; align-items: center">
                        <i class="bi bi-graph-up" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px">Thống kê doanh thu</span></a>
                </li>

                <!-- Nav Item - Dashboard -->
                <li class="nav-item" style="background: linear-gradient(45deg, black, transparent)">
                    <a class="nav-link" href="/admin/ban-hang-tai-quay/hien-thi" style="display: flex; align-items: center">
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
                <li class="nav-item">
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
                        <i class="bi bi-person-bounding-box" style="color: white; margin-left: 2px"></i>
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

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Nav Item - Dashboard -->
                <li class="nav-item" style="background: linear-gradient(45deg, black, transparent)">
                    <a class="nav-link" href="/admin/ban-hang-tai-quay/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-shop" style="color: white; margin-left: 2px"></i>
                        <span style="font-weight: bold; margin-left: 6px">Bán hàng tại quầy</span></a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
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

    <!--   -----------   -->
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

<%--                <form--%>
<%--                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">--%>
<%--                    <div class="input-group">--%>
<%--                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."--%>
<%--                               aria-label="Search" aria-describedby="basic-addon2">--%>
<%--                        <div class="input-group-append">--%>
<%--                            <button class="btn btn-primary" type="button">--%>
<%--                                <i class="fas fa-search fa-sm"></i>--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </form>--%>
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

                            <!-- Counter - Alerts -->
                            <span class="badge badge-danger badge-counter"></span>
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
                           
                            <!-- Counter - Messages -->
                            <span class="badge badge-danger badge-counter"></span>
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
                            <a class="dropdown-item" href="/admin/quan-ly-nhan-vien/tai-khoan-cua-toi/${nv.id}">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Thông tin cá nhân
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/admin/ban-hang-tai-quay/dang-xuat" id="dang-xuat" data-toggle="modal"
                               data-target="#logoutModal">
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
                                <form action="/admin/ban-hang-tai-quay/add-hoa-don" method="post" style="float: right;" class="float-end">
                                    <button type="submit" class="btn btn-success">+ Tạo hóa đơn</button>
                                </form>
                                <a class="col-sm-3 btn btn-info text-white" data-bs-toggle="modal" data-bs-target="#exampleModal4"
                                   style="float: right;margin-right: 30px;">
                                    + Chọn sản phẩm
                                </a>
                            </div>
                            <table class="table table-hover" id="myTable">
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
                                <c:forEach varStatus="i" items="${listHoaDon}" var="hd">
                                    <tr data-id="${hd.id}" class="${hoaDon.ma == hd.ma ? 'highlight' : ''}">
                                        <td>${i.index+1}</td>
                                        <td>${hd.ma}</td>
                                        <td>${hd.idNhanVien.hoTen}</td>
                                        <td>
                                            <c:if test="${hd.idKhachHang.id == null}">Khách lẻ</c:if>
                                            <c:if test="${hd.idKhachHang.id != null}">${hd.idKhachHang.hoTen}</c:if>
                                        </td>
                                        <c:set var="ngayThanhToanFormatted" value="${fn:substring(fn:replace(hd.ngayTao, 'T', ' '), 0, 19)}" />
                                        <td>${ngayThanhToanFormatted}</td>

                                        <td>${hd.trangThai == 0 ? "Chưa thanh toán" : "Đã thanh toán"}</td>
                                        <td>
                                            <a href="/admin/ban-hang-tai-quay/detail-hoa-don/${hd.id}"
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
                                    <th>Tên sản phẩm</th>
                                    <th>Màu sắc</th>
                                    <th>Kích thước</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Chức năng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--                                <c:forEach varStatus="i" items="${listHDCT}" var="hdct">--%>
                                <%--                                    <tr>--%>
                                <%--                                        <td>${i.index+1}</td>--%>
                                <%--                                        <td>${hdct.idHoaDon.ma}</td>--%>
                                <%--                                        <td>${hdct.idCTSP.idSanPham.ma}</td>--%>
                                <%--                                        <td width="150px">${hdct.idCTSP.idSanPham.ten}</td>--%>
                                <%--                                        <td>${hdct.soLuong}</td>--%>
                                <%--                                        <td>${hdct.donGia}</td>--%>
                                <%--                                        <td>${hdct.soLuong*hdct.donGia}</td>--%>
                                <%--                                        <td>--%>

                                <%--                                            <div class="button-container">--%>
                                <%--                                                <button id="button" class="update-button btn btn-warning" data-id="${hdct.idCTSP.id}" data-sl="${hdct.soLuong}" data-donGia="${hdct.donGia}" data-tongSL="${hdct.idCTSP.soLuong}">--%>
                                <%--                                                    <i class="bi bi-pencil"></i>--%>
                                <%--                                                </button>--%>

                                <%--                                                <button id="button" class="deleteHDCT-button btn btn-danger" data-idHDCT="${hdct.id}" data-idCTSP="${hdct.idCTSP.id}">--%>
                                <%--                                                    <i class="bi bi-trash"></i>--%>
                                <%--                                                </button>--%>
                                <%--                                            </div>--%>


                                <%--                                        </td>--%>
                                <%--                                    </tr>--%>
                                <%--                                </c:forEach>--%>

                                <c:forEach varStatus="i" items="${listHDCT}" var="hdct">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td>${hdct.idCTSP.idSanPham.ten}</td>
                                        <td>${hdct.idCTSP.idMauSac.ten}</td>
                                        <td>${hdct.idCTSP.idKichThuoc.ten}</td>
                                        <td style="display: flex; align-items: center;">
                                            <form class="d-flex" method="post" action="/admin/ban-hang-tai-quay/update-sl/${hdct.idCTSP.id}" onsubmit="return validateForm(this);">
                                                <input type="hidden" name="idHoaDon" value="${hoaDon.id}">
                                                <input type="hidden" id="tongSL" name="tongSL" value="${hdct.idCTSP.soLuong}">
                                                <input type="hidden" id="soLuongCu" name="soLuongCu" value="${hdct.soLuong}">
                                                <input id="soLuong" class="form-control me-2" type="text" name="soLuong" value="${hdct.soLuong}" style="width: 50px" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                                <button class="btn btn-light" type="submit">
                                                    <i class="bi bi-pencil"></i>
                                                </button>
                                            </form>
                                        </td>
                                        <td class="price">${hdct.donGia}</td>
                                        <td>
                                            <form class="delete-form" action="/admin/ban-hang-tai-quay/delete-hdct/${hdct.id}/${hdct.idCTSP.id}?highlightId=${hoaDon.id}" method="post">
                                                <input type="hidden" name="idHoaDon" value="${hoaDon.id}">
                                                <button class="delete-button2 btn btn-danger" type="button" ><i class="bi bi-trash"></i></button>
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

                                    <div class="mb-3">
                                        <label class="form-label">Mã Hóa Đơn</label>
                                        <input type="text" class="form-control" value="${hoaDon.ma}" readonly>
                                        <input type="hidden" class="form-control" name="idHD"  value="${hoaDon.id}" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Tên Khách Hàng</label>
                                        <div class="row align-items-center">
                                            <div class="col-sm-9">

                                                <c:if test="${hoaDon.idKhachHang.id!=null}">
                                                    <input type="text" class="form-control"  value="${hoaDon.idKhachHang.hoTen}" readonly>
                                                    <input type="hidden" class="form-control" name="idKH"  value="${hoaDon.idKhachHang.id}" readonly>
                                                </c:if>
                                                <c:if test="${hoaDon.idKhachHang.id==null}">
                                                    <input type="text" class="form-control" name="idKH" placeholder="Khách lẻ" readonly>
                                                </c:if>

                                            </div>
                                            <%-- Modal  --%>
                                            <div class="col-sm-1 d-flex " >
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal2">
                                                    <i class="bi bi-person-plus" style="font-size: 25px; padding: 0px;color: blue"></i>
                                                </a>
                                            </div>
                                            <div class="col-sm-2 d-flex " style="padding-left: 17px;">
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal5" href="#">
                                                    <i class="bi bi-folder-plus" style="font-size: 25px; padding: 0px;"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Mã Giảm Giá</label>
                                        <input type="hidden" class="form-control" name="idKhuyenMai"
                                               value="${hoaDon.idKhuyenMai.id}" readonly>
                                        <input type="text" class="form-control"
                                               value="${hoaDon.idKhuyenMai.ma}" readonly>
                                        <%--  Modal chọn mã giảm giá  --%>
                                        <a id="openModalBtn" class="col-sm-3 btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3"
                                           style="height: 38px;width: 79px;margin-top: 16px; margin-right: 6px;">
                                            + Chọn
                                        </a>
                                        <c:if test="${hoaDon.idKhuyenMai.id!=null}">
                                            <a class="col-sm-3 btn btn-outline-danger" href="/admin/ban-hang-tai-quay/huy-khuyen-mai/${hoaDon.idKhuyenMai.id}"
                                               style="height: 38px;width: 79px;margin-top: 16px;">
                                                X Hủy
                                            </a>
                                        </c:if>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Số tiền giảm:</label>
                                        <c:if test="${hoaDon.idKhuyenMai.soTienGiam!=null}">
                                            <input type="text" id="soTienGiamKM" class="form-control" value="${hoaDon.idKhuyenMai.soTienGiam}" readonly>
                                        </c:if>
                                        <c:if test="${hoaDon.idKhuyenMai.soTienGiam==null}">
                                            <input type="text" class="form-control" value="0 ₫" readonly>
                                        </c:if>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Ngày Tạo</label>
                                        <input type="hidden" class="form-control" name="ngayTao" value="${hoaDon.ngayTao}" readonly>
                                        <c:if test="${hoaDon.ngayTao==null}">
                                            <input type="text" class="form-control" value="" readonly>
                                        </c:if>
                                        <c:if test="${hoaDon.ngayTao!=null}">
                                            <input type="text" class="form-control" id="formatted-date" value="${hoaDon.ngayTao}" readonly>
                                        </c:if>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Thành Tiền</label>
                                        <c:if test="${total-hoaDon.idKhuyenMai.soTienGiam>0}">
                                            <input id="tongTienKhiTruKM" type="text" class="form-control" name="tongTien"
                                                   value="${total-hoaDon.idKhuyenMai.soTienGiam}" readonly/>
                                            <input type="hidden" class="form-control"
                                                   id="tongTien" value="${total-hoaDon.idKhuyenMai.soTienGiam}" readonly/>
                                        </c:if>
                                        <%--                                        <c:if test="${total==null}">--%>
                                        <%--                                            <input type="number" class="form-control" value="0"--%>
                                        <%--                                                   readonly/>--%>
                                        <%--                                        </c:if>--%>
                                        <c:if test="${total-hoaDon.idKhuyenMai.soTienGiam<=0}">
                                            <input type="number" class="form-control" value="0"
                                                   readonly/>
                                        </c:if>
                                    </div>

                                    <%--    chọn phương thức thanh toán   --%>
                                    <div class="mb-3">
                                        <label class="form-label">Phương Thức Thanh Toán:</label>
                                        <div class="form-check" style="margin-left: 14px;">
                                            <input type="radio" class="form-check-input" id="radio1" name="optradio" value="1" checked>
                                            <label class="form-check-label" for="radio1">Tiền mặt</label>
                                        </div>
                                        <div class="form-check" style="margin-left: 14px;">
                                            <input type="radio" class="form-check-input" id="radio2" name="optradio" value="2">
                                            <label class="form-check-label" for="radio2">Thanh toán qua VNPay</label>
                                        </div>
                                    </div>
                                    <%--   Hiển thị khi chọn radio    --%>
                                    <div id="cash-div" class="content-div">
                                        <div class="mb-3">
                                            <label class="form-label">Tiền Khách Đưa</label>
                                            <div class="row align-items-center">
                                                <div class="col-sm-10 d-flex align-items-center">
                                                    <input id="tienKhachDua" class="form-control" type="text" value="" required>

                                                </div>
                                                <div class="col-sm-2 d-flex">
                                                    <i id="calculateChangeButton" class="bi bi-chevron-double-down" style="font-size: 20px; cursor: pointer;" onclick="calculateChange()"></i>
                                                </div>
                                                <span id="errTraLai" style="color: red; margin-left: 10px;"></span>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Trả Lại</label>
                                            <input id="tienTraLai" type="text" class="form-control" required readonly>
                                        </div>
                                        <div class="mb-3" style="margin-top: 25px">
                                            <div class="col-sm-12">
                                                <c:if test="${hoaDon.id!=null}">
                                                    <button id="checkBtn" type="submit" class="btn btn-outline-primary" idhd =${hoaDon.id}><i class="bi bi-wallet2" style="padding-right: 5px"></i>Thanh Toán</button>
                                                    <%--Hủy hóa đơn--%>
                                                    <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#myModal">
                                                        <i class="bi bi-x"></i> Hủy Đơn
                                                    </button>
                                                </c:if>


                                            </div>
                                        </div>
                                    </div>
<%----%>

                                    <!-- The Modal -->
                                    <div class="modal" id="myModal">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <div class="modal-body">
                                                    <form>
                                                        <div class="mb-3 mt-3">
                                                            <label class="form-label">Lý do hủy:</label>
                                                            <input type="text" class="form-control" name="ghiChu" id="ghiChu">
                                                            <p id="error-ghiChu" style="color: red"></p>
                                                        </div>
                                                        <a href="#" id="cancelOrder2" class="btn btn-outline-primary"><i class="bi bi-x"></i> Hủy Đơn</a>
                                                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div id="vnpay-div" class="content-div hidden">
                                        <div class="mb-3" style="margin-top: 15px">
                                            <div class="col-sm-12">
                                                <div style="display: flex; align-items: center;">
                                                    <form class="thanhToan-form" action="/admin/ban-hang-tai-quay/pay/${total-hoaDon.idKhuyenMai.soTienGiam}/${hoaDon.ma}" method="get">
                                                        <button class="thanhToan-button2 btn btn-outline-primary" type="button" style="margin-top: 16px"><i class="bi bi-wallet2" style="padding-right: 5px"></i> Thanh Toán</button>
                                                    </form>
                                                    <a href="#" id="cancelOrder" class="btn btn-outline-danger" style="margin-left: 10px;"><i class="bi bi-x"></i> Hủy Đơn</a>
<%--                                                    <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#myModal2">--%>
<%--                                                        <i class="bi bi-x"></i> Hủy Đơn--%>
<%--                                                    </button>--%>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

<%--                                    <!-- The Modal -->--%>
<%--                                    <div class="modal" id="myModal2">--%>
<%--                                        <div class="modal-dialog">--%>
<%--                                            <div class="modal-content">--%>

<%--                                                <div class="modal-body">--%>
<%--&lt;%&ndash;                                                    <form>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <div class="mb-3 mt-3">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <label class="form-label">Lý do hủy:</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <input type="text" class="form-control" name="ghiChu" id="ghiChu2">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <p id="error-ghiChu2" style="color: red"></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" id="cancelOrder3" class="btn btn-outline-primary"><i class="bi bi-x"></i> Hủy Đơn</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </form>&ndash;%&gt;--%>
<%--                                                    <p>Xin chào</p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>



                                    <%-- Cũ --%>
                                    <%--                                        <div class="row mb-3">--%>
                                    <%--                                            <label class="col-sm-4 col-form-label">Mã hóa đơn</label>--%>
                                    <%--                                            <div class="col-sm-8">--%>
                                    <%--                                                <input type="text" class="form-control" value="${hoaDon.ma}"/>--%>
                                    <%--                                                <input type="hidden" class="form-control" name="idHD"  value="${hoaDon.id}" readonly>--%>
                                    <%--                                            </div>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <div class="row mb-3">--%>
                                    <%--                                            <label class="col-sm-4 col-form-label">Ngày tạo</label>--%>
                                    <%--                                            <div class="col-sm-8">--%>
                                    <%--                                                <input type="text" class="form-control" name="ngayTao" value="${hoaDon.ngayTao}">--%>
                                    <%--                                            </div>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <div class="row mb-3">--%>
                                    <%--                                            <label class="col-sm-4 col-form-label">Tên khách hàng</label>--%>
                                    <%--                                            <div class="col-sm-5">--%>
                                    <%--                                                    <input type="text" class="form-control"  value="${hoaDon.idKhachHang.hoTen}" readonly>--%>
                                    <%--                                                    <input type="hidden" class="form-control" name="idKH"  value="${hoaDon.idKhachHang.id}" readonly>--%>
                                    <%--                                            </div>--%>
                                    <%--                                            &lt;%&ndash;   Modal thêm nhanh khách hàng&ndash;%&gt;--%>
                                    <%--                                            <a class="col-sm-1 " data-bs-toggle="modal" data-bs-target="#exampleModal2"--%>
                                    <%--                                               style="padding-right: 0px;margin-top: 7px">--%>
                                    <%--                                                <i class="bi bi-person-plus" style="font-size: 25px;padding: 0px"></i>--%>
                                    <%--                                            </a>--%>
                                    <%--                                            <a class="col-sm-1" data-bs-toggle="modal" data-bs-target="#exampleModal"--%>
                                    <%--                                               href="#" style="padding-right: 0px;margin-top: 7px">--%>
                                    <%--                                                <i class=" bi bi-folder-plus col-3" style="font-size: 25px;padding: 0px"></i>--%>
                                    <%--                                            </a>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <div class="row mb-3">--%>
                                    <%--                                            <label class="col-sm-4 col-form-label">Mã giảm giá</label>--%>
                                    <%--                                            <div class="col-sm-5">--%>
                                    <%--                                                <input type="hidden" class="form-control" name="idKhuyenMai"--%>
                                    <%--                                                       value="${hoaDon.idKhuyenMai.id}" readonly>--%>
                                    <%--                                                <input type="text" class="form-control"--%>
                                    <%--                                                       value="${hoaDon.idKhuyenMai.ma}" readonly>--%>
                                    <%--                                            </div>--%>
                                    <%--                                            &lt;%&ndash;  Modal chọn mã giảm giá  &ndash;%&gt;--%>
                                    <%--                                            <a class="col-sm-3 btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3"--%>
                                    <%--                                               style="height: 38px;width: 79px;">--%>
                                    <%--                                                + Chọn--%>
                                    <%--                                            </a>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <div class="row mb-3">--%>
                                    <%--                                            <label class="col-sm-4 col-form-label">Số tiền giảm</label>--%>
                                    <%--                                            <div class="col-sm-5">--%>
                                    <%--                                                <p>${hoaDon.idKhuyenMai.soTienGiam}</p>--%>
                                    <%--                                            </div>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    <div class="row mb-3">--%>
                                    <%--                                        <label class="col-sm-4 col-form-label">Tổng tiền</label>--%>
                                    <%--                                        <div class="col-sm-8">--%>
                                    <%--                                            <c:if test="${total>0}">--%>
                                    <%--                                                <input id="tongTienKhiTruKM" type="number" class="form-control"--%>
                                    <%--                                                       name="tongTien"  value="${total-hoaDon.idKhuyenMai.soTienGiam}"--%>
                                    <%--                                                       readonly/>--%>
                                    <%--                                            </c:if>--%>
                                    <%--                                            <c:if test="${total==null}">--%>
                                    <%--                                                <input type="number" class="form-control" value="0"--%>
                                    <%--                                                       readonly/>--%>
                                    <%--                                            </c:if>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    </div>--%>
                                    <%--                                        <div class="row mb-3">--%>
                                    <%--                                            <label class="col-sm-4 col-form-label">Tiền khách đưa</label>--%>
                                    <%--                                            <div class="col-sm-6">--%>
                                    <%--                                                <input id="tienKhachDua" class="form-control" type="number" required>--%>
                                    <%--                                                <span id="errTraLai" style="color: red"></span>--%>
                                    <%--                                            </div>--%>

                                    <%--                                            <i id="calculateChangeButton" class=" col-sm-2 bi bi-chevron-double-down"--%>
                                    <%--                                               style="font-size: 20px" onclick="calculateChange()"></i>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <div class="row mb-3">--%>
                                    <%--                                            <label class="col-sm-4 col-form-label">Trả lại</label>--%>
                                    <%--                                            <div class="col-sm-8">--%>
                                    <%--                                                <input id="tienTraLai" type="number" class="form-control" required--%>
                                    <%--                                                       readonly>--%>

                                    <%--                                            </div>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    --%>
                                    <%--                                        <div class="row mb-3 mt-4 justify-content-end text-end">--%>
                                    <%--                                            <div class="col-sm-10">--%>
                                    <%--                                                <button id="checkBtn" idhd =${hoaDon.id} type="submit" class="btn btn-success ">THANH TOÁN</button>--%>
                                    <%--                                            </div>--%>
                                    <%--                                        </div>--%>
                                    <!-- End General Form Elements -->
                                </div>
                            </div><!-- End Recent Activity -->
                        </div>
                    </div>


                </div>


            </div>
            <!--  Kết thúc bán hàng tại quầy  -->

        </div>



        <!-- Modal mã giảm giá -->
        <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false" >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h5 class="modal-title" id="exampleModalLabel">Mã giảm giá</h5>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>Giảm tối đa</th>
                                    <th>Áp dụng</th>
                                    <th>Số lượng</th>
                                    <th>Chọn</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${listKM}" var="km">
                                    <c:if test="${km.apDung<=total}">
                                        <tr>
                                            <td>${km.ten}</td>
                                            <td class="price">${km.soTienGiam}</td>
                                            <td class="price">${km.apDung}</td>
                                            <td>${km.soLuong}</td>
                                            <td>
                                                <form action="/admin/ban-hang-tai-quay/find-khuyen-mai/${km.id}" method="post" onsubmit="return validateAddToMaGiamGia();">
                                                    <input id="selectedMaGiamGia" type="hidden" name="idHoaDon" value="${hoaDon.id}">
                                                    <input  type="hidden" name="idKMBanDau" value="${hoaDon.idKhuyenMai.id}">
                                                    <button class="btn btn-primary" type="submit">
                                                        <i class="bi bi-plus-square"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--        Modal thêm nhanh khách hàng--%>

        <!-- Modal khách hàng -->
        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h5 class="modal-title" id="exampleModalLabel1">Thêm khách hàng</h5>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="khachHangForm" method="post" action="/admin/ban-hang-tai-quay/create">
                            <div class="mb-3 mt-3">
                                <label class="form-label">Họ tên khách hàng:</label>
                                <input type="text" class="form-control" id="tenKhachHang" name="hoTen">
                                <p id="error-tenKhachHang" class="error2" style="color: red"></p>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Số điện thoại:</label>
                                <input type="text" class="form-control" id="soDienThoai" name="sdt">
                                <p id="error-soDienThoai" class="error2" style="color: red"></p>
                            </div>
                            <div class="mb-3 mt-3">
                                <label  class="form-label">Giới tính:</label>
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="gioiTinhNam" name="gioiTinh" value="1">Nam
                                    <label class="form-check-label" for="radio1"></label>
                                </div>
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="gioiTinhNu" name="gioiTinh" value="0">Nữ
                                    <label class="form-check-label" for="radio2"></label>
                                </div>
                                <p id="error-gioiTinh" class="error2" style="color: red"></p>
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
        <div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false" >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h5 class="modal-title" id="exampleModalLabel">Danh sách khách hàng</h5>
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
                                    <th style="text-align: center">Tên khách hàng</th>
                                    <th style="text-align: center">Số điện thoại</th>
                                    <th style="text-align: center">Chọn</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listKH}" var="kh">
                                    <tr>
                                        <td>${kh.hoTen}</td>
                                        <td>${kh.sdt}</td>
                                        <td>
                                            <form action="/admin/ban-hang-tai-quay/find-kh/${kh.id}" method="post" onsubmit="return validateBeforeAddToCart();">
                                                <input type="hidden" name="idHoaDon" value="${hoaDon.id}">
                                                <input type="hidden" name="maHoaDon" value="${hoaDon.ma}">
                                                <input type="hidden" class="form-control" name="ngayTao" value="${hoaDon.ngayTao}">
                                                <input type="hidden" value="${hoaDon.id}" id="selectedInvoiceId">
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
        </div>
        <%--End--%>

        <!-- Modal chi tiết sản phẩm -->
        <div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false" >
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h3 class="modal-title" id="exampleModalLabel4">Chi tiết sản phẩm</h3>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                    </div>
                    <div class="modal-body">

                        <%--          --%>
                        <div class="row">
                            <div class="col col-12">
                                <!-- Sản phẩm -->

                                <div class="row">
                                    <div class="col col-5">
                                        <input oninput="searchBySPCT(this)" type="text" name="search" class="form-control" placeholder="Tìm kiếm theo mã sản phẩm, màu sắc,..."
                                               aria-label="Recipient's username" aria-describedby="button-addon2" style="margin-bottom: 20px">
                                    </div>
                                </div>

                                <%--     Lọc theo thuộc tính   --%>
                                <form method="post" action="/admin/ban-hang-tai-quay/filter">
                                    <div class="row">
                                        <div class="col col-md-3">
                                            <div class="form-group">
                                                <label ><strong>Chọn sản phẩm</strong></label>
                                                <select class="form-control" id="combobox1">
                                                    <!-- Các option sẽ được nạp ở đây -->
                                                    <option value="">Tất cả</option>
                                                    <c:forEach items="${listSanPham}" var="sanPham">
                                                        <option value="${sanPham.id}">${sanPham.ten}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col col-md-2">
                                            <div class="form-group">
                                                <label ><strong>Chọn màu sắc</strong></label>
                                                <select class="form-control" id="combobox2">
                                                    <!-- Các option sẽ được nạp ở đây -->
                                                    <option value="">Tất cả</option>
                                                    <c:forEach items="${listMauSac}" var="mauSac">
                                                        <option value="${mauSac.id}">${mauSac.ten}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col col-md-2">
                                            <div class="form-group">
                                                <label ><strong>Chọn kích thước</strong></label>
                                                <select class="form-control" id="combobox3">
                                                    <!-- Các option sẽ được nạp ở đây -->
                                                    <option value="">Tất cả</option>
                                                    <c:forEach items="${listKichThuoc}" var="kichThuoc">
                                                        <option value="${kichThuoc.id}">${kichThuoc.ten}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col col-md-2">
                                            <div class="form-group">
                                                <label ><strong>Chọn chất liệu</strong></label>
                                                <select class="form-control" id="combobox4">
                                                    <!-- Các option sẽ được nạp ở đây -->
                                                    <option value="">Tất cả</option>
                                                    <c:forEach items="${listChatLieu}" var="chatLieu">
                                                        <option value="${chatLieu.id}">${chatLieu.ten}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col col-md-2">
                                            <div class="form-group">
                                                <label ><strong>Chọn kiểu tay</strong></label>
                                                <select class="form-control" id="combobox5">
                                                    <!-- Các option sẽ được nạp ở đây -->
                                                    <option value="">Tất cả</option>
                                                    <c:forEach items="${listKieuTay}" var="kieuTay">
                                                        <option value="${kieuTay.id}">${kieuTay.ten}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>


                                    </div>
                                </form>

                                <div class="table-scroll2">
                                    <table class="table table-hover" id="contentAjax2">
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

                                        <tbody id="chiTietSanPhamTableBody">
                                        <c:forEach varStatus="i" items="${listCTSP.content}" var="spct">
                                            <tr>
                                                <td>${i.index+1}</td>
                                                <td>${spct.idSanPham.ma}</td>
                                                <td>${spct.idSanPham.ten}</td>
                                                <td>${spct.idMauSac.ten}</td>
                                                <td>${spct.idKichThuoc.ten}</td>
                                                <td>${spct.idChatLieu.ten}</td>
                                                <td>${spct.idKieuTay.ten}</td>
                                                <td>${spct.soLuong}</td>
                                                <td class="price">${spct.giaBan}</td>
                                                <td>${spct.trangThai==1?"Còn hàng":"Hết hàng"}</td>
                                                <td>
                                                    <form action="/admin/ban-hang-tai-quay/add-san-pham/${spct.id}/${spct.giaBan}" method="post"
                                                          onsubmit="return validateBeforeAddToCart();">
                                                        <input type="hidden" name="idHoaDon" value="${hoaDon.id}"
                                                               id="selectedInvoiceId">
                                                            <%--                                                        <input type="hidden" name="donGia" value="${spct.giaBan}">--%>
                                                        <button class="btn btn-success" type="submit">+</button>
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
<%--<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"--%>
<%--     aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel3">Ready to Leave?</h5>--%>
<%--                <button class="close" type="button" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">×</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>--%>
<%--                <a class="btn btn-primary" href="login.html">Logout</a>--%>
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

    //Chuyển list khách hàng java -> js
    var listKH = []
    <c:forEach items="${listKH}" var="kh">
    var KhachHang = {};
    KhachHang.id = "${kh.id}";
    KhachHang.hoTen = "${kh.hoTen}";
    KhachHang.gioiTinh = "${kh.gioiTinh}";
    KhachHang.sdt = "${kh.sdt}";
    listKH.push(KhachHang);
    </c:forEach>

    //Validate form
    function isVietnamesePhoneNumber(phone) {
        const regex = /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/;
        return regex.test(phone);
    }

    function validateEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    function clearErrors() {
        document.querySelectorAll('.error').forEach(element => {
            element.textContent = '';
        });
    }

    function isValidFullName(fullName) {
        var regex = /^[a-zA-ZÀ-ỹ\s]+$/;
        return regex.test(fullName);
    }

    function clearErrors() {
        document.querySelectorAll('.error2').forEach(element => {
            element.textContent = '';
        });
    }

    //Thêm khách hàng
    document.getElementById('khachHangForm').addEventListener('submit', function(event) {

        event.preventDefault();
        clearErrors();
        // Get the form fields
        const tenKhachHang = document.getElementById('tenKhachHang').value.trim();
        const soDienThoai = document.getElementById('soDienThoai').value.trim();
        const gioiTinhNam = document.getElementById('gioiTinhNam').checked;
        const gioiTinhNu = document.getElementById('gioiTinhNu').checked;

        let hasError = false;

        // Validate name
        if (!tenKhachHang) {
            document.getElementById('error-tenKhachHang').textContent = 'Họ tên khách hàng không được để trống';
            hasError = true;
        }else if (!isValidFullName(tenKhachHang)){
            document.getElementById('error-tenKhachHang').textContent = 'Họ tên khách hàng chỉ được nhập chữ';
            hasError = true;
        }else if (tenKhachHang.length > 30){
            document.getElementById('error-tenKhachHang').textContent = 'Họ tên khách hàng không được quá 30 ký tự';
            hasError = true;
        }

        // Validate sđt
        if (!soDienThoai) {
            document.getElementById('error-soDienThoai').textContent = 'Số điện thoại không được để trống';
            hasError = true;
        } else if (!isVietnamesePhoneNumber(soDienThoai)) {
            document.getElementById('error-soDienThoai').textContent = 'Số điện thoại không hợp lệ';
            hasError = true;
        } else if (listKH.some(khachHang => khachHang.sdt === soDienThoai)) {
            document.getElementById('error-soDienThoai').textContent = 'Số điện thoại đã tồn tại';
            hasError = true;
        }

        // Validate gender
        if (!gioiTinhNam && !gioiTinhNu) {
            document.getElementById('error-gioiTinh').textContent = 'Giới tính không được để trống';
            hasError = true;
        }

        // Prevent form submission if validation fails
        if (hasError) {
            return;
        }

        event.preventDefault();
        Swal.fire({
            title: "Bạn có chắc chắn muốn thêm không?",
            text: "Bạn sẽ không thể hoàn tác hành động này!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Hủy",
            confirmButtonText: "Thêm"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Đã thêm!",
                    text: "Bạn đã thêm khách hàng thành công.",
                    icon: "success"
                }).then(() => {
                    // window.location.href = "/qlnv/quan-ly-nhan-vien";
                    document.getElementById('khachHangForm').submit();
                });
            }
        });

    });


    //kết thúc thêm nhanh khách hàng

    //check validate khi update số lượng ở giỏ hàng
    function validateForm(form) {
        var soLuong = form.soLuong.value;

        if (soLuong.trim() === "") {
            Swal.fire({
                title: 'Lỗi!',
                text: 'Số lượng không được để trống',
                icon: 'error',
                confirmButtonText: 'OK'
            });
            return false;
        }

        return true;
    }


    // Fomat ngày trên ô input
    function formatDateString(dateString) {
        const date = new Date(dateString);
        return date.toLocaleString();
    }
    const inputElement = document.getElementById('formatted-date');

    const originalDateString = inputElement.value;

    const formattedDateString = formatDateString(originalDateString);

    inputElement.value = formattedDateString;
    //Kết thúc


    // Fomat đúng định dạng ở tạo hóa đơn
    function formatDateString2(dateString) {
        const date = new Date(dateString);
        return date.toLocaleString();
    }
    // Get all the original date cells and formatted date cells
    const originalDateCells = document.querySelectorAll('.original-date');

    // Loop through each original date cell and format the date
    for (let i = 0; i < originalDateCells.length; i++) {
        const originalDateString = originalDateCells[i].innerText;
        const formattedDateString2 = formatDateString2(originalDateString);
        originalDateCells[i].innerText = formattedDateString2;
    }
    <%--// Function to format the date--%>
    <%--function formatDate(dateString) {--%>
    <%--    const date = new Date(dateString);--%>
    <%--    const day = String(date.getDate()).padStart(2, '0');--%>
    <%--    const month = String(date.getMonth() + 1).padStart(2, '0');--%>
    <%--    const year = date.getFullYear();--%>
    <%--    const hours = String(date.getHours()).padStart(2, '0');--%>
    <%--    const minutes = String(date.getMinutes()).padStart(2, '0');--%>
    <%--    const seconds = String(date.getSeconds()).padStart(2, '0');--%>

    <%--    console.log(`Formatted Date: ${day}/${month}/${year} ${hours}:${minutes}:${seconds}`);--%>

    <%--    return `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`;--%>
    <%--}--%>

    <%--// Apply the format to each cell--%>
    <%--document.querySelectorAll('.original-date').forEach(function(cell) {--%>
    <%--    const originalDate = cell.textContent.trim();--%>
    <%--    cell.textContent = formatDate(originalDate);--%>
    <%--});--%>

    <%--document.addEventListener('DOMContentLoaded', function() {--%>
    <%--    // Code to format dates--%>
    <%--    document.querySelectorAll('.original-date').forEach(function(cell) {--%>
    <%--        const originalDate = cell.textContent.trim();--%>
    <%--        cell.textContent = formatDate(originalDate);--%>
    <%--    });--%>
    <%--});--%>

    //Kết thúc


    document.addEventListener('DOMContentLoaded', function () {
        var highlightId = '${highlightId}';
        if (highlightId) {
            var rows = document.querySelectorAll('#myTable tbody tr');
            rows.forEach(function (row) {
                if (row.getAttribute('data-id') === highlightId) {
                    row.classList.add('highlight');
                }
            });
        }
    });


    //chọn phương thức hiển thị khi chọn radio
    document.addEventListener('DOMContentLoaded', (event) => {
        const radioButtons = document.querySelectorAll('input[name="optradio"]');
        const cashDiv = document.getElementById('cash-div');
        const vnpayDiv = document.getElementById('vnpay-div');

        radioButtons.forEach(radio => {
            radio.addEventListener('change', () => {
                if (radio.value === '1') {
                    cashDiv.classList.remove('hidden');
                    vnpayDiv.classList.add('hidden');
                } else if (radio.value === '2') {
                    cashDiv.classList.add('hidden');
                    vnpayDiv.classList.remove('hidden');
                }
            });
        });
    });

    // Fomat sang VNĐ bảng hóa đơn chi tiết
    function formatCurrencyVND(amount) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
    }

    document.querySelectorAll('.price').forEach(function(cell) {
        let amount = parseFloat(cell.textContent);
        cell.textContent = formatCurrencyVND(amount);
    });
    // End

    //input tổng tiền
    document.addEventListener('DOMContentLoaded', function() {
        var input = document.getElementById('tongTienKhiTruKM');
        var value = parseInt(input.value);

        var formattedValue = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(value);

        input.value = formattedValue;
    });

    //input tổng tiền
    document.addEventListener('DOMContentLoaded', function() {
        var input = document.getElementById('soTienGiamKM');
        var value = parseInt(input.value);

        var formattedValue = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(value);

        input.value = formattedValue;
    });
    //

    document.addEventListener('DOMContentLoaded', function() {
        var tongTienInput = document.getElementById('tongTien');
        var tienKhachDuaInput = document.getElementById('tienKhachDua');

        // Định dạng giá trị tổng tiền khi trang được tải
        var tongTien = parseInt(tongTienInput.value, 10);
        tongTienInput.value = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(tongTien);

        tienKhachDuaInput.addEventListener('input', function(event) {
            var value = tienKhachDuaInput.value.replace(/\D/g, ''); // Loại bỏ tất cả các ký tự không phải số
            if (value) {
                var formattedValue = new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(value);

                tienKhachDuaInput.value = formattedValue;
            }
        });

        tienKhachDuaInput.addEventListener('focus', function(event) {
            var value = tienKhachDuaInput.value.replace(/\D/g, ''); // Loại bỏ tất cả các ký tự không phải số
            tienKhachDuaInput.value = value;
        });

        tienKhachDuaInput.addEventListener('blur', function(event) {
            var value = tienKhachDuaInput.value.replace(/\D/g, ''); // Loại bỏ tất cả các ký tự không phải số
            if (value) {
                var formattedValue = new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(value);

                tienKhachDuaInput.value = formattedValue;
            }
        });

        // Hàm để lấy giá trị gốc
        function getRawValue(input) {
            var value = input.value.replace(/\D/g, ''); // Loại bỏ tất cả các ký tự không phải số
            return parseInt(value, 10);
        }

        // Hàm tính tiền trả lại
        window.calculateChange = function() {
            var tongTien = getRawValue(tongTienInput);
            var tienKhachDua = getRawValue(tienKhachDuaInput);

            console.log("Tổng tiền đầu: ", tongTienInput);
            console.log("Tổng tiền: ", tongTien);
            console.log("Tiền khách đưa: ", tienKhachDua);

            var tienTraLai = (tienKhachDua - tongTien);
            console.log("Tiền trả lại: ", tienTraLai);
            var thongBao = document.getElementById("errTraLai");

            if (isNaN(tienKhachDua)) {
                thongBao.textContent = "Vui lòng nhập số tiền hợp lệ.";
                return false;
            }

            if (tienKhachDua < tongTien) {
                thongBao.textContent = "Số tiền khách đưa phải lớn hơn hoặc bằng tổng tiền.";
                document.getElementById('tienTraLai').value = "";
                return false;
            }

            // Hiển thị số tiền trả lại trong trường "Trả lại"
            var formattedValue = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(tienTraLai);

            document.getElementById('tienTraLai').value = formattedValue;
            thongBao.textContent = "";
            return true;
        }
    });

    //xóa sản phẩm trong giỏ hàng
    document.querySelectorAll('.delete-button2').forEach(button => {
        button.addEventListener('click', function() {
            const form = this.closest('.delete-form');
            Swal.fire({
                title: 'Bạn có muốn xóa không??',
                text: "Dữ liệu này sẽ không thể khôi phục lại!",
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

    //hủy hóa đơn
    <%--document.getElementById('cancelOrder3').addEventListener('click', function(event) {--%>
    <%--    event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>--%>

    <%--    var listHDCT = [];--%>
    <%--    <c:forEach items="${listHDCT}" var="hdct">--%>
    <%--    var HoaDonCT = {};--%>
    <%--    HoaDonCT.id = "${hdct.id}";--%>
    <%--    listHDCT.push(HoaDonCT);--%>
    <%--    </c:forEach>--%>

    <%--    if (listHDCT.some(hoaDonCT => hoaDonCT.id != null)) {--%>
    <%--        Swal.fire({--%>
    <%--            title: 'Bạn có muốn hủy đơn không?',--%>
    <%--            icon: 'warning',--%>
    <%--            showCancelButton: true,--%>
    <%--            confirmButtonColor: '#3085d6',--%>
    <%--            cancelButtonColor: '#d33',--%>
    <%--            confirmButtonText: 'Có, hủy đơn!',--%>
    <%--            cancelButtonText: 'Không'--%>
    <%--        }).then((result) => {--%>
    <%--            if (result.isConfirmed) {--%>
    <%--                var ghiChu = document.getElementById('ghiChu2').value;--%>
    <%--                let hasError = false;--%>
    <%--                if (ghiChu==""){--%>
    <%--                    document.getElementById('error-ghiChu2').textContent = 'Vui lòng nhập lý do';--%>
    <%--                    hasError=true;--%>
    <%--                }else {--%>
    <%--                    var url = "/admin/ban-hang-tai-quay/delete-hoa-don?ghiChu=" + encodeURIComponent(ghiChu);--%>
    <%--                    // Chuyển hướng đến URL để hủy đơn cùng với ghi chú--%>
    <%--                    window.location.href = url;--%>
    <%--                }--%>
    <%--            }--%>
    <%--        });--%>
    <%--    } else {--%>
    <%--        Swal.fire({--%>
    <%--            title: 'Lỗi!',--%>
    <%--            text: 'Giỏ hàng không có sản phẩm.',--%>
    <%--            icon: 'error',--%>
    <%--            confirmButtonText: 'Đóng'--%>
    <%--        });--%>
    <%--    }--%>
    <%--});--%>

    //


    //hủy hóa đơn
    document.getElementById('cancelOrder2').addEventListener('click', function(event) {
        event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

        var listHDCT = [];
        <c:forEach items="${listHDCT}" var="hdct">
        var HoaDonCT = {};
        HoaDonCT.id = "${hdct.id}";
        listHDCT.push(HoaDonCT);
        </c:forEach>

        if (listHDCT.some(hoaDonCT => hoaDonCT.id != null)) {
            Swal.fire({
                title: 'Bạn có muốn hủy đơn không?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Có, hủy đơn!',
                cancelButtonText: 'Không'
            }).then((result) => {
                if (result.isConfirmed) {
                    var ghiChu = document.getElementById('ghiChu').value;
                    let hasError = false;
                    if (ghiChu==""){
                        document.getElementById('error-ghiChu').textContent = 'Vui lòng nhập lý do';
                        hasError=true;
                    }else {
                        var url = "/admin/ban-hang-tai-quay/delete-hoa-don?ghiChu=" + encodeURIComponent(ghiChu);
                        // Chuyển hướng đến URL để hủy đơn cùng với ghi chú
                        window.location.href = url;
                    }
                }
            });
        } else {
            Swal.fire({
                title: 'Lỗi!',
                text: 'Giỏ hàng không có sản phẩm.',
                icon: 'error',
                confirmButtonText: 'Đóng'
            });
        }
    });

    //

    //hủy hóa đơn
    document.getElementById('cancelOrder').addEventListener('click', function(event) {
        event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>


        var listHDCT = []
        <c:forEach items="${listHDCT}" var="hdct">
        var HoaDonCT = {};
        HoaDonCT.id = "${hdct.id}";
        listHDCT.push(HoaDonCT);
        </c:forEach>



        if (listHDCT.some(hoaDonCT => hoaDonCT.id != null)){
            Swal.fire({
                title: 'Bạn có muốn hủy đơn không?',
                // text: "Bạn không thể hoàn tác hành động này!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Có, hủy đơn!',
                cancelButtonText: 'Không'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Chuyển hướng đến URL để hủy đơn
                    window.location.href = "/admin/ban-hang-tai-quay/delete-hoa-don/${hoaDon.id}";
                }
            })
        }else{
            // thongBao.textContent =  "Vui lòng kiểm tra lại thanh toán";
            Swal.fire({
                title: 'Lỗi!',
                text: 'Giỏ hàng không có sản phẩm.',
                icon: 'error',
                confirmButtonText: 'Đóng'
            });
        }


    });
    //

    function searchByName(param){
        var txtSearch = param.value;
        console.log(txtSearch);
        $.ajax({
            url: "/admin/ban-hang-tai-quay/search/${hoaDon.id}",
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

    <%--    &lt;%&ndash;    &ndash;%&gt;--%>
    <%--    function calculateChange() {--%>
    <%--        var tongTien = parseInt(document.getElementById('tongTien').value);--%>
    <%--        var tienKhachDua = parseInt(document.getElementById('tienKhachDua').value)*1000;--%>
    <%--        console.log("Tổng tiền: ",tongTien);--%>
    <%--        console.log("Tiền khách đưa: ",tienKhachDua);--%>

    <%--        var tienTraLai = (tienKhachDua - tongTien);--%>
    <%--        console.log("Tiền trả lại: ",tienTraLai);--%>
    <%--        var thongBao = document.getElementById("errTraLai");--%>
    <%--        if (isNaN(tienKhachDua)) {--%>
    <%--            thongBao.textContent = "Vui lòng nhập số tiền hợp lệ.";--%>
    <%--            return false;--%>
    <%--        }--%>

    <%--        if (tienKhachDua == "" || tienKhachDua < tongTien) {--%>
    <%--            thongBao.textContent = "Số tiền khách đưa phải lớn hơn hoặc bằng tổng tiền.";--%>
    <%--            // alert('Số tiền khách đưa phải lớn hơn hoặc bằng tổng tiền.');--%>
    <%--            document.getElementById('tienTraLai').value = "";--%>
    <%--            return false;--%>
    <%--        }--%>

    <%--        // Hiển thị số tiền trả lại trong trường "Trả lại"--%>
    <%--        var formattedValue = new Intl.NumberFormat('vi-VN', {--%>
    <%--            style: 'currency',--%>
    <%--            currency: 'VND'--%>
    <%--        }).format(tienTraLai);--%>

    <%--        document.getElementById('tienTraLai').value = formattedValue;--%>
    <%--        thongBao.textContent="";--%>
    <%--        return true;--%>
    <%--    }--%>



    function checkValidateAfterUpdate(){

        var soLuongNhap = parseInt(document.querySelectorAll("#soLuong").value);
        var soLuongCu = parseInt(document.querySelectorAll("#soLuongCu").value);
        var tongSL22 = parseInt(document.querySelectorAll("#tongSL").value);
        var tt = soLuongCu+tongSL22

        console.log(soLuongNhap)
        console.log(soLuongCu)
        console.log(tongSL22)

        if (soLuongNhap<=0){
            Swal.fire({
                title: 'Lỗi!',
                text: 'Số lượng phải lớn hơn 0!',
                icon: 'error',
                confirmButtonText: 'OK'
            });
            return false;
        }

        if (soLuongNhap>tt){
            Swal.fire({
                title: 'Lỗi!',
                text: 'Số lượng nhập lớn hơn số lượng trong kho',
                icon: 'error',
                confirmButtonText: 'OK'
            });
            return false;
        }

        return true;
    }


    function validateBeforeAddToCart() {
        // Kiểm tra xem hóa đơn đã được chọn chưa
        var selectedInvoiceId = document.getElementById("selectedInvoiceId").value;

        if (selectedInvoiceId === "") {
            Swal.fire({
                title: 'Lỗi!',
                text: 'Vui lòng chọn hóa đơn.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
            return false; // Ngăn chặn sự kiện click nút "+"
        }

        return true; // Cho phép thêm sản phẩm vào giỏ hàng nếu đã chọn hóa đơn
    }

    // function validateThanhToan() {
    //     // Get the button element
    //     var checkBtn = document.getElementById("checkBtn");
    //
    //     // Get the idhd attribute value
    //     var idhd = checkBtn.getAttribute("idhd");
    //     console.log(idhd);
    //
    //     // Check if idhd is null or empty
    //     if (idhd=="") {
    //         alert("Vui lòng chọn hóa đơn.");
    //         return false; // Prevent form submission
    //     }
    //
    //     return true; // Allow form submission
    // }

    function validateAddToMaGiamGia(){
        // Kiểm tra xem hóa đơn đã được chọn chưa
        var selectedMaGiamGia = document.getElementById("selectedMaGiamGia").value;

        if (selectedMaGiamGia === "") {
            Swal.fire({
                title: 'Lỗi!',
                text: 'Vui lòng chọn hóa đơn trước khi thêm mã giảm giá vào giỏ hàng.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
            return false; // Ngăn chặn sự kiện click nút "+"
        }

        return true; // Cho phép thêm sản phẩm vào giỏ hàng nếu đã chọn hóa đơn
    }




    const deleteButtons = document.querySelectorAll('.delete-button');
    const checkBtn = document.querySelectorAll('#checkBtn');
    // Thêm sự kiện click cho từng nút
    deleteButtons.forEach(button => {
        button.addEventListener('click', function () {
            const idhd = this.getAttribute('idhd');
            Swal.fire({
                title: 'Bạn có muốn xóa không?',
                text: "Bạn sẽ không thể khôi phục lại dữ liệu này!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Vâng, xóa nó!',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Thực hiện hành động xóa ở đây, ví dụ:
                    // Gửi yêu cầu AJAX tới server để xóa dữ liệu
                    fetch(`/admin/ban-hang-tai-quay/delete-hoa-don/`+idhd, { method: 'GET' }).then(() => {
                        Swal.fire(
                            'Đã xóa!',
                            'Dữ liệu của bạn đã bị xóa.',
                            'success'
                        );
                        // Xóa hàng khỏi bảng sau khi xóa thành công
                        button.closest('tr').remove();
                    });
                    button.closest('tr').remove();
                }
            });
        });
    });




    checkBtn.forEach(button => {
        button.addEventListener('click', function () {
            console.log("test check btn");
            var idHD = document.getElementsByName("idHD")[0].value;
            var idKH  = document.getElementsByName("idKH")[0].value;
            var idKhuyenMai = document.getElementsByName("idKhuyenMai")[0].value;
            // var tongTien = document.getElementsByName("tongTien")[0].value;
            var thongBao = document.getElementById("errTraLai");
            // var tongTien = parseInt(document.getElementById("tongTienKhiTruKM").value);

            var tongTienInput = document.getElementById('tongTien');
            function getRawValue(input) {
                var value = input.value.replace(/\D/g, ''); // Loại bỏ tất cả các ký tự không phải số
                return parseInt(value, 10);
            }
            var tongTien = getRawValue(tongTienInput);

            var tongTienInput = document.getElementById('tongTien');
            var tienKhachDuaInput = document.getElementById('tienKhachDua');
            var testTTKhachDua = getRawValue(tienKhachDuaInput);

            var moneyGiven = parseInt(document.getElementById("tienKhachDua").value);
            var thongBao = document.getElementById("errTraLai");
            console.log("====================== id hd:",idHD);
            console.log("====================== id kh:",idKH);
            console.log("====================== id khuyen mai:",idKhuyenMai);
            console.log("====================== tong tien:",tongTien);
            console.log("====================== money given:",testTTKhachDua);

            if(!isNaN(moneyGiven)&&!isNaN(tongTien)&&testTTKhachDua>=tongTien){
                Swal.fire({
                    title: 'Xác nhận thanh toán?',
                    text: "Dữ liệu sẽ được lưu lại!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Vâng,Thanh toán!',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        fetch(`/admin/ban-hang-tai-quay/thanh-toan/`+idHD+'?idKhuyenMai='+idKhuyenMai+'&idKH='+idKH+'&tongTien='+tongTien,
                            { method: 'POST' }).then(() => {
                            Swal.fire(
                                'Đã thanh toán!',
                                'Dữ liệu đã được ghi nhận.',
                                'success'
                            ).then(() => {
                                window.location.href = '/admin/ban-hang-tai-quay/hien-thi';
                            });
                            button.closest('tr').remove();
                        });
                        button.closest('tr').remove();
                        thongBao.textContent =  "";
                    }
                });
            }
            else if (testTTKhachDua<tongTien){
                // thongBao.textContent =  "Vui lòng kiểm tra lại thanh toán";
                Swal.fire({
                    title: 'Lỗi!',
                    text: 'Vui lòng kiểm tra lại tiền khách đưa khi thanh toán.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
            else if (tongTien===null){
                // thongBao.textContent =  "Vui lòng kiểm tra lại thanh toán";
                Swal.fire({
                    title: 'Lỗi!',
                    text: 'Vui lòng kiểm tra lại tiền khách đưa khi thanh toán111111111.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
            else{
                // thongBao.textContent =  "Vui lòng kiểm tra lại thanh toán";
                Swal.fire({
                    title: 'Lỗi!',
                    text: 'Vui lòng nhập tiền khách đưa trước khi thanh toán.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
        });
    });


    //Test button VNPay
    // const checkBtn2 = document.querySelectorAll('#checkBtn2');
    // checkBtn2.forEach(button => {
    //     button.addEventListener('click', function () {
    //         console.log("test check btn");
    //         var idHD = document.getElementsByName("idHD")[0].value;
    //         var idKH  = document.getElementsByName("idKH")[0].value;
    //         var idKhuyenMai = document.getElementsByName("idKhuyenMai")[0].value;
    //
    //         var tongTienInput = document.getElementById('tongTien');
    //         function getRawValue(input) {
    //             var value = input.value.replace(/\D/g, ''); // Loại bỏ tất cả các ký tự không phải số
    //             return parseInt(value, 10);
    //         }
    //         var tongTien = getRawValue(tongTienInput);
    //
    //         console.log("====================== id hd:",idHD);
    //         console.log("====================== id kh:",idKH);
    //         console.log("====================== id khuyen mai:",idKhuyenMai);
    //         console.log("====================== tong tien:",tongTien);
    //         if(!isNaN(tongTien)){
    //             Swal.fire({
    //                 title: 'Xác nhận thanh toán?',
    //                 text: "Dữ liệu sẽ được lưu lại!",
    //                 icon: 'warning',
    //                 showCancelButton: true,
    //                 confirmButtonColor: '#3085d6',
    //                 cancelButtonColor: '#d33',
    //                 confirmButtonText: 'Vâng,Thanh toán!',
    //                 cancelButtonText: 'Hủy'
    //             }).then((result) => {
    //                 if (result.isConfirmed) {
    //                     fetch(`/ban-hang-tai-quay/pay/`+idHD+'?idKhuyenMai='+idKhuyenMai+'&idKH='+idKH+'&tongTien='+tongTien,
    //                         { method: 'POST' }).then(() => {
    //                         Swal.fire(
    //                             'Đã thanh toán!',
    //                             'Dữ liệu đã được ghi nhận.',
    //                             'success'
    //                         )
    //                             .then(() => {
    //                             window.location.href = '/ban-hang-tai-quay';
    //                         });
    //                         button.closest('tr').remove();
    //                     });
    //                     button.closest('tr').remove();
    //                     thongBao.textContent =  "";
    //                 }
    //             });
    //         }
    //         else{
    //             // thongBao.textContent =  "Vui lòng kiểm tra lại thanh toán";
    //             Swal.fire({
    //                 title: 'Lỗi!',
    //                 text: 'Vui lòng nhập tiền khách đưa trước khi thanh toán.',
    //                 icon: 'error',
    //                 confirmButtonText: 'OK'
    //             });
    //         }
    //     });
    // });


    //C2
    document.querySelectorAll('.thanhToan-button2').forEach(button => {
        button.addEventListener('click', function() {
            const form = this.closest('.thanhToan-form');
            Swal.fire({
                title: 'Bạn có muốn thanh toán không??',
                text: "Dữ liệu này sẽ được lưu lại!",
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

    // Kết thúc test VNPay

</script>
<script>
    function searchBySPCT(param){
        var txtSearch = param.value;
        console.log(txtSearch);
        $.ajax({
            url: "/admin/ban-hang-tai-quay/searchSPCT",
            type: "POST",
            data: {
                search:txtSearch
            },
            success: function (data) {
                // var row = document.getElementById("content");
                // row.innerHTML = data;
                $('#contentAjax2').empty()
                $('#contentAjax2').append(data);

                console.log(data);
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }


    //
    function searchByName(param){
        var txtSearch = param.value;
        console.log(txtSearch);
        $.ajax({
            url: "/admin/ban-hang-tai-quay/search/${hoaDon.id}",
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

    //Lọc sản phẩm
    $(document).ready(function(){
        $('#combobox1').on('change', function() {
            var productId = $(this).val();
            if (productId==""){
                $.ajax({
                    url: "/admin/ban-hang-tai-quay/locSPCTTheoAll",
                    type: 'GET',
                    success: function(data) {
                        $('#contentAjax2').empty()
                        $('#contentAjax2').append(data);
                    }
                });
            }else {
                $.ajax({
                    url: "/admin/ban-hang-tai-quay/locSPCTBySanPham/"+productId,
                    type: 'GET',
                    data: {id: productId},
                    success: function(data) {
                        $('#contentAjax2').empty()
                        $('#contentAjax2').append(data);
                    }
                });
            }
        });
    });

    //Lọc màu sắc
    $(document).ready(function(){
        $('#combobox2').on('change', function() {
            var productId = $(this).val();
            if (productId==""){
                $.ajax({
                    url: "/admin/ban-hang-tai-quay/locSPCTTheoAll",
                    type: 'GET',
                    success: function(data) {
                        $('#contentAjax2').empty()
                        $('#contentAjax2').append(data);
                    }
                });
            }else {
                $.ajax({
                    url: "/admin/ban-hang-tai-quay/locSPCTByMauSac/"+productId,
                    type: 'GET',
                    data: {id: productId},
                    success: function(data) {
                        $('#contentAjax2').empty()
                        $('#contentAjax2').append(data);
                    }
                });
            }

        });
    });

    //Lọc kích thước
    $(document).ready(function(){
        $('#combobox3').on('change', function() {
            var productId = $(this).val();
            if (productId==""){
                $.ajax({
                    url: "/admin/ban-hang-tai-quay/locSPCTTheoAll",
                    type: 'GET',
                    success: function(data) {
                        $('#contentAjax2').empty()
                        $('#contentAjax2').append(data);
                    }
                });
            }else {
                $.ajax({
                    url: "/admin/ban-hang-tai-quay/locSPCTByKichThuoc/"+productId,
                    type: 'GET',
                    data: {id: productId},
                    success: function(data) {
                        $('#contentAjax2').empty()
                        $('#contentAjax2').append(data);
                    }
                });
            }
        });
    });

    //Lọc chất liệu
    $(document).ready(function(){
        $('#combobox4').on('change', function() {
            var productId = $(this).val();
            if (productId==""){
                $.ajax({
                    url: "/admin/ban-hang-tai-quay/locSPCTTheoAll",
                    type: 'GET',
                    success: function(data) {
                        $('#contentAjax2').empty()
                        $('#contentAjax2').append(data);
                    }
                });
            }else {
                $.ajax({
                    url: "/admin/ban-hang-tai-quay/locSPCTByChatLieu/"+productId,
                    type: 'GET',
                    data: {id: productId},
                    success: function(data) {
                        $('#contentAjax2').empty()
                        $('#contentAjax2').append(data);
                    }
                });
            }
        });
    });

    //Lọc theo kiểu tay
    $(document).ready(function(){
        $('#combobox5').on('change', function() {
            var productId = $(this).val();
            console.log("Id kiểu tay: ",productId)
            if (productId==""){
                $.ajax({
                    url: "/admin/ban-hang-tai-quay/locSPCTTheoAll",
                    type: 'GET',
                    success: function(data) {
                        $('#contentAjax2').empty()
                        $('#contentAjax2').append(data);
                    }
                });
            }else {
                $.ajax({
                    url: "/admin/ban-hang-tai-quay/locSPCTByKieuTay/"+productId,
                    type: 'GET',
                    data: {id: productId},
                    success: function(data) {
                        $('#contentAjax2').empty()
                        $('#contentAjax2').append(data);
                    }
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