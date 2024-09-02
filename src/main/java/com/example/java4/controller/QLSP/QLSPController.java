package com.example.java4.controller.QLSP;
import com.example.java4.config.UserInfor;
import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.entities.NhanVien;
import com.example.java4.repositories.KhuyenMaiRepository;
import com.example.java4.repositories.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
@RequestMapping("admin/quan-ly-san-pham")
public class QLSPController {
    @Autowired
    NhanVienRepository nhanVienRepo;
    @GetMapping("")
    public String hienThi(Model model, @RequestParam(value = "page", defaultValue = "0") String pageParam) {
        if (UserInfor.idNhanVien != null){
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
            return "/view/QLSP/sanPham.jsp";
        }
        else{
            return  "redirect:/admin/dang-nhap-view";
        }
    }
    @GetMapping("{idSP}")
    public String detailSP(Model model, @PathVariable String idSP) {
        if (UserInfor.idNhanVien != null){
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
            return "/view/QLSP/detailSP.jsp";
        }
        else{
            return  "redirect:/admin/dang-nhap-view";
        }
    }
    @GetMapping("add-sp")
    public String addSPView() {
        return "/view/QLSP/addSP.jsp";
    }
}
