package com.example.java4.entities.noMap;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Objects;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="chiTietSanPham")
public class ChiTietSanPhamNoMap {
    private String id;
    private Integer soLuong;
    private String moTa;
    private BigDecimal giaNhap;
    private BigDecimal giaBan;
    private LocalDateTime ngayTao;
    private Integer trangThai;
    private String idMauSac;
    private String idKichThuoc;
    private String idChatLieu;
    private String idKieuTay;
    private String idSanPham;

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "ID")
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "SoLuong")
    public Integer getSoLuong() {
        return soLuong;
    }
    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    @Column(name = "MoTa")
    public String getMoTa() {
        return moTa;
    }
    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    @Column(name = "GiaNhap")
    public BigDecimal getGiaNhap() {
        return giaNhap;
    }
    public void setGiaNhap(BigDecimal giaNhap) {
        this.giaNhap = giaNhap;
    }

    @Column(name = "GiaBan")
    public BigDecimal getGiaBan() {
        return giaBan;
    }
    public void setGiaBan(BigDecimal giaBan) {
        this.giaBan = giaBan;
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
        ChiTietSanPhamNoMap that = (ChiTietSanPhamNoMap) o;
        return Objects.equals(id, that.id) && Objects.equals(soLuong, that.soLuong) && Objects.equals(moTa, that.moTa) && Objects.equals(giaNhap, that.giaNhap) && Objects.equals(giaBan, that.giaBan) && Objects.equals(ngayTao, that.ngayTao) && Objects.equals(trangThai, that.trangThai);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, soLuong, moTa, giaNhap, giaBan, ngayTao, trangThai);
    }

    @Column(name = "IdMauSac")
    public String getIdMauSac() {
        return idMauSac;
    }

    public void setIdMauSac(String mauSacByIdMauSac) {
        this.idMauSac = mauSacByIdMauSac;
    }
    @Column(name = "IdKichThuoc")
    public String getIdKichThuoc() {
        return idKichThuoc;
    }

    public void setIdKichThuoc(String kichThuocByIdKichThuoc) {
        this.idKichThuoc = kichThuocByIdKichThuoc;
    }
    @Column(name = "IdChatLieu")
    public String getIdChatLieu() {
        return idChatLieu;
    }

    public void setIdChatLieu(String chatLieuByIdChatLieu) {
        this.idChatLieu = chatLieuByIdChatLieu;
    }

    @JoinColumn(name = "IdKieuTay")
    public String getIdKieuTay() {
        return idKieuTay;
    }

    public void setIdKieuTay(String kieuTayByIdKieuTay) {
        this.idKieuTay = kieuTayByIdKieuTay;
    }

    @Column(name = "IdSanPham")
    public String getIdSanPham() {
        return idSanPham;
    }

    public void setIdSanPham(String sanPhamByIdSanPham) {
        this.idSanPham = sanPhamByIdSanPham;
    }
}
