package com.example.java4.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LichSuHoaDonDTO {

    private String id;
    private int index;
    private String trangThai;
    private String thoiGian;
    private String hoTen;
    private String chucVu;
    private String ghiChu;
}
