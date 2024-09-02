package com.example.java4.controller.QLSP;

import com.example.java4.controller.ATrangChu.SanPhamCard;
import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.entities.HinhAnh;
import com.example.java4.entities.noMap.ChiTietSanPhamNoMap;
import com.example.java4.repositories.*;
import com.example.java4.repositories.NoMap.SPCTRepoNoMap;
import com.example.java4.request.QLSP.Store.SPCTStore;
import com.example.java4.request.QLSP.Update.SPCTUpdate;
import com.example.java4.response.SPCTResponse;
import com.example.java4.response.SPCTView;
import com.example.java4.response.SanPhamView;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

@Controller
@RequestMapping("chi-tiet-sp")
public class SPCTController {
    //    @RequestMapping(name="login", method = RequestMethod.POST)
    @Autowired
    KichThuocRepository kichThuocRepo;
    @Autowired
    MauSacRepository mauSacRepo;
    @Autowired
    ChatLieuRepository chatLieuRepo;
    @Autowired
    KieuTayRepository kieuTayRepo;
    @Autowired
    SPCTRepository chiTietSPRepository;
    @Autowired
    SPCTRepoNoMap spctRepoNoMap;
    @Autowired
    private SearchService search;
    @Autowired
    HinhAnhRepository hinhAnhRepo;
    public SPCTController() {
    }

    @CrossOrigin
    @GetMapping("/index")
    public ResponseEntity<List<ChiTietSanPham>> index(@RequestParam("page") Optional<Integer> pageParam) {
        int page = pageParam.orElse(1);
        Pageable pageable = PageRequest.of(page - 1, 20);
        return ResponseEntity.ok(chiTietSPRepository.findByTrangThai(1, pageable).getContent());
    }

    @CrossOrigin
    @GetMapping("/detail-byidsp-all/{idSP}")
    public ResponseEntity<List<SPCTView>> GetIndexByIdSPAll(@PathVariable(value = "idSP") String idSP, @RequestParam("page") Optional<Integer> pageParam) {
        int page = pageParam.orElse(1);
        Pageable pageable = PageRequest.of(page - 1, 20);
        List<ChiTietSanPham> lstChiTietSP = chiTietSPRepository.findByIdSPAll(idSP, pageable).getContent();
        List<SPCTView> lstSPCTView =  new ArrayList<>();
        for (ChiTietSanPham chiTietSanPham : lstChiTietSP) {
            SPCTView spctView = new SPCTView();
            spctView.setId(chiTietSanPham.getId());
            spctView.setSoLuong(chiTietSanPham.getSoLuong());
            spctView.setMoTa(chiTietSanPham.getMoTa());
            spctView.setGiaNhap(chiTietSanPham.getGiaNhap());
            spctView.setGiaBan(chiTietSanPham.getGiaBan());
            spctView.setNgayTao(chiTietSanPham.getNgayTao());
            spctView.setTrangThai(chiTietSanPham.getTrangThai());
            spctView.setIdMauSac(chiTietSanPham.getIdMauSac());
            spctView.setIdKichThuoc(chiTietSanPham.getIdKichThuoc());
            spctView.setIdChatLieu(chiTietSanPham.getIdChatLieu());
            spctView.setIdKieuTay(chiTietSanPham.getIdKieuTay());
            spctView.setIdSanPham(chiTietSanPham.getIdSanPham());
            spctView.setHinhAnh(chiTietSPRepository.getHinhAnhOfSPCT(chiTietSanPham.getId()));
            lstSPCTView.add(spctView);
            System.out.println("==========================================hinh anh: "+ spctView.getHinhAnh());
        }
        return ResponseEntity.ok(lstSPCTView);
    }

    @CrossOrigin
    @GetMapping("/get-all")
    public ResponseEntity<List<ChiTietSanPham>> getAll(@RequestParam("page") Optional<Integer> pageParam) {
        int page = pageParam.orElse(1);
        Pageable pageable = PageRequest.of(page - 1, 20);
        return ResponseEntity.ok(chiTietSPRepository.findAllByPage(pageable).getContent());
    }

    @CrossOrigin
    @GetMapping("count")
    public ResponseEntity<Integer> getCount() {
        return ResponseEntity.ok(chiTietSPRepository.getCount());
    }

    @CrossOrigin
    @GetMapping("count-stt1")
    public ResponseEntity<Integer> getCountstt1() {
        return ResponseEntity.ok(chiTietSPRepository.getCountStt1());
    }

    @CrossOrigin
    @GetMapping("count-stt0")
    public ResponseEntity<Integer> getCountstt0() {
        return ResponseEntity.ok(chiTietSPRepository.getCountStt0());
    }

    @CrossOrigin
    @GetMapping("count-byidsp/{idsp}")
    public ResponseEntity<Integer> getCountByidsp(@PathVariable("idsp") String idSP) {
        return ResponseEntity.ok(chiTietSPRepository.getCountByidsp(idSP));
    }

    @CrossOrigin
    @GetMapping("count-stt1-byidsp/{idsp}")
    public ResponseEntity<Integer> getCountstt1ByIdsp(@PathVariable("idsp") String idSP) {
        return ResponseEntity.ok(chiTietSPRepository.getCountStt1Byidsp(idSP));
    }

    @CrossOrigin
    @GetMapping("count-stt0-byidsp/{idsp}")
    public ResponseEntity<Integer> getCountstt0ByIdsp(@PathVariable("idsp") String idSP) {
        return ResponseEntity.ok(chiTietSPRepository.getCountStt0Byidsp(idSP));
    }

    @CrossOrigin
    @GetMapping("/detail/{id}")
    public ResponseEntity<ChiTietSanPham> getDetail(@PathVariable(value = "id") ChiTietSanPham chiTietSP) {
        return ResponseEntity.ok(chiTietSP);
    }

    @CrossOrigin
    @PostMapping("/update/{id}")
    public ResponseEntity<Boolean> doUpdate(@PathVariable(value = "id") ChiTietSanPhamNoMap chiTietSP,
                                            @RequestBody @Valid SPCTUpdate newChiTietSP,
                                            BindingResult rs) {
        if (rs.hasErrors()) {
            System.out.println("update error: " + rs);
            return ResponseEntity.ok(false);
        } else {
            chiTietSP.setIdMauSac(newChiTietSP.getIdMauSac());
            chiTietSP.setIdKichThuoc(newChiTietSP.getIdKichThuoc());
            chiTietSP.setIdChatLieu(newChiTietSP.getIdChatLieu());
            chiTietSP.setIdKieuTay(newChiTietSP.getIdKieuTay());
            chiTietSP.setMoTa(newChiTietSP.getMoTa());
            chiTietSP.setSoLuong(Integer.valueOf(newChiTietSP.getSoLuong()));
            chiTietSP.setGiaNhap(BigDecimal.valueOf(Long.valueOf(newChiTietSP.getGiaNhap())));
            chiTietSP.setGiaBan(BigDecimal.valueOf(Long.valueOf(newChiTietSP.getGiaBan())));
            chiTietSP.setTrangThai(Integer.valueOf(newChiTietSP.getTrangThai()));
            spctRepoNoMap.save(chiTietSP);
            return ResponseEntity.ok(true);
        }
    }

    @CrossOrigin
    @PostMapping("/update-all-ChatLieu")
    public ResponseEntity<Integer> doUpdateAllChatLieu(@RequestParam(value = "idSanPham") String idSanPham,
                                                       @RequestParam(value = "idChatLieu") String idChatLieu) {
        return ResponseEntity.ok(chiTietSPRepository.updateAllChatLieu(idSanPham,idChatLieu));
    }

    @CrossOrigin
    @PostMapping("/update-all-KieuTay")
    public ResponseEntity<Integer> doUpdateAllKieuTay(@RequestParam(value = "idSanPham") String idSanPham,
                                                      @RequestParam(value = "idKieuTay") String idKieuTay) {
        return ResponseEntity.ok(chiTietSPRepository.updateAllKieuTay(idSanPham,idKieuTay));
    }

    @CrossOrigin
    @PostMapping("/update-dynamic")
    public ResponseEntity<Integer> doUpdateAllKieuTay(@RequestParam Map<String, Object> params) {
        System.out.println("==================================do update all");
        Map<String, Object> searchParams = new HashMap<>();
        searchParams.put("idSanPham", params.get("idSanPham"));
        searchParams.put("idMauSac", params.get("idMauSac"));

        for (String string : params.keySet()) {
            System.out.println("test keyset: " + string);
            System.out.println("test object: " + params.get(string));
        }

        for (String string : searchParams.keySet()) {
            System.out.println("test keyset search params: " + string);
            System.out.println("test object search params: " + searchParams.get(string));
        }

        List<ChiTietSanPham> lstChiTietSP = search.searchChiTietSanPham(searchParams);

        for (ChiTietSanPham chiTietSanPham : lstChiTietSP) {
            System.out.println("test spct: " + chiTietSanPham.getIdSanPham().getTen());

            if (!params.get("soLuong").equals("")) {
                System.out.println("=======================do set so luong: " + params.get("soLuong"));
                chiTietSanPham.setSoLuong(Integer.valueOf(params.get("soLuong").toString()));
            }

            if (!params.get("giaNhap").equals("")) {
                System.out.println("=======================do set gia nhap: " + params.get("giaNhap"));
                chiTietSanPham.setGiaNhap(BigDecimal.valueOf(Long.valueOf(params.get("giaNhap").toString())));
            }

            if (!params.get("giaBan").equals("")) {
                System.out.println("====================== do set gia ban: " + params.get("giaBan"));
                chiTietSanPham.setGiaBan(BigDecimal.valueOf(Long.valueOf(params.get("giaBan").toString())));
            }

            if (!params.get("moTa").equals("")) {
                System.out.println("====================== do set mo ta: " + params.get("moTa"));
                chiTietSanPham.setMoTa(params.get("moTa").toString());
            }

            if (!params.get("trangThai").equals("")) {
                System.out.println("===================== do set trang thai: " + params.get("trangThai"));
                chiTietSanPham.setTrangThai(Integer.valueOf(params.get("trangThai").toString()));
            }

            if (!params.get("hinhAnh1").equals("") || !params.get("hinhAnh2").equals("") || !params.get("hinhAnh3").equals("")) {
                System.out.println("======= do set hinh anh");

                HinhAnh newHinhAnh = hinhAnhRepo.findByIdCTSP(chiTietSanPham.getId());

                // Check if HinhAnh record exists, if not, create a new one
                if (newHinhAnh == null) {
                    newHinhAnh = new HinhAnh();
                    newHinhAnh.setIdCTSP(chiTietSanPham); // Ensure you set the correct relationship here
                }
                newHinhAnh.setHinhAnh1(params.get("hinhAnh1").toString());
                newHinhAnh.setHinhAnh2(params.get("hinhAnh2").toString());
                newHinhAnh.setHinhAnh3(params.get("hinhAnh3").toString());
                hinhAnhRepo.save(newHinhAnh);
            }
        }

        chiTietSPRepository.saveAll(lstChiTietSP);

        for (ChiTietSanPham chiTietSanPham : lstChiTietSP) {
            System.out.println("new data:  " + chiTietSanPham);
        }

        return ResponseEntity.ok(1);
    }



    @CrossOrigin
    @PostMapping("/enable-status/{id}")
    public ResponseEntity<Integer> enableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(chiTietSPRepository.enableStt(id));
    }

    @CrossOrigin
    @PostMapping("/disable-status/{id}")
    public ResponseEntity<Integer> disableStatus(@PathVariable(value = "id") String id) {
        return ResponseEntity.ok(chiTietSPRepository.enableStt(id));
    }

    @CrossOrigin
    @PostMapping("save")
    public ResponseEntity<ChiTietSanPhamNoMap> Store(
            @RequestBody @Valid SPCTStore newChiTietSP,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            System.out.println("temp error: " + result);
            return ResponseEntity.ok(null);
        } else {
            ChiTietSanPhamNoMap spctChecked = spctRepoNoMap.findDuplicatedRecord(newChiTietSP.getIdSp(), newChiTietSP.getIdMauSac(), newChiTietSP.getIdKichThuoc(), newChiTietSP.getIdChatLieu(), newChiTietSP.getIdKieuTay());
            if (spctChecked != null) {
                System.out.println("is duplicated");
                return ResponseEntity.ok(null);
            } else {
                System.out.println("do normal adding");
                LocalDateTime localNow = LocalDateTime.now();
                ChiTietSanPhamNoMap chiTietSP = new ChiTietSanPhamNoMap();
                chiTietSP.setIdSanPham(newChiTietSP.getIdSp());
                chiTietSP.setIdMauSac(newChiTietSP.getIdMauSac());
                chiTietSP.setIdKichThuoc(newChiTietSP.getIdKichThuoc());
                chiTietSP.setIdChatLieu(newChiTietSP.getIdChatLieu());
                chiTietSP.setIdKieuTay(newChiTietSP.getIdKieuTay());
                chiTietSP.setMoTa(newChiTietSP.getMoTa());
                chiTietSP.setSoLuong(Integer.valueOf(newChiTietSP.getSoLuong()));
                chiTietSP.setGiaNhap(BigDecimal.valueOf(Long.valueOf(newChiTietSP.getGiaNhap())));
                chiTietSP.setGiaBan(BigDecimal.valueOf(Long.valueOf(newChiTietSP.getGiaBan())));
                chiTietSP.setTrangThai(Integer.valueOf(newChiTietSP.getTrangThai()));
                chiTietSP.setNgayTao(localNow);
                return ResponseEntity.ok(spctRepoNoMap.save(chiTietSP));
            }
        }
    }

    @GetMapping("/search")
    public ResponseEntity<List<SPCTView>> searchChiTietSanPham(@RequestParam Map<String, Object> params, @RequestParam("page") Optional<Integer> pageParam) {
        List<ChiTietSanPham> lstChiTietSP = search.searchChiTietSanPham1(params);
        int page = pageParam.orElse(1);
        Pageable pageable = PageRequest.of(page - 1, 20);
        List<SPCTView> lstSPCTView =  new ArrayList<>();
        for (ChiTietSanPham chiTietSanPham : lstChiTietSP) {
            SPCTView spctView = new SPCTView();
            spctView.setId(chiTietSanPham.getId());
            spctView.setSoLuong(chiTietSanPham.getSoLuong());
            spctView.setMoTa(chiTietSanPham.getMoTa());
            spctView.setGiaNhap(chiTietSanPham.getGiaNhap());
            spctView.setGiaBan(chiTietSanPham.getGiaBan());
            spctView.setNgayTao(chiTietSanPham.getNgayTao());
            spctView.setTrangThai(chiTietSanPham.getTrangThai());
            spctView.setIdMauSac(chiTietSanPham.getIdMauSac());
            spctView.setIdKichThuoc(chiTietSanPham.getIdKichThuoc());
            spctView.setIdChatLieu(chiTietSanPham.getIdChatLieu());
            spctView.setIdKieuTay(chiTietSanPham.getIdKieuTay());
            spctView.setIdSanPham(chiTietSanPham.getIdSanPham());
            spctView.setHinhAnh(chiTietSPRepository.getHinhAnhOfSPCT(chiTietSanPham.getId()));
            lstSPCTView.add(spctView);
            System.out.println("==========================================hinh anh: "+ spctView.getHinhAnh());
        }
        return ResponseEntity.ok(lstSPCTView);
    }

    @GetMapping("/search1")
    public ResponseEntity<List<SPCTResponse>> searchIdSP(@RequestParam Map<String, Object> params) {
        List<ChiTietSanPham> chiTietSanPhams = search.searchChiTietSanPham1(params);
        Set<String> processedIds = new HashSet<>();
        List<SPCTResponse> lstSpct = new ArrayList<>();
        for (ChiTietSanPham chiTietSanPham : chiTietSanPhams) {
            String sanPhamId = chiTietSanPham.getIdSanPham().getId();
            if (chiTietSanPham.getSoLuong() > 0 && !processedIds.contains(sanPhamId)) {
                SPCTResponse  spctResponse = new SPCTResponse();
                spctResponse.setIdCTSP(chiTietSanPham.getId());
                spctResponse.setIdSP(chiTietSanPham.getIdSanPham().getId());
                spctResponse.setMaSP(chiTietSanPham.getIdSanPham().getMa());
                spctResponse.setTenSP(chiTietSanPham.getIdSanPham().getTen());
                spctResponse.setTenKieuTay(chiTietSanPham.getIdKieuTay().getTen());
                spctResponse.setGiaBan(chiTietSanPham.getGiaBan());
                spctResponse.setHinhAnh1(hinhAnhRepo.findMinHinhAnhByCTSP(chiTietSanPham.getId()));
                lstSpct.add(spctResponse);
                processedIds.add(sanPhamId);
                System.out.println("spctresponse: "+spctResponse);
            }
        }
        return ResponseEntity.ok(lstSpct);
    }

}