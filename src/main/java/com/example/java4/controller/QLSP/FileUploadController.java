package com.example.java4.controller.QLSP;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class FileUploadController {

    @Value("${file.upload-dir}")
    private String uploadDir;

    @GetMapping("/")
    public String index() {
        return "upload";
    }

    @PostMapping("/upload")
    public void uploadFile(@RequestParam("file") MultipartFile file, Model model) {
        System.out.println("test save file: "+file);
        if (file.isEmpty()) {
            model.addAttribute("message", "Please select a file to upload.");
        }

        try {
            byte[] bytes = file.getBytes();
            Path path = Paths.get(uploadDir + File.separator + file.getOriginalFilename());
            Files.write(path, bytes);
            model.addAttribute("message", "You successfully uploaded '" + file.getOriginalFilename() + "'");
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "Failed to upload '" + file.getOriginalFilename() + "'");
        }
    }
    @PostMapping("/uploads")
    public void saveUploadFile(
            @RequestParam("hinhAnh1File") MultipartFile newHinhAnh1File,
            @RequestParam("hinhAnh2File") MultipartFile newHinhAnh2File,
            @RequestParam("hinhAnh3File") MultipartFile newHinhAnh3File,
            Model model
    ) {
        if (newHinhAnh1File.isEmpty()) {
            model.addAttribute("message", "Vui lòng chọn hình ảnh 1.");
        }
        if(newHinhAnh2File.isEmpty()){
            model.addAttribute("message", "Vui lòng chọn hình ảnh 2.");
        }
        if(newHinhAnh3File.isEmpty()){
            model.addAttribute("message", "Vui lòng chọn hình ảnh 3.");
        }
        try {
            byte[] bytesHinhAnh1 = newHinhAnh1File.getBytes();
            byte[] bytesHinhAnh2 = newHinhAnh2File.getBytes();
            byte[] bytesHinhAnh3 = newHinhAnh3File.getBytes();
            Path path1 = Paths.get(uploadDir + File.separator +newHinhAnh1File.getOriginalFilename());
            Path path2 = Paths.get(uploadDir + File.separator +newHinhAnh2File.getOriginalFilename());
            Path path3 = Paths.get(uploadDir + File.separator +newHinhAnh3File.getOriginalFilename());
            Files.write(path1, bytesHinhAnh1);
            Files.write(path2, bytesHinhAnh2);
            Files.write(path3, bytesHinhAnh3);
            model.addAttribute("message", "You successfully uploaded");
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "Failed to upload");
        }
    }

}
