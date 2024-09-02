package com.example.java4.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CTHDResponse {
    private String idHD;
    private String idCTHD;
    private String idCTSP;
    private String hinhAnh1;
    private String tenSanPham;
    private String tenMauSac;
    private String tenKichThuoc;
    private String tenChatLieu;
    private String tenKieuTay;
    private Integer soLuong;
    private BigDecimal donGia;
    private Integer trangThai;
}
