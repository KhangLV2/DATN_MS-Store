package com.example.java4.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class HoaDonResponse {

    private String maHD;
    private LocalDateTime ngayTao;
    private Integer soLuong;
    private BigDecimal tongTien;
    private Integer trangThai;

}
