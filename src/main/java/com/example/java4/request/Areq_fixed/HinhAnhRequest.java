package com.example.java4.request.Areq_fixed;

import com.example.java4.entities.ChiTietSanPham;
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
public class HinhAnhRequest {

    private String id;

    @NotNull(message = "Không được để trống")
    private ChiTietSanPham idCTSP;

    @NotBlank(message = "Không được để trống")
    private String hinhAnh1;

    @NotBlank(message = "Không được để trống")
    private String hinhAnh2;

    @NotBlank(message = "Không được để trống")
    private String hinhAnh3;

    @NotNull(message = "Không được để trống")
    private Integer trangThai;

}
