package com.example.java4.repositories;

import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.entities.HoaDon;
import com.example.java4.response.SPCTDTO;
import com.example.java4.response.ThongKeDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public interface ThongKeRepository extends JpaRepository<HoaDon, String> {

    // Doanh thu ngày hôm nay
    @Query(value = "SELECT " +
            "COALESCE(SUM(sub.TongTien), 0) AS doanhThu, " +
            "COALESCE(SUM(sub.soLuongSanPhamDaBan), 0) AS soLuongSanPhamDaBan, " +
            "COUNT(DISTINCT CASE WHEN sub.TrangThai = 6 THEN sub.ID ELSE NULL END) AS donHangThanhCong, " +
            "COUNT(DISTINCT CASE WHEN sub.TrangThai = 7 THEN sub.ID ELSE NULL END) AS donHangDaHuy " +
            "FROM ( " +
            "    SELECT " +
            "        hd.ID, " +
            "        hd.TongTien, " +
            "        SUM(cthd.SoLuong) AS soLuongSanPhamDaBan, " +
            "        hd.TrangThai " +
            "    FROM HoaDon hd " +
            "    LEFT JOIN ChiTietHoaDon cthd ON cthd.IdHoaDon = hd.ID " +
            "    WHERE CAST(hd.NgayTao AS DATE) = CAST(:date AS DATE) " +
            "     AND hd.TrangThai = 6" +
            "    GROUP BY hd.ID, hd.TongTien, hd.TrangThai " +
            ") sub",
            nativeQuery = true)
    List<Object[]> getDailyStatistics(@Param("date") LocalDateTime date);

    // Thống kê doanh thu cho tuần hiện tại
    @Query(value = "SELECT " +
            "COALESCE(SUM(sub.TongTien), 0) AS doanhThu, " +
            "COALESCE(SUM(sub.soLuongSanPhamDaBan), 0) AS soLuongSanPhamDaBan, " +
            "COUNT(DISTINCT CASE WHEN sub.TrangThai = 6 THEN sub.ID ELSE NULL END) AS donHangThanhCong, " +
            "COUNT(DISTINCT CASE WHEN sub.TrangThai = 7 THEN sub.ID ELSE NULL END) AS donHangDaHuy " +
            "FROM ( " +
            "    SELECT " +
            "        hd.ID, " +
            "        hd.TongTien, " +
            "        SUM(cthd.SoLuong) AS soLuongSanPhamDaBan, " +
            "        hd.TrangThai " +
            "    FROM HoaDon hd " +
            "    LEFT JOIN ChiTietHoaDon cthd ON cthd.IdHoaDon = hd.ID " +
            "    WHERE hd.NgayTao BETWEEN :startDate AND :endDate " +
            "    AND hd.TrangThai = 6" +
            "    GROUP BY hd.ID, hd.TongTien, hd.TrangThai " +
            ") sub",
            nativeQuery = true)
    List<Object[]> getWeeklyStatistics(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    // Thống kê doanh thu cho tháng hiện tại
    @Query(value = "SELECT " +
            "COALESCE(SUM(sub.TongTien), 0) AS doanhThu, " +
            "COALESCE(SUM(sub.soLuongSanPhamDaBan), 0) AS soLuongSanPhamDaBan, " +
            "COUNT(DISTINCT CASE WHEN sub.TrangThai = 6 THEN sub.ID ELSE NULL END) AS donHangThanhCong, " +
            "COUNT(DISTINCT CASE WHEN sub.TrangThai = 7 THEN sub.ID ELSE NULL END) AS donHangDaHuy " +
            "FROM ( " +
            "    SELECT " +
            "        hd.ID, " +
            "        hd.TongTien, " +
            "        SUM(cthd.SoLuong) AS soLuongSanPhamDaBan, " +
            "        hd.TrangThai " +
            "    FROM HoaDon hd " +
            "    LEFT JOIN ChiTietHoaDon cthd ON cthd.IdHoaDon = hd.ID " +
            "    WHERE DATEPART(MONTH, hd.NgayTao) = DATEPART(MONTH, :date) " +
            "    AND DATEPART(YEAR, hd.NgayTao) = DATEPART(YEAR, :date) " +
            "    AND hd.TrangThai = 6" +
            "    GROUP BY hd.ID, hd.TongTien, hd.TrangThai " +
            ") sub",
            nativeQuery = true)
    List<Object[]> getMonthlyStatistics(@Param("date") LocalDateTime date);


    // Thống kê doanh thu cho năm hiện tại
    // Thống kê cho năm
    @Query(value = "SELECT " +
            "COALESCE(SUM(sub.TongTien), 0) AS doanhThu, " +
            "COALESCE(SUM(sub.soLuongSanPhamDaBan), 0) AS soLuongSanPhamDaBan, " +
            "COUNT(DISTINCT CASE WHEN sub.TrangThai = 6 THEN sub.ID ELSE NULL END) AS donHangThanhCong, " +
            "COUNT(DISTINCT CASE WHEN sub.TrangThai = 7 THEN sub.ID ELSE NULL END) AS donHangDaHuy " +
            "FROM ( " +
            "    SELECT " +
            "        hd.ID, " +
            "        hd.TongTien, " +
            "        SUM(cthd.SoLuong) AS soLuongSanPhamDaBan, " +
            "        hd.TrangThai " +
            "    FROM HoaDon hd " +
            "    LEFT JOIN ChiTietHoaDon cthd ON cthd.IdHoaDon = hd.ID " +
            "    WHERE DATEPART(YEAR, hd.NgayTao) = DATEPART(YEAR, :date) " +
            "    AND hd.TrangThai = 6" +
            "    GROUP BY hd.ID, hd.TongTien, hd.TrangThai " +
            ") sub",
            nativeQuery = true)
    List<Object[]> getYearlyStatistics(@Param("date") LocalDateTime date);


    // Thống kê doanh thu theo khoảng ngày tùy chỉnh từ ngày bắt đầu  đến ngày kết thúc
    @Query(value = "SELECT " +
            "COALESCE(SUM(sub.TongTien), 0) AS doanhThu, " +
            "COALESCE(SUM(sub.soLuongSanPhamDaBan), 0) AS soLuongSanPhamDaBan, " +
            "COUNT(DISTINCT CASE WHEN sub.TrangThai = 6 THEN sub.ID ELSE NULL END) AS donHangThanhCong, " +
            "COUNT(DISTINCT CASE WHEN sub.TrangThai = 7 THEN sub.ID ELSE NULL END) AS donHangDaHuy " +
            "FROM ( " +
            "    SELECT " +
            "        hd.ID, " +
            "        hd.TongTien, " +
            "        SUM(cthd.SoLuong) AS soLuongSanPhamDaBan, " +
            "        hd.TrangThai " +
            "    FROM HoaDon hd " +
            "    LEFT JOIN ChiTietHoaDon cthd ON cthd.IdHoaDon = hd.ID " +
            "    WHERE hd.NgayTao BETWEEN :startDate AND :endDate" +
            "    AND hd.TrangThai = 6 " +
            "    GROUP BY hd.ID, hd.TongTien, hd.TrangThai " +
            ") sub",
            nativeQuery = true)
    List<Object[]> getCustomStatistics(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);


    // Thống kê sản phẩm sắp hết hàng
    @Query("SELECT c FROM ChiTietSanPham c WHERE c.soLuong <= 10 and c.trangThai=1 and c.idSanPham.trangThai=1" +
            " ORDER BY c.soLuong  ASC")
    Page<ChiTietSanPham> findProductsLowOnStock(Pageable pageable);


    // Thống kê sản phẩm bán chạy
    @Query("SELECT new com.example.java4.response.SPCTDTO(" +
            "sp.ten, " +
            "sp.ma, " +
            "ctsp.giaBan, " +
            "COALESCE(SUM(cthd.soLuong), 0)) " +
            "FROM ChiTietHoaDon cthd " +
            "JOIN cthd.idCTSP ctsp " +
            "JOIN ctsp.idSanPham sp " +
            "JOIN cthd.idHoaDon hd " +
            "WHERE FUNCTION('YEAR', hd.ngayTao) = FUNCTION('YEAR', :date) " +
            "AND FUNCTION('MONTH', hd.ngayTao) = FUNCTION('MONTH', :date) " +
            "GROUP BY sp.ten, sp.ma, ctsp.giaBan " +
            "HAVING COALESCE(SUM(cthd.soLuong), 0) > :minQuantity " +
            "ORDER BY COALESCE(SUM(cthd.soLuong), 0) DESC")
    Page<SPCTDTO> getTopSellingProductsByMonth(@Param("date") LocalDateTime date,
                                               @Param("minQuantity") int minQuantity, Pageable pageable);


    // Thống kê theo ngày
    @Query(value = "SELECT " +
            "CAST(hd.NgayTao AS DATE) AS day, " +
            "COUNT(DISTINCT hd.ID) AS soLuongHoaDon, " +
            "COALESCE(SUM(cthd.SoLuong), 0) AS soLuongSanPham " +
            "FROM HoaDon hd " +
            "LEFT JOIN ChiTietHoaDon cthd ON cthd.IdHoaDon = hd.ID " +
            "WHERE CAST(hd.NgayTao AS DATE) = CAST(:date AS DATE) " +
            "AND hd.TrangThai = 6" +
            "GROUP BY CAST(hd.NgayTao AS DATE) " +
            "ORDER BY day",
            nativeQuery = true)
    List<Object[]> getCurrentDailyMonthStatistics(@Param("date") LocalDateTime date);

    // Thống kê theo tuần
    @Query(value = "SELECT " +
            "CAST(hd.NgayTao AS DATE) AS day, " +
            "COUNT(DISTINCT hd.ID) AS soLuongHoaDon, " +
            "COALESCE(SUM(cthd.SoLuong), 0) AS soLuongSanPham " +
            "FROM HoaDon hd " +
            "LEFT JOIN ChiTietHoaDon cthd ON cthd.IdHoaDon = hd.ID " +
            "WHERE hd.NgayTao BETWEEN :startDate AND :endDate " +
            "AND hd.TrangThai = 6" +
            "GROUP BY CAST(hd.NgayTao AS DATE) " +
            "ORDER BY day",
            nativeQuery = true)
    List<Object[]> getCurrentWeeklyStatistics(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    // Thống kê biểu đồ cột hóa đơn và sản phẩm theo tháng
    @Query(value = "SELECT " +
            "CAST(hd.NgayTao AS DATE) AS day, " +
            "COUNT(DISTINCT hd.ID) AS soLuongHoaDon, " +
            "COALESCE(SUM(cthd.SoLuong), 0) AS soLuongSanPham " +
            "FROM HoaDon hd " +
            "LEFT JOIN ChiTietHoaDon cthd ON cthd.IdHoaDon = hd.ID " +
            "WHERE DATEPART(MONTH, hd.NgayTao) = DATEPART(MONTH, :date) " +
            "AND DATEPART(YEAR, hd.NgayTao) = DATEPART(YEAR, :date) " +
            "AND hd.TrangThai = 6" +
            "GROUP BY CAST(hd.NgayTao AS DATE) " +
            "ORDER BY day",
            nativeQuery = true)
    List<Object[]> getCurrentMonthStatistics(@Param("date") LocalDateTime date);

    // Thống kê theo năm
    @Query(value = "SELECT " +
            "CAST(hd.NgayTao AS DATE) AS day, " +
            "COUNT(DISTINCT hd.ID) AS soLuongHoaDon, " +
            "COALESCE(SUM(cthd.SoLuong), 0) AS soLuongSanPham " +
            "FROM HoaDon hd " +
            "LEFT JOIN ChiTietHoaDon cthd ON cthd.IdHoaDon = hd.ID " +
            "WHERE DATEPART(YEAR, hd.NgayTao) = DATEPART(YEAR, :date) " +
            "AND hd.TrangThai = 6" +
            "GROUP BY CAST(hd.NgayTao AS DATE) " +
            "ORDER BY day",
            nativeQuery = true)
    List<Object[]> getCurrentYearlyStatistics(@Param("date") LocalDateTime date);

    // Thống kê từ ngày bắt đầu đến ngày kết thúc
    @Query(value = "SELECT " +
            "CAST(hd.NgayTao AS DATE) AS day, " +
            "COUNT(DISTINCT hd.ID) AS soLuongHoaDon, " +
            "COALESCE(SUM(cthd.SoLuong), 0) AS soLuongSanPham " +
            "FROM HoaDon hd " +
            "LEFT JOIN ChiTietHoaDon cthd ON cthd.IdHoaDon = hd.ID " +
            "WHERE hd.NgayTao BETWEEN :startDate AND :endDate " +
            "AND hd.TrangThai = 6 " +
            "GROUP BY CAST(hd.NgayTao AS DATE) " +
            "ORDER BY day",
            nativeQuery = true)
    List<Object[]> getCustomDateRangeStatistics(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);




}
