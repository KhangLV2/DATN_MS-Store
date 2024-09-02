package com.example.java4.request.req_sang;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GiaoHangRequest {

    private BigDecimal soTienGiam;
    private Integer phuongThucThanhToan;
    private String tenNguoiNhan;
    private String sdtNguoiNhan;
    private String diaChiChiTiet;
    private String ghiChu;
}
