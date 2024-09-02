package com.example.java4.controller.controller_tai;
import com.example.java4.config.UserInfor;
import com.example.java4.entities.KhachHang;
import com.example.java4.repositories.KhachHangRepository;
import com.example.java4.request.req_tai.KhachHangDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    KhachHangRepository khachHangRepository;

    @GetMapping("")
    public String home(Model model) {
        // Khởi tạo khachHangDTO mới nếu chưa tồn tại
        if (!model.containsAttribute("khachHangDTO")) {
            model.addAttribute("khachHangDTO", new KhachHangDTO());
        }
        return "/view/view_tai/home/trangChu.jsp";
    }


    // Hiển thị giao diện đăng nhâp của User
    @GetMapping("/login")
    public String view(Model model) {
        if (!model.containsAttribute("khachHangDTO")) {
            model.addAttribute("khachHangDTO", new KhachHangDTO());
        }
        return "/view/view_tai/home/trangChu.jsp";
    }

    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> login( @ModelAttribute("khachHangDTO") KhachHangDTO khachHangDTO,
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
                response.put("redirectUrl", "/home");
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
        return "redirect:/home";
    }

    @PostMapping("/register")
    public String register( @ModelAttribute("khachHangDTO") KhachHangDTO khachHangDTO,
                           BindingResult result,
                           RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("registerErrors", result.getAllErrors());
            return "redirect:/home";
        }

        KhachHang existingUser = khachHangRepository.findByTaiKhoan(khachHangDTO.getTaiKhoan());
        if (existingUser != null) {
            redirectAttributes.addFlashAttribute("registerErrors", "Username already exists");
            return "redirect:/home";
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
        return "redirect:/home";
    }
}