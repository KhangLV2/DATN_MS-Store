package com.example.java4.entities;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
public class TinhThanh {
    private String id;
    private String ten;
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

    @Column(name = "Ten")
    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
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
        TinhThanh tinhThanh = (TinhThanh) o;
        return Objects.equals(id, tinhThanh.id) && Objects.equals(ten, tinhThanh.ten) && Objects.equals(trangThai, tinhThanh.trangThai);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, ten, trangThai);
    }
}
