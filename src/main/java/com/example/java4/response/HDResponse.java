package com.example.java4.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HDResponse {
    private String maHD;
    private String hoTen;
    private String sdt;
    private String tenNguoiNhan;
    private String sdtNguoiNhan;
    private String diaChiChiTiet;
    private String idPhuongXa;
    private String idQuanHuyen;
    private String idTinhThanh;
    private String ghiChu;
    private LocalDateTime ngayThanhToan;
    private LocalDateTime ngayShip;
    private LocalDateTime ngayNhan;
    private Integer trangThai;
    private Integer loaiHoaDon;
    private BigDecimal tongTien;
    private BigDecimal soTienGiamKM;
    private BigDecimal tienShip;
}
