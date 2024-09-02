package com.example.java4.entities;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
public class DiaChi {
    private String id;
    private String tenNguoiNhan;
    private String sdtNguoiNhan;
    private String diaChiChiTiet;
    private String idPhuongXa;
    private String idQuanHuyen;
    private String idTinhThanh;

    private Integer idT;
    private Integer idQH;
    private String idPX;

    private String idNhanVien;
    private KhachHang idKhachHang;
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

    @Column(name = "TenNguoiNhan")
    public String getTenNguoiNhan() {
        return tenNguoiNhan;
    }

    public void setTenNguoiNhan(String tenNguoiNhan) {
        this.tenNguoiNhan = tenNguoiNhan;
    }

    @Column(name = "SDTNguoiNhan")
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

    @Column(name = "TrangThai")
    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
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

    //
    @Column(name = "IdT")
    public Integer getIdT() {
        return idT;
    }

    public void setIdT(Integer idT) {
        this.idT = idT;
    }

    @Column(name = "QH")
    public Integer getIdQH() { return idQH;
    }

    public void setIdQH(Integer idQH) {
        this.idQH = idQH;
    }

    @Column(name = "IdPX")
    public String getIdPX() { return idPX;
    }

    public void setIdPX(String idPX) {
        this.idPX = idPX;
    }
    //

    @Column(name = "IdNV")
    public String getIdNhanVien() {
        return idNhanVien;
    }

    public void setIdNhanVien(String idNhanVien) {
        this.idNhanVien = idNhanVien;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DiaChi diaChi = (DiaChi) o;
        return Objects.equals(id, diaChi.id) && Objects.equals(tenNguoiNhan, diaChi.tenNguoiNhan) && Objects.equals(sdtNguoiNhan, diaChi.sdtNguoiNhan) && Objects.equals(diaChiChiTiet, diaChi.diaChiChiTiet) && Objects.equals(idPhuongXa, diaChi.idPhuongXa) && Objects.equals(idQuanHuyen, diaChi.idQuanHuyen) && Objects.equals(idTinhThanh, diaChi.idTinhThanh) && Objects.equals(idNhanVien, diaChi.idNhanVien) && Objects.equals(trangThai, diaChi.trangThai);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, diaChiChiTiet, trangThai);
    }


    @ManyToOne
    @JoinColumn(name = "IdKH", referencedColumnName = "ID")
    public KhachHang getIdKhachHang() {
        return idKhachHang;
    }

    public void setIdKhachHang(KhachHang khachHangByIdKh) {
        this.idKhachHang = khachHangByIdKh;
    }
}
