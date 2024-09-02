package com.example.java4.controller.QLThuocTinh;

import com.example.java4.config.UserInfor;
import com.example.java4.entities.ChatLieu;
import com.example.java4.entities.KichThuoc;
import com.example.java4.entities.NhanVien;
import com.example.java4.repositories.KichThuocRepository;
import com.example.java4.repositories.NhanVienRepository;
import com.example.java4.request.ThuocTinhRequest.ChatLieuRequest;
import com.example.java4.request.ThuocTinhRequest.KichThuocRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/quan-ly-kich-thuoc")
public class KichThuocControllerSang {

    @Autowired
    KichThuocRepository kichThuocRepo;
    @Autowired
    NhanVienRepository nhanVienRepo;
    @GetMapping("")
    public String getList(Model model, String keyword, @RequestParam("idKichThuoc") Optional<String> idKichThuoc) {
        if (UserInfor.idNhanVien != null){
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
            KichThuoc kichThuoc = kichThuocRepo.findByIdKTh(idKichThuoc);
            if (kichThuoc != null) {
                model.addAttribute("kichThuoc", kichThuoc);
            }

            List<KichThuoc> list = kichThuocRepo.findAll();
            if (keyword != null) {
                list = kichThuocRepo.search(keyword);
            }
            model.addAttribute("listKichThuoc", list);
            KichThuoc request = new KichThuoc();
            model.addAttribute("data", request);
            return "/view/QLThuocTinh/kichThuoc.jsp";
        }
        else{
            return  "redirect:/admin/dang-nhap-view";
        }
    }

    @PostMapping("/add")
    public String addKichThuoc(KichThuocRequest request, RedirectAttributes redirectAttributes
    ) {
        int count = kichThuocRepo.countByMa(request.getMa());
        // Tạo mã tự động kiểu số thứ tự
        String maTuDong = "KTHMSS" + (kichThuocRepo.count() + 1);

        KichThuoc kichThuoc = new KichThuoc();
        kichThuoc.setMa(maTuDong);
        kichThuoc.setTen(request.getTen().trim());
        kichThuoc.setNgayTao(LocalDateTime.now().withNano(0));
        kichThuoc.setTrangThai(1);
        kichThuocRepo.save(kichThuoc);
        redirectAttributes.addFlashAttribute("success", "Thêm kích thước thành công");

        return "redirect:/admin/quan-ly-kich-thuoc";
    }

    @PostMapping("/update/{id}")
    public String updateKichThuoc(@PathVariable("id") String idKichThuoc, KichThuocRequest request, RedirectAttributes redirectAttributes) {
        KichThuoc kichThuoc = kichThuocRepo.findById1(idKichThuoc);

        kichThuoc.setTen(request.getTen().trim());
        kichThuoc.setTrangThai(request.getTrangThai());
        kichThuocRepo.save(kichThuoc);
        redirectAttributes.addFlashAttribute("success", "Sửa kích thước thành công");

        return "redirect:/admin/quan-ly-kich-thuoc";
    }


    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") String id) {
        kichThuocRepo.deleteById(id);
        return "redirect:/admin/quan-ly-kich-thuoc";
    }

}
