package com.example.java4.controller.QLThuocTinh;

import com.example.java4.config.UserInfor;
import com.example.java4.entities.ChatLieu;
import com.example.java4.entities.MauSac;
import com.example.java4.entities.NhanVien;
import com.example.java4.repositories.ChatLieuRepository;
import com.example.java4.repositories.MauSacRepository;
import com.example.java4.repositories.NhanVienRepository;
import com.example.java4.request.ThuocTinhRequest.ChatLieuRequest;
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
@RequestMapping("/admin/quan-ly-chat-lieu")
public class ChatLieuControllerSang {

    @Autowired
    ChatLieuRepository chatLieuRepo;
    @Autowired
    NhanVienRepository nhanVienRepo;
    @GetMapping("")
    public String getList(Model model, String keyword, @RequestParam("idChatLieu") Optional<String> idChatLieu) {
        if (UserInfor.idNhanVien != null){
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
            ChatLieu chatLieu = chatLieuRepo.findByIdKTh(idChatLieu);
            if (chatLieu != null) {
                model.addAttribute("chatLieu", chatLieu);
            }
            List<ChatLieu> list = chatLieuRepo.findAll();
            if (keyword != null) {
                list = chatLieuRepo.search(keyword);
            }
            model.addAttribute("listChatLieu", list);
            ChatLieuRequest request = new ChatLieuRequest();
            model.addAttribute("data", request);
            return "/view/QLThuocTinh/chatLieu.jsp";
        }
        else{
            return  "redirect:/admin/dang-nhap-view";
        }
    }

    @PostMapping("/add")
    public String addChatLieu(ChatLieuRequest request, RedirectAttributes redirectAttributes
    ) {
        int count = chatLieuRepo.countByMa(request.getMa());
        // Tạo mã tự động kiểu số thứ tự
        String maTuDong = "CLIMSS" + (chatLieuRepo.count() + 1);

        ChatLieu chatLieu = new ChatLieu();
        chatLieu.setMa(maTuDong);
        chatLieu.setTen(request.getTen().trim());
        chatLieu.setNgayTao(LocalDateTime.now().withNano(0));
        chatLieu.setTrangThai(1);
        chatLieuRepo.save(chatLieu);
        redirectAttributes.addFlashAttribute("success", "Thêm chất liệu thành công");

        return "redirect:/admin/quan-ly-chat-lieu";
    }

    @PostMapping("/update/{id}")
    public String updateChatLieu(@PathVariable("id") String idChatLieu, ChatLieuRequest request, RedirectAttributes redirectAttributes) {
        ChatLieu chatLieu = chatLieuRepo.findById1(idChatLieu);

        chatLieu.setTen(request.getTen().trim());
        chatLieu.setTrangThai(request.getTrangThai());
        chatLieuRepo.save(chatLieu);
        redirectAttributes.addFlashAttribute("success", "Sửa chất liệu thành công");

        return "redirect:/admin/quan-ly-chat-lieu";
    }


    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") String id) {
        chatLieuRepo.deleteById(id);
        return "redirect:/admin/quan-ly-chat-lieu";
    }

}
