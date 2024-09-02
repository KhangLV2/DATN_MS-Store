package com.example.java4.repositories;

import com.example.java4.entities.HoaDon;
import com.example.java4.response.HoaDonResponse;
import com.example.java4.entities.KhuyenMai;
import com.example.java4.response.SanPhamChiTietResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface HoaDonRepository
        extends JpaRepository<HoaDon,String>
{
    // Loại hóa đơn
    public static final int HOA_DON_OFF = 0;
    public static final int HOA_DON_ONL = 1;
    // Các trạng thái của hóa đơn
    public static final int CHO_THANH_TOAN = 0;
    public static final int CHO_XAC_NHAN = 1;
    public static final int DA_XAC_NHAN = 2;
    public static final int CHO_GIAO_HANG = 3;
    public static final int DANG_GIAO_HANG = 4;
    public static final int DA_THANH_TOAN = 5;
    public static final int DA_HOAN_THANH = 6;
    public static final int DA_HUY= 7;
    public static final int TRA_HANG= 8;
    //Phương thức thanh toán
    public static final int TIEN_MAT = 0;
    public static final int CHUYEN_KHOAN = 1;
    @Query(value = "SELECT TOP 5 * FROM HoaDon where LoaiHoaDon = 0 and trangThai=0 ORDER BY ngayTao DESC",
            nativeQuery = true)
    List<HoaDon>  selectTop5();
    Optional<HoaDon> findById(String id);
    @Query(value = "SELECT COUNT(*) FROM dbo.HoaDon",nativeQuery = true)
    Integer countHD();
    // Lấy ra Page danh sách hóa đơn theo trạng thái được sắp xếp theo ngày giờ mới nhất
    Page<HoaDon> findByTrangThaiOrderByNgayTaoDesc(int trangThai, Pageable pageable);
    //Lấy ra hóa đơn theo idKH, loại hóa đơn và trạng thái
    @Query("select hd from HoaDon hd where hd.idKhachHang.id = ?1 and hd.loaiHoaDon = ?2 and hd.trangThai = ?3")
    HoaDon findByidKHAndLoaiHoaDonAndTrangThai(String idKH, Integer loaiHD, Integer trangThai);
    @Query("select hd from HoaDon hd where hd.idKhachHang.id = ?1 and hd.trangThai = ?2")
    HoaDon findByIdKhachHang(String idKH, Integer trangThai);
//    @Query(value = "SELECT TOP 5 * FROM HoaDon where trangThai = 1 ORDER BY ngayTao DESC",
//            nativeQuery = true)


    Page<HoaDon>  findByTrangThai(int trangThai,Pageable pageable);


    //    public Optional<HoaDon_Tai> findById(String id);
    // Tìm hóa đơn theo loại hóa đơn, chức năng lọc hóa đơn theo LoaiHoaDon
    Page<HoaDon> findByLoaiHoaDon(int loaiHoaDon, Pageable pageable);
    // Tìm hóa đơn theo loại hóa đơn, chức năng lọc hóa đơn theo LoaiHoaDon và Trạng thái của hóa đơn

    @Query("select hd from HoaDon hd where hd.trangThai=:trangThai")
    Page<HoaDon> findByTrangThaiAndLoaiHoaDon(@Param("trangThai") Integer trangThai, Pageable pageable);
    @Query("SELECT h FROM HoaDon h " +
            "JOIN h.idKhachHang kh " +
            "WHERE LOWER(h.ma) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "OR LOWER(kh.sdt) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    Page<HoaDon> searchByKeyword(@Param("keyword") String keyword, Pageable pageable);

    Page<HoaDon> findByTrangThaiAndLoaiHoaDonOrderByNgayTaoDesc(int trangThai, int loaiHoaDon, Pageable pageable);

//    Page<HoaDon> findByNgayTaoBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);

    @Query("SELECT h FROM HoaDon h " +
            "JOIN h.idKhachHang kh " +
            "WHERE (LOWER(h.ma) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "OR LOWER(kh.sdt) LIKE LOWER(CONCAT('%', :keyword, '%'))) " +
            "AND (:startDate IS NULL OR h.ngayTao >= :startDate) " +
            "AND (:endDate IS NULL OR h.ngayTao <= :endDate)")
    Page<HoaDon> searchByKeywordAndDate(@Param("keyword") String keyword,
                                        @Param("startDate") LocalDateTime startDate,
                                        @Param("endDate") LocalDateTime endDate,
                                        Pageable pageable);

    // Các phương thức đếm số lượng hóa đơn theo trạng thái
    @Query("SELECT COUNT(h) FROM HoaDon h WHERE h.trangThai = :trangThai")
    int countByTrangThai(@Param("trangThai") int trangThai);

    @Query("SELECT COUNT(h) FROM HoaDon h")
    int countAll();


    //Sáng  làm

    @Query("select hd.ma from HoaDon hd where hd.idKhachHang.id = ?1 and hd.trangThai = ?2  ")
    String getMaHoaDon(String idkh, Integer trangThai);

    //Tìm kiếm theo mã và sdt
    @Query("SELECT hd FROM HoaDon hd " +
            "LEFT JOIN hd.idKhachHang kh " +
            "WHERE hd.ma LIKE %?1%" +
            "OR kh.sdt LIKE %?1%")
    Page<HoaDon> seachMaAndSdt(String keyword, Pageable pageable);

    //Tìm kiếm theo ngày
    @Query("SELECT hd FROM HoaDon hd " +
            "LEFT JOIN hd.idKhachHang kh " +
            "WHERE hd.ngayTao " +
            "BETWEEN ?1 and ?2")
    Page<HoaDon> searchByDate(LocalDateTime startDate, LocalDateTime endDate, Pageable pageable);

    //Tìm kiếm theo từ khóa và theo loại hóa đơn
    @Query("SELECT hd FROM HoaDon hd " +
            "LEFT JOIN hd.idKhachHang kh " +
            "WHERE (hd.ma LIKE %?1% OR kh.sdt LIKE %?1%) AND (hd.loaiHoaDon = ?2)")
    Page<HoaDon> searchByMaOrSdtAndLoaiHoaDon(String keyword, Integer loaiHoaDon, Pageable pageable);

    //Tìm kiếm theo từ khóa và theo khoảng ngày
    @Query("SELECT hd FROM HoaDon hd " +
            "LEFT JOIN hd.idKhachHang kh " +
            "WHERE (hd.ma LIKE %?1% OR kh.sdt LIKE %?1%) AND (hd.ngayTao BETWEEN ?2 AND ?3)")
    Page<HoaDon> searchByMaOrSdtAndNgayTao(String keyword, LocalDateTime startDate, LocalDateTime endDate, Pageable pageable);

    //Tìm kiếm theo theo loại hóa đơn và theo khoảng ngày
    @Query("SELECT hd FROM HoaDon hd " +
            "LEFT JOIN hd.idKhachHang kh " +
            "WHERE (hd.loaiHoaDon = ?1) AND (hd.ngayTao BETWEEN ?2 AND ?3)")
    Page<HoaDon> searchByLoaiHoaDonAndNgayTao(Integer loaiHoaDon, LocalDateTime startDate, LocalDateTime endDate, Pageable pageable);

    //Tìm kiếm theo từ khóa và theo khoảng ngày
    @Query("SELECT hd FROM HoaDon hd " +
            "LEFT JOIN hd.idKhachHang kh " +
            "WHERE (hd.ma LIKE %?1% OR kh.sdt LIKE %?1%) AND (hd.loaiHoaDon = ?2) AND (hd.ngayTao BETWEEN ?3 AND ?4)")
    Page<HoaDon> searchByMaOrSdtAndLoaiHoaDonAndNgayTao(String keyword, Integer loaiHoaDon, LocalDateTime startDate, LocalDateTime endDate, Pageable pageable);

    @Query("select hd from HoaDon hd where hd.id=?1")
    HoaDon findByIdHoaDon(String idHoaDon);

    @Query("select new com.example.java4.response.HoaDonResponse(hd.id, hd.ma, cthd.idCTSP.idSanPham.ten, cthd.soLuong, ha.hinhAnh1, cthd.idCTSP.idMauSac.ten, cthd.idCTSP.idKichThuoc.ten, ctsp.giaBan) from HoaDon hd " +
            "join ChiTietHoaDon cthd on cthd.idHoaDon.id = hd.id " +
            "join ChiTietSanPham ctsp on ctsp.id = cthd.idCTSP.id " +
            "join HinhAnh ha on ha.idCTSP.id = ctsp.id " +
            "where hd.idKhachHang.id = ?1 and hd.trangThai = ?2")
    List<HoaDonResponse> getListHDbyIDKH(String idKH, Integer trangThai);

    // Tìm khuyến mãi theo id hóa đơn -Tai
    @Query("SELECT hd.idKhuyenMai FROM HoaDon hd WHERE hd.id = :hoaDonId")
    KhuyenMai findKhuyenMaiByHoaDonId(@Param("hoaDonId") String hoaDonId);

    @Query("select hd from HoaDon hd where hd.idKhachHang.id = ?1 " +
            "order by hd.ngayTao desc")
    Page<HoaDon> getHoaDonByIDKHA(String idKH, Pageable pageable);

    @Query("select hd from HoaDon hd " +
            "where hd.idKhachHang.id = ?1 and hd.trangThai = ?2 " +
            "order by hd.ngayTao desc")
    Page<HoaDon> getHoaDonByIDKHAndTrangThai(String idKH, Integer trangThai, Pageable pageable);

    @Query("select count(hd) from HoaDon hd where hd.idKhachHang.id = ?1 and hd.trangThai = ?2")
    int countByHoaDonByTrangThai(String idKH, Integer trangThai);

    @Query("select count(hd) from HoaDon hd where hd.trangThai >= 1 and hd.idKhachHang.id = ?1")
    int countByTrangThai(String idKH);

    @Query("SELECT hd FROM HoaDon hd ")
    Page<HoaDon> findAllExcludingSpecificTypeAndStatus(Pageable pageable);

    @Query("select hd from HoaDon hd " +
            "where hd.idKhachHang.id = ?1 and hd.id = ?2")
    List<HoaDon> getListHDbyIDKHAndIDHD(String idKH, String idHD);


    //    Tìm kiếm khuyến mãi theo hóa đơn
    @Query("SELECT km FROM KhuyenMai  km JOIN HoaDon hd ON km.id = hd.idKhuyenMai.id " +
            "WHERE hd.id = :idHoaDon")
    KhuyenMai getKhuyenMaiApDung(@Param("idHoaDon") String idHoaDon);

//    @Modifying
//    @Transactional
//    @Query("UPDATE HoaDon hd SET hd.tongTien = :newTongTien WHERE hd.idHoaDon.id = :idHoaDon")
//    int updateTongTienByIdHoaDon(@Param("idHoaDon") String idHoaDon, @Param("newTongTien") BigDecimal newTongTien);

};
