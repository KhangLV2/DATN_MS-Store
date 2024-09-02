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
public class GioHangResponse {
    private String idHDCT;
    private String tenSanPham;
    private String hinhAnh1;
    private String tenMauSac;
    private String tenKichThuoc;
    private Integer soLuong;
    private Integer soLuongCTSP;
    private BigDecimal donGia;
}