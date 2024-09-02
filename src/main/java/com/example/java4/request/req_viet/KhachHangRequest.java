package com.example.java4.request.req_viet;

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
public class KhachHangRequest {
    private String id;
    private String hoTen;
    private Integer gioiTinh;
    private String sdt;
    private Date ngaySinh;
    private String taiKhoan;
    private String matKhau;
    private String email;
    private MultipartFile anhDaiDien;
    private Integer trangThai;
}
