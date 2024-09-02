package com.example.java4.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class KhachHangDTO {

    private String id;
    private String hoTen;
    private Integer gioiTinh;
    private String sdt;
    private Date ngaySinh;
    private String taiKhoan;
    private String matKhau;
    private String email;
    private String anhDaiDien;
    private LocalDateTime ngayTao;
    private LocalDateTime ngaySua;
    private Integer trangThai;
}
