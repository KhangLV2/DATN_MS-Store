package com.example.java4.config;

public class HoaDonUtil {


    public static String getTrangThaiName(Integer trangThai) {
        switch (trangThai) {
            case 0:
                return "Chờ thanh toán";
            case 1:
                return "Chờ xác nhận";
            case 2:
                return "Đã xác nhận";
            case 3:
                return "Chờ giao hàng";
            case 4:
                return "Đang vận chuyển";
            case 5:
                return "Giao hàng thành công";
            case 6:
                return "Đã hoàn thành";
            case 7:
                return "Đã hủy";
            default:
                return "Không xác định";
        }
    }

    public static String getStatusClass(int status) {
        switch(status) {
            case 0:
            case 1:
                return "bg-danger";
            case 3:
            case 4:
                return "bg-warning";
            case 5:
            case 6:
                return "bg-success";
            case 7:
                return "bg-danger";
            default:
                return "bg-primary";
        }
    }
}
