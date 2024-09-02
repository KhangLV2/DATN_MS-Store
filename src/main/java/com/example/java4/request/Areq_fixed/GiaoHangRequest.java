package com.example.java4.request.Areq_fixed;

import com.example.java4.entities.HoaDon;
import com.example.java4.entities.PhuongXa;
import com.example.java4.entities.QuanHuyen;
import com.example.java4.entities.TinhThanh;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GiaoHangRequest {

    private String id;

    @NotNull(message = "Không được để trống")
    private HoaDon idHoaDon;

    @NotBlank(message = "Không được để trống")
    private String tenNguoiNhan;

    @NotBlank(message = "Không được để trống")
    private String sdtNguoiNhan;

    @NotBlank(message = "Không được để trống")
    private String diaChiChiTiet;

    @NotNull(message = "Không được để trống")
    private PhuongXa idPhuongXa;

    @NotNull(message = "Không được để trống")
    private QuanHuyen idQuanHuyen;

    @NotNull(message = "Không được để trống")
    private TinhThanh idTinhThanh;

    @NotNull(message = "Không được để trống")
    private Date ngayShip;

    @NotNull(message = "Không được để trống")
    private Date ngayNhan;

    @NotNull(message = "Không được để trống")
    private Integer phiShip;

    @NotNull(message = "Không được để trống")
    private Integer trangThai;

}
