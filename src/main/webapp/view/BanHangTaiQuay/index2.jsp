<%@page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

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
</head>
<body>
<div class="modal-body" >


    <div id="contentAjax2">

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
                            <button class="btn btn-success" type="submit">+</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>



</div>
</body>

<script>
    // Fomat sang VNĐ bảng hóa đơn chi tiết
    function formatCurrencyVND(amount) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
    }

    document.querySelectorAll('.price').forEach(function(cell) {
        let amount = parseFloat(cell.textContent);
        cell.textContent = formatCurrencyVND(amount);
    });
    // End
</script>

</html>