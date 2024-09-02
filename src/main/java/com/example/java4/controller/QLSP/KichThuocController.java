package com.example.java4.controller.QLSP;

import com.example.java4.entities.KichThuoc;
import com.example.java4.request.QLSP.Store.KichThuocStore;
import com.example.java4.request.QLSP.Update.KichThuocUpdate;
import com.example.java4.repositories.KichThuocRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("kich-thuoc")
public class KichThuocController {
    //    @RequestMapping(name="login", method = RequestMethod.POST)
    @Autowired
    KichThuocRepository ktRepo;

    public KichThuocController() {
    }
    @CrossOrigin
    @GetMapping("/index")
    public ResponseEntity<List<KichThuoc>> getIndexPage() {
        return ResponseEntity.ok(ktRepo.findAll());
    }
    @CrossOrigin
    @GetMapping("/get-all")
    public ResponseEntity<List<KichThuoc>> getAll(@RequestParam("page") Optional<Integer> pageParam) {
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
    public ResponseEntity<KichThuoc> getDetail(@PathVariable(value = "id") KichThuoc kichThuoc){
        return  ResponseEntity.ok(kichThuoc);
    }
    @CrossOrigin
    @PostMapping("/update/{id}")
    public ResponseEntity<Boolean> doUpdate(@Valid @RequestBody KichThuocUpdate newKichThuoc, BindingResult rs,
                                            @PathVariable(value = "id") KichThuoc kt) {
        if (rs.hasErrors()) {
            System.out.println("error at kich thuoc: " + rs);
            return null;
        } else {
            kt.setTen(newKichThuoc.getTen());
            kt.setTrangThai(Integer.valueOf(newKichThuoc.getTrangThai()));
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
            @RequestBody @Valid KichThuocStore newKichThuoc,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            System.out.println("error temp: " + result);
            return ResponseEntity.ok(false);
        } else {
            LocalDateTime localNow = LocalDateTime.now();
            String ma = "KT"+(ktRepo.getCount()+1);
            KichThuoc kt = new KichThuoc();
            kt.setMa(ma);
            kt.setTen(newKichThuoc.getTen());
            kt.setTrangThai(Integer.valueOf(newKichThuoc.getTrangThai()));
            kt.setNgayTao(localNow);
            ktRepo.save(kt);
            return ResponseEntity.ok(true);
        }
    }
}