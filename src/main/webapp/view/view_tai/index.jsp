<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <script src="js/main.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <title>Document</title>
    <%--    Thư viện Sweet Alert 2 để thông báo--%>
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><strong>NEXTCOP</strong></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/Home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/Home/employee">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/Home/contactServlet">Contacts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/Home/loginServlet">Login</a>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control bg-light me-2" style="border:none" type="search"
                           placeholder="Tìm kiếm" aria-label="Tìm kiếm">
                    <button type="button" class="btn btn-danger">Search</button>
                </form>
            </div>
        </div>
    </nav>
</header>
<!-- <div class="col-f" style="width:700px;margin-left: auto;margin-right: auto;"> -->
<footer id="footer" style="margin-top: 60px;">
    <div class="container">
        <div class="row" style="width:750px;margin-left: auto;margin-right: auto;">
            <div class="col-4 md-4">
                <div class="useful-link">
                    <h2 style="color:white;">Useful Links</h2>
                    <div class="use-links">
                        <li><a href=""><i class="fa-solid fa-angles-right"></i> Home</a></li>
                        <li><a href=""><i class="fa-solid fa-angles-right"></i> About Us</a>
                        </li>
                        <li><a href=""><i class="fa-solid fa-angles-right"></i> Gallery</a>
                        </li>
                        <li><a href=""><i class="fa-solid fa-angles-right"></i> Contact</a>
                        </li>
                    </div>
                </div>
            </div>
            <div class="col-4 md-4">
                <div class="social-links">
                    <h2 style="color: white;">Follow Us</h2>
                    <div class="social-icons">
                        <li><a href=""><i class="fa-brands fa-facebook-f"></i> Facebook</a></li>
                        <li><a href=""><i class="fa-brands fa-instagram"></i> Instagram</a></li>
                        <li><a href=""><i class="fa-brands fa-linkedin-in"></i> Linkedin</a></li>
                    </div>
                </div>
            </div>
            <div class="col-4 md-4">
                <div class="address">
                    <h2 style="color: white">Address</h2>
                    <div class="address-links">
                        <li class="address1"><i class="fa-solid fa-location-dot"></i>FPT
                            Nam Từ Liêm-
                            Hà Nội
                            Việt Nam
                        </li>
                        <li><a href=""><i class="fa-solid fa-phone"></i> +84374223222</a></li>
                        <li><a href=""><i class="fa-solid fa-envelope"></i> phucloc@gmail.com</a></li>
                    </div>
                </div>
            </div>
        </div>
    </div>


</footer>

<%--Thông báo đăng nhập thành công--%>
<%-- Thông báo đăng nhập thành công --%>
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

        <c:if test="${not empty successMessage}">
        Toast.fire({
            icon: "success",
            title: "${successMessage}"
        });
        </c:if>
    </script>
    </script>
</body>
</html>