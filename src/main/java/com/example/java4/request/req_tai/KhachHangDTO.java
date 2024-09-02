package com.example.java4.request.req_tai;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KhachHangDTO {
    @NotBlank(message = "Vui lòng nhập tài khoản.")
    private String taiKhoan;
    @NotBlank(message = "Vui lòng nhập mật khẩu.")
    private String matKhau;

    @NotBlank(message = "Vui lòng nhập email.")
    private String email;
    @NotBlank(message = "Vui lòng nhập số điện thoại")
    private String sdt;

    private LocalDateTime ngayTao;

    private Integer trangThai;
}
