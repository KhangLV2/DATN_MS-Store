package com.example.java4.controller;
import com.example.java4.config.UserInfor;
import com.example.java4.entities.*;
import com.example.java4.repositories.*;
import com.example.java4.request.req_tai.KhachHangDTO;
import com.example.java4.response.GioHangResponse;
import com.example.java4.response.KichThuocRespone;
import com.example.java4.response.MauSacRespone;
import com.example.java4.response.MauSizeSL;
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
@RequestMapping("cua-hang")
public class TrangChuController {
    @Autowired
    SPCTRepository spctRepo;
    @Autowired
    HinhAnhRepository hinhAnhRepo;
    @Autowired
    KichThuocRepository kichThuocRepo;
    @Autowired
    MauSacRepository mauSacRepo;
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
    private List<ChiTietHoaDon> listHDCT = new ArrayList<>();
    private List<ChiTietSanPham> listCTSP= new ArrayList<>();
    private List<SanPham> listSanPham = new ArrayList<>();
    private List<KhachHang> listKhachHang = new ArrayList<>();
    private List<GioHangResponse> listGioHang;
    //Test api địa chỉ
    @GetMapping("apiDiaChi")
    public String apiDC(){
        return "/view/view_viet/testApiDiaChi.jsp";
    }

    @PostMapping("addDC")
    public void addDiaChi(
            @RequestParam("tenTinh") String tinh,
            @RequestParam("tenQuan") String quan,
            @RequestParam("tenPhuong") String phuong
    ){
        System.out.println("Tỉnh: "+tinh);
        System.out.println("Quận: "+quan);
        System.out.println("Phường: "+phuong);
    }

    //Bán onl
    @GetMapping("/trang-chu")
    public String getTrangChu(
            Model model,
            @RequestParam("page")Optional<Integer> pageParam
    ){
        if (!model.containsAttribute("khachHangDTO")) {
            System.out.println("crette dto");
            model.addAttribute("khachHangDTO", new KhachHangDTO());
        }
        Pageable pageable = PageRequest.of(pageParam.orElse(0), 9);
        Page pageSP = spctRepo.getAllSP(pageable);
        model.addAttribute("pageSP", pageSP);
        model.addAttribute("soLuong", hdctRepo.findByKHnStt(khachHangRepo.findByIdKH(UserInfor.idKhachHang)));
        System.out.println("================================test user info :"+UserInfor.idKhachHang);
        return "/view/ban_hang_online/trangChu.jsp";
    }

    //Hiển thị chi tiết sản phẩm đã chọn
    @GetMapping("detail-san-pham/{idCTSP}")
    public String detail(
            Model model,
            @PathVariable("idCTSP") String idCTSP
    ){
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
        model.addAttribute("soLuong",hdctRepo.findByKHnStt(khachHangRepo.findByIdKH(UserInfor.idKhachHang)));
        return "/view/view_viet/chiTietSanPham.jsp";
    }

    //Thêm sản phẩm vào giỏ hàng
    @PostMapping("add-gio-hang")
    public String addGioHang(
            Model model,
            @RequestParam("idCTSP") String idCTSP,
            @RequestParam("mauSac") String tenMauSac,
            @RequestParam("kichThuoc") String tenKichThuoc,
            @RequestParam("soLuong") Integer soLuong,
            RedirectAttributes redirectAttributes
    ){

        //Lấy ra màu sắc theo tên màu sắc
        MauSac mauSac = mauSacRepo.findByTen(tenMauSac);
        //Lấy ra kích thước theo tên kích thước
        KichThuoc kichThuoc = kichThuocRepo.findByTen(tenKichThuoc);
        //Lấy ra thông tin khách hàng đăng nhập
        KhachHang khachHang = khachHangRepo.findByIdKH(UserInfor.idKhachHang);
        //Lấy ra chi tiết sản phẩm theo idCTSP đang có
        ChiTietSanPham ctsp = spctRepo.findById(idCTSP).get();
        //Lấy ra chi tiết sản phẩm đã chọn theo idSP, idMS, idKth
        ChiTietSanPham chiTietSanPham = spctRepo.findCTSPBySanPham_MauSac_KichThuoc(ctsp.getIdSanPham().getId(), mauSac.getId(), kichThuoc.getId());

        //Mã tự động hóa đơn
        int count = hoaDonRepo.countHD();

        //Check khách hàng có đăng nhập ko
        if (khachHang == null){     //Nếu ko đăng nhập thì lưu vào localStorage

            //Luồng khách hàng chưa đăng nhập thì làm sau

        }else {    //Nếu có đăng nhập thì tạo hóa đơn và lưu vào HDCT(Giỏ hàng)

            //Tìm hoá đơn theo idKH, loaiHD và trạng thái  ->  Check khách hàng đã có hóa đơn chưa
            HoaDon hoaDonCuaKH = hoaDonRepo.findByidKHAndLoaiHoaDonAndTrangThai(UserInfor.idKhachHang, HoaDonRepository.HOA_DON_ONL, HoaDonRepository.CHO_THANH_TOAN);

            //Kiểm tra số lượng khách thêm giỏ hàng có nhiều hơn số lượng tồn của SPCT không
            if (soLuong > chiTietSanPham.getSoLuong()){
                redirectAttributes.addFlashAttribute("error", "Số lượng sản phẩm còn lại không đủ!");
                return "redirect:/store/detail-san-pham/" + idCTSP;
            }

            //Nếu khách hàng chưa có hóa đơn thì tạo mới hóa đơn -> thêm sản phẩm giỏ hàng
            if (hoaDonCuaKH == null){
                try {
                    HoaDon hoaDon = new HoaDon();
                    hoaDon.setMa("HDMSS"+(count+111));
                    hoaDon.setIdKhachHang(khachHang);
                    hoaDon.setNgayTao(LocalDateTime.now().withNano(0));
                    hoaDon.setTrangThai(HoaDonRepository.CHO_THANH_TOAN);
                    hoaDon.setLoaiHoaDon(HoaDonRepository.HOA_DON_ONL);
                    hoaDonRepo.save(hoaDon);
                    ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
                    chiTietHoaDon.setIdHoaDon(hoaDon);
                    chiTietHoaDon.setIdCTSP(chiTietSanPham);
                    chiTietHoaDon.setSoLuong(soLuong);
                    chiTietHoaDon.setDonGia(chiTietSanPham.getGiaBan().multiply(BigDecimal.valueOf(soLuong)));
                    chiTietHoaDon.setTrangThai(HDCTRepository.CHUA_THANH_TOAN);
                    hdctRepo.save(chiTietHoaDon);
                    redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
                }catch (Exception e){
                    e.printStackTrace();
                }
            }else {  //Nếu có hóa đơn rồi thì thêm sản phẩm vào giỏ hàng
                //Lấy ra danh sách chi tiết hóa đơn theo hóa đơn của khách hàng
                List<ChiTietHoaDon> listHDCT = hdctRepo.findHDCTByIdHoaDon(hoaDonCuaKH.getId());
                boolean flag = false;
                String idHDCT = "";
                //Kiểm tra xem sản phẩm đã có hay chưa
                for (ChiTietHoaDon cthd : listHDCT){
                    if (chiTietSanPham.getId().equals(cthd.getIdCTSP().getId())){
                        idHDCT = cthd.getId();
                        flag = true;
                        break;
                    }
                }
                //Nếu sản phẩm đã tồn tại trong giỏ hàng thì cộng dồn
                if (flag){
                    try {
                        ChiTietHoaDon cthd = hdctRepo.findById(idHDCT).get();
                        cthd.setSoLuong(cthd.getSoLuong() + soLuong);
                        cthd.setDonGia(cthd.getDonGia().add(chiTietSanPham.getGiaBan().multiply(BigDecimal.valueOf(soLuong))));
                        hdctRepo.save(cthd);
                        redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                } else {   //Check sản phẩm chưa có trong giỏ hàng thì thêm mới
                    try {
                        ChiTietHoaDon chiTietHoaDonMoi = new ChiTietHoaDon();
                        chiTietHoaDonMoi.setIdHoaDon(hoaDonCuaKH);
                        chiTietHoaDonMoi.setIdCTSP(chiTietSanPham);
                        chiTietHoaDonMoi.setSoLuong(soLuong);
                        chiTietHoaDonMoi.setDonGia(chiTietSanPham.getGiaBan().multiply(BigDecimal.valueOf(soLuong)));
                        chiTietHoaDonMoi.setTrangThai(HDCTRepository.CHUA_THANH_TOAN);
                        hdctRepo.save(chiTietHoaDonMoi);
                        redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
            }
        }
        return "redirect:/cua-hang/detail-san-pham/" + idCTSP;
    }
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
                response.put("redirectUrl", "/cua-hang/trang-chu");
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
        return "redirect:/trang-chu";
    }

    @PostMapping("/register")
    public String register( @ModelAttribute("khachHangDTO") KhachHangDTO khachHangDTO,
                            BindingResult result,
                            RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("registerErrors", result.getAllErrors());
            return "redirect:/trang-chu";
        }
        KhachHang existingUser = khachHangRepository.findByTaiKhoan(khachHangDTO.getTaiKhoan());
        if (existingUser != null) {
            redirectAttributes.addFlashAttribute("registerErrors", "Username already exists");
            return "redirect:/trang-chu";
        }
        // Save the new user
        KhachHang newUser = new KhachHang();
        newUser.setTaiKhoan(khachHangDTO.getTaiKhoan());
        newUser.setEmail(khachHangDTO.getEmail());
        newUser.setSdt(khachHangDTO.getSdt());
        newUser.setMatKhau(khachHangDTO.getMatKhau());
        newUser.setNgayTao( LocalDateTime.now());
        newUser.setTrangThai(khachHangRepository.ACTIVE);
        khachHangRepository.save(newUser);
        redirectAttributes.addFlashAttribute("successMessage", "Đăng ký thành công!");
        return "redirect:/trang-chu";
    }


    @GetMapping("/gio-hang")
    public String gioHang(Model model) {
        listHDCT = hdctRepo.findByIdHoaDonByIDKH(UserInfor.idKhachHang);
        listGioHang = hdctRepo.getAll(UserInfor.idKhachHang);
        listCTSP = spctRepo.findAll();
        listSanPham = sanPhamRepo.findAll();
        boolean check = false;
        System.out.println("====================================test id kh : "+UserInfor.idKhachHang);
        if (listHDCT.isEmpty()) {
            //Trong giỏ hàng không có sản phẩm sẽ hiển thị thông báo
            check = true;
            model.addAttribute("check", check);
            return "/view/ban_hang_online/gioHang.jsp";
        } else {
            //Trong giỏ hàng có sản phẩm sẽ hiển thị danh sách
            check = false;
            model.addAttribute("listGioHang", listGioHang);
            model.addAttribute("listCTSP", listCTSP);
            model.addAttribute("listSanPham", listSanPham);
            model.addAttribute("check", check);
        }

        //Tính tổng số lượng sản phẩm có trong giỏ hàng
        Integer totalSoLuong = 0;
        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
            totalSoLuong += chiTietHoaDon.getSoLuong();
        }
        model.addAttribute("soLuong", hdctRepo.findByKHnStt(khachHangRepo.findByIdKH(UserInfor.idKhachHang)));

        //Tính tổng giá tiền của giỏ hàng
        BigDecimal tongTienBigDecimal  = new BigDecimal(0.0);
        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
            BigDecimal soLuongDecimal = new BigDecimal(chiTietHoaDon.getSoLuong());
            tongTienBigDecimal = tongTienBigDecimal.add(chiTietHoaDon.getDonGia().multiply(soLuongDecimal));
            System.out.println("============================don gia: "+chiTietHoaDon.getDonGia());
            System.out.println("============================so luong: "+ soLuongDecimal);
            System.out.println("=======================test multiply "+chiTietHoaDon.getDonGia().multiply(soLuongDecimal));
        }
        model.addAttribute("tongTien", tongTienBigDecimal);
        return "/view/ban_hang_online/gioHang.jsp";
    }

    //Giảm số lượng sản phẩm có trong giỏ hàng đi 1
    @GetMapping("/giam-so-luong/{idHDCT}")
    public String giamSoLuong(@PathVariable("idHDCT") String idHDCT) {
        ChiTietHoaDon chiTietHoaDon = hdctRepo.findById(idHDCT).get();
        //số lượng sản phẩm thấp nhất = 1
        if (chiTietHoaDon.getSoLuong() <= 1) {
            chiTietHoaDon.setSoLuong(1);
            hdctRepo.save(chiTietHoaDon);
        } else {
            chiTietHoaDon.setSoLuong(chiTietHoaDon.getSoLuong() - 1);
            hdctRepo.save(chiTietHoaDon);
        }
        return "redirect:/cua-hang/gio-hang";
    }

    //Tăng số lượng sản phẩm có trong giỏ hàng lên 1
    @GetMapping("/tang-so-luong/{idHDCT}")
    public String tangSoLuong(@PathVariable("idHDCT") String idHDCT) {
        ChiTietHoaDon chiTietHoaDon = hdctRepo.findById(idHDCT).get();
        //Số lượng sản phẩm cao nhất = 5
        if (chiTietHoaDon.getSoLuong() >= 5) {
            chiTietHoaDon.setSoLuong(chiTietHoaDon.getSoLuong());
            hdctRepo.save(chiTietHoaDon);
        } else {
            chiTietHoaDon.setSoLuong(chiTietHoaDon.getSoLuong() + 1);
            hdctRepo.save(chiTietHoaDon);
        }
        return "redirect:/cua-hang/gio-hang";
    }

    //Xóa sản phẩm ra khỏi giỏ hàng
    @GetMapping("/delete/{idHDCT}")
    public String deleteIDSPCT(@PathVariable String idHDCT, RedirectAttributes redirectAttributes) {
        ChiTietHoaDon chiTietHoaDon = hdctRepo.findById(idHDCT).get();
        try {
            hdctRepo.delete(chiTietHoaDon);
            redirectAttributes.addFlashAttribute("success", "Xóa sản phẩm thành công");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/cua-hang/gio-hang";
    }

//    @PostMapping("/thanh-toan")
//    public String thanhToan(GiaoHangRequest ghRequest, @RequestParam("tenTinh") String idTinhThanh,
//                            @RequestParam("tenQuan") String idQuanHuyen, @RequestParam("tenPhuong") String idPhuongXa) {
//
//        Integer tongTien = 0;
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            tongTien += chiTietHoaDon.getSoLuong() * chiTietHoaDon.getDonGia();
//        }
//
//        HoaDon hoaDon = hoaDonRepo.findByIdKhachHang(idKH).get();
//        hoaDon.setPhuongThucThanhToan(ghRequest.getPhuongThucThanhToan());
//        hoaDon.setNgayThanhToan(LocalDateTime.now().withNano(0));
//        hoaDon.setTongTien(tongTien);
//        hoaDon.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
//        hoaDon.setLoaiHoaDon(HoaDonRepository.HOA_DON_ONL);
//        hoaDonRepo.save(hoaDon);
//
//        System.out.println(idTinhThanh);
//        System.out.println(idQuanHuyen);
//        System.out.println(idPhuongXa);
//        System.out.println(hoaDon);
//
//
//        GiaoHang giaoHang = new GiaoHang();
//        giaoHang.setIdHoaDon(hoaDonRepo.findByIdKhachHang(idKH).get());
//        giaoHang.setTenNguoiNhan(ghRequest.getTenNguoiNhan());
//        giaoHang.setSdtNguoiNhan(ghRequest.getSdtNguoiNhan());
//        giaoHang.setDiaChiChiTiet(ghRequest.getDiaChiChiTiet());
//        giaoHang.setIdTinhThanh(idTinhThanh);
//        giaoHang.setIdQuanHuyen(idQuanHuyen);
//        giaoHang.setIdPhuongXa(idPhuongXa);
//        giaoHang.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
//        giaoHang.setGhiChu(ghRequest.getGhiChu());
//        giaoHangRepo.save(giaoHang);
//
//        return "redirect:/gio-hang";
//    }




//    @Autowired
//    SanPhamRepository sanPhamRepo;
//    @GetMapping("/san-pham")
//    public String sanPham(Model model){
//        SanPhamRequest sanPhamRequest = new SanPhamRequest();
//        model.addAttribute("sanPham", sanPhamRequest);
//        model.addAttribute("listSP", sanPhamRepo.findAll());
//        return "/view/view_viet/sanPham.jsp";
//    }
//
//    @PostMapping("add")
//    public String add(
//            Model model,
//            @Valid @ModelAttribute("sanPham") SanPhamRequest spReq,
//            BindingResult result
//    ){
//        if (result.hasErrors()){
//            return "/view/view_viet/sanPham.jsp";
//        }
//        SanPham sanPham = new SanPham();
//        sanPham.setTen(spReq.getTen());
//        sanPham.setTrangThai(spReq.getTrangThai());
//        sanPham.setNgayTao(spReq.getNgayTao());
//        sanPhamRepo.save(sanPham);
//
//        return "/view/view_viet/sanPham.jsp";
//    }

}
