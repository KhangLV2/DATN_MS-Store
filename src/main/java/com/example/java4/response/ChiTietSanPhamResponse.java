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
public class ChiTietSanPhamResponse {
    private String idCTSP;
    private String idSP;
    private String maSP;
    private String tenSanPham;
    private String tenMauSac;
    private String tenKichThuoc;
    private String tenKieuTay;
    private String tenChatLieu;
    private Integer soLuong;
    private BigDecimal giaBan;
    private String hinhAnh1;
}
