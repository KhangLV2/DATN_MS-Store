package com.example.java4.controller.ATrangChu;

import com.example.java4.entities.SanPham;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamCard {
    private String idCTSP;
    private SanPham sp;
    private String tenKieuTay;
    private BigDecimal giaBan;
    private String hinhAnh1;
}
