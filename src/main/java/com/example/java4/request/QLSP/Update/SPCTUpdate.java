package com.example.java4.request.QLSP.Update;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SPCTUpdate {
    @NotEmpty
    private String idMauSac;
    @NotEmpty
    private String idKichThuoc;
    @NotEmpty
    private String idChatLieu;
    @NotEmpty
    private String idKieuTay;
    private String moTa;
    @Positive
    private String soLuong;
    @Positive
    private String giaNhap;
    @Positive
    private String giaBan;
    @NotEmpty
    private String  trangThai;
}