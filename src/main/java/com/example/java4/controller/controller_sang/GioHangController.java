//package com.example.java4.controller.controller_sang;
//
//import com.example.java4.config.UserInfor;
//import com.example.java4.entities.ChiTietHoaDon;
//import com.example.java4.entities.ChiTietSanPham;
//import com.example.java4.entities.KhachHang;
//import com.example.java4.entities.SanPham;
//import com.example.java4.repositories.*;
//import com.example.java4.response.GioHangResponse;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.math.BigDecimal;
//import java.util.ArrayList;
//import java.util.List;
//
//@Controller
//@RequestMapping("sang")
//public class GioHangController {
//
//    @Autowired
//    HoaDonRepository hoaDonRepo;
//
//    @Autowired
//    HDCTRepository hdctRepo;
//
//    @Autowired
//    SPCTRepository spctRepo;
//
//    @Autowired
//    SanPhamRepository sanPhamRepo;
//
//    @Autowired
//    KhachHangRepository khachHangRepo;
//
//    @Autowired
//    GiaoHangRepo giaoHangRepo;
//
//    private List<ChiTietHoaDon> listHDCT;
//    private List<ChiTietSanPham> listCTSP;
//    private List<SanPham> listSanPham;
//    private List<KhachHang> listKhachHang;
//    private List<GioHangResponse> listGioHang;
//
//    public GioHangController() {
//        listHDCT = new ArrayList<>();
//        listCTSP = new ArrayList<>();
//        listSanPham = new ArrayList<>();
//        listKhachHang = new ArrayList<>();
//        listGioHang = new ArrayList<>();
//    }
//
//    private String idKH = UserInfor.idKhachHang;
//
//    //Danh sách sản phẩm
//    @GetMapping("/gio-hang")
//    public String gioHang(Model model) {
//        listHDCT = hdctRepo.findByIdHoaDonByIDKH(idKH);
//        listGioHang = hdctRepo.getAll(idKH);
//        listCTSP = spctRepo.findAll();
//        listSanPham = sanPhamRepo.findAll();
//        boolean check = false;
//        System.out.println("====================================test id kh : " + idKH);
//        if (listHDCT.isEmpty()) {
//            //Trong giỏ hàng không có sản phẩm sẽ hiển thị thông báo
//            check = true;
//            model.addAttribute("check", check);
//            return "/view/view_sang/gioHang.jsp";
//        } else {
//            //Trong giỏ hàng có sản phẩm sẽ hiển thị danh sách
//            check = false;
//            model.addAttribute("listGioHang", listGioHang);
//            model.addAttribute("listCTSP", listCTSP);
//            model.addAttribute("listSanPham", listSanPham);
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
//        BigDecimal tongTienBigDecimal = new BigDecimal(0);
//        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
//            BigDecimal soLuongDecimal = new BigDecimal(chiTietHoaDon.getSoLuong());
//            tongTienBigDecimal.add(chiTietHoaDon.getDonGia().multiply(soLuongDecimal));
//        }
//        model.addAttribute("tongTien", tongTienBigDecimal);
//        return "/view/view_sang/gioHang.jsp";
//    }
//
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
//        return "redirect:/gio-hang";
//    }
//
//    //Tăng số lượng sản phẩm có trong giỏ hàng lên 1
//    @GetMapping("/tang-so-luong/{idHDCT}")
//    public String tangSoLuong(@PathVariable("idHDCT") String idHDCT) {
//        ChiTietHoaDon chiTietHoaDon = hdctRepo.findById(idHDCT).get();
//        //Số lượng sản phẩm cao nhất = 5
//        if (chiTietHoaDon.getSoLuong() >= 5) {
//            chiTietHoaDon.setSoLuong(chiTietHoaDon.getSoLuong());
//            hdctRepo.save(chiTietHoaDon);
//        } else {
//            chiTietHoaDon.setSoLuong(chiTietHoaDon.getSoLuong() + 1);
//            hdctRepo.save(chiTietHoaDon);
//        }
//        return "redirect:/gio-hang";
//    }
//
//    //Xóa sản phẩm ra khỏi giỏ hàng
//    @GetMapping("/delete/{idHDCT}")
//    public String deleteIDSPCT(@PathVariable String idHDCT, RedirectAttributes redirectAttributes) {
//        ChiTietHoaDon chiTietHoaDon = hdctRepo.findById(idHDCT).get();
//        try {
//            hdctRepo.delete(chiTietHoaDon);
//            redirectAttributes.addFlashAttribute("success", "Xóa sản phẩm thành công");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "redirect:/gio-hang";
//    }
//
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
//        giao
//        giaoHang.setGhiChu(ghRequest.getGhiChu());
//        giaoHangRepo.save(giaoHang);
//
//        return "redirect:/gio-hang";
//    }
//}