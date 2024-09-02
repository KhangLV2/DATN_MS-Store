package com.example.java4.entities;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class GiaoHang {
    private String id;
    private HoaDon idHoaDon;
    private String tenNguoiNhan;
    private String sdtNguoiNhan;
    private String diaChiChiTiet;
    private String idPhuongXa;
    private String idQuanHuyen;
    private String idTinhThanh;
    private LocalDateTime ngayShip;
    private LocalDateTime ngayNhan;
    private BigDecimal phiShip;
    private Integer trangThai;
    private String ghiChu;

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "ID")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "TenNguoiNhan")
    public String getTenNguoiNhan() {
        return tenNguoiNhan;
    }

    public void setTenNguoiNhan(String tenNguoiNhan) {
        this.tenNguoiNhan = tenNguoiNhan;
    }

    @Column(name = "SdtNguoiNhan")
    public String getSdtNguoiNhan() {
        return sdtNguoiNhan;
    }

    public void setSdtNguoiNhan(String sdtNguoiNhan) {
        this.sdtNguoiNhan = sdtNguoiNhan;
    }

    @Column(name = "DiaChiChiTiet")
    public String getDiaChiChiTiet() {
        return diaChiChiTiet;
    }

    public void setDiaChiChiTiet(String diaChiChiTiet) {
        this.diaChiChiTiet = diaChiChiTiet;
    }

    @Column(name = "IdPhuongXa")
    public String getIdPhuongXa() {
        return idPhuongXa;
    }

    public void setIdPhuongXa(String idPhuongXa) {
        this.idPhuongXa = idPhuongXa;
    }

    @Column(name = "IdQuanHuyen")
    public String getIdQuanHuyen() {
        return idQuanHuyen;
    }

    public void setIdQuanHuyen(String idQuanHuyen) {

        this.idQuanHuyen = idQuanHuyen;
    }

    @Column(name = "IdTinhThanh")
    public String getIdTinhThanh() {
        return idTinhThanh;
    }

    public void setIdTinhThanh(String idTinhThanh) {
        this.idTinhThanh = idTinhThanh;
    }

    @Column(name = "NgayShip")
    public LocalDateTime getNgayShip() {
        return ngayShip;
    }

    public void setNgayShip(LocalDateTime ngayShip) {
        this.ngayShip = ngayShip;
    }

    @Column(name = "NgayNhan")
    public LocalDateTime getNgayNhan() {
        return ngayNhan;
    }

    public void setNgayNhan(LocalDateTime ngayNhan) {
        this.ngayNhan = ngayNhan;
    }

    @Column(name = "PhiShip")
    public BigDecimal getPhiShip() {
        return phiShip;
    }

    public void setPhiShip(BigDecimal phiShip) {
        this.phiShip = phiShip;
    }

    @Column(name = "TrangThai")
    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }

    @Column(name = "GhiChu")
    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GiaoHang giaoHang = (GiaoHang) o;
        return Objects.equals(id, giaoHang.id) && Objects.equals(tenNguoiNhan, giaoHang.tenNguoiNhan) && Objects.equals(sdtNguoiNhan, giaoHang.sdtNguoiNhan) && Objects.equals(diaChiChiTiet, giaoHang.diaChiChiTiet) && Objects.equals(idPhuongXa, giaoHang.idPhuongXa) && Objects.equals(idQuanHuyen, giaoHang.idQuanHuyen) && Objects.equals(idTinhThanh, giaoHang.idTinhThanh) && Objects.equals(ngayShip, giaoHang.ngayShip) && Objects.equals(ngayNhan, giaoHang.ngayNhan) && Objects.equals(phiShip, giaoHang.phiShip) && Objects.equals(trangThai, giaoHang.trangThai) && Objects.equals(ghiChu, giaoHang.ghiChu);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, tenNguoiNhan, sdtNguoiNhan, diaChiChiTiet, ngayShip, ngayNhan, phiShip, trangThai);
    }

    @OneToOne
    @JoinColumn(name = "IdHoaDon", referencedColumnName = "ID")
    public HoaDon getIdHoaDon() {
        return idHoaDon;
    }

    public void setIdHoaDon(HoaDon hoaDonByIdHoaDon) {
        this.idHoaDon = hoaDonByIdHoaDon;
    }
}
