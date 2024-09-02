package com.example.java4.repositories.viet_repo;

import com.example.java4.entities.ChiTietHoaDon;
import com.example.java4.response.CTHDResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CTHDRepository extends JpaRepository<ChiTietHoaDon, String> {

    public static final int CHO_TRA_HANG = 3;

    @Query("select new com.example.java4.response.CTHDResponse (cthd.idHoaDon.id, cthd.id, ctsp.id, ha.hinhAnh1, ctsp.idSanPham.ten, ctsp.idMauSac.ten, ctsp.idKichThuoc.ten, ctsp.idChatLieu.ten, ctsp.idKieuTay.ten, cthd.soLuong, cthd.donGia, cthd.trangThai) " +
            "from ChiTietHoaDon cthd " +
            "join HoaDon hd on hd.id = cthd.idHoaDon.id " +
            "join ChiTietSanPham ctsp on ctsp.id = cthd.idCTSP.id " +
            "join HinhAnh ha on ha.idCTSP.id = ctsp.id " +
            "where hd.id = ?1 ")
    List<CTHDResponse> getAllCTHDByIdHD(String idHD);

    @Query("select new com.example.java4.response.CTHDResponse (cthd.idHoaDon.id, cthd.id, ctsp.id, ha.hinhAnh1, ctsp.idSanPham.ten, ctsp.idMauSac.ten, ctsp.idKichThuoc.ten, ctsp.idChatLieu.ten, ctsp.idKieuTay.ten, cthd.soLuong, cthd.donGia, cthd.trangThai) " +
            "from ChiTietHoaDon cthd " +
            "join HoaDon hd on hd.id = cthd.idHoaDon.id " +
            "join ChiTietSanPham ctsp on ctsp.id = cthd.idCTSP.id " +
            "join HinhAnh ha on ha.idCTSP.id = ctsp.id " +
            "where hd.id = ?1 and cthd.trangThai = ?2 ")
    List<CTHDResponse> getAllCTHDByIdHDAndTrangThai(String idHD, Integer trangThai);

    @Query("select cthd from ChiTietHoaDon cthd where cthd.trangThai = ?1")
    List<ChiTietHoaDon> getAllCTHDByTrangThai(Integer trangThai);

}
