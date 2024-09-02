package com.example.java4.config;

import com.example.java4.service.KhuyenMaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class KhuyenMaiScheduler {

    @Autowired
    private KhuyenMaiService khuyenMaiService;
    // 1 tiếng thì sẽ chạy lại 1 lần
    @Scheduled(cron = "0 0 */1 * * *")
    public void runTask() {
        khuyenMaiService.updateKhuyenMaiStatus();
    }
}
