package com.example.java4.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class KhachHang {
    private String id;
    private String hoTen;
    private Integer gioiTinh;
    private String sdt;
    private Date ngaySinh;
    private String taiKhoan;
    private String matKhau;
    private String email;
    private String anhDaiDien;
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

    @Column(name = "HoTen")
    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    @Column(name = "GioiTinh")
    public Integer getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(Integer gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    @Column(name = "Sdt")
    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    @Column(name = "NgaySinh")
    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    @Column(name = "TaiKhoan")
    public String getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(String taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    @Column(name = "MatKhau")
    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    @Column(name = "Email")
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "AnhDaiDien")
    public String getAnhDaiDien() {
        return anhDaiDien;
    }

    public void setAnhDaiDien(String anhDaiDien) {
        this.anhDaiDien = anhDaiDien;
    }


    @Column(name = "NgayTao")
    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(LocalDateTime ngayTao) {
        this.ngayTao = ngayTao;
    }

    @Column(name = "NgaySua")
    public LocalDateTime getNgaySua() {
        return ngaySua;
    }

    public void setNgaySua(LocalDateTime ngaySua) {
        this.ngaySua = ngaySua;
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
        KhachHang khachHang = (KhachHang) o;
        return Objects.equals(id, khachHang.id) && Objects.equals(hoTen, khachHang.hoTen) && Objects.equals(gioiTinh, khachHang.gioiTinh) && Objects.equals(sdt, khachHang.sdt) && Objects.equals(ngaySinh, khachHang.ngaySinh) && Objects.equals(taiKhoan, khachHang.taiKhoan) && Objects.equals(matKhau, khachHang.matKhau) && Objects.equals(anhDaiDien, khachHang.anhDaiDien) && Objects.equals(ngayTao, khachHang.ngayTao) && Objects.equals(ngaySua, khachHang.ngaySua) && Objects.equals(trangThai, khachHang.trangThai);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, hoTen, gioiTinh, sdt, ngaySinh, taiKhoan, matKhau, anhDaiDien, ngayTao, ngaySua, trangThai);
    }
}
