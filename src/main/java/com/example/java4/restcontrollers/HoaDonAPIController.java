//package com.example.java4.restcontrollers;
//
//import com.example.java4.entities.ChiTietHoaDon;
//import com.example.java4.entities.HoaDon;
//import com.example.java4.repositories.HDCTRepository;
//import com.example.java4.repositories.HoaDonRepository;
//import com.example.java4.response.HoaDonDTO;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.util.List;
//
//@RestController
//@RequestMapping("/api/hoa-don")
//public class HoaDonAPIController {
//
//    @Autowired
//    private HoaDonRepository _hoaDonRepo;
//
//    @Autowired
//    private HDCTRepository _hoaDonChiTietRepo;
//
//    @GetMapping("/detail/{idHD}")
//    public ResponseEntity<?> getHoaDonDetail(@PathVariable("idHD") String idHD) {
//        // Tìm hóa đơn theo ID
//        HoaDon hoaDon = _hoaDonRepo.findById(idHD).orElse(null);
//        if (hoaDon == null) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy hóa đơn.");
//        }
//
//        // Lấy danh sách chi tiết hóa đơn
//        List<ChiTietHoaDon> listHDCT = _hoaDonChiTietRepo.findAllByHoaDon_Id(idHD);
//
//        // Tạo một đối tượng DTO để gửi dữ liệu cần thiết
//        HoaDonDTO hoaDonDTO = HoaDonDTO.fromEntity(hoaDon);
//        return ResponseEntity.ok(hoaDonDTO);
//    }
//}
