package com.example.java4.restcontrollers;

import com.example.java4.entities.PhuongXa;
import com.example.java4.entities.QuanHuyen;
import com.example.java4.entities.TinhThanh;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class DiaChiApiController {

    private final RestTemplate restTemplate = new RestTemplate();
    private final String token = "63b87d88-2f7f-11ef-bd60-ee73b759c2ff"; // Token của bạn

    @GetMapping("/api/tinh-thanh/{id}")
    public TinhThanh getTinhThanhById(@PathVariable String id) {
        String url = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province/" + id;
        return restTemplate.getForObject(url, TinhThanh.class);
    }

    @GetMapping("/api/quan-huyen/{id}")
    public QuanHuyen getQuanHuyenById(@PathVariable String id) {
        String url = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district/" + id;
        return restTemplate.getForObject(url, QuanHuyen.class);
    }

    @GetMapping("/api/phuong-xa/{id}")
    public PhuongXa getPhuongXaById(@PathVariable String id) {
        String url = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward/" + id;
        return restTemplate.getForObject(url, PhuongXa.class);
    }
}

