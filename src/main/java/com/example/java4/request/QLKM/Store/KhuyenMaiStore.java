package com.example.java4.request.QLKM.Store;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.math.BigDecimal;
import java.sql.Date;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class KhuyenMaiStore {
    private String id;
    @NotEmpty
    private String ten;
    @NotNull
    private Date ngayBatDau;
    @NotNull
    private Date ngayKetThuc;
    @NotNull
    private BigDecimal soTienGiam;
    @NotNull
    private Integer soLuong;
    @NotNull
    private BigDecimal apDung;
    @NotNull
    private Integer trangThai;
}
