////package com.example.java4.restcontrollers;
////
//<<<<<<< HEAD
////import com.example.java4.entities.KhachHang;
////import com.example.java4.repositories.KhachHangRepository;
////import org.springframework.beans.factory.annotation.Autowired;
////import org.springframework.web.bind.annotation.DeleteMapping;
////import org.springframework.web.bind.annotation.PathVariable;
////import org.springframework.web.bind.annotation.RestController;
//=======
////import com.example.java4.request.khach_hang.StoreRequest;
////import com.example.java4.entities.KhachHang;
////import com.example.java4.repositories.KhachHangRepository;
////import jakarta.validation.Valid;
////import org.springframework.beans.factory.annotation.Autowired;
////import org.springframework.validation.BindingResult;
////import org.springframework.web.bind.annotation.*;
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////
////import java.util.List;
////
////@RestController
////public class KhachHangController {
//<<<<<<< HEAD
////        @RequestMapping(name="login", method = RequestMethod.POST)
//=======
////    //    @RequestMapping(name="login", method = RequestMethod.POST)
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////    List<KhachHang> ds;
////    StoreRequest rem;
////    @Autowired
////    KhachHangRepository khRepo;
////
////    public KhachHangController() {
////        this.rem = new StoreRequest();
////    }
////
////    @GetMapping("/getList")
////    public List<KhachHang> getList() {
////        return khRepo.findAll();
////    }
////
////    @GetMapping("/detail/{id}")
////    public KhachHang detailKhachHang(@PathVariable("id") Integer id) {
////        return khRepo.findById(id).get();
////    }
////
////    @PostMapping("/add")
////    public String addKhachHang(@Valid @RequestBody StoreRequest request, BindingResult result) {
////        if (result.hasErrors()) {
////            System.out.println(result.getFieldError().getDefaultMessage());
////            return "Thêm thất bại";
////        } else {
////            KhachHang kh = new KhachHang();
////            kh.setMa(request.getMa());
////            kh.setTen(request.getTen());
////            kh.setSdt(request.getSdt());
////            kh.setTrangThai(request.getTrangThai());
////            khRepo.save(kh);
////            return "Thêm thành công";
////        }
////    }
////
////    @PutMapping("/update")
////    public String updateKhachHang(@Valid @RequestBody StoreRequest request, BindingResult result) {
////        if (result.hasErrors()) {
////            System.out.println(result.getFieldError().getDefaultMessage());
////            return "Sửa thất bại";
////        } else {
////            KhachHang kh = new KhachHang();
////            kh.setId(request.getId());
////            kh.setMa(request.getMa());
////            kh.setTen(request.getTen());
////            kh.setSdt(request.getSdt());
////            kh.setTrangThai(request.getTrangThai());
////            khRepo.save(kh);
////            return "Sửa thành công";
////        }
////    }
////
////    @DeleteMapping("/delete/{id}")
////    public String deleteKhachHang(@PathVariable("id") Integer id) {
////        khRepo.deleteById(id);
////        return "Xóa thành công";
////    }
////}