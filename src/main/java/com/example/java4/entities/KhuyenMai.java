package com.example.java4.entities;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class KhuyenMai {
    private String id;
    private String ma;
    private String ten;
    private Date ngayBatDau;
    private Date ngayKetThuc;
    private BigDecimal soTienGiam;
    private BigDecimal apDung;
    private Integer soLuong;
    private Integer trangThai;
    private LocalDateTime ngayTao;


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

    @Column(name = "NgayBatDau")
    public Date getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(Date ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    @Column(name = "NgayKetThuc")
    public Date getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }

    @Column(name = "SoTienGiam")
    public BigDecimal getSoTienGiam() {
        return soTienGiam;
    }

    public void setSoTienGiam(BigDecimal soTienGiam) {
        this.soTienGiam = soTienGiam;
    }

    @Column(name = "ApDung")
    public BigDecimal getApDung() {
        return apDung;
    }

    public void setApDung(BigDecimal apDung) {
        this.apDung = apDung;
    }

    @Column(name = "SoLuong")
    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    @Column(name = "TrangThai")
    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }

    @Column(name = "NgayTao")
    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(LocalDateTime ngayTao) {
        this.ngayTao = ngayTao;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        KhuyenMai khuyenMai = (KhuyenMai) o;

        return Objects.equals(id, khuyenMai.id) &&
                Objects.equals(ma, khuyenMai.ma) &&
                Objects.equals(ten, khuyenMai.ten) &&
                Objects.equals(ngayBatDau, khuyenMai.ngayBatDau) &&
                Objects.equals(ngayKetThuc, khuyenMai.ngayKetThuc) &&
                Objects.equals(soTienGiam, khuyenMai.soTienGiam) &&
                Objects.equals(soLuong, khuyenMai.soLuong) &&
                Objects.equals(trangThai, khuyenMai.trangThai) &&
                Objects.equals(ngayTao, khuyenMai.ngayTao) &&
                Objects.equals(apDung, khuyenMai.apDung);

    }

    @Override
    public int hashCode() {

        return Objects.hash(id, ma, ten, ngayBatDau, ngayKetThuc, soTienGiam, soLuong, trangThai, ngayTao, apDung);

    }
}
