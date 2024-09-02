package com.example.java4.entities;

import jakarta.persistence.*;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class SanPham {
    private String id;
    private String ma;
    private String ten;
    private String hinhAnh;
    private LocalDateTime ngayTao;
    private Integer trangThai;

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "ID")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "Ma")
    public String getMa() {
        return ma;
    }

    public void setMa(String ma) {
        this.ma = ma;
    }

    @Column(name = "Ten")
    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    @Column(name = "HinhAnh")
    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    @Column(name = "NgayTao")
    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(LocalDateTime ngayTao) {
        this.ngayTao = ngayTao;
    }

    @Column(name = "TrangThai")
    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SanPham sanPham = (SanPham) o;
        return Objects.equals(id, sanPham.id) && Objects.equals(ma, sanPham.ma) && Objects.equals(ten, sanPham.ten) && Objects.equals(hinhAnh, sanPham.hinhAnh) && Objects.equals(ngayTao, sanPham.ngayTao) && Objects.equals(trangThai, sanPham.trangThai);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, ma, ten, hinhAnh, ngayTao, trangThai);
    }
}
