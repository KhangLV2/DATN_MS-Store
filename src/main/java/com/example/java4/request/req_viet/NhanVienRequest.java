package com.example.java4.request.req_viet;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NhanVienRequest {

    @NotBlank(message = "Vui lòng nhập tên nhân viên!")
    private String hoTen;

    @NotNull(message = "Vui lòng chọn giới tính!")
    private Integer gioiTinh;

    @NotNull(message = "Vui lòng nhập ngày sinh")
    private Date ngaySinh;

    @NotBlank(message = "Vui lòng nhập số điện thoại!")
    private String sdt;

    @NotBlank(message = "Vui lòng nhập tài khoản!")
    private String taiKhoan;

    @NotBlank(message = "Vui lòng nhập mật khẩu!")
    private String matKhau;

    private MultipartFile anhDaiDien;

    private LocalDateTime ngayTao;

    private LocalDateTime ngaySua;

    private Integer trangThai;

    private String idCV;
}
