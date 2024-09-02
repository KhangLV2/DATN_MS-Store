////package com.example.java4.restcontrollers;
////
//<<<<<<< HEAD
////import org.springframework.stereotype.Controller;
////import org.springframework.web.bind.annotation.RequestMapping;
//=======
////import com.example.java4.request.nhan_vien.StoreRequest;
////import com.example.java4.entities.NhanVienViet;
////import com.example.java4.repositories.NhanVienRepository;
////import jakarta.validation.Valid;
////import org.springframework.beans.factory.annotation.Autowired;
////import org.springframework.data.domain.PageRequest;
////import org.springframework.data.domain.Pageable;
////import org.springframework.stereotype.Controller;
////import org.springframework.ui.Model;
////import org.springframework.validation.BindingResult;
////import org.springframework.web.bind.annotation.*;
////
////import java.util.List;
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////
////@Controller
////@RequestMapping("nhan_vien")
////public class NhanVienController {
////    StoreRequest rem;
////    @Autowired
////    NhanVienRepository nvRepo;
////    public NhanVienController() {
////        this.rem = new StoreRequest();
////    }
////
////
//<<<<<<< HEAD
////        Lấy tất cả các dữ liệu danh sách nhân viên
//=======
////    //    Lấy tất cả các dữ liệu danh sách nhân viên
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////    @GetMapping("/get-all")
////    public List<NhanVienViet> index(Model model) {
////        return nvRepo.findAll();
////    }
////
////    // Lấy dữ liệu đối tượng Nhân Viên theo Id
////    @GetMapping("/detail/{id}")
////    public NhanVienViet detail(@PathVariable("id") Integer id, Model model) {
////        return nvRepo.findById(id).orElse(null);
////    }
////
////    //  Lấy danh sách Nhân Viên có phân trang, 5 phần tử trên 1 trang
////    @GetMapping("/phan-trang")
////    public List<NhanVienViet> page(@RequestParam(value = "page", defaultValue = "0") Integer pageNumber, Model model) {
////        Pageable pageable = PageRequest.of(pageNumber, 5);
////        return nvRepo.findByTrangThai(1, pageable).getContent();
////    }
////
////
////    //    Chức năng thêm mới Nhân Viên
////    @PostMapping("/create")
////    public String create(
////            @RequestBody @Valid StoreRequest nhanVienRequest,
////            BindingResult result
////    ) {
////
////        if (result.hasErrors()) {
////            System.out.println(result.getFieldError().getDefaultMessage());
////            return "Thêm mới nhân viên thất bại";
////        } else {
////            NhanVienViet nhanVien = new NhanVienViet();
////            nhanVien.setMa(nhanVienRequest.getMa());
////            nhanVien.setTen(nhanVienRequest.getTen());
////            nhanVien.setTenDangNhap(nhanVienRequest.getTenDangNhap());
////            nhanVien.setMatKhau(nhanVienRequest.getMatKhau());
////            nhanVien.setTrangThai(nhanVienRequest.getTrangThai());
////            nvRepo.save(nhanVien);
////            return "Thêm mới nhân viên thành công";
////        }
////    }
////
////
////    //    Chức năng cập nhật nhân viên
////    @PutMapping("/update-nhanvien")
////    public String doUpdate(
////            @RequestBody @Valid StoreRequest nhanVienRequest,
////            BindingResult result
////    ) {
////        if (result.hasErrors()) {
////            System.out.println(result.getFieldError().getDefaultMessage());
////            return "Sửa nhân viên thất bại";
////        } else {
////
////            NhanVienViet nhanVien = new NhanVienViet();
////            nhanVien.setId(nhanVienRequest.getId());
////            nhanVien.setMa(nhanVienRequest.getMa());
////            nhanVien.setTen(nhanVienRequest.getTen());
////            nhanVien.setTenDangNhap(nhanVienRequest.getTenDangNhap());
////            nhanVien.setMatKhau(nhanVienRequest.getMatKhau());
////            nhanVien.setTrangThai(nhanVienRequest.getTrangThai());
////            nvRepo.save(nhanVien);
////            return "Sửa nhân viên thành công";
////        }
////    }
////
////    //    Chức năng xóa màu sắc
////    @DeleteMapping("/delete-mauSac/{id}")
////    public String delete(@PathVariable(value = "id") NhanVienViet nhanVien) {
////
////        if (nhanVien == null) {
////            return "Xóa nhân viên thất bại";
////        }
////
////        nvRepo.delete(nhanVien);
////        return "Xóa nhân viên thành công ";
////    }
////
////}