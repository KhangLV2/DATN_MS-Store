package com.example.java4.controller.BanHangTaiQuay;
import com.example.java4.repositories.SPCTRepository;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@NoArgsConstructor
@Service
public class Validator {
    @Autowired
    SPCTRepository  spctrepo;
    public Boolean  isOutStock(int soLuong,String idspct){
        Integer stockQty = spctrepo.findBySoLuong(idspct);
        if(soLuong<stockQty){
            return true;
        }
        else{
            return false;
        }
    }
    public void testing(String idspct){
        System.out.println("validator check :"+spctrepo.findBySoLuong(idspct));
    }
}
