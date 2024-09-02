package com.example.java4.repositories;

import com.example.java4.entities.DiaChi;
import org.eclipse.tags.shaded.org.apache.bcel.generic.Select;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiaChiRepository extends JpaRepository<DiaChi,String> {

    public static final int MAC_DINH  = 1;
    public static final int TUY_CHON = 0;

    @Query("select dc from DiaChi dc where dc.idKhachHang.id = ?1 and dc.trangThai = ?2")
    DiaChi getDiaChiByIdKhachHangAndTrangThai(String idKH, Integer trangThai);

    @Query("select dc from DiaChi dc where dc.idKhachHang.id = ?1  order by dc.trangThai desc")
    List<DiaChi> getAllDiaChi(String idKH);

    @Query("select dc from DiaChi dc where dc.id = ?1")
    DiaChi findDiaChiByID(String id);
    @Query("SELECT diaChi FROM DiaChi diaChi WHERE diaChi.idKhachHang.id = :idKH and diaChi.trangThai=1")
    DiaChi findDiaChiByKhachHangId(@Param("idKH") String idKH);


    // Lấy danh sách địa chỉ theo idKH - Tai
    @Query("Select diaChi FROM DiaChi diaChi WHERE diaChi.idKhachHang.id = :idKH")
    List<DiaChi> findDiaChiByIdKhachHang(@Param("idKH") String idKH);
}
