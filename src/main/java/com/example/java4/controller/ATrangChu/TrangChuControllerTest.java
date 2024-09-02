//package com.example.java4.controller.ATrangChu;
//
//import com.example.java4.config.Config_Online;
//import com.example.java4.config.UserInfor;
//import com.example.java4.entities.*;
//import com.example.java4.repositories.*;
//import com.example.java4.repositories.viet_repo.CTHDRepository;
//import com.example.java4.repositories.viet_repo.CTSPRepository;
//import com.example.java4.request.req_sang.DiaChiRequest;
//import com.example.java4.request.req_sang.GiaoHangRequest;
//import com.example.java4.request.req_sang.KhachHangRequest;
//import com.example.java4.request.req_tai.KhachHangDTO;
//import com.example.java4.response.*;
//import com.example.java4.service.StorageService;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.io.IOException;
//import java.math.BigDecimal;
//import java.net.URLEncoder;
//import java.nio.charset.StandardCharsets;
//import java.text.SimpleDateFormat;
//import java.time.LocalDateTime;
//import java.util.*;
//
//@Controller
//@RequestMapping("cua-hang")
//public class TrangChuControllerTest {
//    @Autowired
//    SPCTRepository spctRepo;
//    @Autowired
//    HinhAnhRepository hinhAnhRepo;
//    @Autowired
//    KichThuocRepository kichThuocRepo;
//    @Autowired
//    MauSacRepository mauSacRepo;
//    @Autowired
//    KhachHangRepository khachHangRepo;
//    @Autowired
//    HoaDonRepository hoaDonRepo;
//    @Autowired
//    HDCTRepository hdctRepo;
//    @Autowired
//    SanPhamRepository sanPhamRepo;
//    @Autowired
//    KhachHangRepository khachHangRepository;
//    @Autowired
//    GiaoHangRepo giaoHangRepo;
//    @Autowired
//    DiaChiRepository diaChiRepo;
//    @Autowired
//    KhuyenMaiRepository khuyenMaiRepo;
//    @Autowired
//    LichSuHoaDonRepository _lichSuHoaDonRepo;
//    @Autowired
//    private StorageService storageService;
//    @Autowired
//    CTSPRepository ctspRepo;
//    @Autowired
//    KieuTayRepository kieuTayRepo;
//    @Autowired
//    CTHDRepository cthdRepo;
//
//    private List<HoaDon> listHoaDon = new ArrayList<>();
//    private List<ChiTietHoaDon> listHDCT = new ArrayList<>();
//    private List<ChiTietSanPham> listCTSP = new ArrayList<>();
//    private List<SanPham> listSanPham = new ArrayList<>();
//    private List<KhachHang> listKhachHang = new ArrayList<>();
//    private List<GioHangResponse> listGioHang;
//    private List<DiaChi> listDiaChi = new ArrayList<>();
//    private List<KhuyenMai> listKhuyenMai = new ArrayList<>();
//    private List<HoaDonResponse> listHDByIDKH = new ArrayList<>();
//    private String idHoaDon;
//
//    //Test api địa chỉ
//    @GetMapping("apiDiaChi")
//    public String apiDC() {
//        return "/view/view_viet/testApiDiaChi.jsp";
//    }
//
//    @PostMapping("addDC")
//    public void addDiaChi(
//            @RequestParam("tenTinh") String tinh,
//            @RequestParam("tenQuan") String quan,
//            @RequestParam("tenPhuong") String phuong
//    ) {
//        System.out.println("Tỉnh: " + tinh);
//        System.out.println("Quận: " + quan);
//        System.out.println("Phường: " + phuong);
//    }
//
//    @GetMapping("/trang-chu")
//    public String getTrangChu(
//            Model model,
//            @RequestParam("page") Optional<Integer> pageParam
//    ) {
//        if (!model.containsAttribute("khachHangDTO")) {
//            System.out.println("crette dto");
//            model.addAttribute("khachHangDTO", new KhachHangDTO());
//        }
//
//        Pageable pageable = PageRequest.of(pageParam.orElse(0), 9);
//        List<SPCTResponse> listSanPhamRes = ctspRepo.getAllSP(pageable);
//        model.addAttribute("listSanPhamRes", listSanPhamRes);
//        model.addAttribute("soLuong", hdctRepo.findByKHnStt(khachHangRepo.findByIdKH(UserInfor.idKhachHang)));
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        listGioHang = hdctRepo.getAll(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        Integer totalSoLuong = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            totalSoLuong += chiTietHoaDon.getSoLuong();
//        }
//        model.addAttribute("soLuong", totalSoLuong);
//
//        BigDecimal minGiaBan = ctspRepo.minGiaBan();
//        BigDecimal maxGiaBan = ctspRepo.maxGiaBan();
//        model.addAttribute("minGiaBan", minGiaBan);
//        model.addAttribute("maxGiaBan", maxGiaBan);
//
//        model.addAttribute("listMauSac", mauSacRepo.findAll());
//        model.addAttribute("listKichThuoc", kichThuocRepo.findAll());
//        model.addAttribute("listKieuTay", kieuTayRepo.findAll());
//
//        //Lấy ra danh sách chi tiết sản phẩm response
//        model.addAttribute("listCTSPRes", ctspRepo.getCTSPRes());
//
//        //Lấy ra danh sách chi tiết hóa đơn
//        model.addAttribute("listCTHDByTT", cthdRepo.getAllCTHDByTrangThai(HDCTRepository.ACTIVE));
//        return "/view/BanHangOnline/trangChu.jsp";
//    }
//
//    //Hiển thị chi tiết sản phẩm đã chọn
//    @GetMapping("detail-san-pham/{idCTSP}")
//    public String detail(
//            Model model,
//            @PathVariable("idCTSP") String idCTSP
//    ) {
//        ChiTietSanPham chiTietSanPham = spctRepo.findById(idCTSP).get();
//        HinhAnh hinhAnh = hinhAnhRepo.findByIdCTSP(idCTSP);
//
//        //Lấy danh sách màu sắc, kích thước, số lượng của sản phẩm
//        List<MauSizeSL> listMauSizeSL = spctRepo.getListMauSizeSL(chiTietSanPham.getIdSanPham().getId());
//
//        //Lấy ra danh sách kích thước theo idSP
//        List<KichThuocRespone> listKichThuoc = kichThuocRepo.getListKichThuocByIdSP(chiTietSanPham.getIdSanPham().getId());
//
//        //Lấy danh sách màu sắc theo idSP
//        List<MauSacRespone> listMauSac = mauSacRepo.getListMauSacByIdSP(chiTietSanPham.getIdSanPham().getId());
//
//        //Lấy số lượng spct của thằng đầu tiên khi vào trang
//        KichThuocRespone kichThuocRespone = listKichThuoc.get(0);
//        MauSacRespone mauSacRespone = listMauSac.get(0);
//
//        Integer soLuongTon = spctRepo.getSoLuongCTSPBySanPham_MauSac_KichThuoc(chiTietSanPham.getIdSanPham().getId(), mauSacRespone.getIdMS(), kichThuocRespone.getIdKth());
//
//        model.addAttribute("soLuongTon", soLuongTon);
//        model.addAttribute("ctsp", chiTietSanPham);
//        model.addAttribute("hinhAnh", hinhAnh);
//        model.addAttribute("listKichThuoc", listKichThuoc);
//        model.addAttribute("listMauSizeSL", listMauSizeSL);
//        model.addAttribute("listMauSac", listMauSac);
//        model.addAttribute("soLuong", hdctRepo.findByKHnStt(khachHangRepo.findByIdKH(UserInfor.idKhachHang)));
//
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        listGioHang = hdctRepo.getAll(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        Integer totalSoLuong = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            totalSoLuong += chiTietHoaDon.getSoLuong();
//        }
//        model.addAttribute("soLuongGioHang", totalSoLuong);
//        return "/view/BanHangOnline/chiTietSanPham.jsp";
//    }
//
//    //Thêm sản phẩm vào giỏ hàng
//    @PostMapping("add-gio-hang")
//    public String addGioHang(
//            Model model,
//            @RequestParam("idCTSP") String idCTSP,
//            @RequestParam("mauSac") String tenMauSac,
//            @RequestParam("kichThuoc") String tenKichThuoc,
//            @RequestParam("soLuong") Integer soLuong,
//            RedirectAttributes redirectAttributes
//    ) {
//
//        //Bắt khách đăng nhập mới thêm sản phẩm giỏ hàng được
//        if (UserInfor.idKhachHang == null) {     //Nếu ko đăng nhập thì thông báo khách hàng đăng nhập
//            redirectAttributes.addFlashAttribute("error", "Vui lòng đăng nhập trước khi thêm sản phẩm!");
//            return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//        }
//
//        //Lấy ra màu sắc theo tên màu sắc
//        MauSac mauSac = mauSacRepo.findByTen(tenMauSac);
//        //Lấy ra kích thước theo tên kích thước
//        KichThuoc kichThuoc = kichThuocRepo.findByTen(tenKichThuoc);
//        //Lấy ra thông tin khách hàng đăng nhập
//        KhachHang khachHang = khachHangRepo.findByIdKH(UserInfor.idKhachHang);
//        //Lấy ra chi tiết sản phẩm theo idCTSP đang có
//        ChiTietSanPham ctsp = spctRepo.findById(idCTSP).get();
//        //Lấy ra chi tiết sản phẩm đã chọn theo idSP, idMS, idKth
//        ChiTietSanPham chiTietSanPham = spctRepo.findCTSPBySanPham_MauSac_KichThuoc(ctsp.getIdSanPham().getId(), mauSac.getId(), kichThuoc.getId());
//
//        if (khachHang == null) {     //Nếu ko đăng nhập thì lưu vào localStorage
//
//            //Luồng khách hàng chưa đăng nhập thì làm sau
//
//        } else {
//            //Mã tự động hóa đơn
//            int count = hoaDonRepo.countHD();
//            //Kiểm tra số lượng khách thêm giỏ hàng có nhiều hơn số lượng tồn của SPCT không
//            if (soLuong > chiTietSanPham.getSoLuong()) {
//                redirectAttributes.addFlashAttribute("error", "Số lượng sản phẩm còn lại trong kho không đủ!");
//                return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//            }
//
//            if (soLuong < 1) {
//                redirectAttributes.addFlashAttribute("error", "Số lượng sản phẩm không được nhỏ hơn 1!");
//                return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//            }
//
//            //Check không được thêm GH quá 10 sản phẩm
//            if (soLuong > 10) {
//                redirectAttributes.addFlashAttribute("error", "Sản phẩm này chỉ được thêm tối đa là 10!");
//                return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//            }
//
//            //Tìm hoá đơn theo idKH, loaiHD và trạng thái  ->  Check khách hàng đã có hóa đơn chưa
//            HoaDon hoaDonCuaKH = hoaDonRepo.findByidKHAndLoaiHoaDonAndTrangThai(UserInfor.idKhachHang, HoaDonRepository.HOA_DON_ONL, HoaDonRepository.CHO_THANH_TOAN);
//
//            //Check tổng tiền không quá 10tr
//            BigDecimal tongTien = BigDecimal.ZERO;
//            for (ChiTietHoaDon cthd : listHDCT) {
//                tongTien = tongTien.add(cthd.getDonGia().multiply(BigDecimal.valueOf(cthd.getSoLuong())));
//            }
//            BigDecimal tienGioiHan = new BigDecimal(10000000);
//            BigDecimal tienSauKhiThem = chiTietSanPham.getGiaBan().multiply(BigDecimal.valueOf(soLuong));
//            if (tongTien.add(tienSauKhiThem).compareTo(tienGioiHan) > 0) {
//                redirectAttributes.addFlashAttribute("error", "Giới hạn hóa đơn của bạn là 10 triệu!");
//                return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//            }
//
//            //Nếu khách hàng chưa có hóa đơn thì tạo mới hóa đơn -> thêm sản phẩm giỏ hàng
//            if (hoaDonCuaKH == null) {
//                //Lấy ra thông tin khách hàng đăng nhập
//                try {
//                    HoaDon hoaDon = new HoaDon();
//                    hoaDon.setMa("HDMSS" + (count + 111));
//                    hoaDon.setIdKhachHang(khachHang);
//                    hoaDon.setNgayTao(LocalDateTime.now().withNano(0));
//                    hoaDon.setTrangThai(HoaDonRepository.CHO_THANH_TOAN);
//                    hoaDon.setLoaiHoaDon(HoaDonRepository.HOA_DON_ONL);
//                    hoaDonRepo.save(hoaDon);
//
//                    ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
//                    chiTietHoaDon.setIdHoaDon(hoaDon);
//                    chiTietHoaDon.setIdCTSP(chiTietSanPham);
//                    chiTietHoaDon.setSoLuong(soLuong);
//                    chiTietHoaDon.setDonGia(chiTietSanPham.getGiaBan());
//                    chiTietHoaDon.setTrangThai(HDCTRepository.CHUA_THANH_TOAN);
//                    chiTietHoaDon.setNgayTao(LocalDateTime.now().withNano(0));
//                    hdctRepo.save(chiTietHoaDon);
//                    //Lấy ra danh sách chi tiết hóa đơn theo hóa đơn của khách hàng
//                    redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            } else {  //Nếu có hóa đơn rồi thì thêm sản phẩm vào giỏ hàng
//
//                boolean flag = false;
//                String idHDCT = "";
//                //Kiểm tra xem sản phẩm đã có hay chưa
//                for (ChiTietHoaDon cthd : listHDCT) {
//                    if (chiTietSanPham.getId().equals(cthd.getIdCTSP().getId())) {
//                        idHDCT = cthd.getId();
//                        flag = true;
//                        break;
//                    }
//                }
//                List<ChiTietHoaDon> listHDCT = hdctRepo.findHDCTByIdHoaDon(hoaDonCuaKH.getId());
//                //Nếu sản phẩm đã tồn tại trong giỏ hàng thì cộng dồn
//                if (flag) {
//                    try {
//                        ChiTietHoaDon cthd = hdctRepo.findById(idHDCT).get();
//
//                        //Kiểm tra số lượng khách đã thêm(HDCT) có nhiều hơn số lượng tồn của SPCT không
//                        if ((cthd.getSoLuong() + soLuong) > chiTietSanPham.getSoLuong()) {
//                            redirectAttributes.addFlashAttribute("error", "Số lượng sản phẩm còn lại trong kho không đủ!");
//                            return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//                        }
//
//                        //Check HDCT không được quá 10 sản phẩm
//                        if ((cthd.getSoLuong() + soLuong) > 10) {
//                            redirectAttributes.addFlashAttribute("error", "Sản phẩm này chỉ được thêm tối đa 10 chiếc!");
//                            return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//                        }
//
//                        cthd.setSoLuong(cthd.getSoLuong() + soLuong);
//                        cthd.setNgayTao(LocalDateTime.now().withNano(0));
//                        cthd.setDonGia(cthd.getDonGia());
//                        hdctRepo.save(cthd);
//                        redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                } else {   //Check sản phẩm chưa có trong giỏ hàng thì thêm mới
//                    try {
//                        ChiTietHoaDon chiTietHoaDonMoi = new ChiTietHoaDon();
//                        chiTietHoaDonMoi.setIdHoaDon(hoaDonCuaKH);
//                        chiTietHoaDonMoi.setIdCTSP(chiTietSanPham);
//                        chiTietHoaDonMoi.setSoLuong(soLuong);
//                        chiTietHoaDonMoi.setDonGia(chiTietSanPham.getGiaBan());
//                        chiTietHoaDonMoi.setTrangThai(HDCTRepository.CHUA_THANH_TOAN);
//                        hdctRepo.save(chiTietHoaDonMoi);
//                        redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//            }
//        }
//        return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//    }
//
//    @PostMapping("/login")
//    @ResponseBody
//    public ResponseEntity<Map<String, Object>> login(@ModelAttribute("khachHangDTO") KhachHangDTO khachHangDTO,
//                                                     HttpSession session,
//                                                     BindingResult result) {
//        Map<String, Object> response = new HashMap<>();
//        if (result.hasErrors()) {
//            response.put("success", false);
//            response.put("errors", result.getAllErrors());
//            return ResponseEntity.ok(response);
//        }
//
//        KhachHang khachHang = khachHangRepository.findByTaiKhoan(khachHangDTO.getTaiKhoan());
//        if (khachHang != null) {
//            if (khachHang.getMatKhau().equals(khachHangDTO.getMatKhau())) {
//                session.setAttribute("user", khachHang);
//                UserInfor.idKhachHang = khachHang.getId();
//                System.out.println(UserInfor.idKhachHang);
//                response.put("success", true);
//                response.put("successMessage", "Đăng nhập thành công!");
//                response.put("redirectUrl", "/cua-hang/trang-chu");
//                return ResponseEntity.ok(response);
//            } else {
//                response.put("success", false);
//                response.put("errorPassword", "Sai mật khẩu");
//                return ResponseEntity.ok(response);
//            }
//        } else {
//            response.put("success", false);
//            response.put("errorUsername", "Tài khoản không tồn tại");
//            return ResponseEntity.ok(response);
//        }
//    }
//
//    @GetMapping("/logout")
//    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
//        // Xóa thông tin người dùng đã đăng nhập khỏi session
//        session.removeAttribute("user");
//        UserInfor.idKhachHang = null;
//        redirectAttributes.addFlashAttribute("successMessage", "Đăng xuất thành công!");
//        return "redirect:/cua-hang/trang-chu";
//    }
//
//    @PostMapping("/register")
//    public String register(@ModelAttribute("khachHangDTO") KhachHangDTO khachHangDTO,
//                           BindingResult result,
//                           RedirectAttributes redirectAttributes) {
//        if (result.hasErrors()) {
//            redirectAttributes.addFlashAttribute("registerErrors", result.getAllErrors());
//            return "redirect:/cua-hang/trang-chu";
//        }
//        KhachHang existingUser = khachHangRepository.findByTaiKhoan(khachHangDTO.getTaiKhoan());
//        if (existingUser != null) {
//            redirectAttributes.addFlashAttribute("registerErrors", "Username already exists");
//            return "redirect:/cua-hang/trang-chu";
//        }
//        // Save the new user
//        KhachHang newUser = new KhachHang();
//        newUser.setTaiKhoan(khachHangDTO.getTaiKhoan());
//        newUser.setEmail(khachHangDTO.getEmail());
//        newUser.setSdt(khachHangDTO.getSdt());
//        newUser.setMatKhau(khachHangDTO.getMatKhau());
//        newUser.setNgayTao(LocalDateTime.now());
//        newUser.setTrangThai(khachHangRepository.ACTIVE);
//        khachHangRepository.save(newUser);
//        redirectAttributes.addFlashAttribute("successMessage", "Đăng ký thành công!");
//        return "redirect:/cua-hang/trang-chu";
//    }
//
//
//    @GetMapping("/gio-hang")
//    public String gioHang(Model model) {
//        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        listGioHang = hdctRepo.getAll(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        listCTSP = spctRepo.findAll();
//        listSanPham = sanPhamRepo.findAll();
//        DiaChi diaChi = diaChiRepo.getDiaChiByIdKhachHangAndTrangThai(UserInfor.idKhachHang, DiaChiRepository.MAC_DINH);
//        listDiaChi = diaChiRepo.getAllDiaChi(UserInfor.idKhachHang);
//        listKhuyenMai = khuyenMaiRepo.findAll();
//        HoaDon hoaDon = hoaDonRepo.findByIdKhachHang(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        boolean check = false;
//        if (listHDCT.isEmpty()) {
//            //Trong giỏ hàng không có sản phẩm sẽ hiển thị thông báo
//            check = true;
//            model.addAttribute("check", check);
//            return "/view/BanHangOnline/gioHang.jsp";
//        } else {
//            //Trong giỏ hàng có sản phẩm sẽ hiển thị danh sách
//            check = false;
//            model.addAttribute("listGioHang", listGioHang);
//            model.addAttribute("listCTSP", listCTSP);
//            model.addAttribute("listSanPham", listSanPham);
//            model.addAttribute("diaChi", diaChi);
//            model.addAttribute("listDiaChi", listDiaChi);
//            model.addAttribute("listKhuyenMai", listKhuyenMai);
//            model.addAttribute("hoaDon", hoaDon);
//            model.addAttribute("check", check);
//        }
//
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        Integer totalSoLuong = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            totalSoLuong += chiTietHoaDon.getSoLuong();
//        }
//        model.addAttribute("soLuongGioHang", totalSoLuong);
//
//        //Tính tổng giá tiền của giỏ hàng
//        BigDecimal tongTienBigDecimal = new BigDecimal(0.0);
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            BigDecimal soLuongDecimal = new BigDecimal(chiTietHoaDon.getSoLuong());
//            tongTienBigDecimal = tongTienBigDecimal.add(chiTietHoaDon.getDonGia().multiply(soLuongDecimal));
//        }
//        model.addAttribute("tongTien", tongTienBigDecimal);
//
//        return "/view/BanHangOnline/gioHang.jsp";
//    }
//
//    @GetMapping("/dia-chi")
//    public String getlistDiaChi(Model model) {
//        listDiaChi = diaChiRepo.getAllDiaChi(UserInfor.idKhachHang);
//        model.addAttribute("listDiaChi", listDiaChi);
//
//        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        Integer totalSoLuong = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            totalSoLuong += chiTietHoaDon.getSoLuong();
//        }
//        model.addAttribute("soLuongGioHang", totalSoLuong);
//        return "/view/BanHangOnline/diaChi.jsp";
//    }
//
//    @PostMapping("/them-dia-chi")
//    public String themDiaChiByidKH(DiaChiRequest request, @RequestParam("tenTinhThanh") String idTinh,
//                                   @RequestParam("tenQuanHuyen") String idQuan,
//                                   @RequestParam("tenPhuongXa") String idPhuong,
//                                   @RequestParam("idTinhThanh") Integer idTinhThanh,
//                                   @RequestParam("idQuanHuyen") Integer idQuanHuyen,
//                                   @RequestParam("idPX") String idPX,
//                                   RedirectAttributes redirectAttributes) {
//        KhachHang khachHang = khachHangRepo.findByIdKH(UserInfor.idKhachHang);
//        listDiaChi = diaChiRepo.getAllDiaChi(UserInfor.idKhachHang);
//
//        DiaChi diaChi = new DiaChi();
//        diaChi.setTenNguoiNhan(request.getTenNguoiNhan());
//        diaChi.setSdtNguoiNhan(request.getSdtNguoiNhan());
//        diaChi.setDiaChiChiTiet(request.getDiaChiChiTiet());
//        diaChi.setIdTinhThanh(idTinh);
//        diaChi.setIdQuanHuyen(idQuan);
//        diaChi.setIdPhuongXa(idPhuong);
//        diaChi.setIdKhachHang(khachHang);
//        diaChi.setIdT(idTinhThanh);
//        diaChi.setIdQH(idQuanHuyen);
//        diaChi.setIdPX(idPX);
//
//        if (listDiaChi != null && !listDiaChi.isEmpty()) {
//            diaChi.setTrangThai(DiaChiRepository.TUY_CHON);
//        } else {
//            diaChi.setTrangThai(DiaChiRepository.MAC_DINH);
//        }
//        diaChiRepo.save(diaChi);
//        redirectAttributes.addFlashAttribute("successAccount", "Thêm địa chỉ thành công");
//        return "redirect:/cua-hang/dia-chi";
//    }
//
//    @PostMapping("/cap-nhat-dia-chi/{id}")
//    public String suaDiaChiByidKH(DiaChiRequest request, @PathVariable("id") String id, @RequestParam("tenTinh") String idTinh,
//                                  @RequestParam("tenQuan") String idQuan,
//                                  @RequestParam("tenPhuong") String idPhuong,
//                                  @RequestParam("idTinh") Integer idT,
//                                  @RequestParam("idQuan") Integer idQH,
//                                  @RequestParam("idPhuong") String idPX,
//                                  RedirectAttributes redirectAttributes) {
//        DiaChi diaChi = diaChiRepo.findById(id).get();
//        System.out.println(id);
//        System.out.println(idTinh);
//        System.out.println(idQuan);
//        System.out.println(idPhuong);
//        diaChi.setTenNguoiNhan(request.getTenNguoiNhan());
//        diaChi.setSdtNguoiNhan(request.getSdtNguoiNhan());
//        diaChi.setDiaChiChiTiet(request.getDiaChiChiTiet());
//        diaChi.setIdTinhThanh(idTinh);
//        diaChi.setIdQuanHuyen(idQuan);
//        diaChi.setIdPhuongXa(idPhuong);
//        diaChi.setIdT(idT);
//        diaChi.setIdQH(idQH);
//        diaChi.setIdPX(idPX);
//
//        diaChiRepo.save(diaChi);
//        redirectAttributes.addFlashAttribute("successAccount", "Cập nhật địa chỉ thành công");
//        return "redirect:/cua-hang/dia-chi";
//    }
//
//    @GetMapping("/xoa-dia-chi/{id}")
//    public String xoaDiaChi(@PathVariable("id") String id, RedirectAttributes redirectAttributes) {
//        DiaChi diaChi = diaChiRepo.findDiaChiByID(id);
//        diaChiRepo.delete(diaChi);
//        redirectAttributes.addFlashAttribute("successAccount", "Xóa địa chỉ thành công");
//
//        return "redirect:/cua-hang/dia-chi";
//    }
//
//    //Giảm số lượng sản phẩm có trong giỏ hàng đi 1
//    @GetMapping("/giam-so-luong/{idHDCT}")
//    public String giamSoLuong(@PathVariable("idHDCT") String idHDCT, RedirectAttributes redirectAttributes) {
//        ChiTietHoaDon chiTietHoaDon = hdctRepo.findById(idHDCT).get();
//        //số lượng sản phẩm thấp nhất = 1
//        if (chiTietHoaDon.getSoLuong() <= 1) {
//            chiTietHoaDon.setSoLuong(1);
//            hdctRepo.save(chiTietHoaDon);
//            redirectAttributes.addFlashAttribute("error", "Số lượng nhỏ nhất là 1");
//        } else {
//            chiTietHoaDon.setSoLuong(chiTietHoaDon.getSoLuong() - 1);
//            hdctRepo.save(chiTietHoaDon);
//        }
//        return "redirect:/cua-hang/gio-hang";
//    }
//
//    //Tăng số lượng sản phẩm có trong giỏ hàng lên 1
//    @GetMapping("/tang-so-luong/{idHDCT}")
//    public String tangSoLuong(Model model, @PathVariable("idHDCT") String idHDCT, RedirectAttributes redirectAttributes) {
//        ChiTietHoaDon chiTietHoaDon = hdctRepo.findById(idHDCT).get();
//
//        // Tính tổng giá tiền của giỏ hàng hiện tại
//        BigDecimal tongTienBigDecimal = BigDecimal.ZERO;
//        for (ChiTietHoaDon cthd : listHDCT) {
//            BigDecimal soLuongDecimal = new BigDecimal(cthd.getSoLuong());
//            tongTienBigDecimal = tongTienBigDecimal.add(cthd.getDonGia().multiply(soLuongDecimal));
//        }
//
//        // Đặt giới hạn tổng tiền là 10 triệu
//        BigDecimal gioiHanTongTien = new BigDecimal(10000000);
//        // Tính tổng giá tiền sau khi thêm sản phẩm mới
//        BigDecimal tongTienSauKhiThem = tongTienBigDecimal.add(chiTietHoaDon.getDonGia());
//        // Nếu tổng tiền lớn hơn hoặc bằng 10 triệu, báo lỗi
//        if (tongTienSauKhiThem.compareTo(gioiHanTongTien) > 0) {
//            redirectAttributes.addFlashAttribute("error", "Giỏ hàng có thể mua tối đa mỗi hóa đơn 10tr, nếu cần mua hơn liên hệ nhân viên");
//        } else {
//            // Check số lượng của giỏ hàng với số lượng sản phẩm
//            Integer soLuong = hdctRepo.getSoLuong_SPCTByIdHDCT(idHDCT);
//            if (chiTietHoaDon.getSoLuong() >= soLuong) {
//                redirectAttributes.addFlashAttribute("error", "Số lượng tồn không đủ");
//                // Số lượng sản phẩm cao nhất = 10
//            } else if (chiTietHoaDon.getSoLuong() >= 10) {
//                chiTietHoaDon.setSoLuong(chiTietHoaDon.getSoLuong());
//                hdctRepo.save(chiTietHoaDon);
//                redirectAttributes.addFlashAttribute("error", "Số lượng tối đa 10");
//            } else {
//                chiTietHoaDon.setSoLuong(chiTietHoaDon.getSoLuong() + 1);
//                hdctRepo.save(chiTietHoaDon);
//            }
//        }
//
//        return "redirect:/cua-hang/gio-hang";
//    }
//
//    //Xóa sản phẩm ra khỏi giỏ hàng
//    @GetMapping("/delete/{idHDCT}")
//    public String deleteIDSPCT(@PathVariable String idHDCT, RedirectAttributes redirectAttributes) {
//        ChiTietHoaDon chiTietHoaDon = hdctRepo.findById(idHDCT).get();
//        try {
//            hdctRepo.delete(chiTietHoaDon);
//            redirectAttributes.addFlashAttribute("successMessage", "Xóa sản phẩm thành công");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "redirect:/cua-hang/gio-hang";
//    }
//
//    @PostMapping("/thanh-toan")
//    public String thanhToan(GiaoHangRequest request, @RequestParam("phuongThucThanhToan") Integer phuongThucThanhToan, @RequestParam("tenTinh") String idTinhThanh,
//                            @RequestParam("tenQuan") String idQuanHuyen, @RequestParam("tenPhuong") String idPhuongXa,
//                            RedirectAttributes redirectAttributes) {
//
//        if (phuongThucThanhToan == 0) {
//            BigDecimal tongTienBigDecimal = BigDecimal.ZERO;
//            for (ChiTietHoaDon cthd : listHDCT) {
//                BigDecimal soLuongDecimal = new BigDecimal(cthd.getSoLuong());
//                tongTienBigDecimal = tongTienBigDecimal.add(cthd.getDonGia().multiply(soLuongDecimal));
//            }
//            HoaDon hoaDon = hoaDonRepo.findByIdKhachHang(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//            hoaDon.setPhuongThucThanhToan(phuongThucThanhToan);
//            hoaDon.setNgayThanhToan(LocalDateTime.now().withNano(0));
//
//            // Trừ đi số tiền giảm giá nếu có
//            BigDecimal soTienGiam = hoaDon.getIdKhuyenMai() != null ? hoaDon.getIdKhuyenMai().getSoTienGiam() : BigDecimal.ZERO;
//            BigDecimal tongThanhToan = tongTienBigDecimal.subtract(soTienGiam);
//
//            if (tongThanhToan.compareTo(soTienGiam) > 0) {
//                hoaDon.setTongTien(tongThanhToan);
//            } else {
//                hoaDon.setTongTien(BigDecimal.ZERO);
//            }
//            hoaDon.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
//            hoaDon.setLoaiHoaDon(HoaDonRepository.HOA_DON_ONL);
//            hoaDon.setNgayThanhToan(LocalDateTime.now().withNano(0));
//            hoaDonRepo.save(hoaDon);
//
//            GiaoHang giaoHang = new GiaoHang();
//            giaoHang.setIdHoaDon(hoaDon);
//            giaoHang.setTenNguoiNhan(request.getTenNguoiNhan());
//            giaoHang.setSdtNguoiNhan(request.getSdtNguoiNhan());
//            giaoHang.setDiaChiChiTiet(request.getDiaChiChiTiet());
//            giaoHang.setIdTinhThanh(idTinhThanh);
//            giaoHang.setIdQuanHuyen(idQuanHuyen);
//            giaoHang.setIdPhuongXa(idPhuongXa);
//            giaoHang.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
//            giaoHang.setGhiChu(request.getGhiChu());
//            giaoHangRepo.save(giaoHang);
//
////            redirectAttributes.addFlashAttribute("successMessage", "Đặt hàng thành công");
//            createLichSuHoaDon(hoaDon);
//            return "redirect:/cua-hang/don-mua";
//        } else {
//            BigDecimal tongTienBigDecimal = BigDecimal.ZERO;
//            for (ChiTietHoaDon cthd : listHDCT) {
//                BigDecimal soLuongDecimal = new BigDecimal(cthd.getSoLuong());
//                tongTienBigDecimal = tongTienBigDecimal.add(cthd.getDonGia().multiply(soLuongDecimal));
//            }
//            HoaDon hoaDon = hoaDonRepo.findByIdKhachHang(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//            hoaDon.setPhuongThucThanhToan(phuongThucThanhToan);
//            hoaDonRepo.save(hoaDon);
//
//            // Trừ đi số tiền giảm giá nếu có
//            BigDecimal soTienGiam = hoaDon.getIdKhuyenMai() != null ? hoaDon.getIdKhuyenMai().getSoTienGiam() : BigDecimal.ZERO;
//            BigDecimal tongThanhToan = tongTienBigDecimal.subtract(soTienGiam);
//
//            if (giaoHangRepo.findByIdHoaDon(hoaDon.getId()) == 0) {
//                GiaoHang giaoHang = new GiaoHang();
//                giaoHang.setIdHoaDon(hoaDon);
//                giaoHang.setTenNguoiNhan(request.getTenNguoiNhan());
//                giaoHang.setSdtNguoiNhan(request.getSdtNguoiNhan());
//                giaoHang.setDiaChiChiTiet(request.getDiaChiChiTiet());
//                giaoHang.setIdTinhThanh(idTinhThanh);
//                giaoHang.setIdQuanHuyen(idQuanHuyen);
//                giaoHang.setIdPhuongXa(idPhuongXa);
//                giaoHang.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
//                giaoHang.setGhiChu(request.getGhiChu());
//                giaoHangRepo.save(giaoHang);
//            }
//
//            return "redirect:/cua-hang/pay/" + tongThanhToan;
//        }
//    }
//
//    @PostMapping("/khuyen-mai/{id}")
//    public String findKhuyenMai(@PathVariable String id) {
//        HoaDon hoaDon = hoaDonRepo.findByIdKhachHang(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        KhuyenMai khuyenMai = khuyenMaiRepo.findByIdKM(id);
//        khuyenMai.setId(id);
//        hoaDon.setIdKhuyenMai(khuyenMai);
//        hoaDonRepo.save(hoaDon);
//        if (khuyenMai.getId().equals(id)) {
//            khuyenMai.setSoLuong(khuyenMai.getSoLuong() - 1);
//            khuyenMaiRepo.save(khuyenMai);
//        }
//
//        return "redirect:/cua-hang/gio-hang";
//    }
//
//    @GetMapping("/xoa-khuyen-mai/{id}")
//    public String xoaKhuyenMai(@PathVariable("id") String id, RedirectAttributes redirectAttributes) {
//        KhuyenMai khuyenMai = khuyenMaiRepo.findByIdKM(id);
//        if (khuyenMai != null) {
//            khuyenMai.setSoLuong(khuyenMai.getSoLuong() + 1);
//            khuyenMaiRepo.save(khuyenMai);
//
//            HoaDon hoaDon = hoaDonRepo.findByIdKhachHang(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//            hoaDon.setIdKhuyenMai(null);
//            hoaDonRepo.save(hoaDon);
//        }
//
//        return "redirect:/cua-hang/gio-hang";
//    }
//
//    @GetMapping("/don-mua")
//    public String hỉenThi(Model model, @RequestParam(value = "page", defaultValue = "0") int page) {
//        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        listGioHang = hdctRepo.getAll(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//
//        //Số lượng hóa đơn theo trạng thái
//        int countAllHoaDon = hoaDonRepo.countByTrangThai(UserInfor.idKhachHang);
//        int countHDByChoXacNhan = hoaDonRepo.countByHoaDonByTrangThai(UserInfor.idKhachHang, HoaDonRepository.CHO_XAC_NHAN);
//        int countHDByChoGiaoHang = hoaDonRepo.countByHoaDonByTrangThai(UserInfor.idKhachHang, HoaDonRepository.CHO_GIAO_HANG);
//        int countHDByDangGiaoHang = hoaDonRepo.countByHoaDonByTrangThai(UserInfor.idKhachHang, HoaDonRepository.DANG_GIAO_HANG);
//        int countHDByHoanThanh = hoaDonRepo.countByHoaDonByTrangThai(UserInfor.idKhachHang, HoaDonRepository.DA_HOAN_THANH);
//        int countHDDaHuy = hoaDonRepo.countByHoaDonByTrangThai(UserInfor.idKhachHang, HoaDonRepository.DA_HUY);
//
//        model.addAttribute("countAllHoaDon", countAllHoaDon);
//        model.addAttribute("countHDByChoXacNhan", countHDByChoXacNhan);
//        model.addAttribute("countHDByChoGiaoHang", countHDByChoGiaoHang);
//        model.addAttribute("countHDByDangGiaoHang", countHDByDangGiaoHang);
//        model.addAttribute("countHDByHoanThanh", countHDByHoanThanh);
//        model.addAttribute("countHDDaHuy", countHDDaHuy);
//
//
//        Pageable pageable = PageRequest.of(page, 5);
//        Page<HoaDon> listHoaDon = hoaDonRepo.getHoaDonByIDKHA(UserInfor.idKhachHang, pageable);
//        model.addAttribute("listHD", listHoaDon);
//        Page<HoaDon> listHDByChoXacNhan = hoaDonRepo.getHoaDonByIDKHAndTrangThai(UserInfor.idKhachHang, HoaDonRepository.CHO_XAC_NHAN, pageable);
//        model.addAttribute("listHDByChoXacNhan", listHDByChoXacNhan);
//        Page<HoaDon> listHDByChoGiaoHang = hoaDonRepo.getHoaDonByIDKHAndTrangThai(UserInfor.idKhachHang, HoaDonRepository.CHO_GIAO_HANG, pageable);
//        model.addAttribute("listHDByChoGiaoHang", listHDByChoGiaoHang);
//        Page<HoaDon> listHDByDangGiaoHang = hoaDonRepo.getHoaDonByIDKHAndTrangThai(UserInfor.idKhachHang, HoaDonRepository.DANG_GIAO_HANG, pageable);
//        model.addAttribute("listHDByDangGiaoHang", listHDByDangGiaoHang);
//        Page<HoaDon> listHDByHoanThanh = hoaDonRepo.getHoaDonByIDKHAndTrangThai(UserInfor.idKhachHang, HoaDonRepository.DA_HOAN_THANH, pageable);
//        model.addAttribute("listHDByHoanThanh", listHDByHoanThanh);
//        Page<HoaDon> listHDDaHuy = hoaDonRepo.getHoaDonByIDKHAndTrangThai(UserInfor.idKhachHang, HoaDonRepository.DA_HUY, pageable);
//        model.addAttribute("listHDDaHuy", listHDDaHuy);
//
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        Integer totalSoLuong = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            totalSoLuong += chiTietHoaDon.getSoLuong();
//        }
//        model.addAttribute("soLuongGioHang", totalSoLuong);
//        return "/view/BanHangOnline/donMua.jsp";
//    }
//
//    List<ChiTietHoaDon> chiTietHoaDonList = new ArrayList<>();
//
//    @GetMapping("don-mua/{idHD}")
//    public String detailDonMua(Model model, @PathVariable("idHD") String idHD) {
//
//        //Tổng tiền của đơn hàng
//        chiTietHoaDonList = hdctRepo.tongTienHD(UserInfor.idKhachHang, idHD);
//        BigDecimal tongTienBigDecimal = new BigDecimal(0.0);
//        for (ChiTietHoaDon chiTietHoaDon : chiTietHoaDonList) {
//            BigDecimal soLuongDecimal = new BigDecimal(chiTietHoaDon.getSoLuong());
//            tongTienBigDecimal = tongTienBigDecimal.add(chiTietHoaDon.getDonGia().multiply(soLuongDecimal));
//        }
//        model.addAttribute("tongTien", tongTienBigDecimal);
//
//        listGioHang = hdctRepo.getAll(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        List<HoaDonChiTietResponse> listHoaDonChiTiet = hdctRepo.getListHDbyIdKH(UserInfor.idKhachHang, idHD);
//        List<GiaoHang> giaoHang = giaoHangRepo.getListGiaoHangByIdKHAndidHD(UserInfor.idKhachHang, idHD);
//        List<HoaDon> hoaDon = hoaDonRepo.getListHDbyIDKHAndIDHD(UserInfor.idKhachHang, idHD);
//
//        model.addAttribute("listHDCT", listHoaDonChiTiet);
//        model.addAttribute("giaoHang", giaoHang);
//        model.addAttribute("hoaDon", hoaDon);
//
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        Integer totalSoLuong = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            totalSoLuong += chiTietHoaDon.getSoLuong();
//        }
//        model.addAttribute("soLuongGioHang", totalSoLuong);
//        return "/view/BanHangOnline/detailDonMua.jsp";
//    }
//
//    //     Thêm lịch sử hoa don
//    public void createLichSuHoaDon(HoaDon hoaDon) {
//        LichSuHoaDon lichSuHoaDon = new LichSuHoaDon();
//        lichSuHoaDon.setIdHoaDon(hoaDon);
//        lichSuHoaDon.setNgayTao(LocalDateTime.now());
//        lichSuHoaDon.setNgayCapNhat(LocalDateTime.now());
//        lichSuHoaDon.setTrangThai(hoaDon.getTrangThai());
//        if (hoaDon.getPhuongThucThanhToan() == HoaDonRepository.TIEN_MAT) {
//            lichSuHoaDon.setGhiChu("Chưa thanh toán");
//        } else {
//            lichSuHoaDon.setGhiChu("Đã thanh toán");
//        }
//
//        _lichSuHoaDonRepo.save(lichSuHoaDon);
//    }
//
//    @GetMapping("/quan-ly-tai-khoan")
//    public String viewAccount(Model model, HttpSession session) {
//        KhachHang user = (KhachHang) session.getAttribute("user");
//        if (user != null) {
//            KhachHang updatedUser = khachHangRepository.findByIdKH(user.getId());
//            if (updatedUser != null) {
//                model.addAttribute("user", updatedUser);
//            }
//        }
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        Integer totalSoLuong = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            totalSoLuong += chiTietHoaDon.getSoLuong();
//        }
//        model.addAttribute("soLuongGioHang", totalSoLuong);
//        return "/view/BanHangOnline/quan_ly_tai_khoan.jsp";
//    }
//
//    @PostMapping("/cap-nhat-thong-tin")
//    public String updateProfile(@ModelAttribute("user") KhachHangRequest request, BindingResult result,
//                                @RequestParam("profileImage") MultipartFile file, RedirectAttributes redirectAttributes,
//                                HttpSession session) {
//        if (result.hasErrors()) {
//            redirectAttributes.addFlashAttribute("updateErrors", result.getAllErrors());
//            return "redirect:/cua-hang/quan-ly-tai-khoan";
//        }
//        KhachHang user = khachHangRepository.findByIdKH(UserInfor.idKhachHang);
//        if (user != null) {
//            user.setHoTen(request.getHoTen());
//            user.setEmail(request.getEmail());
//            user.setSdt(request.getSdt());
//            user.setGioiTinh(request.getGioiTinh());
//            user.setNgaySinh(request.getNgaySinh());
//            user.setNgayTao(LocalDateTime.now());
//            user.setNgaySua(LocalDateTime.now());
//            user.setTrangThai(khachHangRepository.ACTIVE);
//
//            // Lưu hình ảnh
//            if (!file.isEmpty()) {
//                try {
//                    storageService.store(file);
//                    user.setAnhDaiDien(file.getOriginalFilename());
//                } catch (Exception e) {
//                    e.printStackTrace();
//                    // Xử lý lỗi khi lưu file
//                    redirectAttributes.addFlashAttribute("errorMessage", "Lỗi khi lưu hình ảnh");
//                    return "redirect:/cua-hang/quan-ly-tai-khoan";
//                }
//            }
//            khachHangRepository.save(user);
//            redirectAttributes.addFlashAttribute("successAccount", "Cập nhật thông tin thành công!");
//            // Cập nhật lại thông tin mới của user
//            redirectAttributes.addFlashAttribute("user", user);
//            session.setAttribute("user", user);
//        } else {
//            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy người dùng!");
//        }
//        return "redirect:/cua-hang/quan-ly-tai-khoan";
//    }
//
//
//    // Tích hợp VNPay
//    @GetMapping("/pay/{tongTien}")
//    public void redirectToPaymentGateway(
//            @RequestParam(value = "bankcode", required = false) String bankCode,
//            @PathVariable Long tongTien,
//            HttpServletResponse response
//    ) throws IOException {
//
//        String vnp_Version = "2.1.0";
//        String vnp_Command = "pay";
//        String orderType = "other";
//        long amount = tongTien * 100;
//
//        String vnp_TxnRef = hoaDonRepo.getMaHoaDon(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//
//        String vnp_IpAddr = "127.0.0.1";
//
//        String vnp_TmnCode = Config_Online.vnp_TmnCode;
//
//        Map<String, String> vnp_Params = new HashMap<>();
//        vnp_Params.put("vnp_Version", vnp_Version);
//        vnp_Params.put("vnp_Command", vnp_Command);
//        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
//        vnp_Params.put("vnp_Amount", String.valueOf(amount));
//        vnp_Params.put("vnp_CurrCode", "VND");
//
//        if (bankCode != null && !bankCode.isEmpty()) {
//            vnp_Params.put("vnp_BankCode", bankCode);
//        }
//
//        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
//        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
//        vnp_Params.put("vnp_OrderType", orderType);
//
//        vnp_Params.put("vnp_Locale", "vn");
//        vnp_Params.put("vnp_ReturnUrl", Config_Online.vnp_ReturnUrl);
//        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
//
//        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//        String vnp_CreateDate = formatter.format(cld.getTime());
//        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
//
//        cld.add(Calendar.MINUTE, 15);
//        String vnp_ExpireDate = formatter.format(cld.getTime());
//        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
//
//        List fieldNames = new ArrayList(vnp_Params.keySet());
//        Collections.sort(fieldNames);
//        StringBuilder hashData = new StringBuilder();
//        StringBuilder query = new StringBuilder();
//        Iterator itr = fieldNames.iterator();
//        while (itr.hasNext()) {
//            String fieldName = (String) itr.next();
//            String fieldValue = (String) vnp_Params.get(fieldName);
//            if ((fieldValue != null) && (fieldValue.length() > 0)) {
//                //Build hash data
//                hashData.append(fieldName);
//                hashData.append('=');
//                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
//                //Build query
//                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
//                query.append('=');
//                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
//                if (itr.hasNext()) {
//                    query.append('&');
//                    hashData.append('&');
//                }
//            }
//        }
//        String queryUrl = query.toString();
//        String vnp_SecureHash = Config_Online.hmacSHA512(Config_Online.secretKey, hashData.toString());
//        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
//        String paymentUrl = Config_Online.vnp_PayUrl + "?" + queryUrl;
//
//        String redirectUrl = String.format(
//                "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=%s&vnp_Command=%s&vnp_CreateDate=%s&vnp_CurrCode=%s&vnp_ExpireDate=%s&vnp_IpAddr=%s&vnp_Locale=%s&vnp_OrderInfo=%s&vnp_OrderType=%s&vnp_ReturnUrl=%s&vnp_TmnCode=%s&vnp_TxnRef=%s&vnp_Version=%s&vnp_SecureHash=%s",
//                String.valueOf(amount), vnp_Command, vnp_CreateDate, "VND", vnp_ExpireDate, vnp_IpAddr, "vn", "Thanh toan don hang:" + vnp_TxnRef, "other", Config_Online.vnp_ReturnUrl, vnp_TmnCode, vnp_TxnRef, vnp_Version, vnp_SecureHash
//        );
//
//        response.sendRedirect(redirectUrl);
//    }
//
//    @GetMapping("/payment-info")
//    public String transaction(
//            @RequestParam(value = "vnp_Amount") String amount,
//            @RequestParam(value = "vnp_BankCode") String bankCode,
//            @RequestParam(value = "vnp_ResponseCode") String responseCode,
//            @RequestParam(value = "vnp_OrderInfo") String orderInfo,
//            @RequestParam(value = "vnp_CardType") String cardType, Model model
//    ) {
//
//        int tt = Integer.valueOf(amount) / 100;
//        System.out.println("----------------------------------" + tt);
//        System.out.println("----------------------------------" + bankCode);
//        System.out.println("----------------------------------" + responseCode);
//        System.out.println("----------------------------------" + orderInfo);
//        System.out.println("----------------------------------" + cardType);
//
//        if (responseCode.equals("00")) {
//            model.addAttribute("message", "Thanh toán thành công");
//        } else {
//            model.addAttribute("message", "Thanh toán thất bại");
//        }
//
//        LocalDateTime now = LocalDateTime.now();
//        BigDecimal tongTienBigDecimal = BigDecimal.ZERO;
//        for (ChiTietHoaDon cthd : listHDCT) {
//            BigDecimal soLuongDecimal = new BigDecimal(cthd.getSoLuong());
//            tongTienBigDecimal = tongTienBigDecimal.add(cthd.getDonGia().multiply(soLuongDecimal));
//        }
//        HoaDon hoaDon = hoaDonRepo.findByIdKhachHang(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        hoaDon.setNgayThanhToan(LocalDateTime.now().withNano(0));
//
//        // Trừ đi số tiền giảm giá nếu có
//        BigDecimal soTienGiam = hoaDon.getIdKhuyenMai() != null ? hoaDon.getIdKhuyenMai().getSoTienGiam() : BigDecimal.ZERO;
//        BigDecimal tongThanhToan = tongTienBigDecimal.subtract(soTienGiam);
//
//        hoaDon.setTongTien(tongThanhToan);
//        hoaDon.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
//        hoaDon.setLoaiHoaDon(HoaDonRepository.HOA_DON_ONL);
//        hoaDon.setNgayThanhToan(LocalDateTime.now().withNano(0));
//        hoaDonRepo.save(hoaDon);
//
//
//        model.addAttribute("amount", amount);
//        model.addAttribute("ngayTao", now);
//        model.addAttribute("maHD", orderInfo);
//
//        return "redirect:/cua-hang/don-mua/" + hoaDon.getId();
//    }
//
//}
//
