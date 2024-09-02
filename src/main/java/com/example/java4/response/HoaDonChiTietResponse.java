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

public class HoaDonChiTietResponse {

    private String id;
    private String ma;
    private String hinhAnh1;
    private String tenSP;
    private Integer soLuong;
    private String mauSac;
    private String tenKieuTay;
    private BigDecimal giaBan;
    private Integer trangThai;
}
