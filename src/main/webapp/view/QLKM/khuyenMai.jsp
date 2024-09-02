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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


    <style>
        .table-scroll{
            height: 340px;
            overflow: scroll;
        }

        .table-scroll2{
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
        th,td{
            text-align: center;
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
                <li class="nav-item" >
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="bi bi-diagram-3" style="font-size: 1.2rem; color: #fff;"></i>
                        <span >Quản lý sản phẩm</span>
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
                <li class="nav-item" style="background: linear-gradient(45deg, black, transparent)">
                    <a class="nav-link" href="/admin/quan-ly-khuyen-mai" style="display: flex; align-items: center">
                        <i class="bi bi-gift" style="margin-left: 2px"></i>
                        <span style="margin-left: 6px" >Quản lý khuyến mãi</span></a>
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
                            <a class="dropdown-item" href="" id="dang-xuat">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Đăng xuất
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>


            <!-- Bán hàng tại quầy -->
            <div class="container-fluid">
                <div class="container bg-white">
                    <h2>Quản lý khuyến mại</h2>
                    <div class="row mt-5">
                        <div class="">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã</th>
                                    <th>Tên khuyến mại</th>
                                    <th>Ngày bắt đầu</th>
                                    <th>Ngày kết thúc</th>
                                    <th>Số tiền giảm</th>
                                    <th>Số lượng</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody id="tbl_ds_km">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-row-reverse">
                <button id="btnAdd" class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#ModalAdd">Thêm mới</button>
            </div>
            <div class="col-12 pb-1">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center mb-3">
                        <li class="page-item" id="prev"><Button class="page-link"  onclick="navigate(-1,event)">Previous</Button></li>
                        <div class="d-flex" id="paginationBody">
                        </div>
                        <li class="page-item" id="next"><Button class="page-link"  onclick="navigate(1,event)">Next</Button></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- ModalSPAdd-->
        <div class="modal fade" id="ModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false" >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h3 class="modal-title" id="exampleModalLabelAdd">Thêm mới sản phẩm</h3>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    </div>
                    <div class="modal-body d-flex gap-5">
                        <div class="container">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="tenKMEdit" class="form-label">Tên khuyến mại</label>
                                    <input type="text" class="form-control" id="tenKMAdd" value="">
                                    <p class="error-message" id="tenKMAddErr" style="color: red;"></p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="ngayBatDauEdit" class="form-label">Ngày bắt đầu</label>
                                    <input type="date" class="form-control" id="ngayBatDauAdd" value="">
                                    <p class="error-message" id="ngayBatDauAddErr" style="color: red;"></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="ngayKetThucEdit" class="form-label">Ngày kết thúc</label>
                                    <input type="date" class="form-control" id="ngayKetThucAdd" value="">
                                    <p class="error-message" id="ngayKetThucAddErr" style="color: red;"></p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="soTienGiamEdit" class="form-label">Số tiền giảm</label>
                                    <input type="text" class="form-control" id="soTienGiamAdd" value="">
                                    <p class="error-message" id="soTienGiamAddErr" style="color: red;"></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="soLuongAdd" class="form-label">Số lượng</label>
                                    <input type="text" class="form-control" id="soLuongAdd" value="">
                                    <p class="error-message" id="soLuongAddErr" style="color: red;"></p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="apDungAdd" class="form-label">Đơn tối thiểu</label>
                                    <input type="text" class="form-control" id="apDungAdd" value="">
                                    <p class="error-message" id="apDungAddErr" style="color: red;"></p>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check form-switch mt-4">
                                        <input class="form-check-input" type="checkbox" role="switch" id="trangThaiAdd" checked>
                                        <label class="form-check-label" for="trangThaiEdit" id="trangThaiLabeladd">Trạng thái</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <button id="saveAddBtn" type="submit" class="btn btn-primary">Lưu</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <%--End modal --%>
        <!-- ModalKMEdit-->
        <div class="modal fade" id="ModalEdit" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
             data-bs-backdrop="static" data-bs-keyboard="false" >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <h3 class="modal-title" id="exampleModalLabel4">Chỉnh sửa khuyến mại</h3>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex gap-5">
                        <div class="container">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="maKMEdit" class="form-label">Mã KM</label>
                                    <input type="text" class="form-control" id="maKMEdit" value="">
                                    <p class="error-message" id="maKMEditErr" style="color: red;"></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="tenKMEdit" class="form-label">Tên khuyến mại</label>
                                    <input type="text" class="form-control" id="tenKMEdit" value="">
                                    <p class="error-message" id="tenKMEditErr" style="color: red;"></p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="ngayBatDauEdit" class="form-label">Ngày bắt đầu</label>
                                    <input type="date" class="form-control" id="ngayBatDauEdit" value="">
                                    <p class="error-message" id="ngayBatDauEditErr" style="color: red;"></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="ngayKetThucEdit" class="form-label">Ngày kết thúc</label>
                                    <input type="date" class="form-control" id="ngayKetThucEdit" value="">
                                    <p class="error-message" id="ngayKetThucEditErr" style="color: red;"></p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="soTienGiamEdit" class="form-label">Số tiền giảm</label>
                                    <input type="text" class="form-control" id="soTienGiamEdit" value="">
                                    <p class="error-message" id="soTienGiamEditErr" style="color: red;"></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="soLuongEdit" class="form-label">Số lượng</label>
                                    <input type="text" class="form-control" id="soLuongEdit" value="">
                                    <p class="error-message" id="soLuongEditErr" style="color: red;"></p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="apDungEdit" class="form-label">Đơn tối thiểu</label>
                                    <input type="text" class="form-control" id="apDungEdit" value="">
                                    <p class="error-message" id="apDungEditErr" style="color: red;"></p>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check form-switch mt-4">
                                        <input class="form-check-input" type="checkbox" role="switch" id="trangThaiEdit" checked>
                                        <label class="form-check-label" for="trangThaiEdit" id="trangThaiLabeledit">Trạng thái</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <button id="saveEditBtn" type="submit" class="btn btn-primary">Lưu</button>
                                </div>
                            </div>
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
        button.addEventListener('click', function() {
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
    let idKMLocal = "";
    let currentPage = 1;
    let totalPage = 0;
    const loadDSKM = (pageParams) => {
        // get api + scpt.id
        let datatest = "data testing";
        fetch("/khuyen-mai/get-all"+"?page="+pageParams, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let html = '';
                resp.map((km,i)=>{
                    const maKhuyenMai = km.ma || 'N/A';
                    const tenKhuyenMai = km.ten || 'N/A';
                    const ngayBatDau = km.ngayBatDau || 'N/A';
                    const ngayKetThuc = km.ngayKetThuc || 'N/A';
                    const soTienGiam = km.soTienGiam || 'N/A';
                    const soLuong = km.soLuong || 'N/A';
                    const trangThai = km.trangThai == 1 ? "Hoạt động" : "Dừng hđ";
                    html += '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' + maKhuyenMai + '</td>' +
                        '<td>' + tenKhuyenMai + '</td>' +
                        '<td>' + ngayBatDau + '</td>' +
                        '<td>' + ngayKetThuc + '</td>' +
                        '<td>' + soTienGiam + '</td>' +
                        '<td>' + soLuong + '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<button id="editKMBtn_' + km.id + '" class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#ModalEdit">Chỉnh sửa</button>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                $("#tbl_ds_km").html(html)
            });
    }
    function testDataMapping(){

    }
    function setActive(element, page) {
        // Remove active class from all pagination items
        let items = document.querySelectorAll('.page-item');
        items.forEach(item => item.classList.remove('active'));
        element.parentElement.classList.add('active');
        currentPage = page ;
        updateButtons();
        loadDSKM(currentPage);
    }
    function updateButtons() {
        let items = document.querySelectorAll('.page-item');
        let activeIndex = Array.from(items).findIndex(item => item.classList.contains('active'));
        document.getElementById('prev').classList.toggle('disabled', activeIndex === 1);
        document.getElementById('next').classList.toggle('disabled', activeIndex === items.length - 2);
    }
    function navigate(direction,e) {
        e.preventDefault();
        if(totalPage > 1){
            let items = document.querySelectorAll('.page-item');
            let activeIndex = Array.from(items).findIndex(item => item.classList.contains('active'));
            let newIndex = activeIndex + direction;
            currentPage =newIndex
            loadDSKM(currentPage);
            if (newIndex > 0 && newIndex < items.length - 1) {
                setActive(items[newIndex].querySelector('a'));
            }
        }
    }
    updateButtons();
    const loadTotalPagination = (currentPage) => {
        fetch("/khuyen-mai/count", {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                let html = '';
                // Check if resp is a number and greater than 0
                if (typeof resp === 'number' && resp > 0) {
                    totalPage = Math.ceil(resp/20);
                    for (let i = 1; i <=  Math.ceil(resp/20); i++) {
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
    loadDSKM(currentPage);
    loadTotalPagination(currentPage);
    let maKMEdit = document.getElementById("maKMEdit");
    let tenKMEdit = document.getElementById("tenKMEdit");
    let ngayBatDauEdit = document.getElementById("ngayBatDauEdit");
    let ngayKetThucEdit = document.getElementById("ngayKetThucEdit");
    let soTienGiamEdit = document.getElementById("soTienGiamEdit");
    let soLuongEdit = document.getElementById("soLuongEdit");
    let trangThaiEdit  = document.getElementById("trangThaiEdit");
    let apDungEdit = document.getElementById("apDungEdit");
    $(document).on('click', "button[id^='editKMBtn_']", e => {
        e.preventDefault();
        const queryString = window.location.pathname;
        const pathParts = queryString.split('/');
        const pathVariable = pathParts[pathParts.length - 1];
        const kmid = e.currentTarget.id.replace("editKMBtn_", "");
        idKMLocal = kmid;
        fetch("/khuyen-mai/detail/"+kmid, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(resp => {
                maKMEdit.value = resp.ma;
                tenKMEdit.value = resp.ten;
                ngayBatDauEdit.value = resp.ngayBatDau;
                ngayKetThucEdit.value = resp.ngayKetThuc;
                soTienGiamEdit.value = resp.soTienGiam;
                soLuongEdit.value = resp.soLuong;
                apDungEdit.value = resp.apDung;
                if(resp.trangThai==1){
                    trangThaiEdit.checked = true;
                    labelElementedit.textContent = "Đang hoạt động";
                }
                else{
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
        window.location.href = '/qlsp/'+spid;
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
            var idKH  = document.getElementsByName("idKH")[0].value;
            var idKhuyenMai = document.getElementsByName("idKhuyenMai")[0].value;
            var tongTien = document.getElementsByName("tongTien")[0].value;
            var thongBao = document.getElementById("errTraLai");
            var moneyGiven = parseInt(document.getElementById("tienKhachDua").value);
            var thongBao = document.getElementById("errTraLai");
            console.log("====================== id hd:",idHD);
            console.log("====================== id kh:",idKH);
            console.log("====================== id khuyen mai:",idKhuyenMai);
            console.log("====================== tong tien:",tongTien);
            console.log("====================== money given:",moneyGiven);
            if(tongTien<=moneyGiven&&!isNaN(tongTien)){
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
                        fetch(`/khuyen-mai/save/`, {
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
                        thongBao.textContent =  "";
                    }
                });
            }
            else{
                thongBao.textContent =  "Số tiền khách đưa phải lớn hơn hoặc bằng tổng tiền.";
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

            // Get form elements
            let tenKMEdit = document.getElementById("tenKMAdd");
            let tenKMEditErr = document.getElementById("tenKMAddErr");
            let ngayBatDauEdit = document.getElementById("ngayBatDauAdd");
            let ngayBatDauEditErr = document.getElementById("ngayBatDauAddErr");
            let ngayKetThucEdit = document.getElementById("ngayKetThucAdd");
            let ngayKetThucEditErr = document.getElementById("ngayKetThucAddErr");
            let soTienGiamEdit = document.getElementById("soTienGiamAdd");
            let soTienGiamEditErr = document.getElementById("soTienGiamAddErr");
            let soLuongEdit = document.getElementById("soLuongAdd");
            let soLuongEditErr = document.getElementById("soLuongAddErr");
            let apDungEdit = document.getElementById("apDungAdd");
            let apDungEditErr = document.getElementById("apDungAddErr");
            let trangThaiEdit = document.getElementById("trangThaiAdd");

            // Initialize variables
            let trangThai = trangThaiEdit.checked ? 1 : 0;
            let isValid = true;

            // Clear previous error messages
            clearErrors();

            // Validate Tên khuyến mại
            if (validateNull(tenKMEdit)) {
                tenKMEditErr.textContent = "Vui lòng nhập tên sản phẩm";
                isValid = false;
            }

            // Validate Ngày bắt đầu
            var startDate = new Date(ngayBatDauEdit.value);
            var endDate = new Date(ngayKetThucEdit.value);
            var today = new Date();
            today.setHours(0, 0, 0, 0);

            if (!ngayBatDauEdit.value) {
                ngayBatDauEditErr.textContent = "Vui lòng nhập ngày bắt đầu";
                isValid = false;
            } else if (startDate < today) {
                ngayBatDauEditErr.textContent = "Ngày bắt đầu không được trong quá khứ";
                isValid = false;
            }

            // Validate Ngày kết thúc
            if (!ngayKetThucEdit.value) {
                ngayKetThucEditErr.textContent = "Vui lòng nhập ngày kết thúc";
                isValid = false;
            } else if (endDate < today) {
                ngayKetThucEditErr.textContent = "Ngày kết thúc không được trong quá khứ";
                isValid = false;
            } else if (startDate > endDate) {
                ngayKetThucEditErr.textContent = "Ngày kết thúc phải sau hoặc bằng ngày bắt đầu";
                isValid = false;
            }

            // Validate Số tiền giảm
            if (!soTienGiamEdit.value || isNaN(soTienGiamEdit.value) || Number(soTienGiamEdit.value) <= 0) {
                soTienGiamEditErr.textContent = "Số tiền giảm phải là một số lớn hơn 0";
                isValid = false;
            }

            // Validate Số lượng
            if (!soLuongEdit.value || isNaN(soLuongEdit.value) || Number(soLuongEdit.value) <= 0) {
                soLuongEditErr.textContent = "Số lượng phải là một số lớn hơn 0";
                isValid = false;
            }

            // Validate Đơn tối thiểu
            if (!apDungEdit.value || isNaN(apDungEdit.value) || Number(apDungEdit.value) <= 0) {
                apDungEditErr.textContent = "Đơn tối thiểu phải là một số lớn hơn 0";
                isValid = false;
            }

            // If all validations pass, proceed with form submission
            if (isValid) {
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
                            ten: tenKMEdit.value,
                            ngayBatDau: ngayBatDauEdit.value,
                            ngayKetThuc: ngayKetThucEdit.value,
                            soTienGiam: soTienGiamEdit.value,
                            soLuong: soLuongEdit.value,
                            apDung: apDungEdit.value,
                            trangThai: trangThai
                        };
                        fetch(`/khuyen-mai/save`, {
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
                                    loadDSKM(currentPage); // Assuming you have a function to reload the list
                                });
                            } else {
                                Swal.fire(
                                    'Lỗi!',
                                    'Có lỗi xảy ra khi lưu dữ liệu.',
                                    'error'
                                );
                            }
                        }).catch(error => {
                            console.error('Error:', error);
                            Swal.fire(
                                'Lỗi!',
                                'Không thể lưu dữ liệu.',
                                'error'
                            );
                        });
                    }
                });
            }
        });
    });

    function validateNull(inputElement) {
        return !inputElement.value.trim();
    }

    function clearErrors() {
        let errorElements = document.querySelectorAll('.error-message');
        errorElements.forEach(element => {
            element.textContent = '';
        });
    }

    saveEditBtn.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            console.log("test check btn");

            // Get form elements
            let tenKMEdit = document.getElementById("tenKMEdit");
            let tenKMEditErr = document.getElementById("tenKMEditErr");
            let ngayBatDauEdit = document.getElementById("ngayBatDauEdit");
            let ngayBatDauEditErr = document.getElementById("ngayBatDauEditErr");
            let ngayKetThucEdit = document.getElementById("ngayKetThucEdit");
            let ngayKetThucEditErr = document.getElementById("ngayKetThucEditErr");
            let soTienGiamEdit = document.getElementById("soTienGiamEdit");
            let soTienGiamEditErr = document.getElementById("soTienGiamEditErr");
            let soLuongEdit = document.getElementById("soLuongEdit");
            let soLuongEditErr = document.getElementById("soLuongEditErr");
            let apDungEdit = document.getElementById("apDungEdit");
            let apDungEditErr = document.getElementById("apDungEditErr");
            let trangThaiEdit = document.getElementById("trangThaiEdit");

            // Initialize variables
            let trangThai = trangThaiEdit.checked ? 1 : 0;
            let isValid = true;

            // Clear previous error messages
            clearErrors();

            // Validate Tên khuyến mại
            if (validateNull(tenKMEdit)) {
                tenKMEditErr.textContent = "Vui lòng nhập tên sản phẩm";
                isValid = false;
            }

            // Validate Ngày bắt đầu
            var startDate = new Date(ngayBatDauEdit.value);
            var endDate = new Date(ngayKetThucEdit.value);
            var today = new Date();
            today.setHours(0, 0, 0, 0);

            if (!ngayBatDauEdit.value) {
                ngayBatDauEditErr.textContent = "Vui lòng nhập ngày bắt đầu";
                isValid = false;
            } else if (startDate < today) {
                ngayBatDauEditErr.textContent = "Ngày bắt đầu không được trong quá khứ";
                isValid = false;
            }

            // Validate Ngày kết thúc
            if (!ngayKetThucEdit.value) {
                ngayKetThucEditErr.textContent = "Vui lòng nhập ngày kết thúc";
                isValid = false;
            } else if (endDate < today) {
                ngayKetThucEditErr.textContent = "Ngày kết thúc không được trong quá khứ";
                isValid = false;
            } else if (startDate > endDate) {
                ngayKetThucEditErr.textContent = "Ngày kết thúc phải sau hoặc bằng ngày bắt đầu";
                isValid = false;
            }

            // Validate Số tiền giảm
            if (!soTienGiamEdit.value || isNaN(soTienGiamEdit.value) || Number(soTienGiamEdit.value) <= 0) {
                soTienGiamEditErr.textContent = "Số tiền giảm phải là một số lớn hơn 0";
                isValid = false;
            }

            // Validate Số lượng
            if (!soLuongEdit.value || isNaN(soLuongEdit.value) || Number(soLuongEdit.value) <= 0) {
                soLuongEditErr.textContent = "Số lượng phải là một số lớn hơn 0";
                isValid = false;
            }

            // Validate Đơn tối thiểu
            if (!apDungEdit.value || isNaN(apDungEdit.value) || Number(apDungEdit.value) <= 0) {
                apDungEditErr.textContent = "Đơn tối thiểu phải là một số lớn hơn 0";
                isValid = false;
            }

            // If all validations pass, proceed with form submission
            if (isValid) {
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
                            ten: tenKMEdit.value,
                            ngayBatDau: ngayBatDauEdit.value,
                            ngayKetThuc: ngayKetThucEdit.value,
                            soTienGiam: soTienGiamEdit.value,
                            soLuong: soLuongEdit.value,
                            apDung: apDungEdit.value,
                            trangThai: trangThai
                        };
                        fetch(`/khuyen-mai/update/` + idKMLocal, {
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
                                    loadDSKM(currentPage); // Assuming you have a function to reload the list
                                });
                            } else {
                                Swal.fire(
                                    'Lỗi!',
                                    'Có lỗi xảy ra khi lưu dữ liệu.',
                                    'error'
                                );
                            }
                        }).catch(error => {
                            console.error('Error:', error);
                            Swal.fire(
                                'Lỗi!',
                                'Không thể lưu dữ liệu.',
                                'error'
                            );
                        });
                    }
                });
            }
        });
    });

    function validateNull(inputElement) {
        return !inputElement.value.trim();
    }

    function clearErrors() {
        let errorElements = document.querySelectorAll('.error-message');
        errorElements.forEach(element => {
            element.textContent = '';
        });
    }

</script>
<script>
    $(document).ready(function() {
        $('#saveAddBtn').on('click', function(event) {

            // Optionally, submit the form normally after AJAX request (if needed)
        });
    });
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
</html>