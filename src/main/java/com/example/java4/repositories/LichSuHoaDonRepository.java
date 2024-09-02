package com.example.java4.repositories;

import com.example.java4.entities.LichSuHoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface LichSuHoaDonRepository extends JpaRepository<LichSuHoaDon,String> {


    @Query("SELECT lshd FROM LichSuHoaDon lshd where lshd.idHoaDon.id =:idHoaDon")
    List<LichSuHoaDon> findListByIdHoaDon(@Param("idHoaDon") String idHD);

    @Query("SELECT lshd FROM LichSuHoaDon lshd where lshd.idHoaDon.id =:idHoaDon")
    LichSuHoaDon findByIdHoaDon(@Param("idHoaDon") String idHD);

}
