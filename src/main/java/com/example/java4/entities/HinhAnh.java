package com.example.java4.entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Table(name = "HinhAnh")
public class HinhAnh {
    private String id;
    private ChiTietSanPham idCTSP;
    private String hinhAnh1;
    private String hinhAnh2;
    private String hinhAnh3;
    private LocalDateTime ngayTao;
    private Integer trangThai;

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "ID", unique = true, nullable = false)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "HinhAnh1")
    public String getHinhAnh1() {
        return hinhAnh1;
    }

    public void setHinhAnh1(String hinhAnh1) {
        this.hinhAnh1 = hinhAnh1;
    }

    @Column(name = "HinhAnh2")
    public String getHinhAnh2() {
        return hinhAnh2;
    }

    public void setHinhAnh2(String hinhAnh2) {
        this.hinhAnh2 = hinhAnh2;
    }

    @Column(name = "HinhAnh3")
    public String getHinhAnh3() {
        return hinhAnh3;
    }

    public void setHinhAnh3(String hinhAnh3) {
        this.hinhAnh3 = hinhAnh3;
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
        HinhAnh hinhAnh = (HinhAnh) o;
        return Objects.equals(id, hinhAnh.id) &&
                Objects.equals(hinhAnh1, hinhAnh.hinhAnh1) &&
                Objects.equals(hinhAnh2, hinhAnh.hinhAnh2) &&
                Objects.equals(hinhAnh3, hinhAnh.hinhAnh3) &&
                Objects.equals(ngayTao, hinhAnh.ngayTao) &&
                Objects.equals(trangThai, hinhAnh.trangThai);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, hinhAnh1, hinhAnh2, hinhAnh3, ngayTao, trangThai);
    }

    @OneToOne
    @JoinColumn(name = "IdCTSP", referencedColumnName = "ID", unique = true)
    public ChiTietSanPham getIdCTSP() {
        return idCTSP;
    }

    public void setIdCTSP(ChiTietSanPham idCTSP) {
        this.idCTSP = idCTSP;
    }
}
