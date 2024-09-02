package com.example.java4.repositories;

import com.example.java4.entities.ChatLieu;
import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.response.MauSizeSL;
import com.example.java4.response.SPCTDTO;
import com.example.java4.response.SPCTResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface SPCTRepository extends JpaRepository<ChiTietSanPham, String>, JpaSpecificationExecutor<ChiTietSanPham> {
    public static final int ACTIVE = 1;
    public static final int INACTIVE = 0;

    @Query("select ctsp from ChiTietSanPham ctsp where ctsp.trangThai=1 order by ctsp.id asc")
    public Page<ChiTietSanPham> findByTrangThai(int trangThai, Pageable pageable);

    // Tìm kiếm trên ô text
    @Query("select ctsp from ChiTietSanPham ctsp " +
            "where (ctsp.idSanPham.ma like %?1% or ctsp.idSanPham.ten like %?1%" +
            "or ctsp.idMauSac.ten like %?1% or ctsp.idKichThuoc.ten like %?1%" +
            "or ctsp.idChatLieu.ten like %?1% or ctsp.idKieuTay.ten like %?1%) and ctsp.trangThai=?2")
    Page<ChiTietSanPham> timKiem(String key, int trangThai, Pageable pageable);

    //Lọc theo từng combobox
    @Query("select ctsp from ChiTietSanPham ctsp where ctsp.idSanPham.id = ?1 and ctsp.trangThai = ?2")
    Page<ChiTietSanPham> locCTSPByIdSanPham(String idSanPham, int trangThai, Pageable pageable);

    @Query("select ctsp from ChiTietSanPham ctsp where ctsp.idMauSac.id = ?1 and ctsp.trangThai = ?2")
    Page<ChiTietSanPham> locCTSPByIdMauSac(String idMauSac, int trangThai, Pageable pageable);

    @Query("select ctsp from ChiTietSanPham ctsp where ctsp.idKichThuoc.id = ?1 and ctsp.trangThai = ?2")
    Page<ChiTietSanPham> locCTSPByIdKichThuoc(String idKichThuoc, int trangThai, Pageable pageable);

    @Query("select ctsp from ChiTietSanPham ctsp where ctsp.idChatLieu.id = ?1 and ctsp.trangThai = ?2")
    Page<ChiTietSanPham> locCTSPByIdChatLieu(String idChatLieu, int trangThai, Pageable pageable);

    @Query("select ctsp from ChiTietSanPham ctsp where ctsp.idKieuTay.id = ?1 and ctsp.trangThai = ?2")
    Page<ChiTietSanPham> locCTSPByIdKieuTay(String idKieuTay, int trangThai, Pageable pageable);

    //Lọc cộng dồn sản phẩm(chưa được)
    @Query(value = "select * from ChiTietSanPham " +
            "where idSanPham = :idSanPham and idMauSac = :idMauSac and idKichThuoc = :idKichThuoc " +
            "and idChatLieu = :idChatLieu and idKieuTay = :idKieuTay", nativeQuery = true)
    Page<ChiTietSanPham> filterCombobox(@Param("idSanPham") String idSanPham, @Param("idMauSac") String idMauSac, @Param("idKichThuoc") String idKichThuoc, @Param("idChatLieu") String idChatLieu, @Param("idKieuTay") String idKieuTay, Pageable pageable);

    @Query("SELECT ctsp  FROM ChiTietSanPham ctsp WHERE ctsp.id = ?1 ")
    ChiTietSanPham findByIdCTSP(String id);


    @Query("SELECT new com.example.java4.response.SPCTResponse(ctsp.id, sp.id, sp.ma, sp.ten, kta.ten, ctsp.giaBan, ha.hinhAnh1)" +
            "from ChiTietSanPham ctsp " +
            "join SanPham sp on sp.id = ctsp.idSanPham.id " +
            "join MauSac ms on ms.id = ctsp.idMauSac.id " +
            "join KichThuoc kth on  kth.id = ctsp.idKichThuoc.id " +
            "join ChatLieu cl on cl.id = ctsp.idChatLieu.id " +
            "join KieuTay kta on kta.id = ctsp.idKieuTay.id " +
            "join HinhAnh ha on ctsp.id = ha.idCTSP.id " +
            "where ctsp.id in (select min (innerCtsp.id) from ChiTietSanPham innerCtsp group by innerCtsp.idSanPham.id)")
    Page<SPCTResponse> getAllSP(Pageable pageable);


    @Query("SELECT new com.example.java4.response.SPCTResponse(ctsp.id, sp.id, sp.ma, sp.ten, kta.ten, ctsp.giaBan, ha.hinhAnh1)" +
            "FROM ChiTietSanPham ctsp " +
            "JOIN SanPham sp ON sp.id = ctsp.idSanPham.id " +
            "JOIN MauSac ms ON ms.id = ctsp.idMauSac.id " +
            "JOIN KichThuoc kth ON kth.id = ctsp.idKichThuoc.id " +
            "JOIN ChatLieu cl ON cl.id = ctsp.idChatLieu.id " +
            "JOIN KieuTay kta ON kta.id = ctsp.idKieuTay.id " +
            "JOIN HinhAnh ha ON ctsp.id = ha.idCTSP.id " +
            "WHERE (?1 IS NULL OR sp.ten LIKE %?1% OR ms.ten LIKE %?1% OR kta.ten LIKE %?1%) " +
            "AND ctsp.id IN (SELECT MIN(innerCtsp.id) FROM ChiTietSanPham innerCtsp GROUP BY innerCtsp.idSanPham.id)")
    Page<SPCTResponse> searchSP(@Param("search") String search, Pageable pageable);

//    @Query(
//            "FROM ChiTietSanPham ctsp " +
//            "JOIN SanPham sp ON sp.id = ctsp.idSanPham.id " +
//            "JOIN MauSac ms ON ms.id = ctsp.idMauSac.id " +
//            "JOIN KichThuoc kth ON kth.id = ctsp.idKichThuoc.id " +
//            "JOIN ChatLieu cl ON cl.id = ctsp.idChatLieu.id " +
//            "JOIN KieuTay kta ON kta.id = ctsp.idKieuTay.id " +
//            "JOIN HinhAnh ha ON ctsp.id = ha.idCTSP.id " +
//            "WHERE (?1 IS NULL OR sp.ten LIKE %?1% OR ms.ten LIKE %?1% OR kta.ten LIKE %?1%) " +
//            "AND ctsp.id IN (SELECT MIN(innerCtsp.id) FROM ChiTietSanPham innerCtsp GROUP BY innerCtsp.idSanPham.id)")
//    Page<SPCTResponse> searchSP(@Param("search") String search, Pageable pageable);

    @Query("SELECT new com.example.java4.response.SPCTResponse( min(ctsp.id), sp.id, sp.ma, sp.ten, min(kta.ten), ctsp.giaBan, ha.hinhAnh1)\n" +
            "FROM ChiTietSanPham ctsp \n" +
            "JOIN SanPham sp ON sp.id = ctsp.idSanPham.id\n" +
            "JOIN MauSac ms ON ms.id = ctsp.idMauSac.id\n" +
            "JOIN KichThuoc kth ON kth.id = ctsp.idKichThuoc.id \n" +
            "JOIN ChatLieu cl ON cl.id = ctsp.idChatLieu.id\n" +
            "JOIN KieuTay kta ON kta.id = ctsp.idKieuTay.id \n" +
            "JOIN HinhAnh ha ON ctsp.id = ha.idCTSP.id\n" +
            "WHERE (ctsp.idMauSac.ten like %?1%)\n" +
            "AND sp.id IN (\n" +
            "    SELECT DISTINCT ctsp1.idSanPham.id \n" +
            "    FROM ChiTietSanPham ctsp1 \n" +
            "    WHERE (ctsp.idMauSac.ten like %?1%)\n" +
            ")\n" +
            "GROUP BY  sp.id, sp.ma, sp.ten, kta.ten, ctsp.giaBan, ha.hinhAnh1")
    Page<SPCTResponse> listPageSP(@Param("search") String search, Pageable pageable);

    //Lấy danh sách màu sắc, kích thước, số lượng để sang js lọc
    @Query("select new com.example.java4.response.MauSizeSL (ha.hinhAnh1, ha.hinhAnh2, ha.hinhAnh3, kth.ten, ms.ten, ctsp.soLuong) " +
            "from ChiTietSanPham ctsp " +
            "join KichThuoc kth on kth.id = ctsp.idKichThuoc.id " +
            "join SanPham sp on sp.id = ctsp.idSanPham.id " +
            "join MauSac ms on ms.id = ctsp.idMauSac.id " +
            "join HinhAnh ha on ctsp.id = ha.idCTSP.id " +
            "where sp.id = ?1 and ctsp.trangThai = 1")
    List<MauSizeSL> getListMauSizeSL(String idSP);

    //Lấy ra số lượng ctsp bên trang chi tiết
    @Query("select ctsp.soLuong from ChiTietSanPham ctsp where ctsp.idSanPham.id = ?1 and ctsp.idMauSac.id = ?2 and ctsp.idKichThuoc.id = ?3")
    Integer getSoLuongCTSPBySanPham_MauSac_KichThuoc(String idSP, String idMS, String idKth);

    //Lấy ra STSP theo idSP, idMS, idKth
    @Query("select ctsp from ChiTietSanPham ctsp where ctsp.idSanPham.id = ?1 and ctsp.idMauSac.id = ?2 and ctsp.idKichThuoc.id = ?3")
    ChiTietSanPham findCTSPBySanPham_MauSac_KichThuoc(String idSP, String idMS, String idKth);

    @Query("SELECT spct.soLuong FROM ChiTietSanPham spct WHERE spct.id = :idSPCT AND spct.trangThai = 1")
    Integer findBySoLuong(@Param("idSPCT") String idSPCT);

    //Nguyenxloc
    @Query(value = "SELECT ctsp FROM ChiTietSanPham ctsp where ctsp.trangThai=:trangThai ORDER BY ctsp.ngayTao asc")
    Page<ChiTietSanPham> findByTrangThaiAsc(int trangThai, Pageable pageable);

    @Query(value = "SELECT ctsp FROM ChiTietSanPham ctsp where ctsp.trangThai=1 ORDER BY ctsp.ngayTao asc")
    Page<ChiTietSanPham> findAllByPage(Pageable pageable);

    @Query(value = "SELECT ctsp FROM ChiTietSanPham ctsp where ctsp.trangThai=:trangThai and ctsp.idSanPham.id=:idSP ORDER BY ctsp.ngayTao asc")
    Page<ChiTietSanPham> findByIdSP(int trangThai, String idSP, Pageable pageAble);

    @Query(value = "SELECT ctsp FROM ChiTietSanPham ctsp where ctsp.idSanPham.id=:idSP ORDER BY ctsp.idMauSac.id asc,ctsp.ngayTao asc")
    Page<ChiTietSanPham> findByIdSPAll(String idSP, Pageable pageAble);

    @Modifying(clearAutomatically = true)
    @Query("UPDATE ChiTietSanPham ctsp SET ctsp.trangThai = 1 WHERE ctsp.id=:id")
    int enableStt(@Param("id") String id);

    @Query("UPDATE ChiTietSanPham ctsp SET ctsp.trangThai = 0 WHERE ctsp.id=:id")
    int disableStt(@Param("id") String id);

    @Query(value = "SELECT COUNT(*) FROM chitietsanpham", nativeQuery = true)
    Integer getCount();

    @Query(value = "SELECT COUNT(*) FROM chitietsanpham where trangThai=1", nativeQuery = true)
    Integer getCountStt1();

    @Query(value = "SELECT COUNT(*) FROM chitietsanpham where trangThai=0", nativeQuery = true)
    Integer getCountStt0();

    @Query(value = "SELECT COUNT(*) FROM chitietsanpham where IdSanPham=:idsp", nativeQuery = true)
    Integer getCountByidsp(String idsp);

    @Query(value = "SELECT COUNT(*) FROM chitietsanpham where trangThai=1 and IdSanPham=:idsp", nativeQuery = true)
    Integer getCountStt1Byidsp(String idsp);

    @Query(value = "SELECT COUNT(*) FROM chitietsanpham where trangThai=0 and IdSP=:idsp", nativeQuery = true)
    Integer getCountStt0Byidsp(String idsp);

    @Query(value = "SELECT ctsp.* FROM ChiTietSanPham ctsp " +
            "JOIN ChiTietHoaDon hdct ON ctsp.id = hdct.idCTSP " +
            "WHERE hdct.id = :idHoaDonChiTiet", nativeQuery = true)
    Optional<ChiTietSanPham> findByHoaDonChiTietId(@Param("idHoaDonChiTiet") String idHoaDonChiTiet);
    @Modifying
    @Transactional
    @Query(value = "UPDATE ChiTietSanPham ctsp SET ctsp.idChatLieu.id = :idChatLieu WHERE ctsp.idSanPham.id = :idSanPham")
    Integer updateAllChatLieu(@Param("idSanPham") String idSanPham, @Param("idChatLieu") String idChatLieu);
    @Modifying
    @Transactional
    @Query(value = "UPDATE ChiTietSanPham ctsp SET ctsp.idKieuTay.id = :idKieuTay WHERE ctsp.idSanPham.id = :idSanPham")
    Integer updateAllKieuTay(@Param("idSanPham") String idSanPham, @Param("idKieuTay") String idKieuTay);

    @Query(value = "SELECT MIN(ha.hinhAnh1) FROM HinhAnh ha WHERE ha.idCTSP.id = :idSPCT")
    String getHinhAnhOfSPCT(@Param("idSPCT") String idSPCT);

    // Thống kê danh sách sản phẩm sắp hết hàng
//    @Query("SELECT new com.example.java4.response.SPCTDTO(" +
//            "sp.ten, sp.ma, ctsp.giaBan, ha.hinhAnh1, ctsp.soLuong) " +
//            "FROM ChiTietSanPham ctsp " +
//            "JOIN ctsp.sanPham sp " +
//            "LEFT JOIN ctsp.hinhAnh ha " +
//            "WHERE ctsp.soLuong < :minStock " +
//            "ORDER BY ctsp.soLuong ASC")
//    Page<SPCTDTO> getLowStockProducts(@Param("minStock") int minStock, Pageable pageable);
    @Query(value = "SELECT MAX(ctsp.giaBan) FROM ChiTietSanPham ctsp WHERE ctsp.idSanPham.id = :idSP")
    Long getMaxGiaBan(@Param("idSP") String idSP);

    @Query(value = "SELECT MIN(ctsp.giaBan) FROM ChiTietSanPham ctsp WHERE ctsp.idSanPham.id = :idSP")
    Long getMinGiaBan(@Param("idSP") String idSP);
    @Query("select ctsp from ChiTietSanPham ctsp where ctsp.id = ?1 and ctsp.trangThai = 1")
    ChiTietSanPham getByIDCTSP(String id);

    @Query("select min(ctsp.idChatLieu.id) from ChiTietSanPham ctsp where ctsp.idSanPham.id = :idSP")
    String getMinChatLieuSPCTByIdSP(@Param("idSP") String idSP);

    @Query("select min(ctsp.idKieuTay.id) from ChiTietSanPham ctsp where ctsp.idSanPham.id = :idSP")
    String getMinKieuTaySPCTByIdSP(@Param("idSP") String idSP);

};


