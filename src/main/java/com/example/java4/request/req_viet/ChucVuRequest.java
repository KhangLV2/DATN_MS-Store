package com.example.java4.request.req_viet;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChucVuRequest {
    private String id;

    private String ten;

    private LocalDateTime ngayTao;

    private LocalDateTime ngaySua;

    private Integer trangThai;
}
