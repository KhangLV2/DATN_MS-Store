package com.example.java4.controller.QLThuocTinh;

import com.example.java4.config.UserInfor;
import com.example.java4.entities.KieuTay;
import com.example.java4.entities.MauSac;
import com.example.java4.entities.NhanVien;
import com.example.java4.repositories.MauSacRepository;
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
@RequestMapping("/admin/quan-ly-mau-sac")
public class MauSacControllerSang {

    @Autowired
    MauSacRepository mauSacRepo;
    @Autowired
    NhanVienRepository nhanVienRepo;
    @GetMapping("")
    public String getList(Model model, String keyword, @RequestParam("idMauSac") Optional<String> idMauSac) {
        if (UserInfor.idNhanVien != null){
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
            MauSac mauSac = mauSacRepo.findByIdMS(idMauSac);
            if (mauSac != null) {
                model.addAttribute("mauSac", mauSac);
            }
            List<MauSac> list = mauSacRepo.findAll();
            if (keyword != null) {
                list = mauSacRepo.search(keyword);
            }
            model.addAttribute("listMauSac", list);
            MauSacRequest request = new MauSacRequest();
            model.addAttribute("data", request);
            return "/view/QLThuocTinh/mauSac.jsp";
        }
        else{
            return  "redirect:/admin/dang-nhap-view";
        }
    }

    @PostMapping("/add")
    public String addMauSac(MauSacRequest request, RedirectAttributes redirectAttributes
    ) {
        int count = mauSacRepo.countByMa(request.getMa());
        // Tạo mã tự động kiểu "MS" + số thứ tự
        String maTuDong = "MSAMSS" + (mauSacRepo.count() + 1);

        MauSac mauSac = new MauSac();
        mauSac.setMa(maTuDong);
        mauSac.setTen(request.getTen().trim());
        mauSac.setNgayTao(LocalDateTime.now().withNano(0));
        mauSac.setTrangThai(1);
        mauSacRepo.save(mauSac);
        redirectAttributes.addFlashAttribute("success", "Thêm màu sắc thành công");

        return "redirect:/admin/quan-ly-mau-sac";
    }

    @PostMapping("/update/{id}")
    public String updateMauSac(@PathVariable("id") String idMauSac, MauSacRequest request, RedirectAttributes redirectAttributes) {
        MauSac mauSac = mauSacRepo.findById1(idMauSac);

        mauSac.setTen(request.getTen().trim());
        mauSac.setTrangThai(request.getTrangThai());
        mauSacRepo.save(mauSac);
        redirectAttributes.addFlashAttribute("success", "Sửa màu sắc thành công");

        return "redirect:/admin/quan-ly-mau-sac";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") String id) {
        mauSacRepo.deleteById(id);
        return "redirect:/admin/quan-ly-mau-sac";
    }
}
