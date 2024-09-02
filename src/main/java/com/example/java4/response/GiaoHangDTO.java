package com.example.java4.response;

import com.example.java4.entities.GiaoHang;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.format.DateTimeFormatter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiaoHangDTO {
    private String id;
    private String idHoaDon;
    private String tenNguoiNhan;
    private String sdtNguoiNhan;
    private String diaChiChiTiet;
    private String idPhuongXa;
    private String idQuanHuyen;
    private String idTinhThanh;
    private String ngayShip;
    private String ngayNhan;
    private BigDecimal phiShip;
    private Integer trangThai;
    private String ghiChu;




    // Chuyển đổi từ Entity sang DTO
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

    // Chuyển đổi từ Entity sang DTO
    public static GiaoHangDTO toDTO(GiaoHang giaoHang) {
        if (giaoHang == null) {
            return null;
        }
        GiaoHangDTO giaoHangDTO = new GiaoHangDTO();
        giaoHangDTO.setId(giaoHang.getId());
        giaoHangDTO.setIdHoaDon(giaoHang.getIdHoaDon().getId());
        giaoHangDTO.setTenNguoiNhan(giaoHang.getTenNguoiNhan());
        giaoHangDTO.setSdtNguoiNhan(giaoHang.getSdtNguoiNhan());
        giaoHangDTO.setDiaChiChiTiet(giaoHang.getDiaChiChiTiet());
        giaoHangDTO.setIdPhuongXa(giaoHang.getIdPhuongXa());
        giaoHangDTO.setIdQuanHuyen(giaoHang.getIdQuanHuyen());
        giaoHangDTO.setIdTinhThanh(giaoHang.getIdTinhThanh());
        giaoHangDTO.setNgayShip(giaoHang.getNgayShip() != null ? giaoHang.getNgayShip().toLocalDate().format(DATE_FORMATTER) : null);
        giaoHangDTO.setNgayNhan(giaoHang.getNgayNhan() != null ? giaoHang.getNgayNhan().toLocalDate().format(DATE_FORMATTER) : null);
        giaoHangDTO.setPhiShip(giaoHang.getPhiShip() != null ? giaoHang.getPhiShip() : null);
        giaoHangDTO.setTrangThai(giaoHang.getTrangThai());
        giaoHangDTO.setGhiChu(giaoHang.getGhiChu());
        return giaoHangDTO;
    }

    // Chuyển đổi từ DTO sang Entity
//    public static GiaoHang toEntity(GiaoHangDTO giaoHangDTO) {
//        if (giaoHangDTO == null) {
//            return null;
//        }
//        GiaoHang giaoHang = new GiaoHang();
//        giaoHang.setId(giaoHangDTO.getId());
//        // You need to fetch the HoaDon entity by its ID here, assuming you have a method to do so
//        HoaDon_Tai hoaDon = new HoaDon_Tai(); // This should be replaced by actual fetching logic
//        hoaDon.setId(giaoHangDTO.getIdHoaDon());
//        giaoHang.setIdHoaDon(hoaDon);
//        giaoHang.setTenNguoiNhan(giaoHangDTO.getTenNguoiNhan());
//        giaoHang.setSdtNguoiNhan(giaoHangDTO.getSdtNguoiNhan());
//        giaoHang.setDiaChiChiTiet(giaoHangDTO.getDiaChiChiTiet());
//        giaoHang.setIdPhuongXa(giaoHangDTO.getIdPhuongXa());
//        giaoHang.setIdQuanHuyen(giaoHangDTO.getIdQuanHuyen());
//        giaoHang.setIdTinhThanh(giaoHangDTO.getIdTinhThanh());
//        giaoHang.setNgayShip(giaoHangDTO.getNgayShip());
//        giaoHang.setNgayNhan(giaoHangDTO.getNgayNhan());
//        giaoHang.setPhiShip(giaoHangDTO.getPhiShip());
//        giaoHang.setTrangThai(giaoHangDTO.getTrangThai());
//        giaoHang.setGhiChu(giaoHangDTO.getGhiChu());
//        return giaoHang;
//    }
}
