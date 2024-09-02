package com.example.java4.response;

import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.entities.HoaDon;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonChiTietDTO {

    private String id;
    private HoaDon hoaDon;
    private ChiTietSanPham sanPhamChiTiet;
    private Integer soLuong;
    private Double donGia;
    private String ngayTao;
    private String ngayCapNhat;

    public HoaDonChiTietDTO(String id, HoaDon hoaDon, ChiTietSanPham sanPhamChiTiet, Integer soLuong, Double donGia) {
        this.id = id;
        this.hoaDon = hoaDon;
        this.sanPhamChiTiet = sanPhamChiTiet;
        this.soLuong = soLuong;
        this.donGia = donGia;
    }
}
