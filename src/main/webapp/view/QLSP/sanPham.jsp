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
    <title>Quản lý sản phẩm </title>
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
        /* Base styles for the collapse items */
        .collapse-item {
            display: block;
            padding: 0.5rem 1rem;
            color: #333; /* Default text color */
            text-decoration: none; /* Remove underline */
            border-radius: 0.25rem; /* Optional: rounded corners */
            transition: background-color 0.2s, color 0.2s; /* Smooth transition */
        }

        /* Hover effect */
        .collapse-item:hover,
        .collapse-item:focus {
            background-color: #007bff; /* Change to your preferred hover color */
            color: white; /* Change text color on hover */
        }

        /* Active state (when clicked) */
        .collapse-item.active,
        .collapse-item:active {
            background-color: #0056b3; /* Darker shade for active state */
            color: white; /* Ensure text color contrasts with background */
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

    <!--   -----------   -->
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
                            <a class="dropdown-item" href="" id="dang-xuat" data-toggle="modal"
                               data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Đăng xuất
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>

            <!-- start searchsp -->
            <div class="container-fluid bg-white">
                <h2>Quản lý sản phẩm</h2>
                <div class="row mt-3 ms-2">
                    <div class="col col-md-3">
                        <input id="tenSPSearch" type="text" class="form-control bg-light border-0 small"
                               placeholder="Search for..."
                               aria-label="Search" aria-describedby="basic-addon2">
                    </div>

                    <div class="col col-md-2">
                        <div class="dropdown">
                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                    id="lblTrangThaiSearch" data-bs-toggle="dropdown" aria-expanded="false">
                                Chọn trạng thái
                            </button>
                            <ul id="cboTrangThaiSearch" class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
                                <li><a class="dropdown-item" onclick="setTrangThaiSearch(1)">Hoạt động</a></li>
                                <li><a class="dropdown-item" onclick="setTrangThaiSearch(0)">Dừng hoạt động</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col col-md-3 d-flex gap-3">
                        <button id="btnSearch" class="btn btn-success me-2" onclick="search(event)">
                            Tìm kiếm
                        </button>
                        <button id="btnRefresh" class="btn btn-success me-2" onclick="refreshSearch(event)">
                            Refresh
                        </button>
                    </div>

                </div>
                <div class="d-flex flex-row-reverse mt-5">
                    <div class="d-flex">
                        <button id="btnAdd" class="btn btn-primary me-2" data-bs-toggle="modal"
                                data-bs-target="#ModalAdd" style="width: 150px">Thêm
                            nhanh
                        </button>
                    </div>
                    <div class="d-flex">
                        <button id="btnOpenModalMultipleAdd" class="btn btn-primary me-2" data-bs-toggle="modal"
                                data-bs-target="#ModalMultipleAdd">Thêm sản phẩm
                        </button>
                    </div>
                </div>
                <table class="table table-hover mt-2">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Hình ảnh</th>
                        <th>Mã</th>
                        <th>Tên</th>
                        <th>Ngày tạo</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody id="tbl_ds_sp">

                    </tbody>
                </table>
            </div>

            <div class="col-12 pb-1" id="paginationBox">
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
        <!-- ModalSPAdd-->
        <div class="modal fade" id="ModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h3 class="modal-title" id="exampleModalLabelAdd">Thêm mới sản phẩm</h3>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    </div>
                    <div class="modal-body d-flex gap-2">
                        <div>
                            <div class="mb-3">
                                <label for="tenSPAdd" class="form-label">Tên sản phẩm</label>
                                <input style="width: 450px" type="text" class="form-control" id="tenSPAdd">
                                <p style="color: red;" id="tenSPAddErr"></p>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch" id="trangThaiAdd"
                                       checked>
                                <label class="form-check-label" for="trangThaiAdd" id="trangThaiLabeladd"></label>
                            </div>
                            <button type="submit" id="saveAddBtn" class="btn btn-primary">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--End modal --%>

        <!-- MultipleAddModal-->
        <div class="modal fade" id="ModalMultipleAdd" tabindex="-1" aria-labelledby="exampleModalLabel4"
             aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h3 class="modal-title">Thêm sản phẩm bao gồm các sản phẩm chi tiết</h3>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="overflow-y: auto; height: 80vh;">
                        <div class="" style="overflow-y: auto; height: 80vh;">
                            <div class="mb-3">
                                <div class="row" style="gap: 10px;">
                                    <div class="col col-md-12">
                                        <div class="d-flex" style="gap: 10px;">
                                            <p style="width: 70px;">Tên SP:</p>
                                            <div>
                                                <input type="text" id="tensp"
                                                       class="w-full p-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                                       placeholder="Nhập tên sản phẩm" style="width: 485px ">
                                                <p style="color: red;" class="ms-4" id="tenSPErr"></p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-flex gap-5">
                                        <div class="d-flex" style="width: fit-content">
                                            <p class="mt-2" style="width: 80px;">Chất liệu: </p>
                                            <div class="icon-container">
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
                                        <h5>Sản phẩm bao gồm các màu sắc:</h5>
                                        <div class="d-flex">
                                            <p class="mt-2" style="width: 80px;">Màu sắc: </p>
                                            <div class="icon-container">
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
                                    <h5>Mỗi màu sắc bao gồm các kích thước: </h5>
                                    <div id="kichThuocWrapper">

                                    </div>

                                </div>
                                <button id="saveMultipleAddBtn" class="btn btn-primary me-5">Lưu</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--End modal --%>
        <!-- ModalSPEdit-->
        <div class="modal fade" id="ModalEdit" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h3 class="modal-title" id="exampleModalLabel4">Chỉnh sửa sản phẩm</h3>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex gap-2">
                        <div class="border">
                            <img id="hinhAnhEditDisplay" width="150" height="200" alt="">
                        </div>
                        <div>
                            <div class="mb-3">
                                <label for="tenSPEdit" class="form-label">Tên sản phẩm</label>
                                <input type="text" style="width: 300px;" class="form-control" id="tenSPEdit" value="">
                                <p style="color: red;" id="tenSPEditErr"></p>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch" id="trangThaiEdit"
                                       checked>
                                <label class="form-check-label" for="trangThaiEdit" id="trangThaiLabeledit">Trạng
                                    thái</label>
                            </div>
                            <button id="saveEditBtn" class="btn btn-primary">Lưu</button>
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

    // change sttlbl add
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

<script>
    let idSPLocal = "";
    let currentPage = 1;
    let totalPage = 0;
    const loadDSSP = (pageParams) => {
        // Fetch data from the API with the given page parameter
        fetch("/san-pham/index?page=" + pageParams, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(resp => {
                let html = '';

                // Iterate over the response data
                resp.forEach(function (sp, i) {
                    const maSanPham = sp.ma || 'N/A';
                    const tenSanPham = sp.ten || 'N/A';
                    const hinhAnh = sp.hinhAnh || null;
                    const ngayTao = sp.ngayTao || 'N/A';
                    const trangThai = sp.trangThai === 1
                        ? '<p style="font-weight: bold; color: blue">Hoạt động</p>'
                        : '<p style="font-weight: bold; color: red">Dừng HĐ</p>';

                    // Build the HTML row for each product using string concatenation
                    html += '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' +
                        '<img src="' + (hinhAnh ? "/image/" + hinhAnh : "/image-icon/placeholder.jpg") + '" ' +
                        'alt="Image" ' +
                        'style="width: 50px; height: 60px" ' +
                        'class="img-fluid rounded border" />' +
                        '</td>' +
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

                // Insert the generated HTML into the table body
                document.getElementById("tbl_ds_sp").innerHTML = html;
            })
            .catch(function (error) {
                console.error("Error loading products:", error);
                // You can add additional error handling here if needed
            });
    };


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
            currentPage = newIndex;
            loadDSSP();
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
                //continue
                hinhAnhDisplay.src = resp.hinhAnh ? "/image/" + resp.hinhAnh : "/image-icon/placeholder.jpg";
                if (resp.trangThai == 1) {
                    trangThaiEdit.checked = true;
                    labelElementedit.textContent = "Đang hoạt động";
                } else {
                    trangThaiEdit.checked = false;
                    labelElementedit.textContent = "Dừng hoạt động";
                }
            });
    });
    saveEditBtn.addEventListener('click', function (e) {
        e.preventDefault();
        console.log("test check btn");
        var tenSP = document.getElementById('tenSPEdit').value;
        var trangThaiRaw = document.getElementById('trangThaiEdit').checked;
        var tenSperr = document.getElementById("tenSPEditErr");
        let trangThai = 0;
        let sttCheck = 0;
        console.log("====================== ten sp:", tenSP);
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
        if (sttCheck == 1) {
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
                        hinhAnh: "pendingIMG",
                        trangThai: trangThai
                    };
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

        }
    });


    $(document).on('click', "button[id^='detailSPBtn_']", e => {
        e.preventDefault();
        const queryString = window.location.pathname;
        const pathParts = queryString.split('/');
        const pathVariable = pathParts[pathParts.length - 1];
        const spid = e.currentTarget.id.replace("detailSPBtn_", "");
        console.log("====================test id button detail: ", spid);
        window.location.href = '/admin/quan-ly-san-pham/' + spid;
    });


    function getFileName(fullPath) {
        // Check for the last occurrence of the backslash or forward slash
        var startIndex = Math.max(fullPath.lastIndexOf('\\'), fullPath.lastIndexOf('/'));
        // Extract the file name
        var fileName = fullPath.substring(startIndex + 1);
        return fileName;
    }

    function validateNull(param) {
        if (param === "" || param === undefined) {
            return true;
        } else {
            return false;
        }
    }


</script>
<script>
    const saveAddBtn = document.querySelectorAll('#saveAddBtn');
    saveAddBtn.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            console.log("test check btn");

            var tenSP = document.getElementById('tenSPAdd').value;
            var trangThairaw = document.getElementById('trangThaiAdd').checked;
            var tenSperr = document.getElementById("tenSPAddErr");
            const encodedTenSP = encodeURIComponent(tenSP);
            let sttCheck = 0;

            // Validate product name
            if (validateNull(tenSP)) {
                tenSperr.textContent = "Vui lòng nhập tên sản phẩm";
            } else {
                tenSperr.textContent = "";
                sttCheck++;
            }

            if (sttCheck === 1) {
                fetch(`/san-pham/check-duplicate?tenSP=`+encodedTenSP, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify()
                }).then(response => response.json()).then(data => {
                    console.log("test check duplicate response: ", data);
                    console.log("test ten sp: ", tenSP);
                    if (!data) {
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
                                    trangThai: trangThairaw ? 1 : 0,
                                };

                                fetch(`/san-pham/save`, {
                                    method: 'POST',
                                    headers: {
                                        'Content-Type': 'application/json'
                                    },
                                    body: JSON.stringify(data)
                                }).then(response => {
                                    if (response.ok) {
                                        Swal.fire(
                                            'Đã lưu!',
                                            'Dữ liệu đã được ghi nhận.',
                                            'success'
                                        ).then(() => {
                                            // Fetch the total product count for pagination
                                            fetch("/san-pham/count", {
                                                headers: {
                                                    'Accept': 'application/json',
                                                    'Content-Type': 'application/json'
                                                }
                                            }).then(response => response.json())
                                                .then(totalProducts => {
                                                    const lastPage = Math.ceil(totalProducts / 20);
                                                    loadDSSP(lastPage);
                                                    currentPage = lastPage;
                                                    loadTotalPagination(currentPage);
                                                }).catch(error => {
                                                console.error('Error fetching pagination data:', error);
                                            });
                                        });
                                    } else {
                                        Swal.fire(
                                            'Lỗi!',
                                            'Đã xảy ra lỗi trong quá trình lưu dữ liệu.',
                                            'error'
                                        );
                                    }
                                }).catch(error => {
                                    console.error('Error saving product data:', error);
                                    Swal.fire(
                                        'Lỗi!',
                                        'Đã xảy ra lỗi trong quá trình lưu dữ liệu.',
                                        'error'
                                    );
                                });
                            }
                        });
                    } else {
                        tenSperr.textContent = "Tên sản phẩm trùng"
                    }
                })
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

    // change sttlbl addl

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
    let spct = {
        idSp: "",
        idMauSac: "",
        idKichThuoc: "",
        idChatLieu: "",
        idKieuTay: "",
        moTa: "",
        soLuong: "",
        giaNhap: "",
        giaBan: "",
        trangThai: ""
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
    const lblTrangThaiSearch = document.getElementById("lblTrangThaiSearch");
    const iconAddMoreCboMauSac = document.getElementById("iconAddMoreCboMauSac");
    const iconAddMoreCboKichThuoc = document.getElementById("iconAddMoreCboKichThuoc");
    const iconRemoveMoreCboMauSac = document.getElementById("iconRemoveMoreCboMauSac");
    const iconRemoveMoreCboKichThuoc = document.getElementById("iconRemoveMoreCboKichThuoc");
    let lstKichThuoc = [];
    let lstMauSac = [];
    let lstMauSacShadow = [];
    let idMauSacAdd = "";
    let idKichThuocAdd = "";
    let idChatLieuAdd = "";
    let idKieuTayAdd = "";
    let idTrangThaiSearch = "";
    let howManyCboMauSac = 1;
    let howManyCboKichThuoc = 0;
    let howManyCboMauSacMemo = 0;
    let howManyCboKichThuocMemo = 0;
    size = [];
    let dataCell = {id: "", name: "", size: size, amount: 0};
    let lstDataSet = [];
    let checkChooseDropdown = "";
    let tenSPSearch = "";


    function search(e) {
        e.preventDefault(); // Prevent default form submission behavior
        let html = '';
        let searchText = document.getElementById("tenSPSearch").value.trim();
        if (searchText !== "") {
            idTrangThaiSearch = "";
            document.getElementById("lblTrangThaiSearch").textContent = "Trạng thái";
            searchTyping(); // If there's a search term, call searchTyping
        }
        else{
            fetch("/san-pham/searchsp?trangThai=" + encodeURIComponent(idTrangThaiSearch), {
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                }
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(spList => {
                    // Build HTML for search results
                    spList.forEach((sp, i) => {
                        const maSanPham = sp.ma || 'N/A';
                        const tenSanPham = sp.ten || 'N/A';
                        const hinhAnh = sp.hinhAnh || null;
                        const ngayTao = sp.ngayTao || 'N/A';
                        const trangThai = sp.trangThai === 1
                            ? '<p style="font-weight: bold; color: blue">Hoạt động</p>'
                            : '<p style="font-weight: bold; color: red">Dừng HĐ</p>';

                        html += '<tr>' +
                            '<td>' + (i + 1) + '</td>' +
                            '<td>' +
                            '<img src="' + (hinhAnh ? "/image/" + hinhAnh : "/image-icon/placeholder.jpg") + '" ' +
                            'alt="Image" ' +
                            'style="width: 50px; height: 60px" ' +
                            'class="img-fluid rounded border" />' +
                            '</td>' +
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

                    document.getElementById("tbl_ds_sp").innerHTML = html;
                    document.getElementById("paginationBox").style.display = "none";
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
        }
        // Fetch search results based on trangThai
    }


    function searchTyping() {
        let html = '';
        let text = document.getElementById("tenSPSearch").value;
        let trimmedText = text.trim();
        let firstTwoChars = trimmedText.toLowerCase().substring(0, 2);
        let queryParam = firstTwoChars === "sp" ? "ma=" : "ten=";
        let searchValue = encodeURIComponent(trimmedText);

        console.log("Debug: Search value:", searchValue);
        console.log("Debug: First two characters:", firstTwoChars);

        fetch("/san-pham/search-typing?" + queryParam + searchValue, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(resp => {
                resp.forEach((sp, i) => {
                    const maSanPham = sp.ma || 'N/A';
                    const tenSanPham = sp.ten || 'N/A';
                    const hinhAnh = sp.hinhAnh || null;
                    const ngayTao = sp.ngayTao || 'N/A';
                    const trangThai = sp.trangThai === 1
                        ? '<p style="font-weight: bold; color: blue">Hoạt động</p>'
                        : '<p style="font-weight: bold; color: red">Dừng HĐ</p>';

                    html += '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' +
                        '<img src="' + (hinhAnh ? "/image/" + hinhAnh : "/image-icon/placeholder.jpg") + '" ' +
                        'alt="Image" ' +
                        'style="width: 50px; height: 60px" ' +
                        'class="img-fluid rounded border" />' +
                        '</td>' +
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
                document.getElementById("tbl_ds_sp").innerHTML = html;
                document.getElementById("paginationBox").style.display = "none";
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }




    function refreshSearch(e) {
        e.preventDefault();
        idTrangThaiSearch = "";
        document.getElementById("lblTrangThaiSearch").textContent = "Trạng thái";
        document.getElementById("tenSPSearch").value = "";
        loadDSSP(currentPage);
        document.getElementById("paginationBox").style.display="block";
    }


    const loadLstKichThuoc = () => {
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
                    lstKichThuoc.push(kt);
                });
            });
    }
    loadLstKichThuoc();

    function checkColorExist(colorID) {
        for (let i = 0; i < lstDataSet.length; i++) {
            if (lstDataSet[i].id === colorID) {
                return true;
            }
        }
        return false;
    }


    function setMauSacAdd(msString, indx) {
        try {
            const ms = JSON.parse(msString.replace(/&quot;/g, '"'));
            const idMauSacAdd = ms.id;
            console.log("test existing :", checkColorExist(idMauSacAdd));
            if (!checkColorExist(idMauSacAdd)) {
                const labelElement = document.getElementById("lblMauSacAdd" + indx);
                if (labelElement) {
                    labelElement.textContent = ms.ten;
                } else {
                    console.error('Label element not found for index:', indx);
                }
                // Handle lstDataSet logic
                if (indx >= lstDataSet.length) {
                    // If the index is beyond the current length, push a new entry
                    const size = [];
                    const dataCell = {id: ms.id, name: ms.ten, size: size, amountCBO: 1};
                    lstDataSet.push(dataCell);
                } else {
                    // Update existing entry in lstDataSet
                    lstDataSet[indx].name = ms.ten;
                }
                checkChooseDropdown = ms.ten;
                loadTotalCboMauSac();
                loadCboMauSac();
                loadKichThuocWrapper();
            } else {
                Swal.fire({
                    title: 'Xác nhận?',
                    text: "Màu sắc đã tồn tại !",
                    icon: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'Ok!',
                })
            }

        } catch (error) {
            console.error('Error in setMauSacAdd:', error);
        }
    }


    function setKichThuocAdd(ktString, index, dataSetID) {
        try {
            const kichThuoc = JSON.parse(ktString.replace(/&quot;/g, '"'));
            const idKichThuocAdd = kichThuoc.id;

            // Debugging: Check if dataSetID and index are correct
            console.log('DataSetID:', dataSetID, 'Index:', index);

            // Update the label with the selected kich thuoc name
            const labelElement = document.getElementById("lblKichThuocAdd_" + dataSetID + "_" + index);

            let obj = lstDataSet.find(item => item.id === dataSetID);

            if (!obj) {
                console.error("No matching object found for dataSetID:", dataSetID);
                return;
            }

            let sizeExists = obj.size.some(size => size.id === idKichThuocAdd);

            if (!sizeExists) {
                // If the size doesn't already exist, update the label and the dataset
                if (labelElement) {
                    labelElement.textContent = kichThuoc.ten;
                } else {
                    console.error('Label element not found for dataSetID:', dataSetID, 'index:', index);
                }

                // Update the size in the lstDataSet array
                obj.size[index] = kichThuoc;
                console.log("Size updated for dataSetID:", dataSetID, "Index:", index);

                // Re-render the UI after updating
                loadKichThuocWrapper();

                // Debugging: Log the selected kich thuoc ID
                console.log('Selected kich thuoc ID:', idKichThuocAdd);
                console.log('Dataset name:', dataSetID, 'Dataset index:', index);
            } else {
                // If the size already exists, show a warning
                Swal.fire({
                    title: 'Xác nhận?',
                    text: "Kích thước đã tồn tại!",
                    icon: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'Ok!',
                });
            }
        } catch (error) {
            console.error('Error parsing kichThuoc:', error);
        }
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
        console.log('Selected kieu tay ID modal:', idKieuTayAdd);
        //concathtml here
        // You can add more logic here to handle the selected value
    }


    function setTrangThaiSearch(status) {
        let lblTrangThai = document.getElementById('lblTrangThaiSearch');
        if (status === 1) {
            lblTrangThai.textContent = "Hoạt động";
            idTrangThaiSearch = 1;
        } else {
            lblTrangThai.textContent = "Dừng hoạt động";
            idTrangThaiSearch = 0;
        }
    }


    const loadCboChatLieu = () => {
        fetch("/chat-lieu/index", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let htmlCboAdd = '';
                let htmlCboSearch = '';
                resp.map((cl, i) => {
                    const clString = JSON.stringify(cl).replace(/"/g, '&quot;');
                    htmlCboAdd += '<li><a class="dropdown-item" onclick="setChatLieuAdd(\'' + clString + '\')">' + cl.ten + '</a></li>';
                    htmlCboSearch += '<li><a class="dropdown-item" onclick="setChatLieuSearch(\'' + clString + '\')">' + cl.ten + '</a></li>';
                });
                $("#cboChatLieuAdd").html(htmlCboAdd);
                $("#cboChatLieuSearch").html(htmlCboSearch);
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
                let htmlCboAdd = '';
                let htmlCboSearch = '';
                resp.map((kt, i) => {
                    const kieuTayString = JSON.stringify(kt).replace(/"/g, '&quot;');
                    htmlCboAdd += '<li><a class="dropdown-item"  onclick="setKieuTayAdd(\'' + kieuTayString + '\')">' + kt.ten + '</a></li>';
                    htmlCboSearch += '<li><a class="dropdown-item"  onclick="setKieuTaySearch(\'' + kieuTayString + '\')">' + kt.ten + '</a></li>';
                });
                $("#cboKieuTayAdd").html(htmlCboAdd);
                $("#cboKieuTaySearch").html(htmlCboAdd);
            });
    }
    loadCboKieuTay();

    const fetchMauSac = () => {
        return fetch("/mau-sac/index", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(resp => {
                lstMauSac = [];
                lstMauSacShadow = [];
                resp.forEach(ms => {
                    lstMauSac.push(ms); // Populate lstMauSac array
                    lstMauSacShadow.push(ms);
                });
            })
            .catch(error => console.error('Error loading data:', error));
    };

    const loadCboMauSac = () => {
        let htmlCboAdd = [];

        // Clear existing dropdown content
        for (let i = 0; i < howManyCboMauSac; i++) {
            $("#cboMauSacAdd" + i).html('');
        }
        // Ensure lstMauSacShadow has data before processing
        lstMauSacShadow.forEach((ms, i) => {
            const msString = JSON.stringify(ms).replace(/"/g, '&quot;');
            if (i === 0) {
                // Initialize htmlCboAdd with the first element
                for (let a = 0; a < howManyCboMauSac; a++) {
                    let htmlSet = {indx: a, html: ""};
                    htmlSet.html = '<li><a class="dropdown-item" onclick="setMauSacAdd(\'' + msString + '\', ' + a + ')">' + ms.ten + '</a></li>';
                    htmlCboAdd.push(htmlSet);
                }
            } else {
                // Append to existing htmlCboAdd entries
                htmlCboAdd.forEach((item, b) => {
                    item.html += '<li><a class="dropdown-item" onclick="setMauSacAdd(\'' + msString + '\', ' + item.indx + ')">' + ms.ten + '</a></li>';
                });
            }
        });

        // Render new dropdown content for each cboMauSacAdd element
        htmlCboAdd.forEach((item, i) => {
            $("#cboMauSacAdd" + i).html(item.html);
        });
    };


    // Fetch data and then load CboMauSac after the data is ready
    fetchMauSac().then(() => {
        loadCboMauSac();
        // Create a deep copy of lstMauSac and assign it to lstMauSacShadow
    });

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
        htmlDropdown.insertAdjacentHTML('beforeend', newHtmlContent);
    }
    loadTotalCboMauSac();
    ///work
    //Conduct
    const loadKichThuocWrapper = () => {
        const htmlKichThuocWrapper = document.getElementById("kichThuocWrapper");
        htmlKichThuocWrapper.innerHTML = ''; // Clear the wrapper
        let newHtmlContent = ''; // Temporary variable to hold new HTML content
        for (let i = 0; i < lstDataSet.length; i++) {
            newHtmlContent +=
                '<div class="col col-md-12">' +
                '<div class="d-flex">' +
                '<p class="mt-2" style="width: 80px;">' + lstDataSet[i].name + '</p>' +
                '<div class="icon-container">' +
                '</div>' +
                '<div class="d-flex flex-wrap gap-2" id="kichThuocBox_' + lstDataSet[i].name + '">';

            // Inner loop for amountCBO
            for (let a = 0; a < lstDataSet[i].amountCBO; a++) {
                newHtmlContent +=
                    '<div class="dropdown">' +
                    '<button class="btn btn-outline-secondary dropdown-toggle" ' +
                    'type="button" ' +
                    'id="lblKichThuocAdd_' + lstDataSet[i].id + "_" + a + '" style="width: 150px;" ' +
                    'data-bs-toggle="dropdown" ' +
                    'aria-expanded="false">' +
                    'Chọn kích thước' +
                    '</button>' +
                    '<ul class="dropdown-menu" id="cboKichThuocAdd_' + lstDataSet[i].id + '_' + a + '" ' +
                    'aria-labelledby="dropdownMenuButton2">';

                // Generate dropdown items for each kichThuoc
                lstKichThuoc.forEach((kt, index) => {
                    const ktString = JSON.stringify(kt).replace(/"/g, '&quot;');
                    const escapedName = lstDataSet[i].id.replace(/'/g, "\\'"); // Escape single quotes
                    newHtmlContent += '<li><a class="dropdown-item" onclick="setKichThuocAdd(\'' + ktString + '\', ' + a + ', \'' + escapedName + '\')">' + kt.ten + '</a></li>';
                });

                newHtmlContent +=
                    '</ul>' +
                    '<p style="color: red;" id="cboKichThuocAddErr_' + lstDataSet[i].id + "_" + a + '"></p>' +
                    '</div>';
            }

            newHtmlContent +=
                '</div>' +
                '<div class="icon-container">' +
                '<i class="bi bi-plus col-3 icon-add-more" id="iconAddMoreCboKichThuoc_' + lstDataSet[i].id + '" ' +
                'style="font-size: 25px"></i>' +
                '</div>' +
                '<div class="icon-container">' +
                '<i class="bi bi-dash col-3 icon-remove-more" id="iconRemoveMoreCboKichThuoc_' + lstDataSet[i].id + '" ' +
                'style="font-size: 25px"></i>' +
                '</div>' +
                '</div>' +
                '</div>';
        }
        // Adding the new HTML content to the DOM
        htmlKichThuocWrapper.insertAdjacentHTML('beforeend', newHtmlContent);
        // Rebinding the event listeners after the DOM is updated
        setEventIconAddnRemoveKichThuoc();
        for (let i = 0; i < lstDataSet.length; i++) {
            const sizes = lstDataSet[i].size;
            const amountCBO = lstDataSet[i].amountCBO;

            // Loop through amountCBO and map them directly to sizes
            for (let a = 0; a < amountCBO; a++) {
                const elementId = "lblKichThuocAdd_" + lstDataSet[i].id + "_" + a;
                const element = document.getElementById(elementId);

                if (element) {
                    // Check if there is a corresponding size for this button
                    if (sizes[a]) {
                        element.textContent = sizes[a].ten;
                    } else {
                        element.textContent = 'Chọn kích thước'; // Default text if no size exists
                    }
                } else {
                    console.error('Element not found with ID:', elementId);
                }
            }
        }
    };

    let isEventListenerAttached = false;

    function setEventIconAddnRemoveKichThuoc() {
        if (isEventListenerAttached) return;  // Prevent attaching the event listener more than once
        console.log("check lstDataSet: ", lstDataSet);
        // Handling dynamically generated elements using event delegation
        document.addEventListener('click', function (e) {
            if (e.target && e.target.classList.contains('icon-add-more')) {
                e.preventDefault();
                const mauSacID = e.target.id.replace("iconAddMoreCboKichThuoc_", "");
                let obj = [];
                for (let i = 0; i < lstDataSet.length; i++) {
                    if (lstDataSet[i].id === mauSacID) {
                        obj = lstDataSet[i];
                    }
                }
                if (obj.size[obj.size.length - 1] !== "" && obj.size.length > 0) {
                    console.log("Add Kich Thuoc for: ", mauSacID);
                    for (let i = 0; i < lstDataSet.length; i++) {
                        console.log("loop : ", lstDataSet[i].name);
                        if (lstDataSet[i].id == mauSacID) {
                            // logic add data to size array
                            lstDataSet[i].size.push("");
                            lstDataSet[i].amountCBO++;
                            console.log("check how many +:");
                            loadKichThuocWrapper();
                        }
                    }
                } else {
                    Swal.fire({
                        title: 'Xác nhận?',
                        text: "Vui lòng chọn kích thước !",
                        icon: 'warning',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Ok!',
                    })
                }
                console.log("lst data set: ", lstDataSet);
            }
            if (e.target && e.target.classList.contains('icon-remove-more')) {
                e.preventDefault();
                const mauSacIDAtRemove = e.target.id.replace("iconRemoveMoreCboKichThuoc_", "");
                console.log("Remove Kich Thuoc for: ", mauSacIDAtRemove);
                for (let i = 0; i < lstDataSet.length; i++) {
                    console.log("loop : ", lstDataSet[i].name);
                    if (lstDataSet[i].id == mauSacIDAtRemove) {
                        // logic add data to size array
                        lstDataSet[i].size.pop();
                        lstDataSet[i].amountCBO--;
                        console.log("check how many +:");
                        loadKichThuocWrapper();
                    }
                }
                // Add your logic to handle the removal here
            }
        });
        isEventListenerAttached = true;  // Set flag to true after attaching the event listener
    }


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
    // iconAdd
    iconAddMoreCboMauSac.addEventListener('click', function (e) {
        e.preventDefault();
        if (checkChooseDropdown != "") {
            console.log("add more at: ", checkChooseDropdown);
            console.log("icon add more");
            howManyCboMauSac++;
            loadTotalCboMauSac();
            loadCboMauSac();
            checkChooseDropdown = "";
        } else {
            Swal.fire({
                title: 'Xác nhận?',
                text: "Vui lòng chọn trước khi thêm mới !",
                icon: 'warning',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'Ok!',
            })
        }
    });
    // iconAddMoreCboKichThuoc.addEventListener('click', function (e) {
    //     e.preventDefault();
    //     console.log("icon add more");
    //     howManyCboKichThuoc++;
    //     loadTotalCboKichThuoc();
    //     loadCboKichThuoc();
    // });
    // iconRemove
    iconRemoveMoreCboMauSac.addEventListener('click', function (e) {
        e.preventDefault();
        const htmlDropdown = document.getElementById("mauSacBox");
        htmlDropdown.removeChild(htmlDropdown.lastChild);
        if (checkChooseDropdown != "") {
            lstDataSet.pop();
            loadKichThuocWrapper();
        } else {
            checkChooseDropdown = "hold";
        }
        howManyCboMauSacMemo--;
        howManyCboMauSac--;
        loadTotalCboMauSac();
        loadCboMauSac();
    });

    iconRemoveMoreCboKichThuoc.addEventListener('click', function (e) {
        e.preventDefault();
        const htmlDropdown = document.getElementById("kichThuocBox");
        htmlDropdown.removeChild(htmlDropdown.lastChild);
        console.log("lst mau sac :", lstDataSet);
        howManyCboKichThuocMemo--;
        howManyCboKichThuoc--;
        loadCboKichThuoc();
    });

</script>
<%--end loadingcbo--%>
<script>

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



    updateButtons();
    loadDSSP(currentPage);
    loadTotalPagination(currentPage);

    const editSPBtn = document.querySelectorAll('#editSPBtn');
    const saveEditBtn = document.querySelectorAll('#saveEditBtn');

    function getFileName(fullPath) {
        // Check for the last occurrence of the backslash or forward slash
        var startIndex = Math.max(fullPath.lastIndexOf('\\'), fullPath.lastIndexOf('/'));
        // Extract the file name
        var fileName = fullPath.substring(startIndex + 1);
        return fileName;
    }

    async function fetchData(url, method = 'GET', data = null) {
        const options = {
            method: method,
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        };

        if (data) {
            options.body = JSON.stringify(data);
        }

        const response = await fetch(url, options);

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        // Log the raw response text for debugging
        const responseText = await response.text();
        console.log("Raw Response Text:", responseText);

        // Try to parse as JSON, if applicable
        try {
            const jsonResponse = JSON.parse(responseText);
            return jsonResponse;
        } catch (e) {
            // If parsing fails, return the raw text
            return responseText;
        }
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
        if (idChatLieuModalAdd == "") {
            cboChatLieuModalAddErr.textContent = "Vui lòng chọn chất liệu";
            checkCount = 0;
        } else {
            cboChatLieuModalAddErr.textContent = "";
            checkCount++;
        }
        if (idKieuTayModalAdd == "") {
            cboKieuTayModalAddErr.textContent = "Vui lòng chọn kiểu tay";
            checkCount = 0;
        } else {
            cboKieuTayModalAddErr.textContent = "";
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

    document.addEventListener('DOMContentLoaded', function () {
        const saveMultipleAddBtn = document.getElementById('saveMultipleAddBtn');
        document.getElementById("tenSPErr").textContent = "";

        if (saveMultipleAddBtn) {
            saveMultipleAddBtn.addEventListener('click', function (e) {
                e.preventDefault();
                let tenSP = document.getElementById("tensp").value.trim();
                if (tenSP === "") {
                    document.getElementById("tenSPErr").textContent = "Không để trống";
                    return;
                }
                let encodedTenSP = encodeURIComponent(tenSP);
                fetch(`/san-pham/check-duplicate?tenSP=` + encodedTenSP, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                    .then(response => response.json())
                    .then(data => {
                        console.log("test check duplicate response: ", data);
                        if (!data) {
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
                                    fetchData('http://localhost:8080/san-pham/multiple-save' + "?tenSP=" + tenSP + "&idChatLieu=" + idChatLieuAdd + "&idKieuTay=" + idKieuTayAdd, 'POST', lstDataSet)
                                        .then(responseData => {
                                            console.log("Response Data:", responseData);
                                            if (responseData && typeof responseData === 'string') {
                                                Swal.fire(
                                                    'Đã lưu!',
                                                    'Dữ liệu đã được ghi nhận.',
                                                    'success'
                                                ).then(() => {
                                                    fetch("/san-pham/count", {
                                                        headers: {
                                                            'Accept': 'application/json',
                                                            'Content-Type': 'application/json'
                                                        }
                                                    })
                                                        .then(response => response.json())
                                                        .then(resp => {
                                                            const totalPages = Math.ceil(resp / 20);
                                                            loadDSSP(totalPages); // Load the product list
                                                            currentPage = totalPages;
                                                            loadTotalPagination(currentPage); // Update pagination UI
                                                        })
                                                        .catch(error => {
                                                            console.error('Error fetching pagination data:', error);
                                                        });
                                                });

                                                window.location.href = `http://localhost:8080/admin/quan-ly-san-pham/` + responseData;
                                            } else {
                                                console.error('Unexpected response format:', responseData);
                                            }
                                        })
                                        .catch(error => {
                                            console.error('Error during save operation:', error);
                                        });
                                }
                            });
                        } else {
                            document.getElementById("tenSPErr").textContent = "Tên sản phẩm đã tồn tại";
                        }
                    })
                    .catch(error => {
                        console.error('Error checking for duplicate:', error);
                    });
            });
        } else {
            console.error('Save button not found!');
        }
    });



    function validateNull(param) {
        if (param === "" || param === undefined) {
            return true;
        } else {
            return false;
        }
    }

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

</html>