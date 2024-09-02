

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
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
    <style>
        .print-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px dotted #000;
            padding-bottom: 10px;
            /* margin-bottom: 20px; */
        }
        .logo {
            width: 200px;
        }
        .separator {
            border-bottom: 1px dotted #000;
            margin: 10px 0;
        }
        .info-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .info-section div {
            width: 48%;
        }
        .product-details {
            margin-bottom: 20px;
            border-bottom: 1px dotted #000;
        }
        .product-details h5 {
            font-weight: bold;
        }
        .product-item {
            display: flex;
            justify-content: space-between;
        }
        .signature {
            display: flex;
            justify-content: space-between;
            /* align-items: center; */
            padding-top: 10px;
            /* margin-top: 50px; */
        }
        .signature-box {
            border: 1px solid #000;
            padding: 20px;
            text-align: center;
            padding-bottom: 100px;

        }

        .product-details h5{
            margin: 0px;
        }

        .product-item p{
            margin: 6px;
            padding-bottom: 5px;
        }

        .signature .money{
            font-size: 24px;
            font-weight: bold;
        }

        .signature-box .confirm {
            margin: 0px;
        }

        .signature-box .sign {
            margin: 0px;
            padding-bottom: 5px;
        }

        @media print {
            /* Ẩn tiêu đề và ngày của trình duyệt khi in */
            @page {
                size: auto;
                margin: 0;
            }
        }

        .delivery{
            padding: 20px;

        }
    </style>
</head>
<body>
<div class=" mt-5 p-4 shadow delivery" id="deliveryReceipt">
    <div class="print-header">
        <div>
            <h1>MS-STORE</h1>
            <p class="mb-1">Mã Hóa Đơn: ${hoaDonDTO.ma}</p>
            <p class="mb-0">Ngày Đặt Đơn:${hoaDonDTO.ngayTao}</p>
        </div>
        <div>
            <img src="https://cdn.haitrieu.com/wp-content/uploads/2022/05/Logo-GHN-Slogan-En.png" alt="Logo" class="logo">
        </div>
    </div>
    <div class="info-section">
        <div>
            <h5>Thông tin Bên Gửi:</h5>
            <p>Người gửi: MS-STORE</p>
            <p>Địa chỉ: Tòa nhà FPT Polytechnic, Phố Trịnh Văn Bô, Xuân Phương, Nam Từ Liêm, Hà Nội</p>
            <p>Số điện thoại: 0123 456 789</p>
        </div>
        <div>
            <h5>Thông tin Bên Nhận:</h5>
            <p>Người nhận: ${hoaDonDTO.khachHang.hoTen}</p>
            <p>Địa chỉ: ${diaChiKhachHang.diaChiChiTiet}, ${diaChiKhachHang.idPhuongXa}, ${diaChiKhachHang.idQuanHuyen}, ${diaChiKhachHang.idTinhThanh}</p>
            <p>Số điện thoại: ${hoaDonDTO.khachHang.sdt}</p>
        </div>
    </div>
    <div class="separator"></div>
    <div class="product-details">
        <h5 >Nội dung đơn hàng (Tổng số lượng sản phẩm:)</h5>
        <c:forEach var="chiTietHoaDon" items="${listHDCT}" varStatus="item">
            <div class="product-item">
                <p><span>${item.index + 1}</span> ${chiTietHoaDon.idCTSP.idSanPham.ten}(${chiTietHoaDon.idCTSP.idMauSac.ten},Size:${chiTietHoaDon.idCTSP.idKichThuoc.ten})</p>
                <p>SL: ${chiTietHoaDon.soLuong}</p>
            </div>
        </c:forEach>
    </div>
    <div class="signature">
        <div>
            <p class="mb-0">Tiền thu hộ: <span class="money">
                 <fmt:formatNumber value="${tongTienThanhToan}" type="currency" currencySymbol="₫"
                                   groupingUsed="true"/>

            </span></p>
        </div>
        <div class="signature-box">
            <p class="mb-0 sign">Chữ ký người nhận</p>
            <p class="mb-0  confirm">(Xác nhận hàng nguyên vẹn, không móp, méo)</p>
        </div>
    </div>
</div>
</body>
</html>
</html>
