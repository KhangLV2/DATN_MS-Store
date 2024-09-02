package com.example.java4.repositories;
import com.example.java4.entities.HinhAnh;
import com.example.java4.entities.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
public interface HinhAnhRepository extends JpaRepository<HinhAnh, String> {
    @Query("SELECT h FROM HinhAnh h WHERE h.idCTSP.id = :idCTSP")
    HinhAnh findByIdCTSP(@Param("idCTSP") String idCTSP);
    int ACTIVE  = 1;
    int INACTIVE =0;
    @Query(value = "SELECT sp FROM SanPham sp ORDER BY sp.ngayTao ASC")
    Page<HinhAnh> findByTrangThai(int trangThai, Pageable pageable);
    @Query(value = "SELECT img FROM HinhAnh img ORDER BY img.ngayTao ASC")
    Page<HinhAnh> findAllByPage(Pageable pageable);
    @Query("UPDATE HinhAnh img SET img.trangThai = 1 WHERE img.id=:id")
    int enableStt(@Param("id") String id);
    @Query("UPDATE HinhAnh img SET img.trangThai = 0 WHERE img.id=:id")
    int disableStt(@Param("id")String id);
    @Query(value = "SELECT COUNT(*) FROM hinhanh",nativeQuery = true)
    Integer getCount();
    @Query(value = "SELECT COUNT(*) FROM hinhanh where trangThai=1",nativeQuery = true)
    Integer getCountStt1();
    @Query(value = "SELECT COUNT(*) FROM hinhanh where trangThai=0",nativeQuery = true)
    Integer getCountStt0();
    @Query("SELECT MIN(h.hinhAnh1) FROM HinhAnh h WHERE h.idCTSP.id = :idCTSP")
    String findMinHinhAnhByCTSP(@Param("idCTSP") String idCTSP);
}
