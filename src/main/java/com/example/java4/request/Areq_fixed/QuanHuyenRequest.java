package com.example.java4.request.Areq_fixed;

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
public class QuanHuyenRequest {

    private String id;

    @NotBlank(message = "Không được để trống")
    private String ten;

    @NotNull(message = "Không được để trống")
    private Integer trangThai;

}
