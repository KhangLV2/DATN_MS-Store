package com.example.java4.controller.QLKM;

import com.example.java4.entities.KhuyenMai;
import com.example.java4.entities.SanPham;
import com.example.java4.repositories.KhuyenMaiRepository;
import com.example.java4.repositories.SanPhamRepository;
import com.example.java4.request.QLKM.Store.KhuyenMaiStore;
import com.example.java4.request.QLKM.Update.KhuyenMaiUpdate;
import com.example.java4.request.QLSP.Store.SanPhamStore;
import com.example.java4.request.QLSP.Update.SanPhamUpdate;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
@Controller
@RequestMapping("khuyen-mai")
public class KhuyenMaiController {
    //    @RequestMapping(name="login", method = RequestMethod.POST)
    @Autowired
    KhuyenMaiRepository kmRepo;
    public KhuyenMaiController() {
    }

    @CrossOrigin
    @GetMapping("/index")
    public ResponseEntity<List<KhuyenMai>> index(@RequestParam("page") Optional<Integer> pageParam){
        int page = pageParam.orElse(1);
        Pageable pageale = PageRequest.of(page-1, 20);
        return ResponseEntity.ok(kmRepo.findByTrangThaiAsc(1,pageale).getContent());
    }

    @CrossOrigin
    @GetMapping("/get-all")
    public ResponseEntity<List<KhuyenMai>> getAll(@RequestParam("page") Optional<Integer> pageParam){
        int page = pageParam.orElse(1);
        Pageable pageale = PageRequest.of(page-1, 20);
        return ResponseEntity.ok(kmRepo.findAllByPage(pageale).getContent());
    }

    @CrossOrigin
    @GetMapping("count")
    public ResponseEntity<Integer> getCount() {
        return ResponseEntity.ok(kmRepo.getCount());
    }
    @CrossOrigin
    @GetMapping("count-stt1")
    public ResponseEntity<Integer> getCountstt1() {
        return ResponseEntity.ok(kmRepo.getCountStt1());
    }
    @CrossOrigin
    @GetMapping("count-stt0")
    public ResponseEntity<Integer> getCountstt0() {
        return ResponseEntity.ok(kmRepo.getCountStt0());
    }
    @CrossOrigin
    @GetMapping("/detail/{id}")
    public ResponseEntity<KhuyenMai> getDetail(@PathVariable(value = "id") KhuyenMai khuyenMai){
        return ResponseEntity.ok(khuyenMai);
    }

    @CrossOrigin
    @PostMapping("/update/{id}")
    public ResponseEntity<Boolean> doUpdate(@RequestBody @Valid KhuyenMaiUpdate newKhuyenMai, BindingResult result,
                                            @PathVariable(value ="id") KhuyenMai km){
        if (result.hasErrors()) {
            System.out.println("error temp:" + result);
            return ResponseEntity.ok(false);
        }
        else{
            System.out.println("do update -======================");
            km.setTen(newKhuyenMai.getTen());
            km.setNgayBatDau(newKhuyenMai.getNgayBatDau());
            km.setNgayKetThuc(newKhuyenMai.getNgayKetThuc());
            km.setSoTienGiam(newKhuyenMai.getSoTienGiam());
            km.setSoLuong(newKhuyenMai.getSoLuong());
            km.setTrangThai(newKhuyenMai.getTrangThai());
            km.setApDung(newKhuyenMai.getApDung());
            kmRepo.save(km);
            return ResponseEntity.ok(true);
        }
    }

    @CrossOrigin
    @PostMapping("/enable-status/{id}")
    public ResponseEntity<Integer> enableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(kmRepo.enableStt(id));
    }

    @CrossOrigin
    @PostMapping("/disable-status/{id}")
    public ResponseEntity<Integer> disableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(kmRepo.enableStt(id));
    }

    @CrossOrigin
    @PostMapping("save")
    public ResponseEntity<Boolean> save(
            @RequestBody @Valid KhuyenMaiStore newKhuyenMai,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            System.out.println("error temp: " + result);
            return ResponseEntity.ok(false);
        }
        else{
            LocalDateTime localNow = LocalDateTime.now();
            String ma = "KMMSS"+(kmRepo.getCount()+1);
            KhuyenMai km = new KhuyenMai();
            km.setMa(ma);
            km.setTen(newKhuyenMai.getTen());
            km.setNgayBatDau(newKhuyenMai.getNgayBatDau());
            km.setNgayKetThuc(newKhuyenMai.getNgayKetThuc());
            km.setSoTienGiam(newKhuyenMai.getSoTienGiam());
            km.setSoLuong(newKhuyenMai.getSoLuong());
            km.setTrangThai(newKhuyenMai.getTrangThai());
            km.setApDung(newKhuyenMai.getApDung());
            kmRepo.save(km);
            return ResponseEntity.ok(true);
        }
    }
    @GetMapping("/check-duplicate")
    public ResponseEntity<Boolean> checkDuplicate(@RequestParam("tenKM") String tenKM) {
        // Decode the URL-encoded string to handle special characters
        try {
            tenKM = URLDecoder.decode(tenKM, StandardCharsets.UTF_8.toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(false);
        }
        System.out.println("debug tensp check duplicate: "+tenKM);
        // Trim the decoded string
        tenKM = tenKM.trim();
        // Now you can proceed with your logic
        KhuyenMai existingKM = kmRepo.checkTenKMExist(tenKM);
        boolean isDuplicate = existingKM != null;
        return ResponseEntity.ok(isDuplicate);
    }
}