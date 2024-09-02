package com.example.java4.repositories;

import com.example.java4.entities.ChatLieu;
import com.example.java4.entities.KichThuoc;
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

public interface ChatLieuRepository extends JpaRepository<ChatLieu, String> {
    int ACTIVE  = 1;
    int INACTIVE =0;
    @Query(value = "select cl from ChatLieu cl ORDER BY cl.ngayTao asc")
    Page<ChatLieu> findByTrangThai(int trangThai, Pageable pageable);
    @Query(value = "select cl from ChatLieu cl ORDER BY cl.ngayTao asc")
    Page<ChatLieu> findAllByPage(Pageable pageable);
    @Query("UPDATE ChatLieu cl SET cl.trangThai = 1 WHERE cl.id=:id")
    int enableStt(@Param("id") String id);
    @Query("UPDATE ChatLieu cl SET cl.trangThai = 0 WHERE cl.id=:id")
    int disableStt(@Param("id")String id);
    @Query(value = "SELECT COUNT(*) FROM chatlieu",nativeQuery = true)
    Integer getCount();
    @Query(value = "SELECT COUNT(*) FROM chatlieu where trangThai=1",nativeQuery = true)
    Integer getCountStt1();
    @Query(value = "SELECT COUNT(*) FROM chatlieu where trangThai=0",nativeQuery = true)
    Integer getCountStt0();

    //Sáng
    @Query(value = "select cl from ChatLieu cl where cl.ma Like %?1% " +
            "or cl.ten Like %?1%")
    List<ChatLieu> search(String keyword);

    Integer countByMa(String ma);

    @Query("SELECT cl from ChatLieu cl where cl.id = ?1")
    ChatLieu findByIdKTh(Optional<String> id);

    @Query("SELECT cl from ChatLieu cl where cl.id = ?1")
    ChatLieu findById1(String id);

    @Modifying
    @Transactional
    void deleteById(String id);
}
