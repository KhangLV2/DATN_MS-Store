package com.example.java4.controller.Admin;

import com.example.java4.config.UserInfor;
import com.example.java4.entities.NhanVien;
import com.example.java4.repositories.NhanVienRepository;
import com.example.java4.request.dangNhap.NVSignUpRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    NhanVienRepository nhanVienRepo;
    @GetMapping("dang-nhap-view")
    public String getDangNhapview(Model model){
        NVSignUpRequest nhanVienRequest = new NVSignUpRequest();
        model.addAttribute("nhanVien", nhanVienRequest);
        return "/view/BanHangTaiQuay/dangNhapAdmin.jsp";
    }
    @PostMapping("dang-nhap")
    public String dangNhap(
            Model model,
            @Valid @ModelAttribute("nhanVien") NVSignUpRequest nvReq,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            HttpSession session
    ){
        if (result.hasErrors()){
            System.out.println("Có lỗi");
            System.out.println("result error:"+result.toString());
            return "/view/BanHangTaiQuay/dangNhapAdmin.jsp";
        }

        //Tìm kiếm nhân viên theo tên tài khoản
        boolean checkRole = false;
        NhanVien nhanVienByTK = nhanVienRepo.findByTaiKhoan(nvReq.getTaiKhoan());
        if (nhanVienByTK == null){
            redirectAttributes.addFlashAttribute("error", "Tên tài khoản không tồn tại!");
            return "redirect:/admin/dang-nhap-view";
        }else {
            if (nvReq.getMatKhau().equals(nhanVienByTK.getMatKhau())){
                UserInfor.idNhanVien = nhanVienByTK.getId();
                //Check admin hay nhân viên
                String role = nhanVienByTK.getIdCV().getTen();
                session.setAttribute("userRole", role);
                redirectAttributes.addFlashAttribute("success", "Đăng nhập thành công");
                if (nhanVienByTK.getIdCV().getTen().equals("Quản lý")){
                    return "redirect:/admin/thong-ke/view";
                }else {
                    return "redirect:/admin/ban-hang-tai-quay/hien-thi";
                }

            }else {
                redirectAttributes.addFlashAttribute("error", "Mật khẩu nhập vào chưa đúng!");
                return "redirect:/admin/dang-nhap-view";
            }
        }
    }
}
