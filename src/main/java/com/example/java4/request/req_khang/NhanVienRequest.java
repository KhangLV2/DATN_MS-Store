package com.example.java4.request.req_khang;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NhanVienRequest {

    private int id;
    @NotBlank(message = "Không được để trống")
    private String ma;
    @NotBlank(message = "Không được để trống")
    private String ten;
    @NotBlank(message = "Không được để trống")
    private String tenDangNhap;
    @NotBlank(message = "Không được để trống")
    private String matKhau;
    private int trangThai;

}
