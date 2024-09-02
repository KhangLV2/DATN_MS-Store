package com.example.java4.request.req_tai;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DiaChiDTO {

    private String hoTen;
    private String sdt;
    private String diaChiChiTiet;
    private String idPhuongXa;
    private String idQuanHuyen;
    private String idTinhThanh;
    private Integer phiShip;
    private String ghiChu;
}
