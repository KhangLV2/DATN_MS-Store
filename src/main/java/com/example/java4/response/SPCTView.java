package com.example.java4.response;

import com.example.java4.entities.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDateTime;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SPCTView {
    private String id;
    private Integer soLuong;
    private String moTa;
    private BigDecimal giaNhap;
    private BigDecimal giaBan;
    private LocalDateTime ngayTao;
    private Integer trangThai;
    private MauSac idMauSac;
    private KichThuoc idKichThuoc;
    private ChatLieu idChatLieu;
    private KieuTay idKieuTay;
    private SanPham idSanPham;
    private String hinhAnh;
}
