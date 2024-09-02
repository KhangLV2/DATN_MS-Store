package com.example.java4.request.QLSP.Update;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamUpdate {
    @NotEmpty
    private String ten;
    @NotEmpty
    private String trangThai;
    @NotEmpty
    private String hinhAnh;
}
