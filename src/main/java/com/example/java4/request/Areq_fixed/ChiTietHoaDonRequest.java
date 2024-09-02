package com.example.java4.request.Areq_fixed;

import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.entities.HoaDon;
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
public class ChiTietHoaDonRequest {

    private String id;

    @NotNull(message = "Không được để trống")
    private Integer soLuong;

    @NotNull(message = "Không được để trống")
    private Integer donGia;

    @NotNull(message = "Không được để trống")
    private Integer trangThai;

    @NotNull(message = "Không được để trống")
    private Integer hdctOld; // dùng để làm đổi trả

    @NotNull(message = "Không được để trống")
    private HoaDon idHoaDon;

    @NotNull(message = "Không được để trống")
    private ChiTietSanPham idCTSP;

}
