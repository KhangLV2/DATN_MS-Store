package com.example.java4.request.QLSP.Store;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamStore {
    private String id;
    @NotEmpty
    private String ten;
    @NotEmpty
    private String trangThai;
    private String hinhAnh;
}
