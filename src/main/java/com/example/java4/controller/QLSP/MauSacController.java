package com.example.java4.controller.QLSP;
import com.example.java4.entities.MauSac;
import com.example.java4.repositories.MauSacRepository;
import com.example.java4.request.QLSP.Store.MauSacStore;
import com.example.java4.request.QLSP.Update.MauSacUpdate;
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
@RequestMapping("mau-sac")
public class MauSacController {
    @Autowired
    private MauSacRepository msRepo;
    public MauSacController() {
    }
    @CrossOrigin
    @GetMapping("index")
    public ResponseEntity<List<MauSac>> index() {
        return ResponseEntity.ok(msRepo.findAll());
    }

    @CrossOrigin
    @GetMapping("get-all")
    public ResponseEntity<List<MauSac>> getAll(@RequestParam("page")Optional<Integer> pageParam) {
        int page = pageParam.orElse(1);
        Pageable pageale = PageRequest.of(page-1, 20);
        return ResponseEntity.ok(msRepo.findAllByPage(pageale).getContent());
    }
    @CrossOrigin
    @GetMapping("count")
    public ResponseEntity<Integer> getCount() {
        return ResponseEntity.ok(msRepo.getCount());
    }
    @CrossOrigin
    @GetMapping("count-stt1")
    public ResponseEntity<Integer> getCountstt1() {
        return ResponseEntity.ok(msRepo.getCountStt1());
    }
    @CrossOrigin
    @GetMapping("count-stt0")
    public ResponseEntity<Integer> getCountstt0() {
        return ResponseEntity.ok(msRepo.getCountStt0());
    }
    @CrossOrigin
    @GetMapping("/detail/{id}")
    public ResponseEntity<MauSac> getDetail(@PathVariable("id") MauSac mauSac){
        return ResponseEntity.ok(mauSac);
    }
    @CrossOrigin
    @PostMapping("update/{id}")
    public ResponseEntity<Boolean> doUpdate(
            @RequestBody @Valid MauSacUpdate newMauSac,
            BindingResult result, @PathVariable(value = "id") MauSac ms
    ) {
        if (result.hasErrors()){
            System.out.println("Error temp: " + result);
            return ResponseEntity.ok(false);
        }
        else{
            ms.setTen(newMauSac.getTen());
            ms.setTrangThai(Integer.valueOf(newMauSac.getTrangThai()));
            msRepo.save(ms);
            return  ResponseEntity.ok(true);
        }
    }
    @CrossOrigin
    @PostMapping("/enable-status/{id}")
    public ResponseEntity<Integer> enableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(msRepo.enableStt(id));
    }


    @CrossOrigin
    @PostMapping("/disable-status/{id}")
    public ResponseEntity<Integer> disableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(msRepo.enableStt(id));
    }

    @CrossOrigin
    @PostMapping("save")
    public ResponseEntity<Boolean> save(
            @RequestBody @Valid MauSacStore newMauSac,
            BindingResult result
    ) {
        if (result.hasErrors()){
            System.out.println("error temp at mausac: "+ result);
            return ResponseEntity.ok(false);
        }
        else{
            LocalDateTime localNow = LocalDateTime.now();
            String ma = "MS"+(msRepo.getCount()+1);
            MauSac ms = new MauSac();
            //conduct ma
            ms.setMa(ma);
            ms.setTen(newMauSac.getTen());
            ms.setTrangThai(Integer.valueOf(newMauSac.getTrangThai()));
            ms.setNgayTao(localNow);
            msRepo.save(ms);
            return ResponseEntity.ok(true);
        }
    }
}