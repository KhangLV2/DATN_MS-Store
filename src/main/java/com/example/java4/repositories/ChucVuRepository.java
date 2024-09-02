package com.example.java4.repositories;

import com.example.java4.entities.ChucVu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ChucVuRepository extends JpaRepository<ChucVu, String> {
    public static final int ACTIVE  = 1;
    public static final int INACTIVE =0;
    public Page<ChucVu> findByTrangThai(int trangThai, Pageable pageable);
    public Optional<ChucVu> findById(String id);

    @Query("select cv from ChucVu cv order by cv.ngayTao asc")
    List<ChucVu> getAlll ();

    @Query("select cv from ChucVu cv where cv.trangThai = ?1 order by cv.ngayTao asc ")
    List<ChucVu> findByTrangThai(int trangThai);
}
