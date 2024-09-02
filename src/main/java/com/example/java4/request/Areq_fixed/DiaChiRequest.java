package com.example.java4.request.Areq_fixed;

import com.example.java4.entities.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DiaChiRequest {

    private String id;

    @NotBlank(message = "Không được để trống")
    private String diaChiChiTiet;

    @NotNull(message = "Không được để trống")
    private PhuongXa idPhuongXa;

    @NotNull(message = "Không được để trống")
    private QuanHuyen idQuanHuyen;

    @NotNull(message = "Không được để trống")
    private TinhThanh idTinhThanh;

    @NotNull(message = "Không được để trống")
    private NhanVien idNhanVien;

    @NotNull(message = "Không được để trống")
    private KhachHang idKhachHang;

    @NotNull(message = "Không được để trống")
    private Integer trangThai;

}
