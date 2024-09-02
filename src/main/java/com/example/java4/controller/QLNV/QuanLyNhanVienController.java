package com.example.java4.controller.QLNV;

import com.example.java4.config.UserInfor;
import com.example.java4.entities.ChucVu;
import com.example.java4.entities.NhanVien;
import com.example.java4.repositories.ChucVuRepository;
import com.example.java4.repositories.NhanVienRepository;
import com.example.java4.request.req_viet.ChucVuRequest;
import com.example.java4.request.req_viet.NhanVienRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("admin/quan-ly-nhan-vien")
public class QuanLyNhanVienController {
    @Autowired
    NhanVienRepository nhanVienRepo;

    @Autowired
    ChucVuRepository chucVuRepo;

    @Value("src/main/webapp/imageUser")
    private String fileUpload;

    //Quản lý nhân viên
    @GetMapping("hien-thi")
    public String getQuanLyNhanVien(
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
        List<NhanVien> listNhanVien = nhanVienRepo.findAll();
        List<ChucVu> listChucVuByTrangThai = chucVuRepo.findByTrangThai(ChucVuRepository.ACTIVE);
        model.addAttribute("listChucVu", listChucVuByTrangThai);
        model.addAttribute("listNhanVien", listNhanVien);
        return "/view/QLNV/quanLyNhanVien.jsp";
    }

    //update trạng thái
    @GetMapping("/sua-trang-thai/{id}")
    public String updateTrangThaiOff(@PathVariable("id") NhanVien nhanVien) {
        if (nhanVien.getTrangThai() == NhanVienRepository.ACTIVE) {
            nhanVien.setTrangThai(NhanVienRepository.INACTIVE);
            nhanVienRepo.save(nhanVien);
        } else {
            nhanVien.setTrangThai(NhanVienRepository.ACTIVE);
            nhanVienRepo.save(nhanVien);
        }
        return "redirect:/admin/quan-ly-nhan-vien/hien-thi";
    }

    @GetMapping("/them-nhan-vien-view")
    public String themNhanVienView(
            Model model
    ) {
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        }
        NhanVienRequest nhanVienRequest = new NhanVienRequest();
        model.addAttribute("nhanVien", nhanVienRequest);
        ChucVuRequest chucVuRequest = new ChucVuRequest();
        model.addAttribute("chucVu", chucVuRequest);
        List<ChucVu> listChucVuByTrangThai = chucVuRepo.findByTrangThai(ChucVuRepository.ACTIVE);
        List<ChucVu> listChucVuAll = chucVuRepo.getAlll();
        model.addAttribute("listNhanVien", nhanVienRepo.findAll());
        model.addAttribute("listChucVuAll", listChucVuAll);
        model.addAttribute("listChucVuByTT", listChucVuByTrangThai);
        return "/view/QLNV/themNhanVien.jsp";
    }

    @PostMapping("them-nhan-vien")
    public String themNhanVien(
            @Valid @ModelAttribute("nhanVien") NhanVienRequest nvReq
    ) {
        ChucVu chucVu = chucVuRepo.findById(nvReq.getIdCV()).get();
        NhanVien nhanVien = new NhanVien();
        nhanVien.setHoTen(nvReq.getHoTen().trim());
        nhanVien.setSdt(nvReq.getSdt());
        nhanVien.setNgaySinh(nvReq.getNgaySinh());
        nhanVien.setGioiTinh(nvReq.getGioiTinh());
        nhanVien.setTaiKhoan(nvReq.getTaiKhoan().trim());
        nhanVien.setMatKhau(nvReq.getMatKhau());
        nhanVien.setIdCV(chucVu);

        // Lấy ra tên ảnh
        String imgName = nvReq.getAnhDaiDien().getOriginalFilename();
        try {
            //Lưu ảnh vào file chung
            if (!nvReq.getAnhDaiDien().isEmpty()) {
                byte[] bytes = nvReq.getAnhDaiDien().getBytes();
                Path path = Paths.get(fileUpload + File.separator + imgName);
                Files.write(path, bytes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (nvReq.getAnhDaiDien().isEmpty()) {
            nhanVien.setAnhDaiDien("png-clipart-user-computer-icons-avatar-miscellaneous-heroes.png");
        } else {
            nhanVien.setAnhDaiDien(imgName);
        }
        nhanVien.setNgayTao(LocalDateTime.now());
        nhanVien.setTrangThai(NhanVienRepository.ACTIVE);
        nhanVienRepo.save(nhanVien);
        return "redirect:/admin/quan-ly-nhan-vien/hien-thi";
    }

    @PostMapping("them-chuc-vu")
    public String themChucVu(
            @Valid @ModelAttribute("chucVu") ChucVuRequest cvReq
    ) {
        ChucVu chucVu = new ChucVu();
        chucVu.setTen(cvReq.getTen().trim());
        chucVu.setNgayTao(LocalDateTime.now());
        chucVu.setTrangThai(ChucVuRepository.ACTIVE);
        chucVuRepo.save(chucVu);
        return "redirect:/admin/quan-ly-nhan-vien/them-nhan-vien-view";
    }

    @PostMapping("sua-chuc-vu/{id}")
    public String suaChucVuView(
            Model model,
            @PathVariable("id") ChucVu chucVu,
            @RequestParam("ten") String ten,
            @RequestParam("trangThai") Integer trangThai
    ) {
        chucVu.setId(chucVu.getId());
        chucVu.setTen(ten.trim());
        chucVu.setNgaySua(LocalDateTime.now());
        chucVu.setTrangThai(trangThai);
        chucVuRepo.save(chucVu);
        return "redirect:/admin/quan-ly-nhan-vien/them-nhan-vien-view";
    }


    @GetMapping("/sua-nhan-vien-view/{id}")
    public String suaNhanVienView(
            Model model,
            @PathVariable("id") NhanVien nhanVien
    ) {
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVienTK = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVienTK);
        }
        List<ChucVu> listChucVu = chucVuRepo.findByTrangThai(ChucVuRepository.ACTIVE);
        model.addAttribute("nhanVien", nhanVien);
        model.addAttribute("listChucVu", listChucVu);
        model.addAttribute("listNhanVien", nhanVienRepo.findAll());
        return "/view/QLNV/suaNhanVien.jsp";
    }

    @PostMapping("sua-nhan-vien/{id}")
    public String suaNhanVien(
            @PathVariable("id") NhanVien nhanVien,
            @RequestParam("img") String anhDaiDien,
            @Valid @ModelAttribute("nhanVien") NhanVienRequest nvReq
    ) {

        ChucVu chucVu = chucVuRepo.findById(nvReq.getIdCV()).get();
        nhanVien.setId(nhanVien.getId());
        nhanVien.setHoTen(nvReq.getHoTen().trim());
        nhanVien.setSdt(nvReq.getSdt());
        nhanVien.setNgaySinh(nvReq.getNgaySinh());
        nhanVien.setGioiTinh(nvReq.getGioiTinh());
        nhanVien.setTaiKhoan(nvReq.getTaiKhoan().trim());
        nhanVien.setMatKhau(nvReq.getMatKhau());
        nhanVien.setIdCV(chucVu);

        if (nvReq.getAnhDaiDien() == null || nvReq.getAnhDaiDien().isEmpty()){
            nhanVien.setAnhDaiDien(anhDaiDien);
        }else {
            // Lấy ra tên ảnh
            String imgName = nvReq.getAnhDaiDien().getOriginalFilename();
            try {
                //Lưu ảnh vào file chung
                byte[] bytes = nvReq.getAnhDaiDien().getBytes();
                Path path = Paths.get(fileUpload + File.separator + imgName);
                Files.write(path, bytes);
            } catch (Exception e) {
                e.printStackTrace();
            }
            nhanVien.setAnhDaiDien(imgName);
        }

        nhanVien.setNgaySua(LocalDateTime.now());
        nhanVien.setTrangThai(nvReq.getTrangThai());
        nhanVienRepo.save(nhanVien);
        return "redirect:/admin/quan-ly-nhan-vien/hien-thi";
    }

    @PostMapping("tim-kiem")
    public String timKiem(
            Model model,
            @RequestParam(value = "key", required = false) String key,
            @RequestParam(value = "idCV", required = false) String idCV
    ) {
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        }

        List<NhanVien> listNhanVien = nhanVienRepo.findAll();

        if ((key != null || !key.isEmpty()) && idCV.isEmpty()) {
            listNhanVien = nhanVienRepo.findByHoTenOrSdt(key.trim());
        } else if (key.isEmpty()) {
            listNhanVien = nhanVienRepo.findByChucVu(idCV);
        } else if (!key.isEmpty() && !idCV.isEmpty()) {
            listNhanVien = nhanVienRepo.findByHoTenOrSdtAndChucVu(key.trim(), idCV);
        }

        List<ChucVu> listChucVuByTrangThai = chucVuRepo.findByTrangThai(ChucVuRepository.ACTIVE);
        model.addAttribute("listChucVu", listChucVuByTrangThai);
        model.addAttribute("listNhanVien", listNhanVien);
        return "/view/QLNV/quanLyNhanVien.jsp";
    }


    @GetMapping("/tai-khoan-cua-toi/{id}")
    public String taiKhoanDangNhap(
            Model model,
            @PathVariable("id") NhanVien nhanVien
    ) {
        //Hiển thị thông tin nhân viên đăng nhập
        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVienTK = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVienTK);
        }
        List<ChucVu> listChucVu = chucVuRepo.findByTrangThai(ChucVuRepository.ACTIVE);
        model.addAttribute("nhanVien", nhanVien);
        model.addAttribute("listChucVu", listChucVu);
        model.addAttribute("listNhanVien", nhanVienRepo.findAll());
        return "/view/QLNV/taiKhoanDangNhap.jsp";
    }

    @PostMapping("sua-tai-khoan-cua-toi/{id}")
    public String suaTaiKhoanDangNhap(
            @PathVariable("id") NhanVien nhanVien,
            @RequestParam("img") String anhDaiDien,
            @Valid @ModelAttribute("nhanVien") NhanVienRequest nvReq
    ) {

        ChucVu chucVu = chucVuRepo.findById(nvReq.getIdCV()).get();
        nhanVien.setId(nhanVien.getId());
        nhanVien.setHoTen(nvReq.getHoTen().trim());
        nhanVien.setSdt(nvReq.getSdt());
        nhanVien.setNgaySinh(nvReq.getNgaySinh());
        nhanVien.setGioiTinh(nvReq.getGioiTinh());
        nhanVien.setTaiKhoan(nvReq.getTaiKhoan().trim());
        nhanVien.setMatKhau(nvReq.getMatKhau());
        nhanVien.setIdCV(chucVu);

        if (nvReq.getAnhDaiDien() == null || nvReq.getAnhDaiDien().isEmpty()){
            nhanVien.setAnhDaiDien(anhDaiDien);
        }else {
            // Lấy ra tên ảnh
            String imgName = nvReq.getAnhDaiDien().getOriginalFilename();
            try {
                //Lưu ảnh vào file chung
                byte[] bytes = nvReq.getAnhDaiDien().getBytes();
                Path path = Paths.get(fileUpload + File.separator + imgName);
                Files.write(path, bytes);
            } catch (Exception e) {
                e.printStackTrace();
            }
            nhanVien.setAnhDaiDien(imgName);
        }

        nhanVien.setNgaySua(LocalDateTime.now());
        nhanVien.setTrangThai(nvReq.getTrangThai());
        nhanVienRepo.save(nhanVien);
        return "redirect:/admin/quan-ly-nhan-vien/hien-thi";
    }
}
