package com.example.java4.response;

import jakarta.persistence.Entity;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamView {
    private String id;
    private String ten;
    private String ma;
    private Integer trangThai;
    private LocalDateTime ngayTao;
    private String hinhAnh;
}
