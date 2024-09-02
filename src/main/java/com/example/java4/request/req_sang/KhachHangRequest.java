package com.example.java4.request.req_sang;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KhachHangRequest {
//    @NotBlank(message = "Vui lòng nhập tài khoản.")
    private String taiKhoan;
//    @NotBlank(message = "Vui lòng nhập mật khẩu.")
    private String matKhau;
    private String nhapLaiMatKhau;

//    @NotBlank(message = "Vui lòng nhập email.")
    private String email;
//    @NotBlank(message = "Vui lòng nhập số điện thoại")
    private String sdt;

    private String hoTen;
    private Integer gioiTinh;
    private Date ngaySinh;

    private LocalDateTime ngayTao;

    private Integer trangThai;
}
