package com.example.java4.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ThongKeDTO {

    private BigDecimal doanhThu;
    private Integer soLuongSanPhamDaBan;
    private Integer donHangThanhCong;
    private Integer donHangDaHuy;

    private String tenSanPham;
    private String maSanPham;
    private BigDecimal giaBan;
    private String hinhAnh;
    private Integer soLuong;

    public ThongKeDTO(BigDecimal doanhThu, Integer soLuongSanPhamDaBan, Integer donHangThanhCong, Integer donHangDaHuy) {
        this.doanhThu = doanhThu;
        this.soLuongSanPhamDaBan = soLuongSanPhamDaBan;
        this.donHangThanhCong = donHangThanhCong;
        this.donHangDaHuy = donHangDaHuy;
    }

    public ThongKeDTO(String tenSanPham, String maSanPham, BigDecimal giaBan, String hinhAnh, Integer soLuong) {
        this.tenSanPham = tenSanPham;
        this.maSanPham = maSanPham;
        this.giaBan = giaBan;
        this.hinhAnh = hinhAnh;
        this.soLuong = soLuong;
    }

    public static ThongKeDTO mapToThongKeDTO(Object[] result) {
        if (result == null || result.length < 4) {
            throw new IllegalArgumentException("Invalid result array");
        }
        return new ThongKeDTO(
                (BigDecimal) result[0],
                (Integer) result[1],
                (Integer) result[2],
                (Integer) result[3]
        );
    }

}
