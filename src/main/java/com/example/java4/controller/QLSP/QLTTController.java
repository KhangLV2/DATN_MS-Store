package com.example.java4.controller.QLSP;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("admin/quan-ly-thuoc-tinh")
public class QLTTController {
    @GetMapping("")
    public String hienThi(Model model, @RequestParam(value = "page", defaultValue = "0") String pageParam) {
        return "/view/QLSP/sanPham.jsp";
    }
    @GetMapping("{idSP}")
    public String detailSP(Model model, @PathVariable String idSP) {
        return "/view/QLSP/detailSP.jsp";
    }
    @GetMapping("add-sp")
    public String addSPView() {
        return "/view/QLSP/addSP.jsp";
    }
}
