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

    <title>MSStore_Quản lý nhân viên</title>

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
                <!-- Nav Item - Charts -->
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
                <li class="nav-item" >
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="bi bi-diagram-3" style="font-size: 1.2rem;"></i>
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
                <li class="nav-item" style="background: linear-gradient(45deg, black, transparent)">
                    <a class="nav-link" href="/admin/quan-ly-nhan-vien/hien-thi" style="display: flex; align-items: center">
                        <i class="bi bi-person-bounding-box" style="color: white; margin-left: 2px"></i>
                        <span style="font-weight: bold; margin-left: 6px">Quản lý nhân viên</span></a>
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


            <!-- Bán hàng tại quầy -->
            <div class="container-fluid">
                <div class="container">

                    <%--      Tìm kiếm & lọc thông tin nhân ciên      --%>
                    <h5 class="card-title mb-3">Quản lý thông tin nhân viên</h5>
                    <div class="row mb-4">
                        <div class="card">
                            <div class="card-header">
                                Tìm kiếm thông tin
                            </div>
                            <div class="card-body">
                                <form method="post" action="/admin/quan-ly-nhan-vien/tim-kiem">
                                    <div class="row mb-2">
                                        <div class="col-6">
                                            <label for="timKiem" class="col-sm-2 col-form-label mb-3">Tìm kiếm: </label>
                                            <div class="col-sm-10 float-right mb-3">
                                                <input type="text" class="form-control w-75" name="key" id="timKiem"
                                                       placeholder="Nhập họ tên hoặc Sdt,...">
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <label for="chucVu" class="col-sm-2 col-form-label mb-2">Chức vụ: </label>
                                            <div class="col-sm-10 float-right">
                                                <select class="form-select w-75" aria-label="Default select example"
                                                        id="chucVu" name="idCV">
                                                    <option value="">Chọn chức vụ</option>
                                                    <c:forEach items="${listChucVu}" var="chucVu">
                                                        <option value="${chucVu.id}">${chucVu.ten}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                                        <a href="/admin/quan-ly-nhan-vien/hien-thi"><button type="button" class="btn btn-secondary">Làm mới bộ lọc</button></a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <%--      Danh sách nhân viên     --%>
                    <div class="row">
                        <div class="card">
                            <div class="card-header">
                                <span>Danh sách nhân viên</span>
                                <a href="/admin/quan-ly-nhan-vien/them-nhan-vien-view"><button class="btn btn-primary float-end">+ Thêm</button></a>
                            </div>
                            <div class="card-body">
                                <table class="table" id="nhanVienTable">
                                    <thead class="table-secondary">
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col">Ảnh</th>
                                        <th scope="col">Họ tên</th>
                                        <th scope="col">Giới tính</th>
                                        <th scope="col">Ngày sinh</th>
                                        <th scope="col">Sdt</th>
                                        <th scope="col">Chức vụ</th>
                                        <th scope="col">Ngày tạo</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach varStatus="i" items="${listNhanVien}" var="nv">
                                        <tr>
                                            <th>${i.index+1}</th>
                                            <th><img src="/imageUser/${nv.anhDaiDien}" style="width: 70px; height: 60px"></th>
                                            <td>${nv.hoTen}</td>
                                            <td>${nv.gioiTinh == 1 ? "Nam" : "Nữ"}</td>
                                            <td>${nv.ngaySinh}</td>
                                            <td>${nv.sdt}</td>
                                            <td>${nv.idCV.ten}</td>
                                            <td>${nv.ngayTao}</td>
                                            <td>
                                                <c:if test="${nv.trangThai == 1}">
                                                    <span class="badge bg-success">Đang làm</span>
                                                </c:if>
                                                <c:if test="${nv.trangThai == 0}">
                                                    <span class="badge bg-warning">Đã nghỉ</span>
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="/admin/quan-ly-nhan-vien/sua-trang-thai/${nv.id}"><button class="btn btn-outline-secondary" style="width: 33px; display: inline-flex;align-items: center;justify-content: center"><i class="bi bi-arrow-repeat" style="font-size: 17px"></i></button></a>
                                                <a href="/admin/quan-ly-nhan-vien/sua-nhan-vien-view/${nv.id}"><button class="btn btn-warning"><i class="bi bi-pencil-square"></i></button></a>
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