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
    <script src="https://esgoo.net/scripts/jquery.js"></script>
    <style type="text/css">
        .css_select_div{ text-align: center;}
        .css_select{ display: inline-table; width: 25%; padding: 5px; margin: 5px 2%; border: solid 1px #686868; border-radius: 5px;}
    </style>
</head>
<body>

<div class="css_select_div">
    <form method="post" action="/store/addDC" id="diaChiForm">
        <select class="css_select" id="tinh" name="tinh" title="Chọn Tỉnh Thành">
            <option value="0">Tỉnh Thành</option>
        </select>
        <select class="css_select" id="quan" name="quan" title="Chọn Quận Huyện">
            <option value="0">Quận Huyện</option>
        </select>
        <select class="css_select" id="phuong" name="phuong" title="Chọn Phường Xã">
            <option value="0">Phường Xã</option>
        </select>
        <div>
            <button type="submit">Submit</button>
        </div>
    </form>
</div>

</body>
<script>
    $(document).ready(function() {
        var token = '4787bafa-2157-11ef-a90d-aaf29aa34580';

        // Function to get JSON with token
        function getJSONWithToken(url, callback) {
            $.ajax({
                url: url,
                headers: {
                    'Token': token
                },
                success: callback,
                error: function (xhr, status, error) {
                    console.error("Error: " + error);
                }
            });
        }

        // Lấy tỉnh thành
        getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', function(data_tinh){

            data_tinh.data.sort(function(a, b) {
                return a.ProvinceID - b.ProvinceID;
            });

            $.each(data_tinh.data, function (key_tinh, val_tinh) {
                $("#tinh").append('<option value="'+val_tinh.ProvinceID+'" name="'+val_tinh.ProvinceName+'">'+val_tinh.ProvinceName+'</option>');
            });

            $("#tinh").change(function(e){
                var idtinh = $(this).val();

                // Lấy quận huyện
                getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=' + idtinh, function(data_quan){
                    $("#quan").html('<option value="0">Quận Huyện</option>');
                    $("#phuong").html('<option value="0">Phường Xã</option>');
                    $.each(data_quan.data, function (key_quan, val_quan) {
                        $("#quan").append('<option value="'+val_quan.DistrictID+'">'+val_quan.DistrictName+'</option>');
                    });

                    // Lấy phường xã
                    $("#quan").change(function(e){
                        var idquan = $(this).val();
                        getJSONWithToken('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=' + idquan, function(data_phuong){
                            $("#phuong").html('<option value="0">Phường Xã</option>');
                            $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                $("#phuong").append('<option value="'+val_phuong.WardCode+'">'+val_phuong.WardName+'</option>');
                            });
                        });
                    });
                });
            });
        });

        $("#diaChiForm").submit(function(e) {
            var tenTinh = $("#tinh option:selected").text();
            var tenQuan = $("#quan option:selected").text();
            var tenPhuong = $("#phuong option:selected").text();

            $("<input>").attr({
                type: "hidden",
                name: "tenTinh",
                value: tenTinh
            }).appendTo("#diaChiForm");

            $("<input>").attr({
                type: "hidden",
                name: "tenQuan",
                value: tenQuan
            }).appendTo("#diaChiForm");

            $("<input>").attr({
                type: "hidden",
                name: "tenPhuong",
                value: tenPhuong
            }).appendTo("#diaChiForm");

            return true;
        });
    });
</script>
</html>