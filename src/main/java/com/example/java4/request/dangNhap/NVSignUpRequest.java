package com.example.java4.request.dangNhap;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NVSignUpRequest {

    private String hoTen;

    private Integer gioiTinh;


    private Date ngaySinh;

    private String sdt;

    private String taiKhoan;

    private String matKhau;

    private String anhDaiDien;

    private LocalDateTime ngayTao;

    private LocalDateTime ngaySua;

    private Integer trangThai;

    private String idCV;
}
