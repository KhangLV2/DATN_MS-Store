<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <th>Tên nhân viên</th>
                    <th>Details
                        <form action="/ban-hang/add-hoa-don" method="post" style="float: right;">
                            <button type="submit" class="btn btn-success">+</button>
                        </form>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
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

                </tr>
                </thead>
                <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
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
                    <th>Kích thước</th>
                    <th>Màu sắc</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>

        </div>
        <div class="col-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">HÓA ĐƠN</h5>
                    <sf:form method="POST" action="/ban-hang/thanh-toan/${data.id}" modelAttribute="data">
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">ID hóa đơn</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Ngày tạo</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Sđt khách hàng</label>
                            <div class="col-sm-6">
                                <sf:select path="idKhachHang" class="form-select "
                                           aria-label="Default select example">
                                    <option value="">132321</option>
                                </sf:select>
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
                            </div>
                            <i id="calculateChangeButton" class=" col-sm-2 bi bi-chevron-double-down"
                               style="font-size: 20px" onclick="calculateChange()"></i>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Trả lại</label>
                            <div class="col-sm-8">
                                <input id="tienTraLai" type="number" class="form-control" required>
                            </div>
                        </div>
                        <div class="row mb-3 mt-4 justify-content-end text-end">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-success ">THANH
                                    TOÁN</button>
                            </div>
                        </div>
                    </sf:form>
                    <!-- End General Form Elements -->
                </div>
            </div><!-- End Recent Activity -->
            <!--  -->
        </div>
    </div>
</div>
</body>

</html>