package com.example.java4.controller.QLThuocTinh;

import com.example.java4.config.UserInfor;
import com.example.java4.entities.KichThuoc;
import com.example.java4.entities.KieuTay;
import com.example.java4.entities.NhanVien;
import com.example.java4.repositories.KieuTayRepository;
import com.example.java4.repositories.NhanVienRepository;
import com.example.java4.request.ThuocTinhRequest.KieuTayRequest;
import com.example.java4.request.ThuocTinhRequest.MauSacRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/quan-ly-kieu-tay")
public class KieuTayControllerSang {

    @Autowired
    KieuTayRepository kieuTayRepo;
    @Autowired
    NhanVienRepository nhanVienRepo;
    @GetMapping("")
    public String getList(Model model, String keyword, @RequestParam("idKieuTay") Optional<String> idKieutay) {
        if (UserInfor.idNhanVien != null){
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
            KieuTay kieuTay = kieuTayRepo.findByIdKTay(idKieutay);
            if (kieuTay != null) {
                model.addAttribute("kieuTay", kieuTay);
            }

            List<KieuTay> list = kieuTayRepo.findAll();
            if (keyword != null) {
                list = kieuTayRepo.search(keyword);
            }
            model.addAttribute("listKieuTay", list);
            KieuTayRequest request = new KieuTayRequest();
            model.addAttribute("data", request);
            return "/view/QLThuocTinh/kieuTay.jsp";
        }
        else{
            return  "redirect:/admin/dang-nhap-view";
        }
    }

    @PostMapping("/add")
    public String addKieutay(KieuTayRequest request, RedirectAttributes redirectAttributes
    ) {
        int count = kieuTayRepo.countByMa(request.getMa());
        // Tạo mã tự động kiểu số thứ tự
        String maTuDong = "KTAMSS" + (kieuTayRepo.count() + 1);

        KieuTay kieuTay = new KieuTay();
        kieuTay.setMa(maTuDong);
        kieuTay.setTen(request.getTen().trim());
        kieuTay.setNgayTao(LocalDateTime.now().withNano(0));
        kieuTay.setTrangThai(1);
        kieuTayRepo.save(kieuTay);
        redirectAttributes.addFlashAttribute("success", "Thêm kiểu tay thành công");

        return "redirect:/admin/quan-ly-kieu-tay";
    }

    @PostMapping("/update/{id}")
    public String updateKieuTay(@PathVariable("id") String idKieuTay, MauSacRequest request, RedirectAttributes redirectAttributes) {
        KieuTay kieuTay = kieuTayRepo.findById1(idKieuTay);

        kieuTay.setTen(request.getTen().trim());
        kieuTay.setTrangThai(request.getTrangThai());
        kieuTayRepo.save(kieuTay);
        redirectAttributes.addFlashAttribute("success", "Sửa kiểu tay thành công");

        return "redirect:/admin/quan-ly-kieu-tay";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") String id) {
        kieuTayRepo.deleteById(id);
        return "redirect:/admin/quan-ly-kieu-tay";
    }
}
