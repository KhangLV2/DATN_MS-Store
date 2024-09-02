package com.example.java4.controller.QuanLyHoaDon;

import com.example.java4.config.HoaDonUtil;
import com.example.java4.config.UserInfor;
import com.example.java4.controller.BanHangTaiQuay.Validator;
import com.example.java4.entities.*;
import com.example.java4.repositories.*;
import com.example.java4.request.dangNhap.NVSignUpRequest;
import com.example.java4.request.req_sang.DiaChiRequest;
import com.example.java4.response.GiaoHangDTO;
import com.example.java4.response.HoaDonDTO;
import com.example.java4.response.HoaDonResponse;
import com.example.java4.response.LichSuHoaDonDTO;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Sort;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/hoa-don2")
public class QuanLyHoaDonControllerTest {

    @Autowired
    KhachHangRepository _khachHangRepo;

    @Autowired
    NhanVienRepository _nhanVienRepo;

    @Autowired
    HDCTRepository _hoaDonChiTietRepo;

    @Autowired
    HoaDonRepository hoaDonRepository;

    @Autowired
    HDCTRepository _hoaDonChiTietReposioty;

    @Autowired
    DiaChiRepository _diaChiRepository;

    @Autowired
    HoaDonRepository _hoaDonRepo;

    @Autowired
    SPCTRepository _sanPhamChiTietRepo;

    @Autowired
    KichThuocRepository kichThuocRepo;

    @Autowired
    ChatLieuRepository chatLieuRepo;

    @Autowired
    KieuTayRepository kieuTayRepo;

    @Autowired
    NhanVienRepository nhanVienRepo;

    @Autowired
    KhuyenMaiRepository khuyenMaiRepo;

    @Autowired
    MauSacRepository mauSacRepository;

    @Autowired
    GiaoHangRepo _giaoHangRepo;

    @Autowired
    SPCTRepository _chiTietSanPhamRepo;

    @Autowired
    HinhAnhRepository _hinhAnhRepo;

    @Autowired
    LichSuHoaDonRepository _lichSuHoaDonRepo;

    @Autowired
    KhuyenMaiRepository _khuyenMaiRepo;

    @Autowired
    DiaChiRepository _diaChiRepo;

    @Autowired
    Validator validator;

    private final RestTemplate restTemplate = new RestTemplate();

    private List<MauSac> listMauSac;
    private List<KichThuoc> listKichThuoc;
    private List<SanPham> listSanPham;
    private List<KieuTay> listKieuTay;
    private List<ChatLieu> listChatLieu;
    private List<KhuyenMai> listKhuyenMai;
    private List<ChiTietSanPham> listChiTietSanPham;
    private List<HoaDon> listHoaDon;
    private String idHoaDon;


    @GetMapping("dang-nhap-view")
    public String getDangNhapview(Model model) {
        NVSignUpRequest nhanVienRequest = new NVSignUpRequest();
        model.addAttribute("nhanVien", nhanVienRequest);
        return "/view/BanHangTaiQuay/dangNhapAdmin.jsp";
    }

    @PostMapping("dang-nhap")
    public String dangNhap(
            Model model,
            @Valid @ModelAttribute("nhanVien") NVSignUpRequest nvReq,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            HttpSession session
    ) {
        if (result.hasErrors()) {
            System.out.println("Có lỗi");
            System.out.println("result error:" + result.toString());
            return "/view/BanHangTaiQuay/dangNhapAdmin.jsp";
        }

        //Tìm kiếm nhân viên theo tên tài khoản
        boolean checkRole = false;
        NhanVien nhanVienByTK = nhanVienRepo.findByTaiKhoan(nvReq.getTaiKhoan());
        if (nhanVienByTK == null) {
            redirectAttributes.addFlashAttribute("error", "Tên tài khoản không tồn tại!");
            return "redirect:/hoa-don/dang-nhap-view";
        } else {
            if (nvReq.getMatKhau().equals(nhanVienByTK.getMatKhau())) {
                UserInfor.idNhanVien = nhanVienByTK.getId();
                //Check admin hay nhân viên
                String role = nhanVienByTK.getIdCV().getTen();
                session.setAttribute("userRole", role);

                redirectAttributes.addFlashAttribute("success", "Đăng nhập thành công");
                return "redirect:/hoa-don/hien-thi";
            } else {
                redirectAttributes.addFlashAttribute("error", "Mật khẩu nhập vào chưa đúng!");
                return "redirect:/hoa-don/dang-nhap-view";
            }
        }
    }

    @GetMapping("dang-xuat")
    public String dangXuat() {
        UserInfor.idNhanVien = null;
        return "redirect:/admin/dang-nhap-view";
    }


    // Chức năng hiển thị danh sach hoa don theo trang thai
    @GetMapping("/hien-thi")
    public String view(Model model,
                       @RequestParam(value = "page", defaultValue = "0") int page,
                       @RequestParam(value = "status", required = false) String status,
                       @RequestParam(value = "loaiHoaDon", required = false) Integer loaiHoaDon,
                       @RequestParam(value = "keyword", required = false) String keyword,
                       @RequestParam(value = "startDate", required = false) String startDateStr,
                       @RequestParam(value = "endDate", required = false) String endDateStr) {
        Pageable pageable = PageRequest.of(page, 5, Sort.by(Sort.Direction.DESC, "ngayTao"));


        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        } else {
            return "redirect:/admin/dang-nhap-view";
        }

        //Lớp Util để xử chuyển đổi trạng thái
        HoaDonUtil hoaDonUtil = new HoaDonUtil();
        // Xử lý ngày tạo
        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        if (startDateStr != null && !startDateStr.isEmpty()) {
            startDate = LocalDate.parse(startDateStr).atStartOfDay();
        }
        if (endDateStr != null && !endDateStr.isEmpty()) {
            endDate = LocalDate.parse(endDateStr).atTime(LocalTime.MAX);
        }

        Page<HoaDon> pageHD;
        //Tìm kiếm theo từ khóa
        if (keyword != null && !keyword.isEmpty() && loaiHoaDon == -1) {
            pageHD = hoaDonRepository.seachMaAndSdt(keyword, pageable);
        }
        //Tìm kiếm theo khoảng ngày
        else if (startDateStr != null && endDateStr != null && !startDateStr.isEmpty() && !endDateStr.isEmpty() && loaiHoaDon == -1) {
            pageHD = hoaDonRepository.searchByDate(startDate, endDate, pageable);
        } else if (keyword != null && !keyword.isEmpty() && startDateStr != null && endDateStr != null && !startDateStr.isEmpty() && !endDateStr.isEmpty() && loaiHoaDon != -1) {
            pageHD = hoaDonRepository.searchByMaOrSdtAndLoaiHoaDonAndNgayTao(keyword, loaiHoaDon, startDate, endDate, pageable);
        }
        //Tìm kiếm theo từ khóa và loại hóa đơn
        else if (keyword != null && !keyword.isEmpty() && loaiHoaDon != -1) {
            pageHD = hoaDonRepository.searchByMaOrSdtAndLoaiHoaDon(keyword, loaiHoaDon, pageable);
        }
        //Tìm kiếm theo loại hóa đơn và theo khoảng ngày
        else if (loaiHoaDon != null && startDateStr != null && endDateStr != null && !startDateStr.isEmpty() && !endDateStr.isEmpty()) {
            pageHD = hoaDonRepository.searchByLoaiHoaDonAndNgayTao(loaiHoaDon, startDate, endDate, pageable);
        } else {
            if (status != null && !status.isEmpty()) {
                // Lấy ra Page<HoaDon> theo trạng thái
                pageHD = getPageByStatus(status, pageable);
            } else {
                pageHD = (loaiHoaDon != null && loaiHoaDon != -1) ? hoaDonRepository.findByLoaiHoaDon(loaiHoaDon, pageable) : hoaDonRepository.findAllExcludingSpecificTypeAndStatus(pageable);
            }
        }

        // Chuyển đổi danh sách hóa đơn sang HoaDonDTO
        List<HoaDonDTO> listHoaDonDTO = pageHD.stream()
                .map(hoaDon -> {
                    HoaDonDTO hoaDonDTO = HoaDonDTO.fromEntity(hoaDon);
                    hoaDonDTO.setTrangThaiText(hoaDonUtil.getTrangThaiName(hoaDon.getTrangThai()));
                    hoaDonDTO.setMaMau(hoaDonUtil.getStatusClass(hoaDon.getTrangThai()));
                    return hoaDonDTO;
                })

                .collect(Collectors.toList());

        // Đếm số lượng các hóa đơn theo trạng thái
        addStatusCountsToModel(model);
        model.addAttribute("hoaDonPage", listHoaDonDTO);
        model.addAttribute("pageHD", pageHD);
        model.addAttribute("currentStatus", status);
        model.addAttribute("currentLoaiHoaDon", loaiHoaDon);
        model.addAttribute("keyword", keyword);
        model.addAttribute("startDate", startDateStr);
        model.addAttribute("endDate", endDateStr);
        return "/view/QLHD/bill.jsp";
    }


    // Hàm lấy ra Page<HoaDon> theo trạng thái
    private Page<HoaDon> getPageByStatus(String status, Pageable pageable) {
        switch (status) {
            case "all":
                return hoaDonRepository.findAllExcludingSpecificTypeAndStatus(pageable);
            case "confirmation":
                return hoaDonRepository.findByTrangThai(HoaDonRepository.CHO_XAC_NHAN, pageable);
            case "delivery":
                return hoaDonRepository.findByTrangThai(HoaDonRepository.CHO_GIAO_HANG, pageable);
            case "delivering":
                return hoaDonRepository.findByTrangThai(HoaDonRepository.DANG_GIAO_HANG, pageable);
            case "accomplished":
                return hoaDonRepository.findByTrangThai(HoaDonRepository.DA_HOAN_THANH, pageable);
            case "cancelled":
                return hoaDonRepository.findByTrangThai(HoaDonRepository.DA_HUY, pageable);
            default:
                return hoaDonRepository.findAllExcludingSpecificTypeAndStatus(pageable);
        }
    }

    // Hàm Đếm số lượng các hóa đơn theo trạng thái và truyền sang view
    private void addStatusCountsToModel(Model model) {
        model.addAttribute("countAll", hoaDonRepository.countAll());
        model.addAttribute("countChoXacNhan", hoaDonRepository.countByTrangThai(HoaDonRepository.CHO_XAC_NHAN));
        model.addAttribute("countDaXacNhan", hoaDonRepository.countByTrangThai(HoaDonRepository.DA_XAC_NHAN));
        model.addAttribute("countChoGiaoHang", hoaDonRepository.countByTrangThai(HoaDonRepository.CHO_GIAO_HANG));
        model.addAttribute("countDangGiaoHang", hoaDonRepository.countByTrangThai(HoaDonRepository.DANG_GIAO_HANG));
        model.addAttribute("countDaThanhToan", hoaDonRepository.countByTrangThai(HoaDonRepository.DA_THANH_TOAN));
        model.addAttribute("countDaHoanThanh", hoaDonRepository.countByTrangThai(HoaDonRepository.DA_HOAN_THANH));
        model.addAttribute("countDaHuy", hoaDonRepository.countByTrangThai(HoaDonRepository.DA_HUY));
    }

    // Chức năng xem thông tin chi tiết hóa đơn theo IDHD
    @GetMapping("/detail/{idHD}")
    public String detailHDCT(Model model,
                             @PathVariable("idHD") String idHD,
                             @RequestParam(value = "page", defaultValue = "0") String pageParam
    ) {

    idHoaDon=idHD;

        //Tìm đối tượng nhân viên
        NhanVien nhanVien = new NhanVien();
        if (UserInfor.idNhanVien != null) {
            nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
        } else {
            return "redirect:/admin/dang-nhap-view";
        }
        // Lấy danh sách chi tiết hóa đơn
        List<ChiTietHoaDon> listHDCT = _hoaDonChiTietRepo.findAllByHoaDon_Id(idHD);
        // Lấy ra hóa đơn theo ID
        HoaDon hoaDon = _hoaDonRepo.findById(idHD).orElse(null);
        idHoaDon = idHD;
        if (hoaDon == null) {
            model.addAttribute("errorMessage", "Không tìm thấy hóa đơn.");
            return "/view/QLHD/detail_bill2.jsp";
        }

        KhachHang khachHang = hoaDon.getIdKhachHang();
        DiaChi diaChiKhachHang = new DiaChi();
        if (khachHang == null) {
            khachHang = new KhachHang(); // Assume you have a default constructor
            khachHang.setHoTen("Khách lẻ"); // Default name
        }
        if (diaChiKhachHang == null) {
            diaChiKhachHang = new DiaChi();
            diaChiKhachHang.setDiaChiChiTiet("");
        } else {
            List<DiaChi> diaChiList = _diaChiRepository.findDiaChiByIdKhachHang(khachHang.getId());
            diaChiKhachHang = diaChiList.isEmpty() ? new DiaChi() : diaChiList.get(0);
        }

        KhuyenMai khuyenMai = _hoaDonRepo.findKhuyenMaiByHoaDonId(idHD);
        if (khuyenMai == null) {
            khuyenMai = new KhuyenMai();
            khuyenMai.setSoTienGiam(BigDecimal.valueOf(0.0));
        }

        // Chuyển đổi từ HoaDon sang HoaDonDTO
        HoaDonUtil hoaDonUtil = new HoaDonUtil();
        HoaDonDTO hoaDonDTO = HoaDonDTO.fromEntity(hoaDon);
        hoaDonDTO.setTrangThaiText(hoaDonUtil.getTrangThaiName(hoaDon.getTrangThai()));
        hoaDonDTO.setMaMau(hoaDonUtil.getStatusClass(hoaDon.getTrangThai()));
        hoaDonDTO.setGiamGia(khuyenMai.getSoTienGiam());

        // Tính tổng tiền đơn hàng từ danh sách chi tiết hóa đơn
        BigDecimal tongTien = calculateTongTien(listHDCT);
        // Lấy hình ảnh cho các chi tiết sản phẩm và các hình ảnh trong hóa đơn chi tiết
        Map<String, HinhAnh> hinhAnhMap = getHinhAnhMap(listHDCT);
        Map<String, HinhAnh> hinhAnhMapCTSP = getHinhAnhMapCTSP();

        // Lấy ra đối tượng giao hàng theo IdHoaDon
        GiaoHang giaoHang = _giaoHangRepo.findByHoaDonId(idHD);
        if (giaoHang == null) {
            model.addAttribute("errorDelivery", "Không tìm thấy đối tượng giao hàng");
        }

        GiaoHangDTO giaoHangDTO = GiaoHangDTO.toDTO(giaoHang);
        if (giaoHangDTO == null) {
            model.addAttribute("errorDelivery", "Không tìm thấy đối tượng giao hàng");
        }

        BigDecimal phiGiamGia = BigDecimal.ZERO;
        if (khuyenMai != null) {
            phiGiamGia = khuyenMai.getSoTienGiam();
        }
        // Lấy ra danh sách chi tiết sản phẩm để hiển thị lên modal Thêm sản phẩm
        Page<ChiTietSanPham> listCTSP = getListChiTietSanPham(pageParam);

        // Lấy ra danh sách lịch sử hóa đơn và convert sang danh sách lichSuHoaDoDTO
        List<LichSuHoaDon> listLichSuHoaDon = _lichSuHoaDonRepo.findListByIdHoaDon(hoaDon.getId());
        if (listLichSuHoaDon == null) {
            LichSuHoaDon lichSuHoaDon = new LichSuHoaDon();
            lichSuHoaDon.setTrangThai(1);
        }

        List<LichSuHoaDonDTO> listLichSuHoaDonDTO = listLichSuHoaDon.stream()
                .map(this::processLichSuHoaDon)
                .collect(Collectors.toList());
        // Sắp xếp danh sách lịch sử hóa đơn theo thứ tự tăng dần theo thời gian
        Collections.sort(listLichSuHoaDonDTO, Comparator.comparing(
                LichSuHoaDonDTO::getThoiGian,
                Comparator.nullsLast(Comparator.naturalOrder())
        ));

        // Đêm so luong trong hoa don chi tiet
        Integer totalSoLuong = 0;
        for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
            totalSoLuong += chiTietHoaDon.getSoLuong();
        }

        model.addAttribute("listLichSuHoaDonDTO", listLichSuHoaDonDTO);
        model.addAttribute("hinhAnhMap", hinhAnhMap);
        model.addAttribute("hinhAnhMapCTSP", hinhAnhMapCTSP);
        model.addAttribute("tongTienThanhToan", calculateTongTienThanhToan(tongTien, khuyenMai, giaoHang).doubleValue());
        // Thêm các thông tin vào model để truyền sang JSP
        addAttributesToModel(model, nhanVien, hoaDonDTO, khachHang, diaChiKhachHang, giaoHangDTO, listHDCT, listCTSP, listLichSuHoaDon, tongTien, phiGiamGia);

        model.addAttribute("soLuongGioHang", totalSoLuong);

        return "/view/QLHD/detail_bill2.jsp";
    }


    // Lấy ra danh sách chi tiết sản phẩm
    private Page<ChiTietSanPham> getListChiTietSanPham(String pageParam) {
        Pageable pageable = PageRequest.of(Integer.valueOf(pageParam), 10);
        Page<ChiTietSanPham> listCTSP = _sanPhamChiTietRepo.findByTrangThai(1, pageable);
        for (ChiTietSanPham ctsp : listCTSP) {
            if (ctsp.getSoLuong() <= 0) {
                ctsp.setTrangThai(_sanPhamChiTietRepo.INACTIVE);
                listCTSP = _sanPhamChiTietRepo.findByTrangThai(_sanPhamChiTietRepo.INACTIVE, pageable);
                _sanPhamChiTietRepo.save(ctsp);
            }
        }
        return listCTSP;
    }

    //Lấy ra hình ảnh trong chi tiết sản phẩm
    private Map<String, HinhAnh> getHinhAnhMapCTSP() {
        Map<String, HinhAnh> hinhAnhMapCTSP = new HashMap<>();
        List<ChiTietSanPham> listChiTietSanPham = _chiTietSanPhamRepo.findAll();
        for (ChiTietSanPham ctsp : listChiTietSanPham) {
            HinhAnh hinhAnh = _hinhAnhRepo.findByIdCTSP(ctsp.getId());
            if (hinhAnh != null) {
                hinhAnhMapCTSP.put(ctsp.getId(), hinhAnh);
            }
        }
        return hinhAnhMapCTSP;
    }


    // Chức năng xử lý danh sách lịch sử hóa đơn
    private LichSuHoaDonDTO processLichSuHoaDon(LichSuHoaDon lichSuHD) {
        LichSuHoaDonDTO lichSuHoaDonDTO = new LichSuHoaDonDTO();
        HoaDon hoaDon = _hoaDonRepo.findByIdHoaDon(lichSuHD.getIdHoaDon().getId());
        NhanVien nhanVien = hoaDon.getIdNhanVien();
        if (nhanVien == null) {
            nhanVien = new NhanVien();

        }
        // Kiểm tra null cho IdNhanVien trước khi gọi getHoTen()
        if (lichSuHD.getIdNhanVien() == null || lichSuHD.getIdNhanVien().getHoTen() == null) {
            lichSuHoaDonDTO.setHoTen("");
            lichSuHoaDonDTO.setChucVu("");
        } else {
            lichSuHoaDonDTO.setHoTen(lichSuHD.getIdNhanVien().getHoTen());
            lichSuHoaDonDTO.setChucVu(lichSuHD.getIdNhanVien().getIdCV().getTen());
        }

        lichSuHoaDonDTO.setId(lichSuHD.getId());
        lichSuHoaDonDTO.setGhiChu(lichSuHD.getGhiChu());
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        if (lichSuHD.getIdHoaDon().getLoaiHoaDon() == 0) {
            if (lichSuHD.getTrangThai() == 0) {
                lichSuHoaDonDTO.setTrangThai("Tạo hóa đơn");
                lichSuHoaDonDTO.setThoiGian(hoaDon.getNgayTao() != null ? dateTimeFormatter.format(hoaDon.getNgayTao()) : null);
            } else if (lichSuHD.getTrangThai() == 6) {
                lichSuHoaDonDTO.setTrangThai("Đã hoàn thành");
                lichSuHoaDonDTO.setThoiGian(hoaDon.getNgayThanhToan() != null ? dateTimeFormatter.format(hoaDon.getNgayThanhToan()) : null);
            }
        } else if (lichSuHD.getIdHoaDon().getLoaiHoaDon() == 1) {
            switch (lichSuHD.getTrangThai()) {
                case HoaDonRepository.CHO_XAC_NHAN:
                    lichSuHoaDonDTO.setTrangThai("Chờ xác nhận");
                    lichSuHoaDonDTO.setThoiGian(hoaDon.getNgayTao() != null ? dateTimeFormatter.format(hoaDon.getNgayTao()) : null);
                    break;
                case HoaDonRepository.CHO_GIAO_HANG:
                    lichSuHoaDonDTO.setTrangThai("Chờ giao hàng");
                    lichSuHoaDonDTO.setThoiGian(hoaDon.getNgayChoGiaoHang() != null ? dateTimeFormatter.format(hoaDon.getNgayChoGiaoHang()) : null);
                    break;
                case HoaDonRepository.DANG_GIAO_HANG:
                    lichSuHoaDonDTO.setTrangThai("Đang vận chuyển");
                    lichSuHoaDonDTO.setThoiGian(hoaDon.getNgayDangGiaoHang() != null ? dateTimeFormatter.format(hoaDon.getNgayDangGiaoHang()) : null);
                    break;
                case HoaDonRepository.DA_HOAN_THANH:
                    lichSuHoaDonDTO.setTrangThai("Hoàn Thành");
                    lichSuHoaDonDTO.setThoiGian(hoaDon.getNgayThanhToan() != null ? dateTimeFormatter.format(hoaDon.getNgayThanhToan()) : null);
                    break;
                case HoaDonRepository.DA_HUY:
                    lichSuHoaDonDTO.setTrangThai("Hủy đơn hàng");
                    lichSuHoaDonDTO.setThoiGian(hoaDon.getNgayCapNhat() != null ? dateTimeFormatter.format(hoaDon.getNgayCapNhat()) : null);
                    break;
            }
        }

        return lichSuHoaDonDTO;
    }


    // Tính tổng tiền trong hóa đơn chi tiết
    private BigDecimal calculateTongTien(List<ChiTietHoaDon> listHDCT) {
        BigDecimal tongTien = BigDecimal.ZERO;
        for (ChiTietHoaDon hdct : listHDCT) {
            BigDecimal donGia = hdct.getDonGia();
            int soLuong = hdct.getSoLuong();
            tongTien = tongTien.add(donGia.multiply(BigDecimal.valueOf(soLuong)));
        }
        return tongTien;
    }

    // Lấy ra hình ảnh trong hóa đơn chi tiết
    private Map<String, HinhAnh> getHinhAnhMap(List<ChiTietHoaDon> listHDCT) {
        Map<String, HinhAnh> hinhAnhMap = new HashMap<>();
        for (ChiTietHoaDon hdct : listHDCT) {
            HinhAnh hinhAnh = _hinhAnhRepo.findByIdCTSP(hdct.getIdCTSP().getId());
            if (hinhAnh != null) {
                hinhAnhMap.put(hdct.getIdCTSP().getId(), hinhAnh);
            }
        }
        return hinhAnhMap;
    }


    // Tính ra tổng tiền cần phải thanh toán
    private BigDecimal calculateTongTienThanhToan(BigDecimal tongTien, KhuyenMai khuyenMai, GiaoHang giaoHang) {
        // Mắc định nếu không có là 0đ
        BigDecimal phiGiamGia = khuyenMai != null ? khuyenMai.getSoTienGiam() : BigDecimal.ZERO;
        BigDecimal phiShip = giaoHang != null && giaoHang.getPhiShip() != null ? giaoHang.getPhiShip() : BigDecimal.ZERO;
        // Tính lại tổng tiền thanh toán
        BigDecimal tongTienThanhToan = tongTien.add(phiShip).subtract(phiGiamGia).max(BigDecimal.ZERO);
        return tongTienThanhToan;
    }


    private void addAttributesToModel(Model model, NhanVien nhanVien, HoaDonDTO hoaDonDTO, KhachHang khachHang, DiaChi diaChiKhachHang, GiaoHangDTO giaoHangDTO, List<ChiTietHoaDon> listHDCT, Page<ChiTietSanPham> listCTSP, List<LichSuHoaDon> listLichSuHoaDon, BigDecimal tongTien, BigDecimal phiGiamGia) {
        model.addAttribute("nv", nhanVien);
        model.addAttribute("hoaDonDTO", hoaDonDTO);
        model.addAttribute("khachHang", khachHang);
        model.addAttribute("diaChiKhachHang", diaChiKhachHang);
        model.addAttribute("giaoHangDTO", giaoHangDTO);
        model.addAttribute("listHDCT", listHDCT);
        model.addAttribute("tongTienDonHang", tongTien.doubleValue());
        model.addAttribute("phiGiamGia", phiGiamGia.doubleValue());
        model.addAttribute("listMauSac", mauSacRepository.findAll());
        model.addAttribute("listKichThuoc", kichThuocRepo.findAll());
        model.addAttribute("listChatLieu", chatLieuRepo.findAll());
        model.addAttribute("listKieuTay", kieuTayRepo.findAll());
        model.addAttribute("listSanPham", _sanPhamChiTietRepo.findAll());
        model.addAttribute("listKM", khuyenMaiRepo.findAll());
        model.addAttribute("listCTSP", listCTSP);
        model.addAttribute("pageCTSP", listCTSP);
        model.addAttribute("listLichSuHoaDon", listLichSuHoaDon);
    }

    // chức năng in phiếu giao hàng
    @GetMapping("/in-phieu-giao-hang")
    public String printDelivery(Model model
    ) {
        // Lấy danh sách chi tiết hóa đơn
        List<ChiTietHoaDon> listHDCT = _hoaDonChiTietRepo.findAllByHoaDon_Id(idHoaDon);
        // Lấy ra hóa đơn theo ID
        HoaDon hoaDon = _hoaDonRepo.findById(idHoaDon).orElse(null);
        if (hoaDon == null) {
            model.addAttribute("errorMessage", "Không tìm thấy hóa đơn.");
            return "/view/QLHD/detail_bill2.jsp";
        }

        KhachHang khachHang = hoaDon.getIdKhachHang();
        DiaChi diaChiKhachHang = new DiaChi();
        if (khachHang == null) {
            khachHang = new KhachHang(); // Assume you have a default constructor
            khachHang.setHoTen("Khách lẻ"); // Default name
        }
        if (diaChiKhachHang == null) {
            diaChiKhachHang = new DiaChi();
            diaChiKhachHang.setDiaChiChiTiet("");
        } else {
            List<DiaChi> diaChiList = _diaChiRepository.findDiaChiByIdKhachHang(khachHang.getId());
            diaChiKhachHang = diaChiList.isEmpty() ? new DiaChi() : diaChiList.get(0);
        }

        KhuyenMai khuyenMai = _hoaDonRepo.findKhuyenMaiByHoaDonId(idHoaDon);
        if (khuyenMai == null) {
            khuyenMai = new KhuyenMai();
            khuyenMai.setSoTienGiam(BigDecimal.valueOf(0.0));
        }

        // Tính tổng tiền đơn hàng từ danh sách chi tiết hóa đơn
        BigDecimal tongTien = calculateTongTien(listHDCT);
        // Lấy ra đối tượng giao hàng theo IdHoaDon
        GiaoHang giaoHang = _giaoHangRepo.findByHoaDonId(idHoaDon);
        if (giaoHang == null) {
            model.addAttribute("errorDelivery", "Không tìm thấy đối tượng giao hàng");
        }

        // Chuyển đổi từ HoaDon sang HoaDonDTO
        HoaDonUtil hoaDonUtil = new HoaDonUtil();
        HoaDonDTO hoaDonDTO = HoaDonDTO.fromEntity(hoaDon);
        hoaDonDTO.setGiamGia(khuyenMai.getSoTienGiam());
        model.addAttribute("hoaDonDTO", hoaDonDTO);
        model.addAttribute("diaChiKhachHang", diaChiKhachHang);
        model.addAttribute("listHDCT", listHDCT);
        model.addAttribute("tongTienThanhToan", calculateTongTienThanhToan(tongTien, khuyenMai, giaoHang).doubleValue());
        return "/view/QLHD/in_phieu_giao_hang.jsp";
    }


    // Chức năng xác nhận đơn hàng
    @PostMapping("/xac-nhan/{idHD}")
    @Transactional
    public String confirmBill(@PathVariable("idHD") String idHD,
                              @RequestParam("trangThai") int trangThai,
                              @RequestParam("moTa") String moTa,
                              Model model,
                              RedirectAttributes redirectAttributes) {
        try {
            HoaDon hoaDon = _hoaDonRepo.findById(idHD).orElse(null);
            if (hoaDon == null) {
                redirectAttributes.addFlashAttribute("confirmError", "Không tìm thấy hóa đơn.");
                return "redirect:/hoa-don/detail/" + idHD;
            }

            NhanVien nhanVien = null;
            if (UserInfor.idNhanVien != null) {
                nhanVien = _nhanVienRepo.findById(UserInfor.idNhanVien).orElse(null);
                if (nhanVien == null) {
                    nhanVien = new NhanVien();
                    redirectAttributes.addFlashAttribute("confirmError", "Không tìm thấy nhân viên.");
                    return "redirect:/hoa-don/detail/" + idHD;
                }
            }

            // Kiểm tra trạng thái hiện tại của hóa đơn
            if (hoaDon.getTrangThai() != _hoaDonRepo.CHO_XAC_NHAN && hoaDon.getTrangThai() != _hoaDonRepo.CHO_GIAO_HANG && hoaDon.getTrangThai() != _hoaDonRepo.DANG_GIAO_HANG) {
                redirectAttributes.addFlashAttribute("confirmError", "Trạng thái của hóa đơn đã thay đổi. Vui lòng tải lại trang.");
                return "redirect:/hoa-don/detail/" + idHD;
            }


            if (hoaDon.getTrangThai() == _hoaDonRepo.CHO_XAC_NHAN) {
                List<ChiTietHoaDon> chiTietList = _hoaDonChiTietRepo.findAllByHoaDon_Id(idHD);
                if (chiTietList.size() < 1) {
                    redirectAttributes.addFlashAttribute("errorProductDetail", "Hóa đơn phải có ít nhất một sản phẩm");
                    return "redirect:/hoa-don/detail/" + idHD;
                }

                // Kiểm tra số lượng sản phẩm trong kho
                List<String> outOfStockProducts = new ArrayList<>();
                for (ChiTietHoaDon chiTietHD : chiTietList) {
                    String idChiTietHoaDon = chiTietHD.getId();
                    Optional<ChiTietSanPham> chiTietSanPhamOptional = _chiTietSanPhamRepo.findByHoaDonChiTietId(idChiTietHoaDon);
                    if (chiTietSanPhamOptional.isPresent()) {
                        ChiTietSanPham chiTietSanPham = chiTietSanPhamOptional.get();
                        int soLuongConLai = chiTietSanPham.getSoLuong() - chiTietHD.getSoLuong();
                        if (soLuongConLai < 0) {
                            outOfStockProducts.add(chiTietSanPham.getIdSanPham().getTen() + " (" + chiTietSanPham.getIdSanPham().getMa() + ")");
                        }
                    } else {
                        redirectAttributes.addFlashAttribute("errorProductDetail", "Không tìm thấy chi tiết sản phẩm có ID = " + idChiTietHoaDon);
                        return "redirect:/hoa-don/detail/" + idHD;
                    }
                }

                // Nếu có sản phẩm hết hàng, thông báo lỗi và không xác nhận đơn hàng
                if (!outOfStockProducts.isEmpty()) {
                    String outOfStockMessage = "Sản phẩm đã hết hàng: " + String.join(", ", outOfStockProducts);
                    redirectAttributes.addFlashAttribute("errorProductDetail", outOfStockMessage);
                    return "redirect:/hoa-don/detail/" + idHD;
                }

                // Cập nhật trạng thái chi tiết hóa đơn và số lượng sản phẩm trong kho
                for (ChiTietHoaDon chiTietHD : chiTietList) {
                    String idChiTietHoaDon = chiTietHD.getId();
                    Optional<ChiTietSanPham> chiTietSanPhamOptional = _chiTietSanPhamRepo.findByHoaDonChiTietId(idChiTietHoaDon);
                    if (chiTietSanPhamOptional.isPresent()) {
                        ChiTietSanPham chiTietSanPham = chiTietSanPhamOptional.get();
                        int soLuongConLai = chiTietSanPham.getSoLuong() - chiTietHD.getSoLuong();
                        chiTietSanPham.setSoLuong(soLuongConLai);
                        chiTietSanPham.setTrangThai(1);
                        _chiTietSanPhamRepo.save(chiTietSanPham);


                    }
                }
            }

            GiaoHang giaoHang = new GiaoHang();
            hoaDon.setGhiChu(hoaDon.getGhiChu());
            updateHoaDonStatus(hoaDon, nhanVien, trangThai, giaoHang, moTa);
            _hoaDonRepo.save(hoaDon);
            HoaDonDTO hoaDonDTO = HoaDonDTO.fromEntity(hoaDon);
            redirectAttributes.addFlashAttribute("hoaDonDTO", hoaDonDTO);
            redirectAttributes.addFlashAttribute("confirmSuccess", "Cập nhật trạng thái đơn hàng thành công.");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("confirmError", "Có lỗi xảy ra khi cập nhật trạng thái đơn hàng.");
        }
        return "redirect:/hoa-don/detail/" + idHD;
    }


    private void updateHoaDonStatus(HoaDon hoaDon, NhanVien nhanVien, int trangThai, GiaoHang giaoHang, String moTa) {
        LichSuHoaDon lichSuHoaDon = createLichSuHoaDon(hoaDon, nhanVien, moTa);
        switch (hoaDon.getTrangThai()) {

            case HoaDonRepository.CHO_XAC_NHAN:
                hoaDon.setTrangThai(HoaDonRepository.CHO_GIAO_HANG);
                hoaDon.setIdNhanVien(nhanVien);
                hoaDon.setNgayDaXacNhan(LocalDateTime.now());
                hoaDon.setNgayChoGiaoHang(LocalDateTime.now());
                lichSuHoaDon.setNgayChoGiaoHang(LocalDateTime.now());
                lichSuHoaDon.setTrangThai(HoaDonRepository.CHO_GIAO_HANG);

//                lichSuHoaDon.setIdHoaDon(hoaDon);
//                lichSuHoaDon.setIdNhanVien(nhanVien);
//                lichSuHoaDon.setGhiChu(moTa);
                _lichSuHoaDonRepo.save(lichSuHoaDon);

                // Gửi Email khi đã xác nhận đơn hàng


                break;
            case HoaDonRepository.CHO_GIAO_HANG:
                hoaDon.setTrangThai(HoaDonRepository.DANG_GIAO_HANG);
                hoaDon.setNgayDangGiaoHang(LocalDateTime.now());
                hoaDon.setIdNhanVien(nhanVien);
                lichSuHoaDon = createLichSuHoaDon(hoaDon, nhanVien, moTa);
                lichSuHoaDon.setNgayDangGiaoHang(LocalDateTime.now());
                lichSuHoaDon.setTrangThai(HoaDonRepository.DANG_GIAO_HANG);
                _lichSuHoaDonRepo.save(lichSuHoaDon);

                break;
            case HoaDonRepository.DANG_GIAO_HANG:
                hoaDon.setTrangThai(HoaDonRepository.DA_HOAN_THANH);
                if (hoaDon.getPhuongThucThanhToan() == 0) {
                    hoaDon.setNgayThanhToan(LocalDateTime.now());
                }
                hoaDon.setIdNhanVien(nhanVien);
                giaoHang.setNgayNhan(LocalDateTime.now());
                lichSuHoaDon.setNgayHoanThanh(LocalDateTime.now());
                lichSuHoaDon.setTrangThai(HoaDonRepository.DA_HOAN_THANH);
                _lichSuHoaDonRepo.save(lichSuHoaDon);

                // Cập nhật trạng thái Chi tiết hóa đơn
                List<ChiTietHoaDon> chiTietList = _hoaDonChiTietRepo.findAllByHoaDon_Id(hoaDon.getId());
                for (ChiTietHoaDon chiTietHD : chiTietList) {
                    if (chiTietHD.getIdHoaDon().getId().equals(hoaDon.getId())) {
                        chiTietHD.setTrangThai(1);
                        _hoaDonChiTietRepo.save(chiTietHD);
                    }
                }

                break;
            default:
                throw new IllegalArgumentException("Trạng thái không hợp lệ.");
        }
    }


    // Hàm thêm đối tượng lịch sử hóa đơn
    public LichSuHoaDon createLichSuHoaDon(HoaDon hoaDon, NhanVien nhanVien, String moTa) {
        LichSuHoaDon lichSuHoaDon = new LichSuHoaDon();
        lichSuHoaDon.setIdHoaDon(hoaDon);
        lichSuHoaDon.setIdNhanVien(nhanVien);
        lichSuHoaDon.setGhiChu(moTa);
        lichSuHoaDon.setNgayTao(hoaDon.getNgayTao());
        lichSuHoaDon.setTrangThai(hoaDon.getTrangThai());
        return lichSuHoaDon;
    }

    @PostMapping("/hoan-tac/{idHD}")
    public String undoBill(@PathVariable("idHD") String idHD,
//                              @PathVariable("trangThai") int trangThai,
                           @RequestParam("moTa") String moTa,
                           Model model,
                           RedirectAttributes redirectAttributes) {
        try {
            HoaDon hoaDon = _hoaDonRepo.findById(idHD).orElse(null);

            if (hoaDon == null) {
                model.addAttribute("errorMessage", "Không tìm thấy hóa đơn.");
                redirectAttributes.addFlashAttribute("confirmError", "Không tìm thấy hóa đơn.");
                return "redirect:/hoa-don/detail/" + idHD;
            }

            GiaoHang giaoHang = _giaoHangRepo.findByHoaDonId(idHD);
            if (giaoHang == null) {
                model.addAttribute("errorDelivery", "Không tìm thấy đối tượng giao hàng");
            }
            GiaoHangDTO giaoHangDTO = GiaoHangDTO.toDTO(giaoHang);
            if (giaoHangDTO == null) {
                model.addAttribute("errorDelivery", "Không tìm thấy đối tượng giao hàng");
            }

            NhanVien nhanVien = new NhanVien();
            if (UserInfor.idNhanVien != null) {
                nhanVien = _nhanVienRepo.findById(UserInfor.idNhanVien).get();

            }

            LichSuHoaDon lichSuHoaDon = createLichSuHoaDon(hoaDon, nhanVien, moTa);

            switch (hoaDon.getTrangThai()) {
                case HoaDonRepository.CHO_GIAO_HANG:

                    hoaDon.setNgayDaXacNhan(null);
                    List<ChiTietHoaDon> chiTietList = _hoaDonChiTietRepo.findAllByHoaDon_Id(idHD);
                    for (ChiTietHoaDon chiTietHD : chiTietList) {
                        String idChiTietHoaDon = chiTietHD.getId();
                        Optional<ChiTietSanPham> chiTietSanPhamOptional = _chiTietSanPhamRepo.findByHoaDonChiTietId(idChiTietHoaDon);
                        if (chiTietSanPhamOptional.isPresent()) {
                            ChiTietSanPham chiTietSanPham = chiTietSanPhamOptional.get();
                            int soLuongConLai = chiTietSanPham.getSoLuong() + chiTietHD.getSoLuong();
                            chiTietSanPham.setSoLuong(soLuongConLai);
                            _chiTietSanPhamRepo.save(chiTietSanPham);
                        } else {
                            redirectAttributes.addFlashAttribute("errorProductDetail", "Không tìm thấy chi tiết sản phẩm có ID = " + idChiTietHoaDon);
                            return "redirect:/hoa-don/detail/" + idHD;
                        }
                    }

                    lichSuHoaDon.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
                    lichSuHoaDon.setNgayChoXacNhan(hoaDon.getNgayChoGiaoHang());
                    hoaDon.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
                    hoaDon.setNgayChoGiaoHang(null);
                    hoaDon.setNgayCapNhat(LocalDateTime.now());
                    _lichSuHoaDonRepo.save(lichSuHoaDon);
                    break;

                case HoaDonRepository.DANG_GIAO_HANG:
                    hoaDon.setTrangThai(HoaDonRepository.CHO_GIAO_HANG);
                    hoaDon.setNgayCapNhat(LocalDateTime.now());
                    lichSuHoaDon.setTrangThai(HoaDonRepository.CHO_GIAO_HANG);
                    lichSuHoaDon.setNgayChoGiaoHang(LocalDateTime.now());
                    _lichSuHoaDonRepo.save(lichSuHoaDon);
                    break;

                case HoaDonRepository.DA_HOAN_THANH:
                    hoaDon.setTrangThai(HoaDonRepository.DANG_GIAO_HANG);
                    hoaDon.setNgayCapNhat(LocalDateTime.now());
                    lichSuHoaDon.setTrangThai(HoaDonRepository.DANG_GIAO_HANG);
                    lichSuHoaDon.setNgayDangGiaoHang(LocalDateTime.now());
                    _lichSuHoaDonRepo.save(lichSuHoaDon);
                    break;
                default:
                    model.addAttribute("errorMessage", "Trạng thái không hợp lệ.");
                    return "redirect:/hoa-don/detail/" + idHD;
            }

            // Lưu lại thay đổi
            _hoaDonRepo.save(hoaDon);
            redirectAttributes.addFlashAttribute("confirmSuccess", "Cập nhật trạng thái đơn hàng thành công.");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("confirmError", "Có lỗi xảy ra khi cập nhật trạng thái đơn hàng.");
        }
        return "redirect:/hoa-don/detail/" + idHD;
    }


    // Chức năng cập nhật thông tin khách hàng
    @PostMapping("/cap-nhat/{hoaDonId}")
    public String updateDiaChi(DiaChiRequest request, @PathVariable("hoaDonId") String hoaDonId,
                               @ModelAttribute("giaoHangDTO") GiaoHangDTO giaoHangDTO,
                               @Param("tenTinh") String tenTinh,
                               @Param("tenQuan") String tenQuan,
                               @Param("tenPhuong") String tenPhuong,
                               @RequestParam(value = "idTinh", required = false) Integer idTinh,
                               @RequestParam(value = "idQuan",required = false) Integer idQuan,
                               @RequestParam(value = "idPhuong",required = false) String idPhuong,
                               @RequestParam Long phiVanChuyen,
                               RedirectAttributes redirectAttributes) {

        System.out.println("__________________________________Phí ship---------------------------------: "+phiVanChuyen);
        BigDecimal phiPhipNew = BigDecimal.valueOf(phiVanChuyen);
        System.out.println("__________________________________Phí ship2---------------------------------: "+phiPhipNew);


//        GiaoHang giaoHang = _giaoHangRepo.findByHoaDonId(idHoaDon);
//        if (giaoHang.getIdHoaDon().getId().equals(idHoaDon)){
//            giaoHang.setPhiShip(phiPhipNew);
//            _giaoHangRepo.save(giaoHang);
//        }

        HoaDon hoaDon = hoaDonRepository.findById(hoaDonId).get();
        GiaoHang giaoHang = _giaoHangRepo.findByHoaDonId(hoaDonId);
        if (giaoHang == null) {
            // Nếu không tìm thấy, bạn có thể tạo mới nếu được phép
            giaoHang = new GiaoHang();
            giaoHang.setIdHoaDon(hoaDon); // Liên kết với HoaDon
        }
        HoaDonDTO hoaDonDTO = HoaDonDTO.fromEntity(hoaDon);
        giaoHangDTO.setIdPhuongXa(tenPhuong);
        giaoHangDTO.setIdQuanHuyen(tenQuan);
        giaoHangDTO.setIdTinhThanh(tenTinh);
        // Cập nhật các thông tin khác như phí ship, ghi chú nếu cần
        giaoHang.setTenNguoiNhan(giaoHangDTO.getTenNguoiNhan());
        giaoHang.setSdtNguoiNhan(giaoHangDTO.getSdtNguoiNhan());
        giaoHang.setDiaChiChiTiet(giaoHangDTO.getDiaChiChiTiet());
        giaoHang.setIdPhuongXa(tenPhuong);
        giaoHang.setIdQuanHuyen(tenQuan);
        giaoHang.setIdTinhThanh(tenTinh);
        if (giaoHang.getIdHoaDon().getId().equals(idHoaDon)){
            giaoHang.setPhiShip(phiPhipNew);
            _giaoHangRepo.save(giaoHang);
        }
        giaoHang.setGhiChu(giaoHangDTO.getGhiChu());

        // Cập nhập địa chỉ khách hàng
        KhachHang khachHang = _khachHangRepo.findByIdKH(hoaDon.getIdKhachHang().getId());
        DiaChi diaChi = _diaChiRepo.findDiaChiByKhachHangId(hoaDon.getIdKhachHang().getId());
        diaChi.setTenNguoiNhan(giaoHangDTO.getTenNguoiNhan());
        diaChi.setSdtNguoiNhan(giaoHangDTO.getSdtNguoiNhan());
        diaChi.setDiaChiChiTiet(giaoHangDTO.getDiaChiChiTiet());
        diaChi.setIdTinhThanh(tenTinh);
        diaChi.setIdQuanHuyen(tenQuan);
        diaChi.setIdPhuongXa(tenPhuong);
        diaChi.setIdKhachHang(khachHang);
        diaChi.setIdT(idTinh);
        diaChi.setIdQH(idQuan);
        diaChi.setIdPX(idPhuong);

        _giaoHangRepo.save(giaoHang);
        _diaChiRepo.save(diaChi);
        // Thêm thông báo thành công và chuyển hướng
        redirectAttributes.addFlashAttribute("hoaDonDTO", hoaDonDTO);
        redirectAttributes.addFlashAttribute("giaoHangDTO", giaoHangDTO);
        redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thông tin địa chỉ thành công.");
        return "redirect:/hoa-don2/detail/" + hoaDonId;
    }

    // Chức năng hủy đơn hàng
    @PostMapping("/huy/{hoaDonId}")
    public String cancelOlder(@PathVariable("hoaDonId") String hoaDonId,
                              @RequestParam("lyDo") String lyDo,
                              RedirectAttributes redirectAttributes) {
        // Tìm đối tượng DiaChi theo IdHoaDon (hoaDonId)
        HoaDon hoaDon = _hoaDonRepo.findById(hoaDonId).get();
        if (hoaDon == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy thông tin đơn hàng");
            return "redirect:/hoa-don/detail/" + hoaDonId;
        }

        // Kiểm tra nếu trạng thái không phải là chờ xác nhận thì không cho huy don
//        if (hoaDon.getTrangThai() != hoaDonRepository.DANG_GIAO_HANG) {
//            redirectAttributes.addFlashAttribute("errorMessage", "Không thể hủy đơn hàng, trạng thái hiện tại đang là đã xác nhận");
//            return "redirect:/hoa-don/detail/" + hoaDonId;
//        }

        // Kiểm tra nếu trạng thái hiện tại của hóa đơn đã thay đổi
        if (hoaDon.getTrangThai() != hoaDonRepository.CHO_XAC_NHAN && hoaDon.getTrangThai() != hoaDonRepository.CHO_GIAO_HANG) {
            redirectAttributes.addFlashAttribute("errorMessage", "Trạng thái của hóa đơn đã thay đổi. Vui lòng tải lại trang.");
            return "redirect:/hoa-don/detail/" + hoaDonId;
        }


        // Kiểm tra nếu đơn hàng quá 3 ngày sau khi thành công thì không cho hủy đơn
        if (hoaDon.getTrangThai() == hoaDonRepository.DA_HOAN_THANH) {
            LocalDateTime threeDaysAfterSuccess = hoaDon.getNgayThanhToan().plusDays(3);
            if (LocalDateTime.now().isAfter(threeDaysAfterSuccess)) {
                redirectAttributes.addFlashAttribute("errorMessage", "Không thể hủy đơn hàng sau 3 ngày kể từ khi giao hàng thành công");
                return "redirect:/hoa-don/detail/" + hoaDonId;
            }
        }

        // Cập nhập lại số lượng khi hủy hóa đơn
        if (hoaDon.getTrangThai() == _hoaDonRepo.CHO_GIAO_HANG) {
            List<ChiTietHoaDon> chiTietList = _hoaDonChiTietRepo.findAllByHoaDon_Id(hoaDonId);
            for (ChiTietHoaDon chiTietHD : chiTietList) {
                String idChiTietHoaDon = chiTietHD.getId();
                Optional<ChiTietSanPham> chiTietSanPhamOptional = _chiTietSanPhamRepo.findByHoaDonChiTietId(idChiTietHoaDon);
                if (chiTietSanPhamOptional.isPresent()) {
                    ChiTietSanPham chiTietSanPham = chiTietSanPhamOptional.get();
                    int soLuongConLai = chiTietSanPham.getSoLuong() + chiTietHD.getSoLuong();
                    chiTietSanPham.setSoLuong(soLuongConLai);
                    _chiTietSanPhamRepo.save(chiTietSanPham);
                } else {
                    redirectAttributes.addFlashAttribute("errorProductDetail", "Không tìm thấy chi tiết sản phẩm có ID = " + idChiTietHoaDon);
                    return "redirect:/hoa-don/detail/" + hoaDonId;
                }
            }
        }

        NhanVien nhanVien = new NhanVien();
        if (UserInfor.idNhanVien != null) {
            nhanVien = nhanVienRepo.findById(UserInfor.idNhanVien).get();
        }
        hoaDon.setTrangThai(hoaDonRepository.DA_HUY);
        hoaDon.setNgayCapNhat(LocalDateTime.now());
        hoaDon.setIdNhanVien(nhanVien);
        hoaDon.setGhiChu(lyDo);
        // Lưu lại vào cơ sở dữ liệu
//        Trả lại khuyến mãi được áp dụng trong hóa đơn khi hủy đơn hàng
        KhuyenMai khuyenMaiApDung = _hoaDonRepo.findKhuyenMaiByHoaDonId(hoaDon.getId());
        if (khuyenMaiApDung != null) {
            khuyenMaiApDung.setSoLuong(khuyenMaiApDung.getSoLuong() + 1);
            _khuyenMaiRepo.save(khuyenMaiApDung);
        }

        LichSuHoaDon lichSuHoaDon = createLichSuHoaDon(hoaDon, nhanVien, lyDo);
        lichSuHoaDon.setNgayCapNhat(LocalDateTime.now());
        _lichSuHoaDonRepo.save(lichSuHoaDon);
        _hoaDonRepo.save(hoaDon);

        System.out.println("Thành công");
        redirectAttributes.addFlashAttribute("cancelSuccess", "Hủy hóa đơn thành công");
        return "redirect:/hoa-don/hien-thi";
    }

    @PostMapping("/xac-nhan-thanh-toan")
    public String confirmPayment(
            @ModelAttribute HoaDonDTO hoaDonDTO,
            RedirectAttributes redirectAttributes) {
        try {
            HoaDon hoaDon = _hoaDonRepo.findById(hoaDonDTO.getId()).orElse(null);

            if (hoaDon == null) {
                redirectAttributes.addFlashAttribute("paymentError", "Không tìm thấy hóa đơn.");
                return "redirect:/hoa-don/detail/" + hoaDonDTO.getId();
            }

            hoaDon.setTongTien(hoaDonDTO.getTongTien());
            hoaDon.setTrangThai(HoaDonRepository.DA_HOAN_THANH);
            hoaDon.setNgayThanhToan(LocalDateTime.now());
            hoaDon.setPhuongThucThanhToan(hoaDonDTO.getPhuongThucThanhToan());
            hoaDon.setGhiChu(hoaDonDTO.getGhiChu());

            _hoaDonRepo.save(hoaDon);

            // Add success message
            redirectAttributes.addFlashAttribute("confirmSuccess", "Cập nhật trạng thái đơn hàng thành công.");
            redirectAttributes.addFlashAttribute("hoaDonDTO", hoaDonDTO);
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("confirmError", "Có lỗi xảy ra khi cập nhật trạng thái đơn hàng.");
        }
        return "redirect:/hoa-don/detail/" + hoaDonDTO.getId();
    }

    // Chức năng thếm sản phẩm vào giỏ hàng
    @GetMapping("/them-san-pham/{idCTSP}")
    public String addSanPhamVaoGioHang(@PathVariable("idCTSP") String idCTSP, @RequestParam(value = "page", defaultValue = "0") Optional<Integer> pageParam,
                                       @RequestParam("idHoaDon") String idHoaDon,
                                       @RequestParam("phiVanChuyenHang") Long phiVanChuyenHang,
                                       RedirectAttributes redirectAttributes) {

        System.out.println("--------------------------------------------------------------------------------------------------------------------------"+phiVanChuyenHang);

        // Tìm hóa đơn chi tiết trong giỏ hàng của hóa đơn có id là idHoaDon
        List<ChiTietHoaDon> listHDCT = _hoaDonChiTietRepo.findAllByHoaDon_Id(idHoaDon);
        HoaDon hoaDon = _hoaDonRepo.findByIdHoaDon(idHoaDon);

        if (idHoaDon == null || idHoaDon.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Không tìm thấy hóa đơn hoặc chi tiết sản phẩm");
            return "redirect:/hoa-don2/detail/" + idHoaDon;
        }

        // Tìm sản phẩm chi tiết theo idCTSP
        Optional<ChiTietSanPham> optionalCTSP = _sanPhamChiTietRepo.findById(idCTSP);
        if (optionalCTSP.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Không tìm thấy sản phẩm chi tiết.");
            return "redirect:/hoa-don2/detail/" + idHoaDon;
        }
        ChiTietSanPham chiTietSanPham = optionalCTSP.get();

        if (chiTietSanPham == null) {
            redirectAttributes.addFlashAttribute("error", "Không tìm thấy sản phẩm chi tiết.");
            return "redirect:/hoa-don2/detail/" + idHoaDon;
        }

        // Kiểm tra xem sản phẩm chi tiết đã có trong giỏ hàng hay chưa
        boolean spTonTaiTrongGioHang = false;
        for (ChiTietHoaDon hdct : listHDCT) {
            if (hdct.getIdCTSP().getId().equals(idCTSP)) {
                // Nếu sản phẩm chi tiết đã có trong giỏ hàng, cộng dồn số lượng
                hdct.setSoLuong(hdct.getSoLuong() + 1);
                hdct.setTrangThai(0);
                hdct.setNgayTao(LocalDateTime.now());
                _hoaDonChiTietRepo.save(hdct);
                spTonTaiTrongGioHang = true;

                // Giảm số lượng của sản phẩm chi tiết trong kho (tạm thời không xử lý số lượng tồn)
                // Nếu trạng thái là "chờ giao hàng", giảm số lượng của sản phẩm chi tiết trong kho
                if (hoaDon.getTrangThai() == hoaDonRepository.CHO_GIAO_HANG) {
                    chiTietSanPham.setSoLuong(chiTietSanPham.getSoLuong() - 1);
                    _sanPhamChiTietRepo.save(chiTietSanPham);
                }
                break;
            }
        }

        // Nếu sản phẩm chi tiết chưa có trong giỏ hàng, thêm mới vào giỏ hàng
        if (!spTonTaiTrongGioHang) {
            ChiTietHoaDon hdct = new ChiTietHoaDon();
            hdct.setIdCTSP(chiTietSanPham);
            HoaDon hoaDonMoi = new HoaDon();
            hoaDonMoi.setId(idHoaDon);
            hdct.setIdHoaDon(hoaDonMoi);
            hdct.setSoLuong(1);

            // Số lượng mặc định khi thêm vào giỏ hàng là 1
            // Lấy giá của sản phẩm chi tiết để lưu vào chi tiết hóa đơn
            hdct.setDonGia(chiTietSanPham.getGiaBan());
            listHDCT.add(hdct);
            hdct.setTrangThai(0);
            hdct.setNgayTao(LocalDateTime.now());
            _hoaDonChiTietRepo.save(hdct);
            // Giảm số lượng của sản phẩm chi tiết trong kho (tạm thời không xử lý số lượng tồn)
            if (hoaDon.getTrangThai() == hoaDonRepository.CHO_GIAO_HANG) {
                chiTietSanPham.setSoLuong(chiTietSanPham.getSoLuong() - 1);
                _sanPhamChiTietRepo.save(chiTietSanPham);
            }
        }

        // Tính tổng tiền
        BigDecimal tongTien = BigDecimal.ZERO;
        for (ChiTietHoaDon hdct : listHDCT) {
            BigDecimal donGia = hdct.getDonGia();
            int soLuong = hdct.getSoLuong();
            tongTien = tongTien.add(donGia.multiply(BigDecimal.valueOf(soLuong)));
        }

        // Set lại tổng tiền trong hóa đơn khi thêm sản phẩm
        hoaDon.setTongTien(tongTien);
        // Áp dụng lại khuyến mãi
        applyKhuyenMai(hoaDon);
        _hoaDonRepo.save(hoaDon);

        HoaDonDTO hoaDonDTO = HoaDonDTO.fromEntity(hoaDon);
        hoaDonDTO.setTongTien(tongTien);

        // Lấy ra đối tượng giao hàng theo IdHoaDon
        GiaoHang giaoHang = _giaoHangRepo.findByHoaDonId(idHoaDon);
        BigDecimal phiShipNew = BigDecimal.valueOf(phiVanChuyenHang);
        giaoHang.setPhiShip(phiShipNew);
        if (giaoHang == null) {
            redirectAttributes.addAttribute("errorDelivery", "Không tìm thấy đối tượng giao hàng");
        }

        GiaoHangDTO giaoHangDTO = GiaoHangDTO.toDTO(giaoHang);
        if (giaoHangDTO == null) {
            redirectAttributes.addAttribute("errorDelivery", "Không tìm thấy đối tượng giao hàng");
        }


        _giaoHangRepo.save(giaoHang);
        redirectAttributes.addFlashAttribute("hoaDonDTO", hoaDonDTO);
        redirectAttributes.addFlashAttribute("addProductSuccess", "Thêm sản phẩm vào giỏ hàng thành công");
        return "redirect:/hoa-don2/detail/" + idHoaDon;
    }


    // Chức năng xóa sản phẩm chi tiết khỏi hoa đơn chi tiết
    @GetMapping("/xoa-san-pham/{idCTSP}")
    public ResponseEntity<Map<String, Object>> xoaSanPhamChiTiet(@PathVariable("idCTSP") String idCTSP,
                                                                 @RequestParam("idHoaDon") String idHoaDon) {
        try {
            // Kiểm tra và tìm sản phẩm chi tiết
            Optional<ChiTietSanPham> optionalCTSP = _sanPhamChiTietRepo.findById(idCTSP);
            if (optionalCTSP.isEmpty()) {
                return ResponseEntity.badRequest().body(Map.of("error", "Không tìm thấy sản phẩm chi tiết."));
            }
            ChiTietSanPham chiTietSanPham = optionalCTSP.get();

            // Tìm hóa đơn
            HoaDon hoaDon = _hoaDonRepo.findById(idHoaDon).orElse(null);
            if (hoaDon == null) {
                return ResponseEntity.badRequest().body(Map.of("error", "Không tìm thấy hóa đơn."));
            }

            // Nếu trạng thái hóa đơn là "Chờ giao hàng", tăng lại số lượng sản phẩm chi tiết
            if (hoaDon.getTrangThai() == HoaDonRepository.CHO_GIAO_HANG) {
                ChiTietHoaDon chiTietHoaDon = _hoaDonChiTietRepo.findByHoaDon_IdAndIdCTSP_Id(idHoaDon, idCTSP);
                if (chiTietHoaDon != null) {
                    chiTietSanPham.setSoLuong(chiTietSanPham.getSoLuong() + chiTietHoaDon.getSoLuong());
                    _sanPhamChiTietRepo.save(chiTietSanPham);
                }
            }

            // Xóa sản phẩm chi tiết từ hóa đơn
            int deletedCount = _hoaDonChiTietRepo.deleteByHoaDon_IdAndIdCTSP_Id(idHoaDon, idCTSP);
            if (deletedCount == 0) {
                return ResponseEntity.badRequest().body(Map.of("error", "Không tìm thấy sản phẩm trong giỏ hàng."));
            }

            // Kiểm tra số lượng không vượt quá số lượng tồn kho
//            if (soLuong > chiTietSanPham.getSoLuong()) {
//                return ResponseEntity.badRequest().body(Map.of("error", "Số lượng cập nhật vượt quá số lượng tồn kho."));
//            }

            // Tính lại tổng tiền để cập nhật tổng tiền bên view
            BigDecimal tongTien = BigDecimal.ZERO;
            List<ChiTietHoaDon> listHDCT = _hoaDonChiTietRepo.findAllByHoaDon_Id(idHoaDon);
            for (ChiTietHoaDon hdct : listHDCT) {
                tongTien = tongTien.add(hdct.getDonGia().multiply(BigDecimal.valueOf(hdct.getSoLuong())));
            }

            hoaDon.setTongTien(tongTien);
            // Áp dụng lại khuyến mãi
            applyKhuyenMai(hoaDon);
            _hoaDonRepo.save(hoaDon);

            // Tính tổng tiền thanh toán bao gồm giảm giá và phí vận chuyển
            KhuyenMai khuyenMai = _hoaDonRepo.findKhuyenMaiByHoaDonId(idHoaDon);
            BigDecimal phiGiamGia = (khuyenMai != null) ? khuyenMai.getSoTienGiam() : BigDecimal.ZERO;
            GiaoHang giaoHang = _giaoHangRepo.findByHoaDonId(idHoaDon);
            BigDecimal phiShip = (giaoHang != null && giaoHang.getPhiShip() != null) ? giaoHang.getPhiShip() : BigDecimal.ZERO;
            BigDecimal tongTienThanhToan = tongTien.add(phiShip).subtract(phiGiamGia);
            // Kiểm tra và điều chỉnh tổng tiền thanh toán không âm
            if (tongTienThanhToan.compareTo(BigDecimal.ZERO) < 0) {
                tongTienThanhToan = BigDecimal.ZERO;
            }

            phiGiamGia =  ( hoaDon.getIdKhuyenMai() != null) ? hoaDon.getIdKhuyenMai().getSoTienGiam() : BigDecimal.ZERO;
            String phieuGiamGia =  ( hoaDon.getIdKhuyenMai() != null) ? hoaDon.getIdKhuyenMai().getMa() : "N/A";

            // Cập nhật lại danh sách sản phẩm để hiển thị để cập nhật lại số lượng
            List<ChiTietSanPham> updatedListCTSP = _sanPhamChiTietRepo.findAll();
            Map<String, Object> response = new HashMap<>();
            response.put("tongTien", tongTien);
            response.put("giamGia",phiGiamGia);
            response.put("phieuGiamGia", phieuGiamGia);
            response.put("tongTienThanhToan", tongTienThanhToan);
            response.put("updatedListCTSP", updatedListCTSP);
            response.put("newQuantity", chiTietSanPham.getSoLuong());
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", "Đã xảy ra lỗi khi xóa sản phẩm."));
        }
    }


    @GetMapping("/cap-nhat-so-luong-san-pham/{idCTSP}")
    public ResponseEntity<Map<String, Object>> updateSoLuong(
            @PathVariable String idCTSP,
            @RequestParam int soLuong,
            @RequestParam("idHoaDon") String idHoaDon
    ) {
        try {
            Map<String, Object> response = new HashMap<>();
            ChiTietSanPham chiTietSanPham = _sanPhamChiTietRepo.findById(idCTSP).orElse(null);

            // Kiểm tra sản phẩm chi tiết
            if (chiTietSanPham == null) {
                return ResponseEntity.badRequest().body(Map.of("error", "Sản phẩm không tồn tại."));
            }

            // Kiểm tra số lượng nhập vào hợp lệ
            if (soLuong <= 0) {
                return ResponseEntity.badRequest().body(Map.of("error", "Số lượng phải lớn hơn 0."));
            }

            // Kiểm tra số lượng không vượt quá số lượng tồn kho
            if (soLuong > chiTietSanPham.getSoLuong()) {
                response.put("newQuantity", chiTietSanPham.getSoLuong());
                return ResponseEntity.badRequest().body(Map.of("error", "Số lượng cập nhật vượt quá số lượng tồn kho."));
            }

            // Lấy danh sách chi tiết hóa đơn
            List<ChiTietHoaDon> listHDCT = _hoaDonChiTietRepo.findAllByHoaDon_Id(idHoaDon);
            if (listHDCT.isEmpty()) {
                return ResponseEntity.badRequest().body(Map.of("error", "Chi tiết hóa đơn không tồn tại."));
            }

            // Tìm hóa đơn và kiểm tra trạng thái
            HoaDon hoaDon = _hoaDonRepo.findById(idHoaDon).orElse(null);
            if (hoaDon == null) {
                return ResponseEntity.badRequest().body(Map.of("error", "Hóa đơn không tồn tại."));
            }

            boolean isWaitingForDelivery = (hoaDon.getTrangThai() == HoaDonRepository.CHO_GIAO_HANG);

            for (ChiTietHoaDon chiTietHoaDon : listHDCT) {
                if (chiTietHoaDon.getIdCTSP().getId().equals(idCTSP)) {
                    // Lấy số lượng cũ và tính sự khác biệt
                    int soLuongCu = chiTietHoaDon.getSoLuong();
                    int soLuongThayDoi = soLuong - soLuongCu;

                    // Cập nhật số lượng trong chi tiết hóa đơn
                    chiTietHoaDon.setSoLuong(soLuong);
                    _hoaDonChiTietRepo.save(chiTietHoaDon);

                    // Nếu hóa đơn đang ở trạng thái "Chờ giao hàng", cập nhật số lượng kho
                    if (isWaitingForDelivery) {
                        int soLuongCuKho = chiTietSanPham.getSoLuong();
                        chiTietSanPham.setSoLuong(soLuongCuKho - soLuongThayDoi);
                        _sanPhamChiTietRepo.save(chiTietSanPham);
                    }
                    break;
                }
            }

            // Tính lại tổng tiền để cập nhật tổng tiền bên view
            BigDecimal tongTien = BigDecimal.ZERO;
            for (ChiTietHoaDon hdct : listHDCT) {
                tongTien = tongTien.add(hdct.getDonGia().multiply(BigDecimal.valueOf(hdct.getSoLuong())));
            }

            hoaDon.setTongTien(tongTien);
            // Áp dụng lại khuyến mãi
            applyKhuyenMai(hoaDon);
            _hoaDonRepo.save(hoaDon);

            // Tính tổng tiền thanh toán bao gồm giảm giá và phí vận chuyển
            KhuyenMai khuyenMai = _hoaDonRepo.findKhuyenMaiByHoaDonId(idHoaDon);
            BigDecimal phiGiamGia = (khuyenMai != null) ? khuyenMai.getSoTienGiam() : BigDecimal.ZERO;
            GiaoHang giaoHang = _giaoHangRepo.findByHoaDonId(idHoaDon);
            BigDecimal phiShip = (giaoHang != null && giaoHang.getPhiShip() != null) ? giaoHang.getPhiShip() : BigDecimal.ZERO;

            BigDecimal tongTienThanhToan = tongTien.add(phiShip).subtract(phiGiamGia);
            // Kiểm tra và điều chỉnh tổng tiền thanh toán không âm
            if (tongTienThanhToan.compareTo(BigDecimal.ZERO) < 0) {
                tongTienThanhToan = BigDecimal.ZERO;
            }
            List<ChiTietSanPham> updatedListCTSP = _sanPhamChiTietRepo.findAll();
            phiGiamGia =  ( hoaDon.getIdKhuyenMai() != null) ? hoaDon.getIdKhuyenMai().getSoTienGiam() : BigDecimal.ZERO;
            String phieuGiamGia =  ( hoaDon.getIdKhuyenMai() != null) ? hoaDon.getIdKhuyenMai().getMa() : "N/A";



            response.put("tongTien", tongTien);
            response.put("giamGia",phiGiamGia);
            response.put("phieuGiamGia", phieuGiamGia);
            response.put("tongTienThanhToan", tongTienThanhToan);
            response.put("listHDCT", listHDCT);
            response.put("idCTSP", idCTSP);
            response.put("newQuantity", chiTietSanPham.getSoLuong());
            response.put("updatedListCTSP", updatedListCTSP);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", "Đã xảy ra lỗi khi cập nhật số lượng sản phẩm."));
        }
    }

    // Cập nhật Khuyến mãi Áp dụng lại mã khuyến mãi khi thêm sửa xóa trong hoa don chi tiet
    public void applyKhuyenMai(HoaDon hoaDon) {
        List<KhuyenMai> khuyenMais = khuyenMaiRepo.findAllKMTrangThai(KhuyenMaiRepository.ACTIVE);

        BigDecimal tongTienHoaDon = hoaDon.getTongTien();
        KhuyenMai khuyenMaiPhuHop = null;
        KhuyenMai khuyenMaiHienTai = hoaDon.getIdKhuyenMai();

        // Tìm mã khuyến mãi phù hợp nhất từ danh sách mã khuyến mãi
        for (KhuyenMai km : khuyenMais) {
            if (tongTienHoaDon.compareTo(km.getApDung()) >= 0) {
                if (khuyenMaiPhuHop == null || km.getSoTienGiam().compareTo(khuyenMaiPhuHop.getSoTienGiam()) > 0) {
                    khuyenMaiPhuHop = km;
                }
            }
        }

        // Kiểm tra và cập nhật mã khuyến mãi hiện tại
        if (khuyenMaiHienTai != null) {
            if (khuyenMaiPhuHop == null || !khuyenMaiPhuHop.equals(khuyenMaiHienTai)) {
                // Hoàn lại số lượng mã khuyến mãi hiện tại nếu không còn thỏa mãn điều kiện
                khuyenMaiHienTai.setSoLuong(khuyenMaiHienTai.getSoLuong() + 1);
                hoaDon.setIdKhuyenMai(null);
                _khuyenMaiRepo.save(khuyenMaiHienTai);
            }
        }

        // Áp dụng mã khuyến mãi mới nếu có và phù hợp
        if (khuyenMaiPhuHop != null && (khuyenMaiHienTai == null || !khuyenMaiPhuHop.equals(khuyenMaiHienTai))) {
            khuyenMaiPhuHop.setSoLuong(khuyenMaiPhuHop.getSoLuong() -  1);
            _khuyenMaiRepo.save(khuyenMaiPhuHop);
            hoaDon.setIdKhuyenMai(khuyenMaiPhuHop);
        }

        hoaDonRepository.save(hoaDon);
    }



    //    ===================== LỌC VÀ TÌM KIẾM==================
    // Chức năng tìm kiem, loc và phan trang trong Modal them san pham
    @PostMapping("/searchSPCT/{id}")
    public String searchSPCT(
            @PathVariable String id,
            Model model,
            @RequestParam("search") String search,
            @RequestParam("page") Optional<Integer> pageParam
    ) {
        Optional<HoaDon> hoaDon = hoaDonRepository.findById(id);
        model.addAttribute("hoaDon", hoaDon.orElse(null));
        Pageable pageable = PageRequest.of(pageParam.orElse(0), 10);
        Page<ChiTietSanPham> listCTSP = _sanPhamChiTietRepo.timKiem(search, SPCTRepository.ACTIVE, pageable);
        setupCommonAttributes(model);
        Map<String, HinhAnh> hinhAnhMapCTSP = getHinhAnhMapCTSP();
        model.addAttribute("listCTSP", listCTSP);
        model.addAttribute("hinhAnhMapCTSP", hinhAnhMapCTSP);
        return "/view/QLHD/modalThemSanPham.jsp";
    }

    //Lọc màu sắc
    @GetMapping("/locSPCTByMauSac/{idMauSac}")
    public String locSPCTByMauSac(
            Model model,
            @PathVariable String idMauSac,
            @RequestParam("page") Optional<Integer> pageParam
    ) {
        Pageable pageable = PageRequest.of(pageParam.orElse(0), 10);
        Page<ChiTietSanPham> listCTSP = _sanPhamChiTietRepo.locCTSPByIdMauSac(idMauSac, SPCTRepository.ACTIVE, pageable);
        setupCommonAttributes(model);
        Map<String, HinhAnh> hinhAnhMapCTSP = getHinhAnhMapCTSP();
        model.addAttribute("listCTSP", listCTSP);
        model.addAttribute("hinhAnhMapCTSP", hinhAnhMapCTSP);
        return "/view/QLHD/modalThemSanPham.jsp";
    }

    //Lọc kích thước
    @GetMapping("/locSPCTByKichThuoc/{idKichThuoc}")
    public String locSPCTByKichThuoc(
            Model model,
            @PathVariable String idKichThuoc,
            @RequestParam("page") Optional<Integer> pageParam
    ) {
        Pageable pageable = PageRequest.of(pageParam.orElse(0), 10);
        Page<ChiTietSanPham> listCTSP = _sanPhamChiTietRepo.locCTSPByIdKichThuoc(idKichThuoc, SPCTRepository.ACTIVE, pageable);

        setupCommonAttributes(model);

        Map<String, HinhAnh> hinhAnhMapCTSP = getHinhAnhMapCTSP();
        model.addAttribute("listCTSP", listCTSP);
        model.addAttribute("hinhAnhMapCTSP", hinhAnhMapCTSP);
        return "/view/QLHD/modalThemSanPham.jsp";
    }

    //Lọc chất liệu
    @GetMapping("/locSPCTByChatLieu/{idChatLieu}")
    public String locSPCTByChatLieu(
            Model model,
            @PathVariable String idChatLieu,
            @RequestParam("page") Optional<Integer> pageParam
    ) {

        Pageable pageable = PageRequest.of(pageParam.orElse(0), 10);
        Page<ChiTietSanPham> listCTSP = _sanPhamChiTietRepo.locCTSPByIdChatLieu(idChatLieu, SPCTRepository.ACTIVE, pageable);
        setupCommonAttributes(model);
        Map<String, HinhAnh> hinhAnhMapCTSP = getHinhAnhMapCTSP();
        model.addAttribute("listCTSP", listCTSP);
        model.addAttribute("hinhAnhMapCTSP", hinhAnhMapCTSP);
        return "/view/QLHD/modalThemSanPham.jsp";
    }

    //Lọc kiểu tay
    @GetMapping("/locSPCTByKieuTay/{idKieuTay}")
    public String locSPCTByKieuTay(
            Model model,
            @PathVariable String idKieuTay,
            @RequestParam("page") Optional<Integer> pageParam
    ) {

        Pageable pageable = PageRequest.of(pageParam.orElse(0), 10);
        Page<ChiTietSanPham> listCTSP = _sanPhamChiTietRepo.locCTSPByIdKieuTay(idKieuTay, SPCTRepository.ACTIVE, pageable);

        setupCommonAttributes(model);

        Map<String, HinhAnh> hinhAnhMapCTSP = getHinhAnhMapCTSP();
        model.addAttribute("listCTSP", listCTSP);
        model.addAttribute("hinhAnhMapCTSP", hinhAnhMapCTSP);
        return "/view/QLHD/modalThemSanPham.jsp";
    }

    // Thiết lập các thuộc tính chung cho model
    private void setupCommonAttributes(Model model) {
        model.addAttribute("listHoaDon", hoaDonRepository.findAll());
        model.addAttribute("listHDCT", hoaDonRepository.findAll());
        model.addAttribute("listKH", _khachHangRepo.findAll());
        model.addAttribute("listMauSac", mauSacRepository.findAll());
        model.addAttribute("listKichThuoc", kichThuocRepo.findAll());
        model.addAttribute("listChatLieu", chatLieuRepo.findAll());
        model.addAttribute("listKieuTay", kieuTayRepo.findAll());
    }

    //lọc sản phẩm chi tiết
    @PostMapping("filter")
    public String filter(
            Model model,
            @RequestParam("idSanPham") String idSanPham,
            @RequestParam("idMauSac") String idMauSac,
            @RequestParam("idKichThuoc") String idKichThuoc,
            @RequestParam("idChatLieu") String idChatLieu,
            @RequestParam("idKieuTay") String idKieuTay,
            @RequestParam("page") Optional<Integer> pageParam
    ) {
        System.out.println("=========================================SANPHAM:====" + idSanPham);
        System.out.println("=========================================MAUSAC:====" + idMauSac);
        System.out.println("=========================================KICHTHUOC:====" + idKichThuoc);
        System.out.println("=========================================CHATLIEU:====" + idChatLieu);
        System.out.println("=========================================KIEUTAY:====" + idKieuTay);
        Pageable pageable = PageRequest.of(pageParam.orElse(0), 10);
//        Page<ChiTietSanPham> listCTSP = sanPhamChiTietRepository.findOneCombobox(idSanPham, idMauSac, idKichThuoc, idChatLieu, idKieuTay, pageable);

        model.addAttribute("listHoaDon", hoaDonRepository.findAll());
        model.addAttribute("listCTSP", _hoaDonChiTietRepo.findAll());
        model.addAttribute("listKH", _khachHangRepo.findAll());
        return "/view/QLHD/detail_bill2.jsp";
    }


    // Chức năng phân trang chuyển page
    @GetMapping("/api/detail/{idHD}/products")
    @ResponseBody
    public ResponseEntity<?> getProductsByPage(@PathVariable("idHD") String idHD,
                                               @RequestParam(value = "page", defaultValue = "0") int pageParam) {
        Page<ChiTietSanPham> listCTSP = getListChiTietSanPham(String.valueOf(pageParam));
        Map<String, Object> response = new HashMap<>();
        response.put("listCTSP", listCTSP.getContent());
        response.put("totalPages", listCTSP.getTotalPages());

        return ResponseEntity.ok(response);
    }


}

