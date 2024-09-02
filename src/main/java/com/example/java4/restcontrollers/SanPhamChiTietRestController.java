package com.example.java4.restcontrollers;

import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.config.HoaDonUtil;
import com.example.java4.config.UserInfor;
import com.example.java4.controller.BanHangTaiQuay.Validator;
import com.example.java4.entities.*;
import com.example.java4.repositories.*;
import com.example.java4.request.dangNhap.NVSignUpRequest;
import com.example.java4.response.GiaoHangDTO;
import com.example.java4.response.HoaDonDTO;
import com.example.java4.response.HoaDonResponse;
import com.example.java4.response.LichSuHoaDonDTO;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Sort;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/chi-tiet-san-pham")
public class SanPhamChiTietRestController {

    @Autowired
    KhachHangRepository _khachHangRepo;

    @Autowired
    NhanVienRepository _nhanVienRepo;

    @Autowired
    HDCTRepository _hoaDonChiTietRepo;

    @Autowired
    HoaDonRepository hoaDonRepository;

    @Autowired
    HDCTRepository _hoaDonChiTietReposioty;

    @Autowired
    DiaChiRepository _diaChiRepository;

    @Autowired
    HoaDonRepository _hoaDonRepo;

    @Autowired
    SPCTRepository _sanPhamChiTietRepo;

    @Autowired
    KichThuocRepository kichThuocRepo;

    @Autowired
    ChatLieuRepository chatLieuRepo;

    @Autowired
    KieuTayRepository kieuTayRepo;

    @Autowired
    NhanVienRepository nhanVienRepo;

    @Autowired
    KhuyenMaiRepository khuyenMaiRepo;

    @Autowired
    MauSacRepository mauSacRepository;

    @Autowired
    GiaoHangRepo _giaoHangRepo;

    @Autowired
    SPCTRepository _chiTietSanPhamRepo;

    @Autowired
    HinhAnhRepository _hinhAnhRepo;

    @Autowired
    LichSuHoaDonRepository _lichSuHoaDonRepo;

    @Autowired
    KhuyenMaiRepository _khuyenMaiRepo;


    @GetMapping("/list")
    public ResponseEntity<Map<String, Object>> getChiTietSanPhamList(
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            @RequestParam(value = "search", defaultValue = "") String search,
            @RequestParam(value = "color", defaultValue = "") String color,
            @RequestParam(value = "sizeFilter", defaultValue = "") String sizeFilter,
            @RequestParam(value = "material", defaultValue = "") String material,
            @RequestParam(value = "sleeve", defaultValue = "") String sleeve) {

        Pageable pageable = PageRequest.of(page, size);
        Page<ChiTietSanPham> chiTietSanPhamPage = _chiTietSanPhamRepo.findByTrangThai(1, pageable);

        Map<String, Object> response = new HashMap<>();
        response.put("chiTietSanPhamList", chiTietSanPhamPage.getContent());
        response.put("totalPages", chiTietSanPhamPage.getTotalPages());
        response.put("currentPage", chiTietSanPhamPage.getNumber());
        response.put("totalElements", chiTietSanPhamPage.getTotalElements());

        List<MauSac> listMauSac = mauSacRepository.findAll();
        List<KichThuoc> listKichThuoc = kichThuocRepo.findAll();
        List<ChatLieu> listChatLieu = chatLieuRepo.findAll();
        List<KieuTay> listKieuTay = kieuTayRepo.findAll();

        response.put("listMauSac", listMauSac);
        response.put("listKichThuoc", listKichThuoc);
        response.put("listChatLieu", listChatLieu);
        response.put("listKieuTay", listKieuTay);

        Map<String, String> hinhAnhMap = new HashMap<>();
        for (ChiTietSanPham product : chiTietSanPhamPage.getContent()) {
            HinhAnh hinhAnh = _hinhAnhRepo.findByIdCTSP(product.getId());
            if (hinhAnh != null) {
                hinhAnhMap.put(product.getId(), hinhAnh.getHinhAnh1());
            }
        }

        response.put("hinhAnhMap", hinhAnhMap);

        return ResponseEntity.ok(response);
    }
}
