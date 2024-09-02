package com.example.java4.service;

import com.example.java4.entities.KhuyenMai;
import com.example.java4.repositories.KhuyenMaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.List;
@Service
public class KhuyenMaiService {


    @Autowired
    private KhuyenMaiRepository khuyenMaiRepository;

    public void updateKhuyenMaiStatus() {
        List<KhuyenMai> khuyenMais = khuyenMaiRepository.findByTrangThai(1);
        LocalDateTime now = LocalDateTime.now();

        for (KhuyenMai khuyenMai : khuyenMais) {
            // Chuyển đổi Date sang LocalDateTime
            LocalDateTime ngayKetThuc = convertSqlDateToLocalDateTime(khuyenMai.getNgayKetThuc());

            // Kiểm tra xem khuyến mãi có hết hạn hoặc số lượng bằng 0 không
            if (khuyenMai.getSoLuong() <= 0 || ngayKetThuc.isBefore(now)) {
                khuyenMai.setTrangThai(0); // Cập nhật trạng thái thành 0 (ngừng hoạt động)
                khuyenMaiRepository.save(khuyenMai); // Lưu cập nhật vào cơ sở dữ liệu
            }
        }
    }

    private LocalDateTime convertSqlDateToLocalDateTime(Date sqlDate) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(sqlDate);
        return calendar.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
    }
}
