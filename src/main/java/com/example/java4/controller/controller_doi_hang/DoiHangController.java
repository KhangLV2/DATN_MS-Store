package com.example.java4.controller.controller_doi_hang;

import com.example.java4.config.UserInfor;
import com.example.java4.entities.ChiTietHoaDon;
import com.example.java4.entities.GiaoHang;
import com.example.java4.entities.HoaDon;
import com.example.java4.entities.NhanVien;
import com.example.java4.repositories.GiaoHangRepo;
import com.example.java4.repositories.HoaDonRepository;
import com.example.java4.repositories.NhanVienRepository;
import com.example.java4.repositories.viet_repo.CTHDRepository;
import com.example.java4.repositories.viet_repo.HDRepository;
import com.example.java4.response.CTHDResponse;
import com.example.java4.response.HDResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
@RequestMapping("admin")
public class DoiHangController {
    @Autowired
    HDRepository hoaDonRepo;
    @Autowired
    CTHDRepository cthdRepo;
    @Autowired
    NhanVienRepository nhanVienRepo;
    @Autowired
    GiaoHangRepo giaoHangRepo;

    @GetMapping("doi-hang-view")
    public String doiHangView(Model model){
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        }
        return "/view/view_doi_hang/doiHang.jsp";
    }

    @PostMapping("tim-kiem-hoa-don")
    public String timKiemHoaDon(
            @RequestParam("maHD") String maHD,
            Model model,
            RedirectAttributes redirectAttributes
    ){
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        }

        //Check nhân viên đăng nhập trước khi sử dụng
//        if (UserInfor.idNhanVien == null){
//            redirectAttributes.addFlashAttribute("error", "Hãy đăng nhập trước khi sử dụng chức năng");
//            return "redirect:/admin/doi-hang-view";
//        }

        HoaDon hoaDon = hoaDonRepo.findByMaHD(maHD);
        if (hoaDon == null){
            redirectAttributes.addFlashAttribute("error", "Không tìm thấy hóa đơn "+maHD);
            return "redirect:/admin/doi-hang-view";
        }else {
            return "redirect:/admin/hoa-don-doi-hang/"+hoaDon.getId();
        }
    }

    @GetMapping("hoa-don-doi-hang/{idHD}")
    public String hoaDonDoiHang(
            @PathVariable("idHD") String idHD,
            Model model
    ){
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        }

        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

        HDResponse hoaDon = hoaDonRepo.getHoaDonByIdHD(idHD);
        model.addAttribute("hoaDon", hoaDon);

        String ngayThanhToan = hoaDon.getNgayThanhToan() != null ? hoaDon.getNgayThanhToan().format(dateTimeFormatter) : null;
        String ngayShip = hoaDon.getNgayShip() != null ? hoaDon.getNgayShip().format(dateTimeFormatter) : null;
        String ngayNhan = hoaDon.getNgayNhan() != null ? hoaDon.getNgayNhan().format(dateTimeFormatter) : null;
        model.addAttribute("ngayThanhToan", ngayThanhToan);
        model.addAttribute("ngayShip", ngayShip);
        model.addAttribute("ngayNhan", ngayNhan);

        //Check ngày nhận hàng thành công < 7 thì được trả, > 7 không được trả
        if (hoaDon.getLoaiHoaDon() == HoaDonRepository.HOA_DON_OFF){
            long soNgayTraHang = ChronoUnit.DAYS.between(hoaDon.getNgayThanhToan(), LocalDateTime.now());
            model.addAttribute("soNgayTraHang", soNgayTraHang);
        }else {
            GiaoHang giaoHang = giaoHangRepo.findByHoaDonId(idHD);
            long soNgayTraHang = giaoHang.getNgayNhan() != null ? ChronoUnit.DAYS.between(giaoHang.getNgayNhan(), LocalDateTime.now()) : 0;
            model.addAttribute("soNgayTraHang", soNgayTraHang);
        }

        //Lấy danh sách CTHD theo idHD & trạng thái chờ trả hàng
        List<CTHDResponse> listCTHDByIdHDAndTrangThai = cthdRepo.getAllCTHDByIdHDAndTrangThai(idHD, CTHDRepository.CHO_TRA_HANG);
        model.addAttribute("listCTHDByTT", listCTHDByIdHDAndTrangThai);

        //Lấy danh sách CTHD theo idHD & trạng thái chờ trả hàng
        List<CTHDResponse> listCTHDByIdHD = cthdRepo.getAllCTHDByIdHD(idHD);
        model.addAttribute("listCTHD", listCTHDByIdHD);

        return "/view/view_doi_hang/hoaDonDoiHang.jsp";
    }

    @PostMapping("san-pham-tra/{idCTHD}")
    public String sanPhamTra(
            Model model,
            @PathVariable("idCTHD") String idCTHD,
            @RequestParam("soLuongTra") Integer soLuongTra
    ){
        System.out.println("=====================================idCTHD: "+idCTHD);
        System.out.println("=====================================soLuongTra: "+soLuongTra);

        ChiTietHoaDon cthd = cthdRepo.findById(idCTHD).get();
        return "redirect:/admin/hoa-don-doi-hang/" + cthd.getIdHoaDon().getId();
    }
}
