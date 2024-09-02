package com.example.java4.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class SanPhamChiTietResponse {

    private UUID id;

    private String tenMauSac;

    private String tenKichThuoc;

    private String tenSanPham;

    private String maSPCT;

    private Integer soLuong;

    private Double donGia;

    private Integer trangThai;
}
