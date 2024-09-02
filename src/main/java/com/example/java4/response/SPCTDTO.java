package com.example.java4.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SPCTDTO {

    private String tenSanPham;
    private String maSanPham;
    private String tenKichThuoc;
    private String tenMauSac;
    private BigDecimal giaBan;
//    private String hinhAnh;
    private Long soLuong;


    public SPCTDTO(String tenSanPham, String maSanPham, BigDecimal giaBan, Long soLuong) {
        this.tenSanPham = tenSanPham;
        this.maSanPham = maSanPham;
        this.giaBan = giaBan;
        this.soLuong = soLuong;
    }
}
