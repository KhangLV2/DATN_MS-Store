<%@page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-8">
            <h3>Bán hàng</h3>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>ID</th>
                    <th>Ngày tạo</th>
                    <th>Tên khách hàng</th>
                    <th>Trạng thái</th>
                    <th>Details
                        <form action="/ban-hang/add-hoa-don" method="post" style="float: right;">
                            <button type="submit" class="btn btn-success">+</button>
                        </form>
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach varStatus="i" items="${listHoaDon}" var="hoaDon">
                    <tr>
                        <td>${i.index+1}</td>
                        <td>${hoaDon.id}</td>
                        <td>${hoaDon.ngayTao}</td>
                        <td>${hoaDon.idKhachHang.hoTen}</td>
                        <td>${hoaDon.trangThai==0?"Chua thanh toan":"Da thanh toan"}</td>
                        <td>
                            <a href="/ban-hang/detail-hoa-don/${hoaDon.id}" class="btn btn-primary">View</a>
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
                    <th>ID Hóa Đơn</th>
                    <th>Mã SP</th>
                    <th>Tên SP</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach varStatus="i" items="${listHDCT}" var="hdct">
                    <tr>
                        <td>${i.index+1}</td>
                        <td>${hdct.idHoaDon.id}</td>
                        <td>${hdct.idCTSP.idSanPham.ma}</td>
                        <td>${hdct.idCTSP.idSanPham.ten}</td>
                        <td>${hdct.soLuong}</td>
                        <td>${hdct.donGia}</td>
                        <td>${hdct.soLuong*hdct.donGia}</td>
                        <td>
                            <form action="/ban-hang/delete-hdct/${hdct.id}" method="post">
                                <input type="hidden" name="idHoaDon" value="${hoaDon.id}">
                                <button class="btn btn-danger" type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Sản phẩm -->
            <h3>Chi tiết sản phẩm</h3>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã</th>
                    <th>Tên SP</th>
                    <th>Màu sắc</th>
                    <th>Size</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach varStatus="i" items="${listCTSP}" var="spct">
                    <tr>
                        <td>${i.index+1}</td>
                        <td>${spct.idSanPham.ma}</td>
                        <td>${spct.idSanPham.ten}</td>
                        <td>${spct.idMauSac.ten}</td>
                        <td>${spct.idKichThuoc.ten}</td>
                        <td>${spct.soLuong}</td>
                        <td>${spct.giaBan}</td>
                        <td>
                            <form action="/ban-hang/add-san-pham/${spct.id}" method="post"
                                  onsubmit="return validateBeforeAddToCart();">
                                <input type="hidden" name="idHoaDon" value="${hoaDon.id}"
                                       id="selectedInvoiceId">
                                <button class="btn btn-success" type="submit">+</button>
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
                    <form method="POST" action="/ban-hang/thanh-toan/${hoaDon.id}">
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">ID hóa đơn</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${hoaDon.id}" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Ngày tạo</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="ngayTao" value="${hoaDon.ngayTao}">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Sđt khách hàng</label>
                            <div class="col-sm-6">
                                <select path="idKhachHang" class="form-select" aria-label="Default select example" name="idKhachHang">
                                    <c:forEach items="${listKH}" var="khachHang">

                                        <option value="${khachHang.id}" ${hoaDon.idKhachHang.sdt==khachHang.sdt?"selected":""}>${khachHang.sdt}</option>

                                    </c:forEach>
                                </select>
                            </div>
                            <a class="col-sm-2" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#">
                                <i class=" bi bi-folder-plus col-3" style="font-size: 25px;"></i>
                            </a>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Tổng tiền</label>
                            <div class="col-sm-8">
                                <input id="tongTien" type="number" class="form-control" value="${tongTien}"
                                       readonly />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Tiền khách đưa</label>
                            <div class="col-sm-6">
                                <input id="tienKhachDua" class="form-control" type="number" required>
                                <span id="errTraLai" style="color: red"></span>
                            </div>

                            <i id="calculateChangeButton" class=" col-sm-2 bi bi-chevron-double-down"
                               style="font-size: 20px" onclick="calculateChange()"></i>

                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Trả lại</label>
                            <div class="col-sm-8">
                                <input id="tienTraLai" type="number" class="form-control" required readonly>

                            </div>
                        </div>
                        <div class="row mb-3 mt-4 justify-content-end text-end">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-success ">THANH TOÁN</button>
                            </div>
                        </div>
                    </form>
                    <!-- End General Form Elements -->
                </div>
            </div><!-- End Recent Activity -->
            <!--  -->
        </div>
    </div>
</div>
</body>

<script>

    function calculateChange() {
        var tongTien = parseFloat('${tongTien}');
        var tienKhachDua = parseFloat(document.getElementById('tienKhachDua').value);
        var tienTraLai = tienKhachDua - tongTien;
        var  thongBao = document.getElementById("errTraLai");
        if (isNaN(tienKhachDua)) {
            thongBao.textContent="Vui lòng nhập số tiền hợp lệ.";
            // alert('Vui lòng nhập số tiền hợp lệ.');
            return false;
        }

        if (tienKhachDua < tongTien) {
            thongBao.textContent="Số tiền khách đưa phải lớn hơn hoặc bằng tổng tiền.";
            // alert('Số tiền khách đưa phải lớn hơn hoặc bằng tổng tiền.');
            document.getElementById('tienTraLai').value ="";
            return false;
        }

        // Hiển thị số tiền trả lại trong trường "Trả lại"
        document.getElementById('tienTraLai').value = tienTraLai.toFixed(2);
    }

    function validatePayment() {
        var tienKhachDua = document.getElementById("tienKhachDua").value;
        var tongTien = parseFloat('${tongTien}');
        if (tienKhachDua === "" || tienKhachDua < tongTien) {
            thongBao.textContent= thongBao.textContent="Vui lòng nhập số tiền khách đưa hợp lệ."
            // alert("Vui lòng nhập số tiền khách đưa hợp lệ.");
            document.getElementById('tienTraLai').value ="";
            return false;
        }
        return true;
    }

    function validateBeforeAddToCart() {
        // Kiểm tra xem hóa đơn đã được chọn chưa
        var selectedInvoiceId = document.getElementById("selectedInvoiceId").value;

        if (selectedInvoiceId === "") {
            alert("Vui lòng chọn hóa đơn trước khi thêm sản phẩm vào giỏ hàng.");
            return false; // Ngăn chặn sự kiện click nút "+"
        }

        return true; // Cho phép thêm sản phẩm vào giỏ hàng nếu đã chọn hóa đơn
    }

</script>


</html>