package com.example.java4.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Objects;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "LichSuHoaDon")
public class LichSuHoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "ID")
    private String id;

    @ManyToOne
    @JoinColumn(name = "IdHoaDon", referencedColumnName = "ID")
    private HoaDon idHoaDon;

    @ManyToOne
    @JoinColumn(name = "IdNhanVien", referencedColumnName = "ID")
    private NhanVien idNhanVien;

    @Column(name = "NgayTao")
    private LocalDateTime ngayTao;

    @Column(name = "NgayCapNhat")
    private LocalDateTime ngayCapNhat;


    @Column(name = "NgayChoXacNhan")
    private LocalDateTime ngayChoXacNhan;


    @Column(name = "NgayChoGiaoHang")
    private LocalDateTime ngayChoGiaoHang;


    @Column(name = "NgayDangGiaoHang")
    private LocalDateTime ngayDangGiaoHang;

    @Column(name = "NgayHoanThanh")
    private LocalDateTime ngayHoanThanh;

    @Column(name = "GhiChu")
    private String ghiChu;

    @Column(name = "TrangThai")
    private Integer trangThai;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LichSuHoaDon that = (LichSuHoaDon) o;
        return Objects.equals(id, that.id) && Objects.equals(idHoaDon, that.idHoaDon) && Objects.equals(idNhanVien, that.idNhanVien) && Objects.equals(ngayTao, that.ngayTao) && Objects.equals(ngayCapNhat, that.ngayCapNhat) && Objects.equals(ghiChu, that.ghiChu) && Objects.equals(trangThai, that.trangThai);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, idHoaDon, idNhanVien, ngayTao, ngayCapNhat, ghiChu, trangThai);
    }
}