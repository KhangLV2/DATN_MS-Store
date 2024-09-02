package com.example.java4.repositories;

import com.example.java4.entities.ChiTietHoaDon;
import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.entities.KhachHang;
import com.example.java4.response.GioHangResponse;
import com.example.java4.response.HoaDonChiTietDTO;
import com.example.java4.response.HoaDonChiTietResponse;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Repository
public interface HDCTRepository
        extends JpaRepository<ChiTietHoaDon, String> {
    public static final int ACTIVE = 1;
    public static final int INACTIVE = 0;

    public Page<ChiTietHoaDon> findByTrangThai(int trangThai, Pageable pageable);

    @Query("SELECT h FROM ChiTietHoaDon h WHERE h.idHoaDon.id = :hoaDon AND h.idCTSP = :sanPhamChiTiet")
    ChiTietHoaDon findByHoaDonAndIdSanPhamChiTiet(@PathVariable("hoaDon") String hoaDon, @PathVariable("sanPhamChiTiet") ChiTietSanPham sanPhamChiTiet);

    // Lấy ra danh sách HoaDonChiTiet theo ID hóa đơn
    @Query("SELECT hdct FROM ChiTietHoaDon hdct WHERE hdct.idHoaDon.id = :hoaDonId")
    List<ChiTietHoaDon> findAllByHoaDon_Id(@Param("hoaDonId") String hoaDonId);

    // Lấy ra tổng tiền trong hóa đơn chi tiết
    @Query("SELECT SUM (hdct.soLuong * hdct.donGia) FROM ChiTietHoaDon  hdct WHERE hdct.idHoaDon.id = :hoaDonId")
    public BigDecimal tinhGiaTriHD(@Param("hoaDonId") String hoaDonId);

    //        public static final int ACTIVE = 1;
//        public static final int INACTIVE = 0;
//        public Page<ChiTietHoaDon> findByTrangThai(int trangThai, Pageable pageable);
//        public List<ChiTietHoaDon> findAllByHoaDon_Id(String id);
//        @Query ("SELECT h FROM ChiTietHoaDon h WHERE h.idHoaDon.id = :hoaDon AND h.idCTSP = :sanPhamChiTiet")
//        ChiTietHoaDon findByHoaDonAndIdSanPhamChiTiet(@PathVariable ("hoaDon") String hoaDon, @PathVariable ("sanPhamChiTiet") ChiTietSanPham sanPhamChiTiet);
//
    @Query("select cthd from ChiTietHoaDon cthd\n" +
            "join HoaDon hd on hd.id = cthd.idHoaDon.id\n" +
            "where hd.idKhachHang.id = ?1 and hd.trangThai = ?2")
    List<ChiTietHoaDon> findByIdHoaDonByIDKH(String idKH, Integer trangThai);

    public static final int CHUA_THANH_TOAN = 0;
    public static final int DA_THANH_TOAN = 1;

    @Query("select new com.example.java4.response.GioHangResponse(cthd.id, ctsp.idSanPham.ten, ha.hinhAnh1, ctsp.idMauSac.ten, ctsp.idKichThuoc.ten, cthd.soLuong, cthd.idCTSP.soLuong, cthd.donGia) " +
            "from ChiTietHoaDon cthd " +
            "join ChiTietSanPham ctsp on ctsp.id = cthd.idCTSP.id " +
            "join HinhAnh ha on ha.idCTSP.id = ctsp.id " +
            "join HoaDon hd on hd.id = cthd.idHoaDon.id " +
            "where hd.idKhachHang.id = ?1 and hd.trangThai = ?2")
    List<GioHangResponse> getAll(String idKH, Integer trangThai);

    @Query("select hdct from ChiTietHoaDon hdct where hdct.idHoaDon.id = ?1")
    List<ChiTietHoaDon> findHDCTByIdHoaDon(String idHD);

    @Query("SELECT COUNT(*) from ChiTietHoaDon hdct where hdct.idHoaDon.idKhachHang = :idKH and hdct.trangThai=0")
    public Long findByKHnStt(KhachHang idKH);

    @Query("select ctsp.soLuong from ChiTietHoaDon cthd\n" +
            "join ChiTietSanPham ctsp on ctsp.id = cthd.idCTSP.id\n" +
            "where cthd.id = ?1")
    Integer  getSoLuong_SPCTByIdHDCT(String idHD);

    @Query("select cthd from ChiTietHoaDon cthd\n" +
            "join HoaDon hd on hd.id = cthd.idHoaDon.id\n" +
            "where hd.idKhachHang.id = ?1")
    ChiTietHoaDon findByIdHoaDonByidKH(String idKH);

//    @Query("SELECT c FROM ChiTietHoaDon c WHERE c.hoaDon.id = :idHoaDon GROUP BY c.hoaDon.id, c.chiTietSanPham.id, c.donGia")
//    List<ChiTietHoaDon> findDistinctByHoaDon_Id(@Param("idHoaDon") String idHoaDon);

    @Transactional
    @Modifying
    @Query("DELETE FROM ChiTietHoaDon hdct WHERE hdct.idHoaDon.id = :idHoaDon AND hdct.idCTSP.id = :idCTSP")
    int deleteByHoaDon_IdAndIdCTSP_Id(@Param("idHoaDon") String idHoaDon, @Param("idCTSP") String idCTSP);


    @Query("select new com.example.java4.response.HoaDonChiTietResponse(hd.id, hd.ma, ha.hinhAnh1, ctsp.idSanPham.ten, cthd.soLuong, ctsp.idMauSac.ten, ctsp.idKichThuoc.ten, ctsp.giaBan, hd.trangThai) " +
            "from ChiTietHoaDon cthd " +
            "join ChiTietSanPham ctsp on ctsp.id = cthd.idCTSP.id " +
            "join HinhAnh ha on ha.idCTSP.id = ctsp.id " +
            "join HoaDon hd on hd.id = cthd.idHoaDon.id " +
            "where hd.idKhachHang.id = ?1 and hd.id = ?2")
    List<HoaDonChiTietResponse> getListHDbyIdKH(String idKH, String idHD);

    @Query("select cthd from ChiTietHoaDon cthd\n" +
            "join HoaDon hd on hd.id = cthd.idHoaDon.id\n" +
            "where hd.idKhachHang.id = ?1 and hd.id = ?2")
    List<ChiTietHoaDon> tongTienHD(String idKH, String idHD);


    @Query("SELECT cthd  FROM ChiTietHoaDon cthd " +
            "JOIN HoaDon  hd on hd.id = cthd.idHoaDon.id " +
            "where hd.id = ?1")
    ChiTietHoaDon findByIdHoaDon(String idHoaDon);


    @Query("SELECT cthd FROM ChiTietHoaDon cthd WHERE cthd.idHoaDon.id = :idHoaDon AND cthd.idCTSP.id = :idCTSP")
    ChiTietHoaDon findByHoaDon_IdAndIdCTSP_Id(@Param("idHoaDon") String idHoaDon, @Param("idCTSP") String idCTSP);

};
