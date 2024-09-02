<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
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

    <title>MSStore_Quản lý kiểu tay</title>

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


            <div class="container-fluid">
                <div class="container">
                    <h5>QUẢN LÝ KIỂU TAY</h5>
                    <%--  Kiểu tay  --%>
                    <div class="card">
                        <div class="card-body">
                            <div>
                                <div class="row">
                                    <%--Tìm kiếm--%>
                                    <div class="col-5">
                                        <form class="d-flex">
                                            <input class="form-control me-2" type="text" name="keyword"
                                                   placeholder="Tên kiểu tay"
                                                   aria-label="Search">
                                            <button class="btn btn-outline-success" type="submit">Tìm</button>
                                        </form>
                                    </div>
                                    <%--Button thêm mới kiểu tay--%>
                                    <div class="col-5 text-end" style="margin: 10px">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                                data-bs-target="#staticBackdrop">
                                            <i class="bi bi-plus-circle"> Thêm mới</i>
                                        </button>
                                    </div>
                                </div>
                                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
                                     data-bs-keyboard="false" tabindex="-1"
                                     aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">THÊM KIỂU TAY</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="/admin/quan-ly-kieu-tay/add" method="post" id="colorForm">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="colorName">Tên kiểu tay</label>
                                                        <input type="text" class="form-control" id="colorName"
                                                               name="ten"/>
                                                        <div id="error-message" style="color: red; display: none;">Tên
                                                            kiểu tay không hợp lệ.
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-success">Thêm</button>
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Đóng
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th scope="col">STT</th>
                                    <th scope="col">Mã</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Thao tác</th>
                                </tr>
                                </thead>
                                <c:forEach var="i" items="${listKieuTay}" varStatus="ktay">
                                    <tr>
                                        <th scope="row">${ktay.index + 1}</th>
                                        <td>${i.ma}</td>
                                        <td>${i.ten}</td>
                                        <td>${fn:replace(i.ngayTao.toString(), 'T', ' ')}</td>
                                        <td>
                                            <c:if test="${i.trangThai == 1}">Hoạt động</c:if>
                                            <c:if test="${i.trangThai == 0}">Ngừng hoạt động</c:if>
                                        </td>
                                        <td>
                                            <a href="" class="btn btn-warning" data-bs-toggle="modal"
                                               data-bs-target="#staticBackdrop1${i.id}">
                                                <i class="bi bi-pencil-square"></i>
                                            </a>
                                            <div class="modal fade" id="staticBackdrop1${i.id}"
                                                 data-bs-backdrop="static" data-bs-keyboard="false"
                                                 tabindex="-1" aria-labelledby="staticBackdropLabel${i.id}"
                                                 aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="staticBackdropLabel1">Sửa kiểu tay</h5>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="/admin/quan-ly-kieu-tay/update/${i.id}" method="post" id="capNhatForm${i.id}">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Mã</label>
                                                                    <input type="text" class="form-control" name="ma" value="${i.ma}" readonly>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label class="form-label" for="Name${i.id}">Tên kích thước</label>
                                                                    <input type="text" class="form-control" id="name${i.id}" name="ten" value="${i.ten}">
                                                                    <div id="nameError${i.id}" class="text-danger"></div>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label class="form-label" for="status${i.id}">Trạng thái</label>
                                                                    <select class="form-select"
                                                                            aria-label="Default select example"
                                                                            name="trangThai"
                                                                            id="trangThai">
                                                                        <option value="1"
                                                                                <c:if test="${i.trangThai == 1}">selected</c:if>>
                                                                            Hoạt động
                                                                        </option>
                                                                        <option value="0"
                                                                                <c:if test="${i.trangThai == 0}">selected</c:if>>
                                                                            Ngừng hoạt động
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="submit" class="btn btn-warning">Sửa</button>
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                </div>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="/admin/quan-ly-kieu-tay/delete/${i.id}" class="btn btn-danger"
                                               onclick="return confirm('Bạn có muốn xóa không ?')"><i
                                                    class="bi bi-trash"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
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

<%--Validate thêm màu sắc--%>
<script>
    document.getElementById('colorForm').addEventListener('submit', function (event) {
        var colorNameInput = document.getElementById('colorName');
        var errorMessage = document.getElementById('error-message');
        var colorName = colorNameInput.value.trim();

        // Chuyển đổi danh sách từ JSP thành mảng JavaScript
        var listKta = [
            <c:forEach items="${listKieuTay}" var="kta" varStatus="status">
            {
                ten: "<c:out value='${kta.ten}' />",
                trangThai: "<c:out value='${kta.trangThai}' />"
            }<c:if test="${!status.last}">, </c:if>
            </c:forEach>
        ];

        // Check trống
        if (colorName === '') {
            errorMessage.textContent = 'Tên kiểu tay không được để trống.';
            errorMessage.style.display = 'block';
            event.preventDefault(); // Ngăn chặn việc gửi biểu mẫu
            return;
        }

        // Kiểm tra độ dài tên
        if (colorName.length < 6 || colorName.length > 30) {
            errorMessage.textContent = 'Tên kiểu tay phải có độ dài từ 6 đến 30 ký tự.';
            errorMessage.style.display = 'block';
            event.preventDefault(); // Ngăn chặn việc gửi biểu mẫu
            return;
        }

        // Kiểm tra ký tự đặc biệt
        var regex = /^[a-zA-Z0-9À-ỹ\s]+$/;
        if (!regex.test(colorName)) {
            errorMessage.textContent = 'Tên kiểu tay không được chứa ký tự đặc biệt.';
            errorMessage.style.display = 'block';
            event.preventDefault(); // Ngăn chặn việc gửi biểu mẫu
            return;
        }

        // Check trùng
        var isDuplicate = listKta.some(function (kieuTay) {
            return kieuTay.ten === colorName;
        });
        if (isDuplicate) {
            errorMessage.textContent = 'Tên kiểu tay đã tồn tại.';
            errorMessage.style.display = 'block';
            event.preventDefault();
            return;
        }
        errorMessage.style.display = 'none';
    });
</script>

<script>
    var listKTay = []
    <c:forEach items="${listKieuTay}" var="kieutay">
    var KieuTay = {};
    KieuTay.id = "${kieutay.id}";
    KieuTay.ten = "${kieutay.ten}";
    listKTay.push(KieuTay);
    </c:forEach>

    // Hàm kiểm tra tính hợp lệ
    function validateForm(id) {
        var nameInput = document.getElementById("name" + id).value.trim();
        var nameError = document.getElementById("nameError" + id);
        var hasError = false;

        // Xóa thông báo lỗi trước đó
        nameError.textContent = "";

        // Kiểm tra tên không được để trống
        if (nameInput === "") {
            nameError.textContent = "Tên kiểu tay không được để trống.";
            hasError = true;
        } else if (nameInput.length < 6 || nameInput.length > 30) {
            nameError.textContent = "Tên kiểu tay phải có độ dài từ 6 đến 30 ký tự.";
            hasError = true;
        } else {
            // Kiểm tra ký tự đặc biệt trong tên (phải chứa các ký tự hợp lệ)
            var specialCharPattern = /^[a-zA-Z0-9À-ỹ\s]+$/;
            if (!specialCharPattern.test(nameInput)) {
                nameError.textContent = "Tên kiểu tay không được chứa ký tự đặc biệt.";
                hasError = true;
            }

            const nameInputs = document.querySelectorAll('input[id^="name"]');
            nameInputs.forEach(input => {
                if (input.id !== 'name' + id && input.value.trim() === nameInput) {
                    document.getElementById('nameError' + id).textContent = 'Tên kiểu tay đã tồn tại';
                    hasError = true;
                }
            });
        }

        // Nếu có lỗi, không cho phép submit form
        return !hasError;
    }

    // Thêm sự kiện kiểm tra khi form được submit
    document.querySelectorAll("form[id^='capNhatForm']").forEach(function (form) {
        form.addEventListener('submit', function (event) {
            var formId = form.id.replace('capNhatForm', '');
            if (!validateForm(formId)) {
                event.preventDefault();
            }
        });
    });
</script>

</html>