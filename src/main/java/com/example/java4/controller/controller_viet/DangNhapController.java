//package com.example.java4.controller.controller_viet;
//
//import com.example.java4.config.UserInfor;
//import com.example.java4.entities.*;
//import com.example.java4.repositories.*;
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.util.List;
//
//@Controller
//@RequestMapping("store")
//public class DangNhapController {
//    @Autowired
//    NhanVienRepository nhanVienRepo;
//
//    @Autowired
//    private HoaDonRepository hoaDonRepository;
//
//    @Autowired
//    private HDCTRepository hoaDonChiTietRepository;
//
//    @Autowired
//    private SPCTRepository sanPhamChiTietRepository;
//
//    @Autowired
//    private KhachHangRepository khachHangRepository;
//
//    @Autowired
//    private MauSacRepository mauSacRepository;
//
//    @Autowired
//    SanPhamRepository sanPhamRepo;
//
//    @Autowired
//    KichThuocRepository kichThuocRepo;
//
//    @Autowired
//    ChatLieuRepository chatLieuRepo;
//
//    @Autowired
//    KieuTayRepository kieuTayRepo;
//
//    @Autowired
//    KhuyenMaiRepository khuyenMaiRepo;
//
//    private List<KhuyenMai> listKhuyenMai;
//    private List<HoaDon> listHoaDon;
//    private List<ChiTietHoaDon> listHDCT;
//    private List<ChiTietSanPham> listCTSP;
//    private List<KhachHang> listKH;
//    private List<MauSac> listMauSac;
//    private List<KichThuoc> listKichThuoc;
//    private List<SanPham> listSanPham;
//    private List<KieuTay> listKieuTay;
//    private List<ChatLieu> listChatLieu;
//    private String idNV = "BF29DB87-6ED2-46E8-B34C-135B2EA4CCA6";
//    @GetMapping("/ban-hang-tai-quay")
//    public String hienThi(Model model,@RequestParam(value = "page",defaultValue ="0") String pageParam ) {
//
//        //Hiển thị thông tin nhân viên đăng nhập
//        if (UserInfor.idNhanVien != null){
//            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
//            model.addAttribute("nv", nhanVien);
//        }
//
//        Pageable pageable = PageRequest.of(Integer.valueOf(pageParam), 10);
//        listHoaDon = hoaDonRepository.selectTop5();
//        Page<ChiTietSanPham> listCTSP = sanPhamChiTietRepository.findByTrangThai(1,pageable);
//        listKH = khachHangRepository.findAll();
//        listMauSac = mauSacRepository.findAll();
//        listKichThuoc = kichThuocRepo.findAll();
//        listKieuTay = kieuTayRepo.findAll();
//        listSanPham = sanPhamRepo.findAll();
//        listChatLieu = chatLieuRepo.findAll();
//        listKhuyenMai = khuyenMaiRepo.findAll();
//        model.addAttribute("listMauSac", listMauSac);
//        model.addAttribute("listKichThuoc", listKichThuoc);
//        model.addAttribute("listChatLieu", listChatLieu);
//        model.addAttribute("listKieuTay", listKieuTay);
//        model.addAttribute("listSanPham", listSanPham);
//        model.addAttribute("listHoaDon", listHoaDon);
//        model.addAttribute("listCTSP", listCTSP);
//        model.addAttribute("listKH", listKH);
//        model.addAttribute("listKM",listKhuyenMai);
//        System.out.println(listMauSac);
//        return "/view/view_viet/banHangTaiQuay.jsp";
//    }
//
//    @GetMapping("dang-nhap-view")
//    public String getDangNhapview(Model model){
//        return "/view/view_viet/dangNhapAdmin.jsp";
//    }
//
//    @PostMapping("dang-nhap")
//    public String dangNhap(
//            Model model,
//            RedirectAttributes redirectAttributes,
//            HttpSession session,
//            @RequestParam("taiKhoan") String taiKhoan,
//            @RequestParam("matKhau") String matKhau
//    ){
//        //Tìm kiếm nhân viên theo tên tài khoản
//        NhanVien nhanVienByTK = nhanVienRepo.findByTaiKhoan(taiKhoan);
//        if (nhanVienByTK == null){
//            redirectAttributes.addFlashAttribute("error", "Tên tài khoản không tồn tại!");
//            return "redirect:/store/dang-nhap-view";
//        }else {
//            if (matKhau.equals(nhanVienByTK.getMatKhau())){
//                UserInfor.idNhanVien = nhanVienByTK.getId();
//
//                //Check admin hay nhân viên
//                String role = nhanVienByTK.getIdCV().getTen();
//                session.setAttribute("userRole", role);
//
//                redirectAttributes.addFlashAttribute("success", "Đăng nhập thành công");
//                return "redirect:/store/ban-hang-tai-quay";
//            }else {
//                redirectAttributes.addFlashAttribute("error", "Mật khẩu nhập vào chưa đúng!");
//                return "redirect:/store/dang-nhap-view";
//            }
//        }
//    }
//
//    @GetMapping("dang-xuat")
//    public void dangXuat(){
//        UserInfor.idNhanVien = null;
//
//    }
//}
