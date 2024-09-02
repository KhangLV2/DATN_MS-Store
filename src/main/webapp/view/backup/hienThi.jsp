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

    <div  id="contentAjax">

        <table class="table table-hover">
            <thead>
            <tr>
                <th>Tên khách hàng</th>
                <th>Số điện thoại</th>
                <th>Chọn</th>
            </tr>
            </thead>
            <tbody id="results">
            <c:forEach items="${pageData.content}" var="kh">
                <tr>
                    <td>${kh.hoTen}</td>
                    <td>${kh.sdt}</td>
                    <td>
                        <form action="/ban-hang-tai-quay/find-kh/${kh.id}" method="post">
                            <input type="hidden" name="idHoaDon" value="${hoaDon.id}">
                            <input type="hidden" name="maHoaDon" value="${hoaDon.ma}">
                            <input type="hidden" class="form-control" name="ngayTao" value="${hoaDon.ngayTao}">
                            <button class="btn btn-primary" type="submit">+</button>
                        </form>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>



</div>
</body>


</html>