package com.example.java4.controller.QLSP;

import com.example.java4.entities.KieuTay;
import com.example.java4.repositories.KieuTayRepository;
import com.example.java4.request.QLSP.Store.KieuTayStore;
import com.example.java4.request.QLSP.Update.KieuTayUpdate;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("kieu-tay")
public class KieuTayController {
    //    @RequestMapping(name="login", method = RequestMethod.POST)
    @Autowired
    KieuTayRepository ktRepo;

    public KieuTayController() {
    }
    @CrossOrigin
    @GetMapping("/index")
    public ResponseEntity<List<KieuTay>> getIndexPage() {
        return ResponseEntity.ok(ktRepo.findAll());
    }
    @CrossOrigin
    @GetMapping("/get-all")
    public ResponseEntity<List<KieuTay>> getAll(@RequestParam("page") Optional<Integer> pageParam) {
        int page =  pageParam.orElse(1);
        Pageable pageable = PageRequest.of(page-1,20);
        return ResponseEntity.ok(ktRepo.findAllByPage(pageable).getContent());
    }
    @CrossOrigin
    @GetMapping("count")
    public ResponseEntity<Integer> getCount() {
        return ResponseEntity.ok(ktRepo.getCount());
    }
    @CrossOrigin
    @GetMapping("count-stt1")
    public ResponseEntity<Integer> getCountstt1() {
        return ResponseEntity.ok(ktRepo.getCountStt1());
    }
    @CrossOrigin
    @GetMapping("count-stt0")
    public ResponseEntity<Integer> getCountstt0() {
        return ResponseEntity.ok(ktRepo.getCountStt0());
    }
    @CrossOrigin
    @GetMapping("detail/{id}")
    public ResponseEntity<KieuTay> getDetail(@PathVariable(value = "id") KieuTay kieuTay){
        return  ResponseEntity.ok(kieuTay);
    }
    @CrossOrigin
    @PostMapping("/update/{id}")
    public ResponseEntity<Boolean> doUpdate(@Valid @RequestBody KieuTayUpdate newKieuTay, BindingResult rs,
                                            @PathVariable(value = "id") KieuTay kt) {
        if (rs.hasErrors()) {
            System.out.println("error at kich thuoc: " + rs);
            return null;
        } else {
            kt.setTen(newKieuTay.getTen());
            kt.setTrangThai(Integer.valueOf(newKieuTay.getTrangThai()));
            ktRepo.save(kt);
            return  ResponseEntity.ok(true);
        }
    }

    @CrossOrigin
    @PostMapping("/enable-status/{id}")
    public ResponseEntity<Integer> enableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(ktRepo.enableStt(id));
    }


    @CrossOrigin
    @PostMapping("/disable-status/{id}")
    public ResponseEntity<Integer> disableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(ktRepo.enableStt(id));
    }
    @CrossOrigin
    @PostMapping("save")
    public ResponseEntity<Boolean> store(
            @RequestBody @Valid KieuTayStore newKieuTay,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            System.out.println("error temp: " + result);
            return ResponseEntity.ok(false);
        } else {
            LocalDateTime localNow = LocalDateTime.now();
            String ma = "KT"+(ktRepo.getCount()+1);
            KieuTay kt = new KieuTay();
            kt.setMa(ma);
            kt.setTen(newKieuTay.getTen());
            kt.setTrangThai(Integer.valueOf(newKieuTay.getTrangThai()));
            kt.setNgayTao(localNow);
            ktRepo.save(kt);
            return ResponseEntity.ok(true);
        }
    }
}