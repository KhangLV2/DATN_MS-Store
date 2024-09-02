////package com.example.java4.restcontrollers;
////
//<<<<<<< HEAD
////import com.example.java4.entities.HoaDon;
////import com.example.java4.entities.SPCT;
////import com.example.java4.repositories.*;
//=======
////import com.example.java4.request.sale.NewHDCTRequest;
////import com.example.java4.entities.*;
////import com.example.java4.repositories.*;
////import jakarta.validation.Valid;
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////import org.springframework.beans.factory.annotation.Autowired;
////import org.springframework.data.domain.Page;
////import org.springframework.data.domain.PageRequest;
////import org.springframework.data.domain.Pageable;
////import org.springframework.stereotype.Controller;
////import org.springframework.ui.Model;
////import org.springframework.validation.BindingResult;
////import org.springframework.web.bind.annotation.*;
////
//<<<<<<< HEAD
//=======
////import java.sql.Date;
////import java.sql.Timestamp;
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////import java.util.Optional;
////
////@Controller
////@RequestMapping("sale")
////public class SaleController {
////    Integer idHDState = null;
////    @Autowired
////    HoaDonRepository hdRepo;
////    @Autowired
////    SPCTRepository spctRepo;
////    @Autowired
////    HDCTRepository hdctRepo;
////    @Autowired
////    NhanVienRepository nvRepo;
////    @Autowired
////    KhachHangRepository khRepo;
////    @Autowired
////    HoaDonRepository hdBaseRepo;
////    @Autowired
////    HDCTRepository hdctBaseRepo;
////    @Autowired
////    SPCTRepository spctBaseRepo;
////    public SaleController() {
////    }
////    @GetMapping("/create")
////    public String create(Model model, @RequestParam("page") Optional<Integer> pageParams) {
////        int page = pageParams.orElse(0);
////        Pageable p = PageRequest.of(page, 5);
//<<<<<<< HEAD
////        Page<SPCT> pageData = spctRepo.findByTrangThai(MauSacRepository.ACTIVE, p);
//=======
////        Page<SPCT> pageData = spctRepo.findByTrangThai(MauSacRepository.ACTIVE, p);
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////        model.addAttribute("dsHoaDon", hdRepo.selectTop5());
////        model.addAttribute("pageData", pageData);
////        model.addAttribute("dsHDCT",hdctRepo.findAllByHoaDon_Id(idHDState));
////        if (idHDState != null) {
////            try {
////                System.out.println("select hd");
////                model.addAttribute("hoaDon", hdRepo.findById(idHDState).get());
////            } catch (Exception e) {
////                e.printStackTrace();
////            }
////        }
////        return "admin/sale/MainView";
////    }
////
////    @GetMapping("/addNewHD")
////    public String addNewHD(Model model) {
////        HoaDon hd = new HoaDon(null, 1, 1, new Date(System.currentTimeMillis()), 0);
////        hdBaseRepo.save(hd);
////        return "redirect:/sale/create";
////    }
////
////    @GetMapping("/addToCart/{id}")
//<<<<<<< HEAD
////    public String addToCart(Model model, @PathVariable(value = "id") SPCT spct) {
//=======
////    public String addToCart(Model model, @PathVariable(value = "id") SPCT spct) {
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////        Integer idSPCT = spct.getId();
////        spct.setSoLuong(spct.getSoLuong()-1);
////        System.out.println("test spct: "+spct.getId());
////        HDCT hdct = new HDCT(null, idHDState, idSPCT, 1, (int) spctBaseRepo.findById(idSPCT).get().getDonGia(), new Timestamp(System.currentTimeMillis()), 1);
////        hdctBaseRepo.save(hdct);
////        spctBaseRepo.save(spct);
////        return "redirect:/sale/create";
////    }
////
////    @GetMapping("/check/{id}")
////    public String check(Model model, @PathVariable(value = "id") HoaDon hd) {
////        System.out.println("check bill: " + hd.getId());
////        hd.setTrangThai(1);
////        hdBaseRepo.save(hd);
////        return "redirect:/sale/create";
////    }
////
////    @GetMapping("/index")
////    public String index(Model model, @RequestParam("page") Optional<Integer> pageParams) {
////        int page = pageParams.orElse(0);
////        Pageable p = PageRequest.of(page, 5);
//<<<<<<< HEAD
////        Page<SPCT> pageData = spctRepo.findByTrangThai(MauSacRepository.ACTIVE, p);
//=======
////        Page<SPCT> pageData = spctRepo.findByTrangThai(MauSacRepository.ACTIVE, p);
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////        model.addAttribute("pageData", pageData);
////        return "admin/ql_spct/Index";
////    }
////
////    @GetMapping("/select/{id}")
////    public String index(Model model, @PathVariable(value = "id") String id) {
////        idHDState = Integer.parseInt(id);
////        return "redirect:/sale/create";
////    }
////
////    @GetMapping("/delete/{id}")
////    public String delete(Model model, @PathVariable(value = "id") String id) {
////        return "redirect:/spct/index";
////    }
////
////    @PostMapping("store")
////    public String Store(
////            @Valid @ModelAttribute("data") NewHDCTRequest req,
////            BindingResult result, Model model
////    ) {
////        return "redirect:/spct/create";
////    }
////}