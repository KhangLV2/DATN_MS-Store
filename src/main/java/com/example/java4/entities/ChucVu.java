package com.example.java4.entities;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class ChucVu {
    private String id;
    private String ten;
    private LocalDateTime ngayTao;
    private LocalDateTime ngaySua;
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

    @Basic
    @Column(name = "Ten")
    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    @Basic
    @Column(name = "NgayTao")
    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(LocalDateTime ngayTao) {
        this.ngayTao = ngayTao;
    }

    @Basic
    @Column(name = "NgaySua")
    public LocalDateTime getNgaySua() {
        return ngaySua;
    }

    public void setNgaySua(LocalDateTime ngaySua) {
        this.ngaySua = ngaySua;
    }

    @Basic
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
        ChucVu chucVu = (ChucVu) o;
        return Objects.equals(id, chucVu.id) && Objects.equals(ten, chucVu.ten) && Objects.equals(ngayTao, chucVu.ngayTao) && Objects.equals(ngaySua, chucVu.ngaySua) && Objects.equals(trangThai, chucVu.trangThai);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, ten, ngayTao, ngaySua, trangThai);
    }
}
