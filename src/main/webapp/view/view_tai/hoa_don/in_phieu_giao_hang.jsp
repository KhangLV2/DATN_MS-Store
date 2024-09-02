

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phiếu Giao Hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>

    </style>
</head>
<body>
<div class="container mt-5 p-4 shadow delivery">
    <div class="text-center mb-4">
        <h1>Phiếu Giao Hàng</h1>
    </div>

    <div class="mb-4">
        <h5>Thông tin Bên Gửi:</h5>
        <p>Người gửi: MS-STORE</p>
        <p>Địa chỉ: Tòa nhà FPT Polytechnic, Phố Trịnh Văn Bô, Xuân Phương, Nam Từ Liêm, Hà Nội</p>
        <p>Số điện thoại: 0123 456 789</p>
    </div>

    <div class="mb-4">
        <h5>Thông tin Bên Nhận:</h5>
        <p>Người nhận: ${hoaDonDTO.khachHang.hoTen}</p>
        <p>Địa chỉ: ${diaChiKhachHang.diaChiChiTiet}, ${diaChiKhachHang.idPhuongXa}, ${diaChiKhachHang.idQuanHuyen}, ${diaChiKhachHang.idTinhThanh}</p>
        <p>Số điện thoại: ${hoaDonDTO.khachHang.sdt}</p>
    </div>

    <div class="mb-4">
        <h5>Nội dung đơn hàng</h5>
        <table class="table table-bordered">
            <thead class="thead-light">
            <tr>
                <th>Tên Sản Phẩm</th>
                <th>Màu Sắc</th>
                <th>Kích Thước</th>
                <th>Số Lượng</th>
                <th>Đơn Giá</th>
                <th>Tổng tiền</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="chiTiet" items="${listHDCT}" varStatus="i">
                <tr>
                    <td>${chiTiet.idCTSP.idSanPham.ten}</td>
                    <td>${chiTiet.idCTSP.idMauSac.ten}</td>
                    <td>${chiTiet.idCTSP.idKichThuoc.ten}</td>
                    <td>${chiTiet.soLuong}</td>
                    <td><fmt:formatNumber value="${chiTiet.donGia}" type="currency" currencySymbol="₫" groupingUsed="true"/></td>
                    <td><fmt:formatNumber value="${chiTiet.donGia * chiTiet.soLuong}" type="currency" currencySymbol="₫" groupingUsed="true"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="d-flex justify-content-between align-items-start mb-4">
        <div>
            <h5 class="mb-0">Tiền thu hộ: <span>200VND</span></h5>
<%--            <p class="font-weight-bold mb-0">--%>
<%--                <fmt:formatNumber value="${hoaDonDTO.tongTien}" type="currency" currencySymbol="₫" groupingUsed="true"/>--%>
<%--            </p>--%>
        </div>
        <div class="text-right mr-5">
            <p class="mb-1 mr-5">Chữ ký người nhận</p>
            <p class="mb-0">(Xác nhận hàng nguyên vẹn, không móp, méo)</p>
        </div>
    </div>
</div>

<div class="text-center mt-4">
    <button id="downloadPdf" class="btn btn-primary">
        <i class="bi bi-printer"></i> Download PDF
    </button>
</div>

<!-- jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<!-- html2pdf.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
<script>
    document.getElementById('downloadPdf').addEventListener('click', () => {
        const element = document.querySelector('.container');
        const opt = {
            margin: 1,
            filename: 'phieu_giao_hang.pdf',
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'cm', format: 'a4', orientation: 'landscape' }
        };
        html2pdf().from(element).set(opt).save();
    });
</script>
</body>
</html>
