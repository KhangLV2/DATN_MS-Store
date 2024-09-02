package com.example.java4.request.Areq_fixed;


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
public class KhachHangRequest {

    private String id;

    @NotBlank(message = "Không được để trống")
    private String hoTen;

    @NotNull(message = "Không được để trống")
    private Integer gioiTinh;

    @NotBlank(message = "Không được để trống")
    private String sdt;

    @NotNull(message = "Không được để trống")
    private Date ngaySinh;

    @NotBlank(message = "Không được để trống")
    private String taiKhoan;

    @NotBlank(message = "Không được để trống")
    private String matKhau;

    @NotBlank(message = "Không được để trống")
    private String anhDaiDien;

    @NotNull(message = "Không được để trống")
    private Date ngayTao;

    @NotNull(message = "Không được để trống")
    private Date ngaySua;

    @NotNull(message = "Không được để trống")
    private Integer trangThai;

}
