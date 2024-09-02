<%@page pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<main id="main" class="main">

    <div class="pagetitle">
        <h5>QUẢN LÝ NHÂN VIÊN</h5>

    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">


            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Danh sách nhân viên</h5>


                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Mã</th>
                                <th scope="col">Tên đăng nhập</th>
                                <th scope="col">Mật khẩu</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="i" items="${listNV}" varStatus="nv">
                                <tr>
                                    <th scope="row">${i.id}</th>
                                    <td>${i.ten}</td>
                                    <td>${i.ma}</td>
                                    <td>${i.tenDangNhap}</td>
                                    <td>${i.matKhau}</td>
                                    <td>
                                        <c:if test="${i.trangThai == 0}">Còn hoạt động</c:if>
                                        <c:if test="${i.trangThai == 1}">Ngừng hoạt động</c:if>
                                    </td>
                                    <td>
                                        <a href="/nhan-vien/edit/${i.id}" class="btn btn-warning">Update</a>
                                        <a href="/nhan-vien/delete/${i.id}" class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa không')">Delete</a>
                                    </td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
        </div>
    </section>

</main><!-- End #main -->

</body>
</html>