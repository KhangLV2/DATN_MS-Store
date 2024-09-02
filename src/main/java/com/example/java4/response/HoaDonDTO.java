package com.example.java4.response;
import com.example.java4.entities.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonDTO {

    private String id;
    private String ma;
    private KhachHang khachHang;
    private NhanVien nhanVien;
    private DiaChi diaChi;
    private KhuyenMai khuyenMai;
    private Integer phuongThucThanhToan;
    private BigDecimal tongTien;
    private Integer loaiHoaDon;
    private String ngayTao;
    private String ngayThanhToan;
    private Integer trangThai;
    private String trangThaiText;
    private String maMau;
    private String ngayCapNhat;
    private String ghiChu;
    private String ngayDaXacNhan;
    private String ngayChoGiaoHang;
    private String ngayDangGiaoHang;
    private BigDecimal giamGia;
    private BigDecimal tongTienThanhToan;


    public HoaDonDTO(String id, String ma, KhachHang khachHang, NhanVien nhanVien, Integer phuongThucThanhToan, BigDecimal tongTien,Integer loaiHoaDon, String ngayTao,String ngayThanhToan, Integer trangThai) {
        this.id = id;
        this.ma = ma;
        this.khachHang = khachHang;
        this.nhanVien = nhanVien;
        this.phuongThucThanhToan = phuongThucThanhToan;
        this.tongTien = tongTien;
        this.loaiHoaDon = loaiHoaDon;
        this.ngayTao = ngayTao;
        this.ngayThanhToan = ngayThanhToan;
        this.trangThai = trangThai;
    }

    public HoaDonDTO(String id, String ma, KhachHang khachHang, NhanVien nhanVien,KhuyenMai khuyenMai ,Integer phuongThucThanhToan, BigDecimal tongTien, Integer loaiHoaDon, String ngayTao, String ngayThanhToan, Integer trangThai, String ngayCapNhat, String ghiChu,String ngayDaXacNhan,String ngayChoGiaoHang,String ngayDangGiaoHang) {
        this.id = id;
        this.ma = ma;
        this.khachHang = khachHang;
        this.nhanVien = nhanVien;
        this.khuyenMai = khuyenMai;
        this.phuongThucThanhToan = phuongThucThanhToan;
        this.tongTien = tongTien;
        this.loaiHoaDon = loaiHoaDon;
        this.ngayTao = ngayTao;
        this.ngayThanhToan = ngayThanhToan;
        this.trangThai = trangThai;
        this.ngayCapNhat = ngayCapNhat;
        this.ghiChu = ghiChu;
        this.ngayDaXacNhan = ngayDaXacNhan;
        this.ngayChoGiaoHang = ngayChoGiaoHang;
        this.ngayDangGiaoHang = ngayDangGiaoHang;
    }



    public static HoaDonDTO fromEntity(HoaDon hoaDon) {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        return new HoaDonDTO(
                hoaDon.getId(),
                hoaDon.getMa(),
                hoaDon.getIdKhachHang(),
                hoaDon.getIdNhanVien(),
                hoaDon.getIdKhuyenMai(),
                hoaDon.getPhuongThucThanhToan(),
                hoaDon.getTongTien(),
                hoaDon.getLoaiHoaDon(),
                hoaDon.getNgayTao() != null ? dateTimeFormatter.format(hoaDon.getNgayTao()).toString() : null,
                hoaDon.getNgayThanhToan() != null ? dateTimeFormatter.format(hoaDon.getNgayThanhToan()).toString() : null,
                hoaDon.getTrangThai(),
                hoaDon.getNgayCapNhat() != null ? dateTimeFormatter.format(hoaDon.getNgayCapNhat()).toString() : null,
                hoaDon.getGhiChu(),
                hoaDon.getNgayDaXacNhan() != null ? dateTimeFormatter.format(hoaDon.getNgayDaXacNhan()) : null,
                hoaDon.getNgayChoGiaoHang() != null ? dateTimeFormatter.format(hoaDon.getNgayChoGiaoHang()).toString() : null,
                hoaDon.getNgayDangGiaoHang() != null ? dateTimeFormatter.format(hoaDon.getNgayDangGiaoHang()).toString() : null
        );
    }

    public HoaDon toEntity() {
        HoaDon hoaDon = new HoaDon();
        hoaDon.setId(this.id);
        hoaDon.setMa(this.ma);
        hoaDon.setIdKhachHang(this.khachHang);
        hoaDon.setIdNhanVien(this.nhanVien);
        hoaDon.setPhuongThucThanhToan(this.phuongThucThanhToan);
        hoaDon.setTongTien(this.tongTien);
        hoaDon.setLoaiHoaDon(this.loaiHoaDon);
        hoaDon.setNgayTao(LocalDateTime.parse(this.ngayTao));
        hoaDon.setNgayThanhToan(this.ngayThanhToan != null ? LocalDateTime.parse(this.ngayThanhToan) : null);
        hoaDon.setTrangThai(this.trangThai);
        return hoaDon;
    }


}


