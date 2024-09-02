package com.example.java4.repositories;

import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.entities.KhuyenMai;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface KhuyenMaiRepository extends JpaRepository<KhuyenMai,String> {

    public static final int ACTIVE  = 1;
    public static final int INACTIVE =0;

    @Query("select km from KhuyenMai km where km.trangThai=:trangThai")
    List<KhuyenMai> findAllKMTrangThai(@Param("trangThai") int trangThai);

    @Query("select km from KhuyenMai km where km.id=?1")
    KhuyenMai findByIdKM(String idKM);

    //Nguyenxloc
    @Query(value = "SELECT km FROM KhuyenMai km where km.trangThai=:trangThai ORDER BY km.ngayTao asc")
    Page<KhuyenMai> findByTrangThaiAsc(int trangThai, Pageable pageable);
    @Query(value = "SELECT km FROM KhuyenMai km ORDER BY km.ngayTao asc")
    Page<KhuyenMai> findAllByPage(Pageable pageable);
    @Modifying(clearAutomatically = true)
    @Query("UPDATE KhuyenMai km SET km.trangThai = 1 WHERE km.id=:id")
    int enableStt(@Param("id") String id);
    @Query("UPDATE KhuyenMai km SET km.trangThai = 0 WHERE km.id=:id")
    int disableStt(@Param("id")String id);
    @Query(value = "SELECT COUNT(*) FROM khuyenMai",nativeQuery = true)
    Integer getCount();
    @Query(value = "SELECT COUNT(*) FROM khuyenMai where trangThai=1",nativeQuery = true)
    Integer getCountStt1();
    @Query(value = "SELECT COUNT(*) FROM khuyenMai where trangThai=0",nativeQuery = true)
    Integer getCountStt0();
    @Query("SELECT km FROM KhuyenMai km WHERE LOWER(km.ten) = LOWER(:tenKM)")
    KhuyenMai checkTenKMExist(@Param("tenKM") String tenKM);
    //Sáng
    @Query("select km from KhuyenMai km where km.trangThai = ?1 and km.soLuong > 0")
    List<KhuyenMai> findByTrangThai(Integer trangThai);

//  =====Tài====
//    Tìm kiếm khuyến mãi theo hóa đơn

}
