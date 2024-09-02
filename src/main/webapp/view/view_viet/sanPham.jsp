<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<h3 class="text-center">Thêm sản phẩm</h3>
<sf:form class="container" method="post" action="/store/add" modelAttribute="sanPham">
    <div class="input-group mb-3">
        <span class="input-group-text" >Tên sản phẩm: </span>
        <sf:input type="text" class="form-control" path="ten" />
    </div>
    <sf:errors path="ten" cssClass="text-danger" />

    <div class="input-group mb-3">
        <span class="input-group-text" >Trạng thái: </span>
        <sf:input type="number" class="form-control" path="trangThai" />
    </div>
    <sf:errors path="trangThai" cssClass="text-danger" />

    <div class="input-group mb-3">
        <span class="input-group-text" >Ngày tạo: </span>
        <sf:input type="date" class="form-control" path="ngayTao" />
    </div>
    <sf:errors path="ngayTao" cssClass="text-danger" />

    <div class="text-center">
        <button type="submit" class="btn btn-success">Add</button>
    </div>
</sf:form>

<h3 class="text-center">Danh sách sản phẩm</h3>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Mã</th>
            <th scope="col">Tên</th>
            <th scope="col">Ngày tạo</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="i" items="${listSP}" var="sanPham">
            <tr>
                <th>${sanPham.id}</th>
                <td>${sanPham.ma}</td>
                <td>${sanPham.ten}</td>
                <td>${sanPham.ngayTao}</td>
                <td>${sanPham.trangThai}</td>
                <td>
                    <a href="/store/edit/${sanPham.id}"><button class="btn btn-warning">Edit</button></a>
                    <a href="/store/delete/${sanPham.id}"><button class="btn btn-danger">Delete</button></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>