package com.example.java4.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


@Service
public class FileSystemStorageService implements StorageService{
    // Đường dẫn đến file khi upload hình ảnh
    private static final String UPLOAD_DIR = "src/main/webapp/image/";



    @Override
    public void init() {
        Path uploadPath = Paths.get(UPLOAD_DIR);
        if (Files.notExists(uploadPath)) {
            try {
                Files.createDirectories(uploadPath);
            } catch (IOException e) {
                throw new RuntimeException("Could not initialize storage", e);
            }
        }
    }

    @Override
    public void store(MultipartFile file) {
        try {
            Path destinationFile = Paths.get(UPLOAD_DIR + file.getOriginalFilename()).toAbsolutePath();
            Files.copy(file.getInputStream(), destinationFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
