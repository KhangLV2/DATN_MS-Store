package com.example.java4.repositories;
import com.example.java4.entities.KieuTay;
import com.example.java4.entities.KieuTay;
import com.example.java4.entities.MauSac;
import com.example.java4.entities.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface KieuTayRepository extends JpaRepository<KieuTay,String> {
    int ACTIVE  = 1;
    int INACTIVE =0;
    @Query(value = "select kt from KieuTay kt ORDER BY kt.ngayTao asc")
    Page<KieuTay> findByTrangThai(int trangThai, Pageable pageable);
    @Query(value = "select kt from KieuTay kt ORDER BY kt.ngayTao asc")
    Page<KieuTay> findAllByPage(Pageable pageable);
    @Query("UPDATE KieuTay kt SET kt.trangThai = 1 WHERE kt.id=:id")
    int enableStt(@Param("id") String id);
    @Query("UPDATE KieuTay kt SET kt.trangThai = 0 WHERE kt.id=:id")
    int disableStt(@Param("id")String id);
    @Query(value = "SELECT COUNT(*) FROM kieutay",nativeQuery = true)
    Integer getCount();
    @Query(value = "SELECT COUNT(*) FROM kieutay where trangThai=1",nativeQuery = true)
    Integer getCountStt1();
    @Query(value = "SELECT COUNT(*) FROM kieutay where trangThai=0",nativeQuery = true)
    Integer getCountStt0();


    //Sáng
    @Query(value = "select ktay from KieuTay ktay where  ktay.ma Like %?1% " +
            "or ktay.ten Like %?1%")
    List<KieuTay> search(String keyword);

    Integer countByMa(String ma);

    @Query("SELECT ktay from KieuTay ktay where ktay.id = ?1")
    KieuTay findByIdKTay(Optional<String> id);

    @Query("SELECT ktay from KieuTay ktay where ktay.id = ?1")
    KieuTay findById1(String id);

    @Modifying
    @Transactional
    void deleteById(String id);
}
