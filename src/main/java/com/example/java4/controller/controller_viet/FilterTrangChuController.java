package com.example.java4.controller.controller_viet;

import com.example.java4.config.UserInfor;
import com.example.java4.entities.*;
import com.example.java4.repositories.*;
import com.example.java4.repositories.viet_repo.CTHDRepository;
import com.example.java4.repositories.viet_repo.CTSPRepository;
import com.example.java4.request.req_tai.KhachHangDTO;
import com.example.java4.response.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

@Controller
@RequestMapping("store")
public class FilterTrangChuController {
    @Autowired
    SPCTRepository spctRepo;
    @Autowired
    HinhAnhRepository hinhAnhRepo;
    @Autowired
    KichThuocRepository kichThuocRepo;
    @Autowired
    MauSacRepository mauSacRepo;
    @Autowired
    KieuTayRepository kieuTayRepo;
    @Autowired
    KhachHangRepository khachHangRepo;
    @Autowired
    HoaDonRepository hoaDonRepo;
    @Autowired
    HDCTRepository hdctRepo;
    @Autowired
    SanPhamRepository sanPhamRepo;
    @Autowired
    KhachHangRepository khachHangRepository;
    @Autowired
    GiaoHangRepo giaoHangRepo;
    @Autowired
    DiaChiRepository diaChiRepo;
    @Autowired
    KhuyenMaiRepository khuyenMaiRepo;

    @Autowired
    CTSPRepository ctspRepo;

    @Autowired
    CTHDRepository cthdRepo;

    private List<HoaDon> listHoaDon = new ArrayList<>();
    private List<ChiTietHoaDon> listHDCT = new ArrayList<>();
    private List<ChiTietSanPham> listCTSP = new ArrayList<>();
    private List<SanPham> listSanPham = new ArrayList<>();
    private List<KhachHang> listKhachHang = new ArrayList<>();
    private List<GioHangResponse> listGioHang;
    private List<DiaChi> listDiaChi = new ArrayList<>();
    private List<KhuyenMai> listKhuyenMai = new ArrayList<>();
    private List<HoaDonResponse> listHDByIDKH = new ArrayList<>();


    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> login(@ModelAttribute("khachHangDTO") KhachHangDTO khachHangDTO,
                                                     HttpSession session,
                                                     BindingResult result) {
        Map<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            response.put("success", false);
            response.put("errors", result.getAllErrors());
            return ResponseEntity.ok(response);
        }

        KhachHang khachHang = khachHangRepository.findByTaiKhoan(khachHangDTO.getTaiKhoan());
        if (khachHang != null) {
            if (khachHang.getMatKhau().equals(khachHangDTO.getMatKhau())) {
                session.setAttribute("user", khachHang);
                UserInfor.idKhachHang = khachHang.getId();
                System.out.println(UserInfor.idKhachHang);
                response.put("success", true);
                response.put("successMessage", "Đăng nhập thành công!");
                response.put("redirectUrl", "/store/trang-chu");
                return ResponseEntity.ok(response);
            } else {
                response.put("success", false);
                response.put("errorPassword", "Sai mật khẩu");
                return ResponseEntity.ok(response);
            }
        } else {
            response.put("success", false);
            response.put("errorUsername", "Tài khoản không tồn tại");
            return ResponseEntity.ok(response);
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        // Xóa thông tin người dùng đã đăng nhập khỏi session
        session.removeAttribute("user");
        UserInfor.idKhachHang = null;
        redirectAttributes.addFlashAttribute("successMessage", "Đăng xuất thành công!");
        return "redirect:/store/trang-chu";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("khachHangDTO") KhachHangDTO khachHangDTO,
                           BindingResult result,
                           @RequestParam("checkDangKy") Integer checkDangKy,
                           RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("registerErrors", result.getAllErrors());
            return "redirect:/store/trang-chu";
        }
        // Save the new user
        if (checkDangKy == 1){
            //Thêm mới khách hàng
            KhachHang newUser = new KhachHang();
            newUser.setTaiKhoan(khachHangDTO.getTaiKhoan());
            newUser.setEmail(khachHangDTO.getEmail());
            newUser.setSdt(khachHangDTO.getSdt());
            newUser.setMatKhau(khachHangDTO.getMatKhau());
            newUser.setNgayTao(LocalDateTime.now());
            newUser.setTrangThai(khachHangRepository.ACTIVE);
            khachHangRepository.save(newUser);
        }else {
            //Sửa khách hàng
            KhachHang khachHang = khachHangRepo.findBySdt(khachHangDTO.getSdt());
            khachHang.setTaiKhoan(khachHangDTO.getTaiKhoan());
            khachHang.setEmail(khachHangDTO.getEmail());
            khachHang.setSdt(khachHangDTO.getSdt());
            khachHang.setMatKhau(khachHangDTO.getMatKhau());
            khachHang.setNgayTao(LocalDateTime.now());
            khachHang.setTrangThai(khachHangRepository.ACTIVE);
            khachHangRepository.save(khachHang);
        }

        redirectAttributes.addFlashAttribute("successMessage", "Đăng ký thành công!");
        return "redirect:/store/trang-chu";
    }

    @GetMapping("/trang-chu")
    public String getTrangChu(
            Model model,
            @RequestParam("page") Optional<Integer> pageParam
    ) {
        if (!model.containsAttribute("khachHangDTO")) {
            System.out.println("crette dto");
            model.addAttribute("khachHangDTO", new KhachHangDTO());
        }
        Pageable pageable = PageRequest.of(pageParam.orElse(0), 2);
        List<SPCTResponse> listSanPhamRes = ctspRepo.getAllSP(pageable);
        model.addAttribute("listSanPhamRes", listSanPhamRes);
        model.addAttribute("soLuong", hdctRepo.findByKHnStt(khachHangRepo.findByIdKH(UserInfor.idKhachHang)));
        //Tính tổng số lượng sản phẩm có trong giỏ hàng
        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
        listGioHang = hdctRepo.getAll(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
        Integer totalSoLuong = 0;
        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
            totalSoLuong += chiTietHoaDon.getSoLuong();
        }
        model.addAttribute("soLuong", totalSoLuong);

        BigDecimal minGiaBan = ctspRepo.minGiaBan();
        BigDecimal maxGiaBan = ctspRepo.maxGiaBan();
        model.addAttribute("minGiaBan", minGiaBan);
        model.addAttribute("maxGiaBan", maxGiaBan);

        model.addAttribute("listMauSac", mauSacRepo.findAll());
        model.addAttribute("listKichThuoc", kichThuocRepo.findAll());
        model.addAttribute("listKieuTay", kieuTayRepo.findAll());

        //Lấy ra danh sách chi tiết sản phẩm response
        model.addAttribute("listCTSPRes", ctspRepo.getCTSPRes());

        //Lấy ra danh sách chi tiết hóa đơn
        model.addAttribute("listCTHDByTT", cthdRepo.getAllCTHDByTrangThai(HDCTRepository.ACTIVE));

        //Lấy ra danh sách khách hàng
        model.addAttribute("listKhachHang", khachHangRepo.findAll());
        return "/view/view_viet/trangChu.jsp";
    }

    //Hiển thị chi tiết sản phẩm đã chọn
    @GetMapping("detail-san-pham/{idCTSP}")
    public String detail(
            Model model,
            @PathVariable("idCTSP") String idCTSP
    ) {
        ChiTietSanPham chiTietSanPham = spctRepo.findById(idCTSP).get();
        HinhAnh hinhAnh = hinhAnhRepo.findByIdCTSP(idCTSP);

        //Lấy danh sách màu sắc, kích thước, số lượng của sản phẩm
        List<MauSizeSL> listMauSizeSL = spctRepo.getListMauSizeSL(chiTietSanPham.getIdSanPham().getId());

        //Lấy ra danh sách kích thước theo idSP
        List<KichThuocRespone> listKichThuoc = kichThuocRepo.getListKichThuocByIdSP(chiTietSanPham.getIdSanPham().getId());

        //Lấy danh sách màu sắc theo idSP
        List<MauSacRespone> listMauSac = mauSacRepo.getListMauSacByIdSP(chiTietSanPham.getIdSanPham().getId());

        //Lấy số lượng spct của thằng đầu tiên khi vào trang
        KichThuocRespone kichThuocRespone = listKichThuoc.get(0);
        MauSacRespone mauSacRespone = listMauSac.get(0);

        Integer soLuongTon = spctRepo.getSoLuongCTSPBySanPham_MauSac_KichThuoc(chiTietSanPham.getIdSanPham().getId(), mauSacRespone.getIdMS(), kichThuocRespone.getIdKth());

        model.addAttribute("soLuongTon", soLuongTon);
        model.addAttribute("ctsp", chiTietSanPham);
        model.addAttribute("hinhAnh", hinhAnh);
        model.addAttribute("listKichThuoc", listKichThuoc);
        model.addAttribute("listMauSizeSL", listMauSizeSL);
        model.addAttribute("listMauSac", listMauSac);
        model.addAttribute("soLuong", hdctRepo.findByKHnStt(khachHangRepo.findByIdKH(UserInfor.idKhachHang)));

        //Tính tổng số lượng sản phẩm có trong giỏ hàng
        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
        listGioHang = hdctRepo.getAll(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
        Integer totalSoLuong = 0;
        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
            totalSoLuong += chiTietHoaDon.getSoLuong();
        }
        model.addAttribute("soLuong", totalSoLuong);

        //Lấy ra danh sách khách hàng
        model.addAttribute("listKhachHang", khachHangRepo.findAll());
        return "/view/view_viet/chiTietSanPham.jsp";
    }

}
