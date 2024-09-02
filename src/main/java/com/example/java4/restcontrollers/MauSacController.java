////package com.example.java4.restcontrollers;
////
//<<<<<<< HEAD
////import com.example.java4.entities.MauSac;
////import com.example.java4.repositories.MauSacRepository;
//=======
////import com.example.java4.request.mau_sac.StoreRequest;
////import com.example.java4.entities.MauSac;
////import com.example.java4.repositories.MauSacRepository;
////import jakarta.validation.Valid;
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////import org.springframework.beans.factory.annotation.Autowired;
////import org.springframework.data.domain.PageRequest;
////import org.springframework.data.domain.Pageable;
////import org.springframework.http.ResponseEntity;
////import org.springframework.ui.Model;
//<<<<<<< HEAD
//=======
////import org.springframework.validation.BindingResult;
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////import org.springframework.web.bind.annotation.*;
////
////import java.util.ArrayList;
////import java.util.List;
////
////@RestController
////@RequestMapping("mau_sac")
////public class MauSacController {
//<<<<<<< HEAD
//////    ArrayList<StoreRequest> ds;
//////    MauSac msRem = new MauSac();
//////    StoreRequest msRemUpdate = new StoreRequest();
//=======
////    ArrayList<StoreRequest> ds;
////    MauSac msRem = new MauSac();
////    StoreRequest msRemUpdate = new StoreRequest();
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////
////
////    @Autowired
////    private MauSacRepository msRepo;
////
////
////    public MauSacController() {
////        System.out.println("start new cycle");
////        this.ds = new ArrayList<>();
////    }
////
//<<<<<<< HEAD
////        Lấy tất cả các dữ liệu danh sách màu sắc
//=======
////    //    Lấy tất cả các dữ liệu danh sách màu sắc
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////    @GetMapping("/get-all")
////    public ResponseEntity<List<MauSac>> index(Model model) {
////        return ResponseEntity.ok(msRepo.findAll());
////    }
////
////    // Lấy dữ liệu đối tượng Màu Sắc theo Id
////    @GetMapping("/detail/{id}")
////    public MauSac detail(@PathVariable("id") Integer id, Model model) {
////        return msRepo.findById(id).orElse(null);
////    }
////
////    //  Lấy danh sách Màu Sắc có phân trang, 5 phần tử trên 1 trang
////    @GetMapping("/phan-trang")
////    public List<MauSac> page(@RequestParam(value = "page", defaultValue = "0") Integer pageNumber, Model model) {
////        Pageable pageable = PageRequest.of(pageNumber, 5);
////        return msRepo.findByTrangThai(1, pageable).getContent();
////    }
////
////
////    //    Chức năng thêm mới màu sắc
//<<<<<<< HEAD
//////    @PostMapping("/create")
//////    public String create(
//////            @RequestBody @Valid StoreRequest mauSacRequest,
//////            BindingResult result
//////    ) {
//////
//////        if (result.hasErrors()) {
//////            System.out.println(result.getFieldError().getDefaultMessage());
//////            return "Thêm mới màu sắc thất bại";
//////        } else {
//////            MauSac mauSac = new MauSac();
//////            mauSac.setTen(mauSacRequest.getTen());
//////            mauSac.setMa(mauSacRequest.getMa());
//////            mauSac.setTrangThai(mauSacRequest.getTrangThai());
//////            msRepo.save(mauSac);
//////            return "Thêm mới màu sắc thành công";
//////        }
//////    }
//////
//////
//////    //    Chức năng cập nhật màu sắc
//////    @PutMapping("/update-mauSac")
//////    public String doUpdate(
//////            @RequestBody @Valid StoreRequest mauSacRequest,
//////            BindingResult result
//////    ) {
//////        if (result.hasErrors()) {
//////            System.out.println(result.getFieldError().getDefaultMessage());
//////            return "Sửa màu sắc thất bại";
//////        } else {
//////
//////            MauSac mauSac = new MauSac();
//////            System.out.println("update post check id:" + mauSac.getId());
//////            mauSac.setId(mauSacRequest.getId());
//////            mauSac.setTen(mauSacRequest.getTen());
//////            mauSac.setMa(mauSacRequest.getMa());
//////            mauSac.setTrangThai(mauSacRequest.getTrangThai());
//////            msRepo.save(mauSac);
//////            return "Sửa màu sắc thành công";
//////        }
//////    }
//////
//////    //    Chức năng xóa màu sắc
//////    @DeleteMapping("/delete-mauSac/{id}")
//////    public String delete(@PathVariable(value = "id") MauSac ms) {
//////
//////        if (ms == null) {
//////            return "Xóa màu sắc thất bại";
//////        }
//////
//////        msRepo.delete(ms);
//////        return "Xóa màu sắc thành công ";
//////    }
//=======
////    @PostMapping("/create")
////    public String create(
////            @RequestBody @Valid StoreRequest mauSacRequest,
////            BindingResult result
////    ) {
////
////        if (result.hasErrors()) {
////            System.out.println(result.getFieldError().getDefaultMessage());
////            return "Thêm mới màu sắc thất bại";
////        } else {
////            MauSac mauSac = new MauSac();
////            mauSac.setTen(mauSacRequest.getTen());
////            mauSac.setMa(mauSacRequest.getMa());
////            mauSac.setTrangThai(mauSacRequest.getTrangThai());
////            msRepo.save(mauSac);
////            return "Thêm mới màu sắc thành công";
////        }
////    }
////
////
////    //    Chức năng cập nhật màu sắc
////    @PutMapping("/update-mauSac")
////    public String doUpdate(
////            @RequestBody @Valid StoreRequest mauSacRequest,
////            BindingResult result
////    ) {
////        if (result.hasErrors()) {
////            System.out.println(result.getFieldError().getDefaultMessage());
////            return "Sửa màu sắc thất bại";
////        } else {
////
////            MauSac mauSac = new MauSac();
////            System.out.println("update post check id:" + mauSac.getId());
////            mauSac.setId(mauSacRequest.getId());
////            mauSac.setTen(mauSacRequest.getTen());
////            mauSac.setMa(mauSacRequest.getMa());
////            mauSac.setTrangThai(mauSacRequest.getTrangThai());
////            msRepo.save(mauSac);
////            return "Sửa màu sắc thành công";
////        }
////    }
////
////    //    Chức năng xóa màu sắc
////    @DeleteMapping("/delete-mauSac/{id}")
////    public String delete(@PathVariable(value = "id") MauSac ms) {
////
////        if (ms == null) {
////            return "Xóa màu sắc thất bại";
////        }
////
////        msRepo.delete(ms);
////        return "Xóa màu sắc thành công ";
////    }
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////
////
////}