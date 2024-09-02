<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>


    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <%--    Thêm thư viện SweetAlert2 để thiển thị thông báo--%>
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            margin: 0;
            padding: 0;
            background: #eee;
            height: 100vh;
        }

        #login .container #login-row #login-column #login-box {
            margin-top: 120px;
            max-width: 600px;
            height: 360px;
            /*border: 1px solid #9C9C9C;*/
            border-radius: 25px;
            background: #FFFFFF;
        }

        #login .container #login-row #login-column #login-box #login-form {
            padding: 20px;
        }

        #login .container #login-row #login-column #login-box #login-form #register-link {
            margin-top: -85px;
        }

        /*.login-form-wrapper {*/
        /*    min-height: 320px; !* Đặt kích thước tối thiểu cho khung form *!*/
        /*}*/

        .text-danger {
            min-height: 1.5em; /* Đặt chiều cao tối thiểu */
            display: block; /* Đảm bảo phần tử là block để áp dụng min-height */
        }
    </style>

</head>
<body>
<div id="login">


    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div id="login-box" class="col-md-12 ">
                    <div class="login-form-wrapper">
                        <form id="login-form" class="form" action="/store/dang-nhap" method="post">
                            <h3 class="text-center text-info">Login</h3>

                            <div class="form-group">
                                <label path="taiKhoan" class="text-info">Username:</label><br>
                                <input path="taiKhoan" class="form-control" name="taiKhoan" id="taiKhoan">
                                <small id="taiKhoanError" class="text-danger">

                                </small>
                            </div>
                            <div class="form-group">
                                <label path="matKhau" class="text-info">Password:</label><br>
                                <input type="password" path="matKhau" class="form-control" name="matKhau" id="matKhau">
                                <small id="matKhauError" class="text-danger"></small>
                            </div>
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span>Remember me</span> <span><input
                                        id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md w-100" value="Submit">
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>


</div>


<script>
    //  // Hiển thị thông báo thất bại nếu đăng nhập thất bại
    const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.onmouseenter = Swal.stopTimer;
            toast.onmouseleave = Swal.resumeTimer;
        }
    });

    <c:if test="${not empty error}">
    Toast.fire({
        icon: "error",
        title: "${error}"
    });
    </c:if>

    <c:if test="${not empty success}">
    Toast.fire({
        icon: "success",
        title: "${success}"
    });
    </c:if>


    $(document).ready(function () {
        // Bắt lỗi khi submit form
        $('#login-form').submit(function (event) {
            var username = $('#taiKhoan').val().trim();
            var password = $('#matKhau').val().trim();


            if (!username || !password) {
                event.preventDefault(); // Ngăn form submit
                if (!username) {
                    $('#taiKhoanError').text('Vui lòng nhập username.');
                    $('#taiKhoan').addClass('border-danger');
                } else {
                    $('#taiKhoanError').text('');
                    $('#taiKhoan').removeClass('border-danger');
                    // $('#taiKhoanError').removeClass('bg-danger text-white'); // Xóa background màu đỏ và màu chữ trắng
                }
                if (!password) {
                    $('#matKhauError').text('Vui lòng nhập password.');
                    $('#matKhau').addClass('border-danger'); // Thêm border màu đỏ
                } else {
                    $('#matKhauError').text(''); // Ẩn thông báo lỗi password nếu đã nhập đúng
                    $('#matKhau').removeClass('border-danger'); // Xóa border màu đỏ
                }
            } else {
                $('#taiKhoanError').text('');
                $('#matKhauError').text('');
                $('#taiKhoan').removeClass('border-danger');
                $('#matKhau').removeClass('border-danger');
            }


        });

        // Ẩn lỗi khi người dùng click vào trường input
        $('input').focus(function () {
            $(this).siblings('.text-danger').text(''); // Ẩn thông báo lỗi
            $(this).removeClass('border-danger'); // Xóa border màu đỏ
            // $(this).siblings('.text-danger').removeClass('bg-danger text-white'); // Xóa background màu đỏ và màu chữ trắng
        });

        // Hiển thị lỗi từ Controller (nếu có)
        var errorUsername = '<%= request.getAttribute("errorUsername") %>';
        var errorPassword = '<%= request.getAttribute("errorPassword") %>';

        if (errorUsername && errorUsername !== 'null') {
            $('#taiKhoanError').text(errorUsername);
            $('#taiKhoan').addClass('border-danger');
        }
        if (errorPassword && errorPassword !== 'null') {
            $('#matKhauError').text(errorPassword);
            $('#matKhau').addClass('border-danger');
        }
    });
</script>

</body>
</html>


