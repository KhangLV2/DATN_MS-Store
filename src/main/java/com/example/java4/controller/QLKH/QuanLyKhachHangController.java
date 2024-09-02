package com.example.java4.controller.QLKH;

import com.example.java4.config.UserInfor;
import com.example.java4.entities.ChucVu;
import com.example.java4.entities.DiaChi;
import com.example.java4.entities.KhachHang;
import com.example.java4.entities.NhanVien;
import com.example.java4.repositories.ChucVuRepository;
import com.example.java4.repositories.DiaChiRepository;
import com.example.java4.repositories.KhachHangRepository;
import com.example.java4.repositories.NhanVienRepository;
import com.example.java4.request.req_viet.ChucVuRequest;
import com.example.java4.request.req_viet.KhachHangRequest;
import com.example.java4.request.req_viet.NhanVienRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("admin/quan-ly-khach-hang")
public class QuanLyKhachHangController {
    @Autowired
    KhachHangRepository khachHangRepo;

    @Autowired
    NhanVienRepository nhanVienRepo;

    @Autowired
    DiaChiRepository diaChiRepo;

    @Value("src/main/webapp/imageUser")
    private String fileUpload;

    //Quản lý khách hàng
    @GetMapping("hien-thi")
    public String getQuanLyKhachHang(
            Model model,
            @RequestParam("page") Optional<Integer> pageParam
    ) {
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        }

        Pageable pageable = PageRequest.of(pageParam.orElse(0), 5);
        Page<NhanVien> pageNhanVien = nhanVienRepo.getAlll(pageable);
        List<KhachHang> listKhachHang = khachHangRepo.findAll();
//        List<DiaChi> listChucVuByTrangThai = diaChiRepo.findBy(ChucVuRepository.ACTIVE);
//        model.addAttribute("listChucVu", listChucVuByTrangThai);
        model.addAttribute("listKhachHang", listKhachHang);
        return "/view/QLKH/quanLyKhachHang.jsp";
    }

    @GetMapping("/them-khach-hang-view")
    public String themKhachHangView(
            Model model
    ) {
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        }
        KhachHangRequest khachHangRequest = new KhachHangRequest();
        model.addAttribute("listKhachHang", khachHangRepo.findAll());
        model.addAttribute("khachHang", khachHangRequest);
        return "/view/QLKH/themKhachHang.jsp";
    }

    @PostMapping("them-khach-hang")
    public String themKhachHang(
            @Valid @ModelAttribute("khachHang") KhachHangRequest khReq
    ) {
        KhachHang khachHang = new KhachHang();
        khachHang.setHoTen(khReq.getHoTen().trim());
        khachHang.setSdt(khReq.getSdt());
        khachHang.setEmail(khReq.getEmail().trim());
        khachHang.setNgaySinh(khReq.getNgaySinh());
        khachHang.setGioiTinh(khReq.getGioiTinh());

        // Lấy ra tên ảnh
        String imgName = khReq.getAnhDaiDien().getOriginalFilename();
        try {
            //Lưu ảnh vào file chung
            if (!khReq.getAnhDaiDien().isEmpty()) {
                byte[] bytes = khReq.getAnhDaiDien().getBytes();
                Path path = Paths.get(fileUpload + File.separator + imgName);
                Files.write(path, bytes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (khReq.getAnhDaiDien().isEmpty()){
            khachHang.setAnhDaiDien("png-clipart-user-computer-icons-avatar-miscellaneous-heroes.png");
        }else {
            khachHang.setAnhDaiDien(imgName);
        }

        khachHang.setNgayTao(LocalDateTime.now());
        khachHang.setTrangThai(NhanVienRepository.ACTIVE);
        khachHangRepo.save(khachHang);
        return "redirect:/admin/quan-ly-khach-hang/hien-thi";
    }


    @GetMapping("/sua-khach-hang-view/{id}")
    public String suaKhachHangView(
            Model model,
            @PathVariable("id") KhachHang khachHang
    ) {
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVienTK = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVienTK);
        }
        model.addAttribute("khachHang", khachHang);
        model.addAttribute("listKhachHang", khachHangRepo.findAll());
        return "/view/QLKH/suaKhachHang.jsp";
    }

    @PostMapping("sua-khach-hang/{id}")
    public String suaKhachHang(
            @PathVariable("id") KhachHang khachHang,
            @RequestParam("img") String anhDaiDien,
            @Valid @ModelAttribute("khachHang") KhachHangRequest khReq
    ) {
        khachHang.setId(khachHang.getId());
        khachHang.setHoTen(khReq.getHoTen().trim());
        khachHang.setSdt(khReq.getSdt());
        khachHang.setEmail(khReq.getEmail().trim());
        khachHang.setNgaySinh(khReq.getNgaySinh());
        khachHang.setGioiTinh(khReq.getGioiTinh());

        // Lấy ra tên ảnh
        if (khReq.getAnhDaiDien() == null || khReq.getAnhDaiDien().isEmpty()) {
            khachHang.setAnhDaiDien(anhDaiDien);
        } else {
            // Lấy ra tên ảnh
            String imgName = khReq.getAnhDaiDien().getOriginalFilename();
            try {
                //Lưu ảnh vào file chung
                byte[] bytes = khReq.getAnhDaiDien().getBytes();
                Path path = Paths.get(fileUpload + File.separator + imgName);
                Files.write(path, bytes);
            } catch (Exception e) {
                e.printStackTrace();
            }
            khachHang.setAnhDaiDien(imgName);
        }

        khachHang.setNgaySua(LocalDateTime.now());
        khachHang.setTrangThai(khReq.getTrangThai());
        khachHangRepo.save(khachHang);
        return "redirect:/admin/quan-ly-khach-hang/hien-thi";
    }

    @GetMapping("dia-chi-view/{idKH}")
    public String diaChiView(
            @PathVariable("idKH") String idKH,
            Model model
    ) {
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        }

//        Pageable pageable = PageRequest.of(pageParam.orElse(0), 5);
//        Page<NhanVien> pageNhanVien = nhanVienRepo.getAlll(pageable);
        List<KhachHang> listKhachHang = khachHangRepo.findAll();
        boolean checkDC = true;
        List<DiaChi> listDiaChiByKH = diaChiRepo.findDiaChiByIdKhachHang(idKH);
        if (listDiaChiByKH.isEmpty()){
            checkDC = false;
        }

        //Lấy thông tin khách hàng hiển thị jsp
        KhachHang khachHang = khachHangRepo.findByIdKH(idKH);
        model.addAttribute("khachHang", khachHang);
        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listDiaChi", listDiaChiByKH);
        model.addAttribute("checkDC", checkDC);
        return "/view/QLKH/quanLyKhachHang.jsp";
    }

    @PostMapping("tim-kiem")
    public String timKiem(
            Model model,
            @RequestParam(value = "key", required = false) String key,
            @RequestParam(value = "ngaySinh1", required = false) String ngayBatDau,
            @RequestParam(value = "ngaySinh2", required = false) String ngayKetThuc
    ) {
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        List<KhachHang> listKhachHang = khachHangRepo.findAll();

        if ((key != null || !key.isEmpty()) && (ngayBatDau.isEmpty() && ngayKetThuc.isEmpty())) {
            listKhachHang = khachHangRepo.findByHoTenOrSdtOrEmail(key.trim());
        } else if (key.isEmpty() && (ngayBatDau != null && ngayKetThuc != null)) {
            try {
                listKhachHang = khachHangRepo.findByKhoangNgaySinh(sdf.parse(ngayBatDau), sdf.parse(ngayKetThuc));
            }catch (Exception e){
                e.printStackTrace();
            }
        } else if (!key.isEmpty() && (!ngayBatDau.isEmpty() && !ngayKetThuc.isEmpty())) {
            try {
                listKhachHang = khachHangRepo.findByHoTenOrSdtOrEmail_NgaySinh(key.trim(), sdf.parse(ngayBatDau), sdf.parse(ngayKetThuc));
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        model.addAttribute("listKhachHang", listKhachHang);
        return "/view/QLKH/quanLyKhachHang.jsp";
    }

}
