//package com.example.java4.controller.controller_sang;
//
//import com.example.java4.config.UserInfor;
//import com.example.java4.entities.*;
//import com.example.java4.repositories.*;
//import com.example.java4.repositories.repo_tai.IHoaDonRepository;
//import com.example.java4.request.req_sang.DiaChiRequest;
//import com.example.java4.request.req_sang.GiaoHangRequest;
//import com.example.java4.request.req_tai.KhachHangDTO;
//import com.example.java4.response.GioHangResponse;
//import com.example.java4.response.KichThuocRespone;
//import com.example.java4.response.MauSacRespone;
//import com.example.java4.response.MauSizeSL;
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
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.math.BigDecimal;
//import java.time.LocalDateTime;
//import java.util.*;
//
//@Controller
//@RequestMapping("cua-hang")
//public class TrangChuController_Sang {
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
//    private List<ChiTietHoaDon> listHDCT = new ArrayList<>();
//    private List<ChiTietSanPham> listCTSP= new ArrayList<>();
//    private List<SanPham> listSanPham = new ArrayList<>();
//    private List<KhachHang> listKhachHang = new ArrayList<>();
//    private List<GioHangResponse> listGioHang;
//    private List<DiaChi> listDiaChi = new ArrayList<>();
//    //Test api địa chỉ
//    @GetMapping("apiDiaChi")
//    public String apiDC(){
//        return "/view/view_viet/testApiDiaChi.jsp";
//    }
//
//    @PostMapping("addDC")
//    public void addDiaChi(
//            @RequestParam("tenTinh") String tinh,
//            @RequestParam("tenQuan") String quan,
//            @RequestParam("tenPhuong") String phuong
//    ){
//        System.out.println("Tỉnh: "+tinh);
//        System.out.println("Quận: "+quan);
//        System.out.println("Phường: "+phuong);
//    }
//
//    //Bán onl
//    @GetMapping("/trang-chu")
//    public String getTrangChu(
//            Model model,
//            @RequestParam("page")Optional<Integer> pageParam
//    ){
//        if (!model.containsAttribute("khachHangDTO")) {
//            System.out.println("crette dto");
//            model.addAttribute("khachHangDTO", new KhachHangDTO());
//        }
//        Pageable pageable = PageRequest.of(pageParam.orElse(0), 9);
//        Page pageSP = spctRepo.getAllSP(pageable);
//        model.addAttribute("pageSP", pageSP);
//        model.addAttribute("soLuong", hdctRepo.findByKHnStt(khachHangRepo.findByIdKH(UserInfor.idKhachHang)));
//        System.out.println("================================test user info :"+UserInfor.idKhachHang);
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        listGioHang = hdctRepo.getAll(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        Integer totalSoLuong = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            totalSoLuong += chiTietHoaDon.getSoLuong();
//        }
//        model.addAttribute("soLuong", totalSoLuong);
//        return "/view/BanHangOnline/trangChu.jsp";
//    }
//
//    //Hiển thị chi tiết sản phẩm đã chọn
//    @GetMapping("detail-san-pham/{idCTSP}")
//    public String detail(
//            Model model,
//            @PathVariable("idCTSP") String idCTSP
//    ){
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
//        model.addAttribute("soLuong",hdctRepo.findByKHnStt(khachHangRepo.findByIdKH(UserInfor.idKhachHang)));
//
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        listGioHang = hdctRepo.getAll(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//        Integer totalSoLuong = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            totalSoLuong += chiTietHoaDon.getSoLuong();
//        }
//        model.addAttribute("soLuong", totalSoLuong);
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
//            return "redirect:/cua_hang/detail-san-pham/" + idCTSP;
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
//        //Mã tự động hóa đơn
//        int count = hoaDonRepo.countHD();
//        //Kiểm tra số lượng khách thêm giỏ hàng có nhiều hơn số lượng tồn của SPCT không
//        if (soLuong > chiTietSanPham.getSoLuong()) {
//            redirectAttributes.addFlashAttribute("error", "Số lượng sản phẩm còn lại trong kho không đủ!");
//            return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//        }
//
//        //Check không được thêm GH quá 10 sản phẩm
//        if (soLuong > 10) {
//            redirectAttributes.addFlashAttribute("error", "Sản phẩm này chỉ được thêm tối đa 10 chiếc!");
//            return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//        }
//
//        //Tìm hoá đơn theo idKH, loaiHD và trạng thái  ->  Check khách hàng đã có hóa đơn chưa
//        HoaDon hoaDonCuaKH = hoaDonRepo.findByidKHAndLoaiHoaDonAndTrangThai(UserInfor.idKhachHang, HoaDonRepository.HOA_DON_ONL, HoaDonRepository.CHO_THANH_TOAN);
//
//        //Check tổng tiền không quá 10tr
//        BigDecimal tongTien = BigDecimal.ZERO;
//        for (ChiTietHoaDon cthd : listHDCT){
//            tongTien = tongTien.add(cthd.getDonGia().multiply(BigDecimal.valueOf(cthd.getSoLuong())));
//        }
//        BigDecimal tienGioiHan = new BigDecimal(50000);
//        BigDecimal tienSauKhiThem = chiTietSanPham.getGiaBan().multiply(BigDecimal.valueOf(soLuong));
//        if (tongTien.add(tienSauKhiThem).compareTo(tienGioiHan) > 0){
//            redirectAttributes.addFlashAttribute("error", "Giới hạn hóa đơn của bạn là 10 triệu!");
//            return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//        }
//
//        //Nếu khách hàng chưa có hóa đơn thì tạo mới hóa đơn -> thêm sản phẩm giỏ hàng
//        if (hoaDonCuaKH == null) {
//            //Lấy ra thông tin khách hàng đăng nhập
//            try {
//                HoaDon hoaDon = new HoaDon();
//                hoaDon.setMa("HDMSS" + (count + 111));
//                hoaDon.setIdKhachHang(khachHang);
//                hoaDon.setNgayTao(LocalDateTime.now().withNano(0));
//                hoaDon.setTrangThai(HoaDonRepository.CHO_THANH_TOAN);
//                hoaDon.setLoaiHoaDon(HoaDonRepository.HOA_DON_ONL);
//                hoaDonRepo.save(hoaDon);
//
//                ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
//                chiTietHoaDon.setIdHoaDon(hoaDon);
//                chiTietHoaDon.setIdCTSP(chiTietSanPham);
//                chiTietHoaDon.setSoLuong(soLuong);
//                chiTietHoaDon.setDonGia(chiTietSanPham.getGiaBan());
//                chiTietHoaDon.setTrangThai(HDCTRepository.CHUA_THANH_TOAN);
//                hdctRepo.save(chiTietHoaDon);
//                //Lấy ra danh sách chi tiết hóa đơn theo hóa đơn của khách hàng
//                redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        } else {  //Nếu có hóa đơn rồi thì thêm sản phẩm vào giỏ hàng
//
//            boolean flag = false;
//            String idHDCT = "";
//            //Kiểm tra xem sản phẩm đã có hay chưa
//            for (ChiTietHoaDon cthd : listHDCT) {
//                if (chiTietSanPham.getId().equals(cthd.getIdCTSP().getId())) {
//                    idHDCT = cthd.getId();
//                    flag = true;
//                    break;
//                }
//            }
//            List<ChiTietHoaDon> listHDCT = hdctRepo.findHDCTByIdHoaDon(hoaDonCuaKH.getId());
//            //Nếu sản phẩm đã tồn tại trong giỏ hàng thì cộng dồn
//            if (flag) {
//                try {
//                    ChiTietHoaDon cthd = hdctRepo.findById(idHDCT).get();
//
//                    //Kiểm tra số lượng khách đã thêm(HDCT) có nhiều hơn số lượng tồn của SPCT không
//                    if ((cthd.getSoLuong()+soLuong) > chiTietSanPham.getSoLuong()){
//                        redirectAttributes.addFlashAttribute("error", "Số lượng sản phẩm còn lại trong kho không đủ!");
//                        return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//                    }
//
//                    //Check HDCT không được quá 10 sản phẩm
//                    if ((cthd.getSoLuong() + soLuong) > 10){
//                        redirectAttributes.addFlashAttribute("error", "Sản phẩm này chỉ được thêm tối đa 10 chiếc!");
//                        return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
//                    }
//
//                    cthd.setSoLuong(cthd.getSoLuong() + soLuong);
//                    cthd.setDonGia(cthd.getDonGia());
//                    hdctRepo.save(cthd);
//                    redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            } else {   //Check sản phẩm chưa có trong giỏ hàng thì thêm mới
//                try {
//                    ChiTietHoaDon chiTietHoaDonMoi = new ChiTietHoaDon();
//                    chiTietHoaDonMoi.setIdHoaDon(hoaDonCuaKH);
//                    chiTietHoaDonMoi.setIdCTSP(chiTietSanPham);
//                    chiTietHoaDonMoi.setSoLuong(soLuong);
//                    chiTietHoaDonMoi.setDonGia(chiTietSanPham.getGiaBan());
//                    chiTietHoaDonMoi.setTrangThai(HDCTRepository.CHUA_THANH_TOAN);
//                    hdctRepo.save(chiTietHoaDonMoi);
//                    redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }}
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
//    public String register( @ModelAttribute("khachHangDTO") KhachHangDTO khachHangDTO,
//                            BindingResult result,
//                            RedirectAttributes redirectAttributes) {
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
//        newUser.setNgayTao( LocalDateTime.now());
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
//        listDiaChi = diaChiRepo.getAllDiaChi();
//        boolean check = false;
//        System.out.println("====================================test id kh : " + UserInfor.idKhachHang);
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
//            model.addAttribute("check", check);
//        }
//
//        //Tính tổng số lượng sản phẩm có trong giỏ hàng
//        Integer totalSoLuong = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            totalSoLuong += chiTietHoaDon.getSoLuong();
//        }
//        model.addAttribute("soLuong", totalSoLuong);
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
//    @PostMapping("/them-dia-chi")
//    public String themDiaChiByidKH(DiaChiRequest request, @RequestParam("tenTinhThanh") String idTinh,
//                                   @RequestParam("tenQuanHuyen") String idQuan,
//                                   @RequestParam("tenPhuongXa") String idPhuong, RedirectAttributes redirectAttributes) {
//        KhachHang khachHang = khachHangRepo.findByIdKH(UserInfor.idKhachHang);
//        listDiaChi = diaChiRepo.findAll();
//
//        DiaChi diaChi = new DiaChi();
//        diaChi.setTenNguoiNhan(request.getTenNguoiNhan());
//        diaChi.setSdtNguoiNhan(request.getSdtNguoiNhan());
//        diaChi.setDiaChiChiTiet(request.getDiaChiChiTiet());
//        diaChi.setIdTinhThanh(idTinh);
//        diaChi.setIdQuanHuyen(idQuan);
//        diaChi.setIdPhuongXa(idPhuong);
//        diaChi.setIdKhachHang(khachHang);
//        if (listDiaChi != null && !listDiaChi.isEmpty()) {
//            diaChi.setTrangThai(DiaChiRepository.TUY_CHON);
//        } else {
//            diaChi.setTrangThai(DiaChiRepository.MAC_DINH);
//        }
//        diaChiRepo.save(diaChi);
//        redirectAttributes.addFlashAttribute("successMessage", "Thêm địa chỉ thành công");
//        return "redirect:/cua-hang/gio-hang";
//    }
//    @PostMapping("/cap-nhat-dia-chi/{id}")
//    public String suaDiaChiByidKH(DiaChiRequest request, @PathVariable("id") String id, @RequestParam("tenTinh") String idTinh,
//                                  @RequestParam("tenQuan") String idQuan,
//                                  @RequestParam("tenPhuong") String idPhuong, RedirectAttributes redirectAttributes) {
//
//        DiaChi diaChi = diaChiRepo.findById(id).get();
//        System.out.println(id);
//        System.out.println(idTinh);
//        System.out.println(idQuan);
//        System.out.println(idPhuong);
//
//        diaChi.setTenNguoiNhan(request.getTenNguoiNhan());
//        diaChi.setSdtNguoiNhan(request.getSdtNguoiNhan());
//        diaChi.setDiaChiChiTiet(request.getDiaChiChiTiet());
//        diaChi.setIdTinhThanh(idTinh);
//        diaChi.setIdQuanHuyen(idQuan);
//        diaChi.setIdPhuongXa(idPhuong);
//        diaChiRepo.save(diaChi);
//        redirectAttributes.addFlashAttribute("successMessage", "Cập nhật địa chỉ thành công");
//        return "redirect:/cua-hang/gio-hang";
//    }
//    @GetMapping("/xoa-dia-chi/{id}")
//    public String xoaDiaChi(@PathVariable("id") String id, RedirectAttributes redirectAttributes) {
//        DiaChi diaChi = diaChiRepo.findDiaChiByID(id);
//        diaChiRepo.delete(diaChi);
//        redirectAttributes.addFlashAttribute("successMessage", "Xóa địa chỉ thành công");
//
//        return "redirect:/cua-hang/gio-hang";
//    }
//    //Giảm số lượng sản phẩm có trong giỏ hàng đi 1
//    @GetMapping("/giam-so-luong/{idHDCT}")
//    public String giamSoLuong(@PathVariable("idHDCT") String idHDCT) {
//        ChiTietHoaDon chiTietHoaDon = hdctRepo.findById(idHDCT).get();
//        //số lượng sản phẩm thấp nhất = 1
//        if (chiTietHoaDon.getSoLuong() <= 1) {
//            chiTietHoaDon.setSoLuong(1);
//            hdctRepo.save(chiTietHoaDon);
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
//        BigDecimal gioiHanTongTien = new BigDecimal(10000);
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
//    @PostMapping("/thanh-toan")
//    public String thanhToan(GiaoHangRequest request, @RequestParam("tenTinh") String idTinhThanh,
//                            @RequestParam("tenQuan") String idQuanHuyen, @RequestParam("tenPhuong") String idPhuongXa, RedirectAttributes redirectAttributes) {
//
//        BigDecimal tongTienBigDecimal = BigDecimal.ZERO;
//        for (ChiTietHoaDon cthd : listHDCT) {
//            BigDecimal soLuongDecimal = new BigDecimal(cthd.getSoLuong());
//            tongTienBigDecimal = tongTienBigDecimal.add(cthd.getDonGia().multiply(soLuongDecimal));
//        }
//
//        HoaDon hoaDon = hoaDonRepo.findByIdKhachHang(UserInfor.idKhachHang, HoaDonRepository.CHO_THANH_TOAN);
//
//        hoaDon.setPhuongThucThanhToan(request.getPhuongThucThanhToan());
//        hoaDon.setNgayThanhToan(LocalDateTime.now().withNano(0));
//        hoaDon.setTongTien(tongTienBigDecimal);
//        hoaDon.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
//        hoaDon.setLoaiHoaDon(HoaDonRepository.HOA_DON_ONL);
//        hoaDonRepo.save(hoaDon);
//
//        GiaoHang giaoHang = new GiaoHang();
//
//        giaoHang.setIdHoaDon(hoaDon);
//        giaoHang.setTenNguoiNhan(request.getTenNguoiNhan());
//        giaoHang.setSdtNguoiNhan(request.getSdtNguoiNhan());
//        giaoHang.setDiaChiChiTiet(request.getDiaChiChiTiet());
//        giaoHang.setIdTinhThanh(idTinhThanh);
//        giaoHang.setIdQuanHuyen(idQuanHuyen);
//        giaoHang.setIdPhuongXa(idPhuongXa);
//        giaoHang.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
//        giaoHang.setGhiChu(request.getGhiChu());
//        giaoHangRepo.save(giaoHang);
//
//        redirectAttributes.addFlashAttribute("successMessage", "Đặt hàng thành công");
//
//        return "redirect:/cua-hang/gio-hang";
//    }
//
//}
