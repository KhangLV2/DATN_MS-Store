package com.example.java4.restcontrollers;

import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.repositories.SPCTRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("rest/chi-tiet-san-pham")
public class ChiTietSanPhamRestController {
    @Autowired
    SPCTRepository spctRepo;

    @GetMapping("get-all")
    public List<ChiTietSanPham> getAll(){
        return spctRepo.findAll();
    }

}
