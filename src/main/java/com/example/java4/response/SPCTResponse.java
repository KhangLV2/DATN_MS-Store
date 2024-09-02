package com.example.java4.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SPCTResponse {
    private String idCTSP;
    private String idSP;
    private String maSP;
    private String tenSP;
    private String tenKieuTay;
    private BigDecimal giaBan;
    private String hinhAnh1;
}
