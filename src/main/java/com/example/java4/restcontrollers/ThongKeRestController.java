package com.example.java4.restcontrollers;

import com.example.java4.repositories.ThongKeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/thong-ke")
public class ThongKeRestController {

    @Autowired
    ThongKeRepository thongKeRepository;
    private String startDate;
    private String endDate;

    // Thống kê sản phẩm và hóa đơn theo tháng hiện tại
    @GetMapping("/thang-hien-tai")
    public ResponseEntity<List<Map<String, Object>>> getCurrentMonthStatistics() {
        LocalDateTime now = LocalDateTime.now();
        List<Object[]> results = thongKeRepository.getCurrentMonthStatistics(now);
        List<Map<String, Object>> statistics = mapResultsToStatistics(results);
        return ResponseEntity.ok(statistics);
    }

    // Thống kê sản phẩm và hóa đơn theo ngày hiện tại
    @GetMapping("/ngay-hien-tai")
    public ResponseEntity<List<Map<String, Object>>> getCurrentDayStatistics() {
        LocalDateTime now = LocalDateTime.now();
        List<Object[]> results = thongKeRepository.getCurrentDailyMonthStatistics(now);
        // Ensure we have at least one entry, even if no data exists
        if (results.isEmpty()) {
            results.add(new Object[]{now.toLocalDate(), 0, 0});
        }
        List<Map<String, Object>> statistics = mapResultsToStatistics(results);
        return ResponseEntity.ok(statistics);
    }

    // Thống kê sản phẩm và hóa đơn theo tháng hiện tại
    @GetMapping("/tuan-hien-tai")
    public ResponseEntity<List<Map<String, Object>>> getCurrentWeekStatistics() {
        LocalDateTime now = LocalDateTime.now();
        LocalDate startDate = now.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY)).toLocalDate();
        LocalDate endDate = now.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY)).toLocalDate();
        List<Object[]> results = thongKeRepository.getCurrentWeeklyStatistics(startDate.atStartOfDay(), endDate.atTime(23, 59, 59));
        List<Map<String, Object>> statistics = mapResultsToStatistics(results);
        return ResponseEntity.ok(statistics);
    }

    @GetMapping("/nam-hien-tai")
    public ResponseEntity<List<Map<String, Object>>> getCurrentYearStatistics() {
        LocalDateTime now = LocalDateTime.now();
        LocalDate startDate = now.with(TemporalAdjusters.firstDayOfYear()).toLocalDate();
        LocalDate endDate = now.with(TemporalAdjusters.lastDayOfYear()).toLocalDate();
        List<Object[]> results = thongKeRepository.getCurrentYearlyStatistics(startDate.atStartOfDay());
        List<Map<String, Object>> statistics = mapResultsToStatistics(results);
        return ResponseEntity.ok(statistics);
    }

    private List<Map<String, Object>> mapResultsToStatistics(List<Object[]> results) {
        List<Map<String, Object>> statistics = new ArrayList<>();
        for (Object[] result : results) {
            Map<String, Object> map = new HashMap<>();
            map.put("day", result[0]);
            map.put("soLuongHoaDon", result[1]);
            map.put("soLuongSanPham", result[2]);
            statistics.add(map);
        }
        return statistics;
    }
}
