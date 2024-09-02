//package com.example.java4.controller.controller_viet;
//
//import com.example.java4.config.UserInfor;
//import com.example.java4.entities.*;
//import com.example.java4.repositories.*;
//import com.example.java4.request.req_viet.SanPhamRequest;
//import com.example.java4.response.KichThuocRespone;
//import com.example.java4.response.MauSacRespone;
//import com.example.java4.response.MauSizeSL;
//import jakarta.validation.Valid;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.math.BigDecimal;
//import java.time.LocalDateTime;
//import java.util.List;
//import java.util.Optional;
//
//@Controller
//@RequestMapping("store")
//public class Controller_V {
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
//    //Bán onl
//    @GetMapping("/trang-chu")
//    public String getTrangChu(
//            Model model,
//            @RequestParam("page") Optional<Integer> pageParam
//    ) {
//        Pageable pageable = PageRequest.of(pageParam.orElse(0), 9);
//        Page pageSP = spctRepo.getAllSP(pageable);
//        model.addAttribute("pageSP", pageSP);
//        return "/view/view_viet/trangChu.jsp";
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
//        return "/view/view_viet/chiTietSanPham.jsp";
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
//            return "redirect:/store/detail-san-pham/" + idCTSP;
//        }
//
//        //Lấy ra màu sắc theo tên màu sắc
//        MauSac mauSac = mauSacRepo.findByTen(tenMauSac);
//        //Lấy ra kích thước theo tên kích thước
//        KichThuoc kichThuoc = kichThuocRepo.findByTen(tenKichThuoc);
//        //Lấy ra chi tiết sản phẩm theo idCTSP đang có
//        ChiTietSanPham ctsp = spctRepo.findById(idCTSP).get();
//        //Lấy ra chi tiết sản phẩm đã chọn theo idSP, idMS, idKth
//        ChiTietSanPham chiTietSanPham = spctRepo.findCTSPBySanPham_MauSac_KichThuoc(ctsp.getIdSanPham().getId(), mauSac.getId(), kichThuoc.getId());
//
//        //Mã tự động hóa đơn
//        int count = hoaDonRepo.countHD();
//
//        //Kiểm tra số lượng khách thêm giỏ hàng có nhiều hơn số lượng tồn của SPCT không
//        if (soLuong > chiTietSanPham.getSoLuong()) {
//            redirectAttributes.addFlashAttribute("error", "Số lượng sản phẩm còn lại không đủ!");
//            return "redirect:/store/detail-san-pham/" + idCTSP;
//        }
//
//        //Check không được thêm GH quá 10 sản phẩm
//
//        //Check HDCT không được quá 10 sản phẩm
//
//        //Tìm hoá đơn theo idKH, loaiHD và trạng thái  ->  Check khách hàng đã có hóa đơn chưa
//        HoaDon hoaDonCuaKH = hoaDonRepo.findByidKHAndLoaiHoaDonAndTrangThai(UserInfor.idKhachHang, HoaDonRepository.HOA_DON_ONL, HoaDonRepository.CHO_THANH_TOAN);
//
//        //Kiểm tra số lượng khách đã thêm(HDCT) có nhiều hơn số lượng tồn của SPCT không
//
//        //Check tổng tiền không quá 10tr
//
//        //Nếu khách hàng chưa có hóa đơn thì tạo mới hóa đơn -> thêm sản phẩm giỏ hàng
//        if (hoaDonCuaKH == null) {
//            //Lấy ra thông tin khách hàng đăng nhập
//            KhachHang khachHang = khachHangRepo.findByIdKH(UserInfor.idKhachHang);
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
//                chiTietHoaDon.setDonGia(chiTietSanPham.getGiaBan().multiply(BigDecimal.valueOf(soLuong)));
//                chiTietHoaDon.setTrangThai(HDCTRepository.CHUA_THANH_TOAN);
//                hdctRepo.save(chiTietHoaDon);
//
//                redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        } else {  //Nếu có hóa đơn rồi thì thêm sản phẩm vào giỏ hàng
//            //Lấy ra danh sách chi tiết hóa đơn theo hóa đơn của khách hàng
//            List<ChiTietHoaDon> listHDCT = hdctRepo.findHDCTByIdHoaDon(hoaDonCuaKH.getId());
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
//            //Nếu sản phẩm đã tồn tại trong giỏ hàng thì cộng dồn
//            if (flag) {
//                try {
//                    ChiTietHoaDon cthd = hdctRepo.findById(idHDCT).get();
//                    cthd.setSoLuong(cthd.getSoLuong() + soLuong);
//                    cthd.setDonGia(cthd.getDonGia().add(chiTietSanPham.getGiaBan().multiply(BigDecimal.valueOf(soLuong))));
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
//                    chiTietHoaDonMoi.setDonGia(chiTietSanPham.getGiaBan().multiply(BigDecimal.valueOf(soLuong)));
//                    chiTietHoaDonMoi.setTrangThai(HDCTRepository.CHUA_THANH_TOAN);
//                    hdctRepo.save(chiTietHoaDonMoi);
//                    redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm vào giỏ hàng thành công.");
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return "redirect:/store/detail-san-pham/" + idCTSP;
//    }
//
////    @Autowired
////    SanPhamRepository sanPhamRepo;
////    @GetMapping("/san-pham")
////    public String sanPham(Model model){
////        SanPhamRequest sanPhamRequest = new SanPhamRequest();
////        model.addAttribute("sanPham", sanPhamRequest);
////        model.addAttribute("listSP", sanPhamRepo.findAll());
////        return "/view/view_viet/sanPham.jsp";
////    }
////
////    @PostMapping("add")
////    public String add(
////            Model model,
////            @Valid @ModelAttribute("sanPham") SanPhamRequest spReq,
////            BindingResult result
////    ){
////        if (result.hasErrors()){
////            return "/view/view_viet/sanPham.jsp";
////        }
////        SanPham sanPham = new SanPham();
////        sanPham.setTen(spReq.getTen());
////        sanPham.setTrangThai(spReq.getTrangThai());
////        sanPham.setNgayTao(spReq.getNgayTao());
////        sanPhamRepo.save(sanPham);
////
////        return "/view/view_viet/sanPham.jsp";
////    }
//
//}
