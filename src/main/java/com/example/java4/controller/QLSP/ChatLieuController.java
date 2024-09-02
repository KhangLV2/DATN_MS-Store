package com.example.java4.controller.QLSP;

import com.example.java4.entities.ChatLieu;
import com.example.java4.repositories.ChatLieuRepository;
import com.example.java4.request.QLSP.Store.ChatLieuStore;
import com.example.java4.request.QLSP.Update.ChatLieuUpdate;
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
@RequestMapping("chat-lieu")
public class ChatLieuController {
    @Autowired
    private ChatLieuRepository chatLieuRepo;
    public ChatLieuController() {
    }
    @CrossOrigin
    @GetMapping("index")
    public ResponseEntity<List<ChatLieu>> index() {
        return ResponseEntity.ok(chatLieuRepo.findAll());
    }
    @CrossOrigin
    @GetMapping("get-all")
    public ResponseEntity<List<ChatLieu>> getAll(@RequestParam("page")Optional<Integer> pageParam) {
        int page = pageParam.orElse(1);
        Pageable pageAble = PageRequest.of(page-1,20);
        return ResponseEntity.ok(chatLieuRepo.findAllByPage(pageAble).getContent());
    }
    @CrossOrigin
    @GetMapping("count")
    public ResponseEntity<Integer> getCount() {
        return ResponseEntity.ok(chatLieuRepo.getCount());
    }
    @CrossOrigin
    @GetMapping("count-stt1")
    public ResponseEntity<Integer> getCountstt1() {
        return ResponseEntity.ok(chatLieuRepo.getCountStt1());
    }
    @CrossOrigin
    @GetMapping("count-stt0")
    public ResponseEntity<Integer> getCountstt0() {
        return ResponseEntity.ok(chatLieuRepo.getCountStt1());
    }
    @CrossOrigin
    @GetMapping("/detail/{id}")
    public ResponseEntity<ChatLieu> getDetail(@PathVariable("id") ChatLieu chatLieu){
        return ResponseEntity.ok(chatLieu);
    }
    @CrossOrigin
    @PostMapping("update/{id}")
    public ResponseEntity<Boolean> doUpdate(
            @RequestBody @Valid ChatLieuUpdate newChatLieu,
            BindingResult result, @PathVariable(value = "id") ChatLieu cl
    ) {
        if (result.hasErrors()){
            System.out.println("Error temp: " + result);
            return ResponseEntity.ok(false);
        }
        else{
            cl.setTen(newChatLieu.getTen());
            cl.setTrangThai(Integer.valueOf(newChatLieu.getTrangThai()));
            chatLieuRepo.save(cl);
            return  ResponseEntity.ok(true);
        }
    }
    @CrossOrigin
    @PostMapping("/enable-status/{id}")
    public ResponseEntity<Integer> enableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(chatLieuRepo.enableStt(id));
    }


    @CrossOrigin
    @PostMapping("/disable-status/{id}")
    public ResponseEntity<Integer> disableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(chatLieuRepo.enableStt(id));
    }

    @CrossOrigin
    @PostMapping("save")
    public ResponseEntity<Boolean> save(
            @RequestBody @Valid ChatLieuStore newChatLieu,
            BindingResult result
    ) {
        if (result.hasErrors()){
            System.out.println("error temp at mausac: "+ result);
            return ResponseEntity.ok(false);
        }
        else{
            LocalDateTime localNow = LocalDateTime.now();
            String ma = "CHL"+(chatLieuRepo.getCount()+1);
            ChatLieu cl = new ChatLieu();
            cl.setMa(ma);
            cl.setTen(newChatLieu.getTen());
            cl.setTrangThai(Integer.valueOf(newChatLieu.getTrangThai()));
            cl.setNgayTao(localNow);
            chatLieuRepo.save(cl);
            return ResponseEntity.ok(true);
        }
    }
}