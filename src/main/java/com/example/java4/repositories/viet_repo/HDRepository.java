package com.example.java4.repositories.viet_repo;

import com.example.java4.entities.HoaDon;
import com.example.java4.response.HDResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface HDRepository extends JpaRepository<HoaDon, String> {

    //Tìm kiếm hóa đơn theo mã hóa đơn
    @Query("select hd from HoaDon hd where hd.ma = ?1")
    HoaDon findByMaHD(String maHD);

    //Lấy ra thông tin hóa đơn
    @Query("select new com.example.java4.response.HDResponse (hd.ma, kh.hoTen, kh.sdt, gh.tenNguoiNhan, gh.sdtNguoiNhan, gh.diaChiChiTiet, gh.idPhuongXa, gh.idQuanHuyen, gh.idTinhThanh, gh.ghiChu, hd.ngayThanhToan, gh.ngayShip, gh.ngayNhan, hd.trangThai, hd.loaiHoaDon, hd.tongTien, km.soTienGiam, gh.phiShip) " +
            "from HoaDon hd " +
            "left join KhuyenMai km on km.id = hd.idKhuyenMai.id " +
            "left join GiaoHang gh on hd.id = gh.idHoaDon.id " +
            "left join KhachHang kh on kh.id = hd.idKhachHang.id " +
            "where hd.id = ?1 ")
    HDResponse getHoaDonByIdHD(String idHD);


}
