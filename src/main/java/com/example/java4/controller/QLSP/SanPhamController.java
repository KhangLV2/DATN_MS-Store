package com.example.java4.controller.QLSP;
import com.example.java4.config.UserInfor;
import com.example.java4.entities.ChatLieu;
import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.entities.NhanVien;
import com.example.java4.entities.SanPham;
import com.example.java4.repositories.*;
import com.example.java4.request.QLSP.Store.KichThuocMulStore;
import com.example.java4.request.QLSP.Store.SanPhamMulStore;
import com.example.java4.request.QLSP.Store.SanPhamStore;
import com.example.java4.request.QLSP.Update.SanPhamUpdate;
import com.example.java4.response.SanPhamView;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.text.NumberFormat;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.*;

@Controller
@RequestMapping("san-pham")
public class SanPhamController {
    //    @RequestMapping(name="login", method = RequestMethod.POST)
    @Autowired
    SanPhamRepository spRepo;
    @Autowired
    MauSacRepository msRepo;
    @Autowired
    ChatLieuRepository clRepo;
    @Autowired
    KieuTayRepository ktRepo;
    @Autowired
    KichThuocRepository sizeRepo;
    @Autowired
    SPCTRepository spctRepository;
    @Autowired
    SearchService search;
    @Autowired
    GiaoHangRepo giaoHangRepo;
    @Autowired
    KhuyenMaiRepository khuyenMaiRepo;
    @Autowired
    HoaDonRepository hoaDonRepo;

    public SanPhamController() {
    }

    @CrossOrigin
    @GetMapping("/index")
    public ResponseEntity<List<SanPhamView>> index(@RequestParam("page") Optional<Integer> pageParam){
        int page = pageParam.orElse(1);
        Pageable pageale = PageRequest.of(page-1, 20);
        List<SanPham> lstSP = spRepo.findAllCase(pageale).getContent();
        List<SanPhamView> lstSPView = new ArrayList<>();
        for (SanPham sanPham : lstSP) {
             SanPhamView spView  = new SanPhamView();
             spView.setId(sanPham.getId());
             spView.setMa(sanPham.getMa());
             spView.setTen(sanPham.getTen());
             spView.setNgayTao(sanPham.getNgayTao());
             spView.setHinhAnh(spRepo.getHinhAnhOfSP(sanPham.getId()));
             spView.setTrangThai(sanPham.getTrangThai());
             lstSPView.add(spView);
        }
        return ResponseEntity.ok(lstSPView);
    }

    @CrossOrigin
    @GetMapping("/get-all")
    public ResponseEntity<List<SanPham>> getAll(@RequestParam("page") Optional<Integer> pageParam){
        int page = pageParam.orElse(1);
        Pageable pageale = PageRequest.of(page-1, 20);
        return ResponseEntity.ok(spRepo.findAllByPage(pageale).getContent());
    }
    @CrossOrigin
    @GetMapping("count")
    public ResponseEntity<Integer> getCount() {
        return ResponseEntity.ok(spRepo.getCount());
    }
    @CrossOrigin
    @GetMapping("count-stt1")
    public ResponseEntity<Integer> getCountstt1() {
        return ResponseEntity.ok(spRepo.getCountStt1());
    }
    @CrossOrigin
    @GetMapping("count-stt0")
    public ResponseEntity<Integer> getCountstt0() {
        return ResponseEntity.ok(spRepo.getCountStt0());
    }

    @CrossOrigin
    @GetMapping("/detail/{id}")
    public ResponseEntity<SanPhamView> getDetail(@PathVariable(value = "id") SanPham sanPham){
        SanPhamView sanPhamView = new SanPhamView();
        sanPhamView.setId(sanPham.getId());
        sanPhamView.setTen(sanPham.getTen());
        sanPhamView.setMa(sanPham.getMa());
        sanPhamView.setNgayTao(sanPham.getNgayTao());
        sanPhamView.setHinhAnh(spRepo.getHinhAnhOfSP(sanPham.getId()));
        sanPhamView.setTrangThai(sanPham.getTrangThai());
        return ResponseEntity.ok(sanPhamView);
    }

    @CrossOrigin
    @PostMapping("/update/{id}")
    public ResponseEntity<Boolean> doUpdate(@RequestBody @Valid SanPhamUpdate newSanPham, BindingResult result,
                                            @PathVariable(value ="id") SanPham sp){
        if (result.hasErrors()) {
            System.out.println("error temp:" + result);
            return ResponseEntity.ok(false);
        }
        else{
            sp.setTen(newSanPham.getTen());
            sp.setTrangThai(Integer.valueOf(newSanPham.getTrangThai()));
            sp.setHinhAnh(newSanPham.getHinhAnh());
            spRepo.save(sp);
            return ResponseEntity.ok(true);
        }
    }

    @CrossOrigin
    @PostMapping("/enable-status/{id}")
    public ResponseEntity<Integer> enableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(spRepo.enableStt(id));
    }

    @CrossOrigin
    @PostMapping("/disable-status/{id}")
    public ResponseEntity<Integer> disableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(spRepo.enableStt(id));
    }

    @CrossOrigin
    @PostMapping("save")
    public ResponseEntity<Boolean> save(
            @RequestBody @Valid SanPhamStore newSanPham,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            System.out.println("error temp: " + result);
            return ResponseEntity.ok(false);
        }
        else{
            LocalDateTime localNow = LocalDateTime.now();
            String ma = "SPHMSS"+(spRepo.getCount()+1);
            SanPham sp = new SanPham();
            sp.setTen(newSanPham.getTen());
            sp.setMa(ma);
            sp.setTrangThai(Integer.valueOf(newSanPham.getTrangThai()));
            sp.setNgayTao(localNow);
            sp.setHinhAnh(null);
            spRepo.save(sp);
            return ResponseEntity.ok(true);
        }
    }

    @CrossOrigin
    @GetMapping("/check-tenSP-exist")
    public ResponseEntity<Integer> checkTenSPExist(@RequestParam(value = "tenSP") String tenSP){
        System.out.println("ten sp :"+tenSP);
        return ResponseEntity.ok(spRepo.checkTenSPIsExist(tenSP));
    }

    @CrossOrigin
    @PostMapping("/multiple-save")
    public ResponseEntity<String> saveMultipleSanPham(@RequestBody List<SanPhamMulStore> sanPhamMulStoreList,@RequestParam("tenSP") String tenSP, @RequestParam("idChatLieu") String idChatLieu, @RequestParam("idKieuTay") String idKieuTay) {
        System.out.println("ten sp check: "+ tenSP);
        System.out.println("id chat lieu check: "+ idChatLieu);
        System.out.println("ten kieu tay check: "+ idKieuTay);
        try {
            SanPham sp = new SanPham();
            String ma = "SPHMSS"+(spRepo.getCount()+1);
            LocalDateTime localNow = LocalDateTime.now();
            sp.setTen(tenSP);
            sp.setMa(ma);
            sp.setTrangThai(0);
            sp.setNgayTao(localNow);
            SanPham newSP = spRepo.save(sp);
            List<ChiTietSanPham> lstSPCT = new ArrayList<>();
            for (SanPhamMulStore sanPhamMulStore : sanPhamMulStoreList) {
                // Save each product, handle the logic as needed
                System.out.println("Saving product: " + sanPhamMulStore.getName());
                for (KichThuocMulStore kichThuocMulStore : sanPhamMulStore.getSize()) {
                    System.out.println("check size: "+ kichThuocMulStore.getTen());
                    ChiTietSanPham newSPCT = new ChiTietSanPham();
                    newSPCT.setIdSanPham(newSP);
                    newSPCT.setIdMauSac(msRepo.findById(sanPhamMulStore.getId()).get());
                    newSPCT.setIdKichThuoc(sizeRepo.findById(kichThuocMulStore.getId()).get());
                    newSPCT.setIdChatLieu(clRepo.findById(idChatLieu).get());
                    newSPCT.setIdKieuTay(ktRepo.findById(idKieuTay).get());
                    newSPCT.setMoTa("");
                    newSPCT.setSoLuong(0);
                    newSPCT.setGiaNhap(new BigDecimal(0));
                    newSPCT.setGiaBan(new BigDecimal(0));
                    newSPCT.setTrangThai(1);
                    newSPCT.setNgayTao(localNow);
                    lstSPCT.add(newSPCT);
                }
            }
            for (ChiTietSanPham chiTietSanPham : lstSPCT) {
                System.out.println("test lst spct: "+chiTietSanPham);
            }
            spctRepository.saveAll(lstSPCT);
            System.out.println("save success");
            System.out.println("test return object: "+newSP.getId());
            return ResponseEntity.ok(newSP.getId());
        } catch (Exception e) {
            return ResponseEntity.ok(null);
        }
    }

    @GetMapping("min-max-price")
    public ResponseEntity<List<Long>> getMinMaxPrice(@RequestParam("idSP") String idSP) {
        Long minValue = spctRepository.getMinGiaBan(idSP);
        Long maxValue = spctRepository.getMaxGiaBan(idSP);

        System.out.println("============================test min api : " + minValue);
        System.out.println("============================test max api : " + maxValue);

        // Create a list containing the min and max values
        List<Long> minMaxPrices = Arrays.asList(minValue, maxValue);

        // Return the list in the response
        return ResponseEntity.ok(minMaxPrices);
    }

    @GetMapping("/searchsp")
    public ResponseEntity<List<SanPhamView>> searchSanPham(
            @RequestParam("trangThai") String trangThai) {
        Integer trangThaiSearch = Integer.parseInt(trangThai);
        List<SanPham> lstSP = spRepo.findAllByTrangThai(trangThaiSearch);
        List<SanPhamView> lstSPView = new ArrayList<>();
        for (SanPham sanPham : lstSP) {
            SanPhamView spView  = new SanPhamView();
            spView.setId(sanPham.getId());
            spView.setMa(sanPham.getMa());
            spView.setTen(sanPham.getTen());
            spView.setNgayTao(sanPham.getNgayTao());
            spView.setHinhAnh(spRepo.getHinhAnhOfSP(sanPham.getId()));
            spView.setTrangThai(sanPham.getTrangThai());
            lstSPView.add(spView);
        }
        return ResponseEntity.ok(lstSPView);
    }

    @CrossOrigin
    @GetMapping("/check-duplicate")
    public ResponseEntity<Boolean> checkDuplicate(@RequestParam("tenSP") String tenSP) {
        // Decode the URL-encoded string to handle special characters
        try {
            tenSP = URLDecoder.decode(tenSP, StandardCharsets.UTF_8.toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(false);
        }
        System.out.println("debug tensp check duplicate: "+tenSP);
        // Trim the decoded string
        tenSP = tenSP.trim();
        // Now you can proceed with your logic
        SanPham existingProduct = spRepo.checkTenSPExist(tenSP);
        boolean isDuplicate = existingProduct != null;
        return ResponseEntity.ok(isDuplicate);
    }

    @CrossOrigin
    @GetMapping("/count-spct-byIdSP")
    public ResponseEntity<Integer> countSPCTbyIDSP(@RequestParam("idSP") String idSP) {
        return ResponseEntity.ok(spctRepository.getCountByidsp(idSP));
    }


    @CrossOrigin
    @GetMapping("/test-api")
    public ResponseEntity<String> test(@RequestParam("idSP") String idSP) {
        return ResponseEntity.ok(spctRepository.getMinChatLieuSPCTByIdSP(idSP));
    }

    @GetMapping("/test-api1")
    public ResponseEntity<String> test1(@RequestParam("idSP") String idSP) {
        return ResponseEntity.ok(spctRepository.getMinKieuTaySPCTByIdSP(idSP));
    }
    @CrossOrigin
    @GetMapping("/search-typing")
    public ResponseEntity<List<SanPhamView>> searchSanPhamByMaOrTen(
            @RequestParam(value = "ma", required = false) String ma,
            @RequestParam(value = "ten", required = false) String ten) {
        List<SanPham> sanPhamList = spRepo.searchByMaOrTen(ma, ten);
        List<SanPhamView> sanPhamViewList = new ArrayList<>();
        for (SanPham sanPham : sanPhamList) {
            SanPhamView spView  = new SanPhamView();
            spView.setId(sanPham.getId());
            spView.setMa(sanPham.getMa());
            spView.setTen(sanPham.getTen());
            spView.setNgayTao(sanPham.getNgayTao());
            spView.setHinhAnh(spRepo.getHinhAnhOfSP(sanPham.getId()));
            spView.setTrangThai(sanPham.getTrangThai());
            sanPhamViewList.add(spView);
        }
        return ResponseEntity.ok(sanPhamViewList);
    }
    @CrossOrigin
    @PostMapping("update-phiship")
    public ResponseEntity<Boolean> save(
            @RequestParam("newPhiShip") String newPhiShip,
            @RequestParam("idHoaDon") String idHoaDon
    ) {
        System.out.println("id hoa don test: " + idHoaDon);
        System.out.println("new phi ship test: " + newPhiShip);
        try {
            // Convert the newPhiShip parameter to BigDecimal
            NumberFormat format = NumberFormat.getInstance(Locale.getDefault());
            Number number = format.parse(newPhiShip);
            BigDecimal bigDecimalPhiShip = new BigDecimal(number.toString());

            // Update the value in the database
            int updatedRows = giaoHangRepo.updatePhiShipByHoaDonId(idHoaDon, bigDecimalPhiShip);

            // Return true if the update affected at least one row, false otherwise
            if (updatedRows > 0) {
                return ResponseEntity.ok(true);
            } else {
                return ResponseEntity.ok(false);
            }
        } catch (ParseException | NumberFormatException e) {
            // Log the exception and return false
            e.printStackTrace();
            return ResponseEntity.ok(false);
        } catch (Exception e) {
            // Catch any other exceptions and return false
            e.printStackTrace();
            return ResponseEntity.ok(false);
        }

    }

}