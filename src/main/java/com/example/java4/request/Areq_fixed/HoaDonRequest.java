package com.example.java4.request.Areq_fixed;


import com.example.java4.entities.KhachHang;
import com.example.java4.entities.KhuyenMai;
import com.example.java4.entities.NhanVien;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HoaDonRequest {

    private String id;

    @NotBlank(message = "Không được để trống")
    private String ma;

    @NotNull(message = "Không được để trống")
    private Integer phuongThucThanhToan;

    @NotNull(message = "Không được để trống")
    private KhuyenMai idKhuyenMai;

    @NotNull(message = "Không được để trống")
    private NhanVien idNhanVien;

    @NotNull(message = "Không được để trống")
    private KhachHang idKhachHang;

    @NotNull(message = "Không được để trống")
    private Date ngayTao;

    @NotNull(message = "Không được để trống")
    private Date ngayThanhToan;

    @NotNull(message = "Không được để trống")
    private Integer tongTien;
    private Integer trangThai;

}
