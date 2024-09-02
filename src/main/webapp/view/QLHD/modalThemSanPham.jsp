<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <div id="contentModalAddProduct">
        <table class="table table-hover table-bordered custom-table ">
            <thead>
            <tr>
                <th>STT</th>
                <th>Tên sản phẩm</th>
                <th>Ảnh sản phẩm</th>
                <th>Màu sắc</th>
                <th>Kích thước</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody id="chiTietSanPhamTableBody">
            <c:forEach var="product" items="${listCTSP.content}" varStatus="status">
                <tr>
                <c:if test="${product.soLuong > 0 }">
                    <td>${status.index + 1}</td>
                    <td>${product.idSanPham.ten}</td>
                    <td>
                        <c:set var="hinhAnh" value="${hinhAnhMapCTSP[product.id]}"/>
                        <c:choose>
                            <c:when test="${not empty hinhAnh}">
                                <img src="/image/${hinhAnh.hinhAnh1}" alt="Ảnh sản phẩm" width="50">
                            </c:when>
                        </c:choose>
                    </td>
                    <td>${product.idMauSac.ten}</td>
                    <td>${product.idKichThuoc.ten}</td>
                    <td>${product.soLuong}</td>
                    <td>
                        <span class="text-danger ">
                                         <fmt:formatNumber value="${product.giaBan}" type="currency"
                                                           currencySymbol="₫" groupingUsed="true"/>
                        </span>
                    </td>
                    <td><span
                            class=" fw-normal badge rounded-pill ${product.trangThai == 0 ? 'bg-danger' : 'bg-success'}">
                            ${product.trangThai == 0 ? "Hết hàng" : "Còn hàng"}
                    </span></td>
                    <td>
                        <!-- Thao tác, ví dụ như nút sửa, xóa -->

                        <a href="/hoa-don/them-san-pham/${product.id}?idHoaDon=${hoaDonDTO.id}">
                            <button class="btn btn-primary btn-sm">Chọn</button>
                        </a>
                    </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>

    </div>



</div>
</body>



</html>