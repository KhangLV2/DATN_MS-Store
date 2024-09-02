
<%@page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <!-- General Form Elements -->
                        <sf:form method="POST" action="/nhan-vien/store" class="mt-4" modelAttribute="data">

                            <div class="row mb-3">
                                <label class="col-sm-4 col-form-label">Tên</label>
                                <div class="col-sm-8">
                                    <sf:input type="text" class="form-control" path="ten"/>
                                    <sf:errors path="ten" cssStyle="color: red"></sf:errors>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-4 col-form-label">Mã</label>
                                <div class="col-sm-8">
                                    <sf:input type="text" class="form-control" path="ma"/>
                                    <sf:errors path="ma" cssStyle="color: red"></sf:errors>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-4 col-form-label">Tên đăng nhập</label>
                                <div class="col-sm-8">
                                    <sf:input type="text" class="form-control" path="tenDangNhap"/>
                                    <sf:errors path="tenDangNhap" cssStyle="color: red"></sf:errors>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-4 col-form-label">Mật khẩu</label>
                                <div class="col-sm-8">
                                    <sf:input type="text" class="form-control" path="matKhau"/>
                                    <sf:errors path="matKhau" cssStyle="color: red"></sf:errors>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <sf:input type="hidden" class="form-control" path="trangThai" value="0"/>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary text-end">CREATE</button>
                            </div>

                        </sf:form><!-- End General Form Elements -->

                    </div>
                </div>

            </div>

        </div>
    </section>

</main><!-- End #main -->

</body>
</html>