package com.example.java4.service;

import com.example.java4.entities.HoaDon;
import com.example.java4.repositories.HoaDonRepository;
import com.example.java4.response.HoaDonDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Data
@AllArgsConstructor
@Service
public class AdminService {
    private HoaDonRepository _hoaDonRepository;

    public List<HoaDonDTO> FilterData(String maSdt, Integer loaiHd, LocalDateTime ngayBatDau, LocalDateTime ngayKetThuc) {
        List<HoaDon> query = _hoaDonRepository.findAll();
        if (!maSdt.isEmpty()) {
            query = query.stream()
                    .filter(record -> record.getMa().toLowerCase(Locale.ROOT).contains(maSdt.toLowerCase(Locale.ROOT)) ||
                            record.getIdKhachHang().getSdt().toLowerCase(Locale.ROOT).contains(maSdt.toLowerCase(Locale.ROOT))
                    )
                    .toList();
        }
        if (loaiHd != null) {
            query = query.stream().filter(record -> record.getLoaiHoaDon() == loaiHd).toList();
        }

        if (ngayBatDau != null && ngayKetThuc != null) {
            query = query.stream()
                    .filter(record -> !record.getNgayTao().isBefore(ngayBatDau) && !record.getNgayTao().isAfter(ngayKetThuc))
                    .collect(Collectors.toList());
        }


        List<HoaDonDTO> res = query.stream()
                .map(record -> new HoaDonDTO(
                        record.getId().toString(),
                        record.getMa(),
                        record.getIdKhachHang(),
                        record.getIdNhanVien(),
                        record.getPhuongThucThanhToan(),
                        record.getTongTien(),
                        record.getLoaiHoaDon(),
                        record.getNgayTao() != null ? record.getNgayTao().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")) : null,
                        record.getNgayThanhToan() != null ? record.getNgayThanhToan().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")) : null,
                        record.getTrangThai()))
                .collect(Collectors.toList());
        return res;
    }
}
