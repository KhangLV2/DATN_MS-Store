//package com.example.java4.controller.controller_sang;
//
//import com.example.java4.config.HoaDonUtil;
//import com.example.java4.entities.*;
//import com.example.java4.entities.tai.HoaDon_Tai;
//import com.example.java4.repositories.*;
//import com.example.java4.repositories.repo_tai.*;
//import com.example.java4.response.GiaoHangDTO;
//import com.example.java4.response.HoaDonDTO;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.data.domain.Sort;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.time.LocalDate;
//import java.time.LocalDateTime;
//import java.time.LocalTime;
//import java.time.format.DateTimeFormatter;
//import java.util.List;
//import java.util.Optional;
//import java.util.UUID;
//import java.util.stream.Collectors;
//
//@Controller
//@RequestMapping("/hoa-don")
//public class QuanLyHoaDonController_Sang {
//
//    @Autowired
//    KhachHangRepository _khachHangRepo;
//    @Autowired
//    NhanVienRepository _nhanVienRepo;
//    @Autowired
//    HDCTRepository _hoaDonChiTietRepo;
//    @Autowired
//    IHoaDonRepository hoaDonRepository;
//    @Autowired
//    IDiaChiRepository _diaChiRepository;
//    @Autowired
//    IHoaDonRepo _hoaDonRepoTai;
//    @Autowired
//    SPCTRepository _sanPhamChiTietRepo;
//    @Autowired
//    KichThuocRepository kichThuocRepo;
//    @Autowired
//    ChatLieuRepository chatLieuRepo;
//    @Autowired
//    KieuTayRepository kieuTayRepo;
//    @Autowired
//    NhanVienRepository nhanVienRepo;
//    @Autowired
//    KhuyenMaiRepository khuyenMaiRepo;
//    @Autowired
//    MauSacRepository mauSacRepository;
//    @Autowired
//    IGiaoHangRepository _giaoHangRepo;
//
//    @Autowired
//    IChiTietSanPhamRepository _chiTietSanPhamRepo;
//
//    private List<MauSac> listMauSac;
//    private List<KichThuoc> listKichThuoc;
//    private List<SanPham> listSanPham;
//    private List<KieuTay> listKieuTay;
//    private List<ChatLieu> listChatLieu;
//    private List<KhuyenMai> listKhuyenMai;
//    private List<ChiTietSanPham> listChiTietSanPham;
//
//    @GetMapping("/hien-thi")
//    public String view(Model model,
//                       @RequestParam(value = "page", defaultValue = "0") int page,
//                       @RequestParam(value = "status", required = false) String status,
//                       @RequestParam(value = "loaiHoaDon", required = false) Integer loaiHoaDon,
//                       @RequestParam(value = "keyword", required = false) String keyword,
//                       @RequestParam(value = "startDate", required = false) String startDateStr,
//                       @RequestParam(value = "endDate", required = false) String endDateStr) {
//        Pageable pageable = PageRequest.of(page, 5, Sort.by(Sort.Direction.DESC, "ngayTao"));
//
//
//        //Lớp Util để xử chuyển đổi trạng thái
//        HoaDonUtil hoaDonUtil = new HoaDonUtil();
//
//        System.out.println("==============================================================" + startDateStr);
//        System.out.println("==============================================================" + endDateStr);
//
//        // Xử lý ngày tạo
//        LocalDateTime startDate = null;
//        LocalDateTime endDate = null;
//        if (startDateStr != null && !startDateStr.isEmpty()) {
//            startDate = LocalDate.parse(startDateStr).atStartOfDay();
//        }
//        if (endDateStr != null && !endDateStr.isEmpty()) {
//            endDate = LocalDate.parse(endDateStr).atTime(LocalTime.MAX);
//        }
//
//        Page<HoaDon> pageHD;
//
//        //Tìm kiếm theo từ khóa
//        if (keyword != null && !keyword.isEmpty() && loaiHoaDon == -1) {
//            pageHD = hoaDonRepository.seachMaAndSdt(keyword, pageable);
//        }
//        //Tìm kiếm theo khoảng ngày
//        else if (startDateStr != null && endDateStr != null && !startDateStr.isEmpty() && !endDateStr.isEmpty() && loaiHoaDon == -1) {
//            pageHD = hoaDonRepository.searchByDate(startDate, endDate, pageable);
//        }
////        //Tìm kiếm theo từ khóa và theo khoảng ngày
////        else if (keyword != null && !keyword.isEmpty() && startDateStr != null && endDateStr != null && !startDateStr.isEmpty() && !endDateStr.isEmpty() && loaiHoaDon != -1) {
////            pageHD = hoaDonRepository.searchByMaOrSdtAndNgayTao(keyword, startDate, endDate, pageable);
////        }
//        else if (keyword != null && !keyword.isEmpty() && startDateStr != null && endDateStr != null && !startDateStr.isEmpty() && !endDateStr.isEmpty() && loaiHoaDon != -1) {
//            pageHD = hoaDonRepository.searchByMaOrSdtAndLoaiHoaDonAndNgayTao(keyword, loaiHoaDon, startDate, endDate, pageable);
//        }
//        //Tìm kiếm theo từ khóa và loại hóa đơn
//        else if (keyword != null && !keyword.isEmpty() && loaiHoaDon != -1) {
//            pageHD = hoaDonRepository.searchByMaOrSdtAndLoaiHoaDon(keyword, loaiHoaDon, pageable);
//        }
//        //Tìm kiếm theo loại hóa đơn và theo khoảng ngày
//        else if (loaiHoaDon != null && startDateStr != null && endDateStr != null && !startDateStr.isEmpty() && !endDateStr.isEmpty()) {
//            pageHD = hoaDonRepository.searchByLoaiHoaDonAndNgayTao(loaiHoaDon, startDate, endDate, pageable);
//        }
//        else {
//            if (status != null && !status.isEmpty()) {
//                switch (status) {
//                    case "all":
//                        pageHD = (loaiHoaDon != null) ? hoaDonRepository.findByLoaiHoaDon(loaiHoaDon, pageable) : hoaDonRepository.findAll(pageable);
//                        break;
//                    case "confirmation":
//                        pageHD = (loaiHoaDon != null) ? hoaDonRepository.findByTrangThaiAndLoaiHoaDon(IHoaDonRepository.CHO_XAC_NHAN, loaiHoaDon, pageable) : hoaDonRepository.findByTrangThai(IHoaDonRepository.CHO_XAC_NHAN, pageable);
//                        break;
//                    case "confirmed":
//                        pageHD = (loaiHoaDon != null) ? hoaDonRepository.findByTrangThaiAndLoaiHoaDon(IHoaDonRepository.DA_XAC_NHAN, loaiHoaDon, pageable) : hoaDonRepository.findByTrangThai(IHoaDonRepository.DA_XAC_NHAN, pageable);
//                        break;
//                    case "delivery":
//                        pageHD = (loaiHoaDon != null) ? hoaDonRepository.findByTrangThaiAndLoaiHoaDon(IHoaDonRepository.CHO_GIAO_HANG, loaiHoaDon, pageable) : hoaDonRepository.findByTrangThai(IHoaDonRepository.CHO_GIAO_HANG, pageable);
//                        break;
//                    case "delivered":
//                        pageHD = (loaiHoaDon != null) ? hoaDonRepository.findByTrangThaiAndLoaiHoaDon(IHoaDonRepository.DANG_GIAO_HANG, loaiHoaDon, pageable) : hoaDonRepository.findByTrangThai(IHoaDonRepository.DANG_GIAO_HANG, pageable);
//                        break;
//                    case "accomplished":
//                        pageHD = (loaiHoaDon != null) ? hoaDonRepository.findByTrangThaiAndLoaiHoaDon(IHoaDonRepository.DA_HOAN_THANH, loaiHoaDon, pageable) : hoaDonRepository.findByTrangThai(IHoaDonRepository.DA_HOAN_THANH, pageable);
//                        break;
//                    case "cancelled":
//                        pageHD = (loaiHoaDon != null) ? hoaDonRepository.findByTrangThaiAndLoaiHoaDon(IHoaDonRepository.DA_HUY, loaiHoaDon, pageable) : hoaDonRepository.findByTrangThai(IHoaDonRepository.DA_HUY, pageable);
//                        break;
//                    default:
//                        pageHD = (loaiHoaDon != null) ? hoaDonRepository.findByLoaiHoaDon(loaiHoaDon, pageable) : hoaDonRepository.findAll(pageable);
//                        break;
//                }
//            } else {
//                pageHD = (loaiHoaDon != null && loaiHoaDon != -1) ? hoaDonRepository.findByLoaiHoaDon(loaiHoaDon, pageable) : hoaDonRepository.findAll(pageable);
//            }
//        }
//
//        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//        List<HoaDonDTO> listHoaDonDTO = pageHD.stream()
//                .map(hoaDon -> {
//                    HoaDonDTO hd = new HoaDonDTO(
//                            hoaDon.getId().toString(),
//                            hoaDon.getMa(),
//                            hoaDon.getIdKhachHang(),
//                            hoaDon.getIdNhanVien(),
//                            hoaDon.getPhuongThucThanhToan(),
//                            hoaDon.getTongTien(),
//                            hoaDon.getLoaiHoaDon(),
//                            hoaDon.getNgayTao() != null ? hoaDon.getNgayTao().format(dateTimeFormatter) : null,
//                            hoaDon.getNgayThanhToan() != null ? hoaDon.getNgayThanhToan().format(dateTimeFormatter) : null,
//                            hoaDon.getTrangThai()
//                    );
//                    hd.setTrangThaiText(hoaDonUtil.getTrangThaiName(hoaDon.getTrangThai()));
//                    hd.setMaMau(hoaDonUtil.getStatusClass(hoaDon.getTrangThai()));
//                    return hd;
//                })
//
//                .collect(Collectors.toList());
//
//        // Đếm số lượng các hóa đơn theo trạng thái
//        int countAll = hoaDonRepository.countAll();
//        int countChoXacNhan = hoaDonRepository.countByTrangThai(IHoaDonRepository.CHO_XAC_NHAN);
//        int countDaXacNhan = hoaDonRepository.countByTrangThai(IHoaDonRepository.DA_XAC_NHAN);
//        int countChoGiaoHang = hoaDonRepository.countByTrangThai(IHoaDonRepository.CHO_GIAO_HANG);
//        int countDangGiaoHang = hoaDonRepository.countByTrangThai(IHoaDonRepository.DANG_GIAO_HANG);
//        int countDaHoanThanh = hoaDonRepository.countByTrangThai(IHoaDonRepository.DA_HOAN_THANH);
//        int countDaHuy = hoaDonRepository.countByTrangThai(IHoaDonRepository.DA_HUY);
//
//        // Đưa các số lượng này vào model
//        model.addAttribute("countAll", countAll);
//        model.addAttribute("countChoXacNhan", countChoXacNhan);
//        model.addAttribute("countDaXacNhan", countDaXacNhan);
//        model.addAttribute("countChoGiaoHang", countChoGiaoHang);
//        model.addAttribute("countDangGiaoHang", countDangGiaoHang);
//        model.addAttribute("countDaHoanThanh", countDaHoanThanh);
//        model.addAttribute("countDaHuy", countDaHuy);
//
//        model.addAttribute("hoaDonPage", listHoaDonDTO);
//        model.addAttribute("pageHD", pageHD);
//        model.addAttribute("currentStatus", status);
//        model.addAttribute("currentLoaiHoaDon", loaiHoaDon);
//        model.addAttribute("keyword", keyword);
//        model.addAttribute("startDate", startDateStr);
//        model.addAttribute("endDate", endDateStr);
////        model.addAttribute("ngayTao", ngayTaoStr);
//
//        return "/view/view_sang/bill_Sang.jsp";
//    }
//
//
//    // Chức năng xem thông tin chi tiết hóa đơn theo IDHD
//    @GetMapping("/detail/{idHD}")
//    public String detailHDCT(Model model,
//                             @PathVariable("idHD") String idHD,
//                             @RequestParam(value = "page", defaultValue = "0") String pageParam
//    ) {
//
//        //Convert String sang UUId
//        try {
//            UUID uuid = UUID.fromString(idHD);
//        } catch (IllegalArgumentException e) {
//            // Handle the invalid UUID format
//            model.addAttribute("errorMessage", "ID hóa đơn không hợp lệ.");
//            return "/view/view_tai/hoa_don/detail_bill.jsp";
//        }
//
//        // Lấy danh sách chi tiết hóa đơn
//        List<ChiTietHoaDon> listHDCT = _hoaDonChiTietRepo.findAllByHoaDon_Id(idHD);
//        // Lấy ra hóa đơn theo ID
////        HoaDon hoaDon = _hoaDonRepo.findById(idHD).orElse(null);
//        HoaDon_Tai hoaDon = _hoaDonRepoTai.findById(idHD).orElse(null);
//        DiaChi diaChiKH = new DiaChi();
//        if (hoaDon.getIdKhachHang() != null && hoaDon.getIdKhachHang().getId() != null) {
//            diaChiKH = _diaChiRepository.findDiaChiByKhachHangId(hoaDon.getIdKhachHang().getId());
//        } else {
//            diaChiKH = null;
//        }
//        if (diaChiKH == null) {
//            model.addAttribute("errorMessage", "Khách hàng chưa có địa chỉ");
//            return "/view/view_tai/hoa_don/detail_bill.jsp";
//        }
//
//        if (hoaDon == null) {
//            // Xử lý trường hợp không tìm thấy hóa đơn
//            model.addAttribute("errorMessage", "Không tìm thấy hóa đơn.");
//            return "/view/view_tai/hoa_don/detail_bill.jsp";
//        }
//
//        // Chuyển đổi từ HoaDon sang HoaDonDTO
//        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//        HoaDonDTO hoaDonDTO = new HoaDonDTO(
//                hoaDon.getId().toString(),
//                hoaDon.getMa(),
//                hoaDon.getIdKhachHang(),
//                hoaDon.getIdNhanVien(),
//                hoaDon.getPhuongThucThanhToan(),
//                hoaDon.getTongTien(),
//                hoaDon.getLoaiHoaDon(),
//                hoaDon.getNgayTao() != null ? hoaDon.getNgayTao().format(dateTimeFormatter) : null,
//                hoaDon.getNgayThanhToan() != null ? hoaDon.getNgayThanhToan().format(dateTimeFormatter) : null,
//                hoaDon.getTrangThai(),
//                hoaDon.getNgayCapNhat() != null ? hoaDon.getNgayCapNhat().format(dateTimeFormatter) : null,
//                hoaDon.getGhiChu(),
//                hoaDon.getNgayDaXacNhan() != null ? hoaDon.getNgayDaXacNhan().format(dateTimeFormatter) : null,
//                hoaDon.getNgayChoGiaoHang() != null ? hoaDon.getNgayChoGiaoHang().format(dateTimeFormatter) : null,
//                hoaDon.getNgayDangGiaoHang() != null ? hoaDon.getNgayDangGiaoHang().format(dateTimeFormatter) : null
//
//        );
//        HoaDonUtil hoaDonUtil = new HoaDonUtil();
////        hoaDonDTO.setNgayCapNhat(hoaDon.getNgayCapNhat().format(dateTimeFormatter));
////        if(hoaDon.getNga)
//        hoaDonDTO.setGhiChu(hoaDon.getGhiChu());
//        hoaDonDTO.setTrangThaiText(hoaDonUtil.getTrangThaiName(hoaDon.getTrangThai()));
//        hoaDonDTO.setMaMau(hoaDonUtil.getStatusClass(hoaDon.getTrangThai()));
//        // Thêm các thông tin vào model để truyền sang JSP
//        model.addAttribute("hoaDonDTO", hoaDonDTO);
//        model.addAttribute("listHDCT", listHDCT);
//        model.addAttribute("diaChiKhachHang", diaChiKH);
//
//
//        switch (hoaDon.getTrangThai()) {
//            case IHoaDonRepository.CHO_XAC_NHAN:
//                model.addAttribute("step", "confirmation");
//                break;
//            case IHoaDonRepository.DA_XAC_NHAN:
//                model.addAttribute("step", "confirmed");
//                break;
//            case IHoaDonRepository.CHO_GIAO_HANG:
//                model.addAttribute("step", "delivery");
//                break;
//            case IHoaDonRepository.DANG_GIAO_HANG:
//                model.addAttribute("step", "delivered");
//                break;
//            case IHoaDonRepository.DA_HOAN_THANH:
//                model.addAttribute("step", "accomplished");
//                break;
//            default:
//                model.addAttribute("step", "default");
//                break;
//        }
//
//        // Lấy ra danh sách chi tiết sản phẩm để hiển thị lên modal Thêm sản phẩm
//        Pageable pageable = PageRequest.of(Integer.valueOf(pageParam), 10);
//        Page<ChiTietSanPham> listCTSP = _sanPhamChiTietRepo.findByTrangThai(1, pageable);
//
//        for (ChiTietSanPham ctsp : listCTSP) {
//            if (ctsp.getSoLuong() <= 0) {
//                listCTSP = _sanPhamChiTietRepo.findByTrangThai(_sanPhamChiTietRepo.INACTIVE, pageable);
//            }
//        }
//
//        // Lấy ra đối tượng giao hàng theo IdHoaDon
//        GiaoHang giaoHang = _giaoHangRepo.findByHoaDonId(idHD);
//        if (giaoHang == null) {
//            model.addAttribute("errorDelivery", "Không tìm thấy đối tượng giao hàng");
//        }
//
//        GiaoHangDTO giaoHangDTO = GiaoHangDTO.toDTO(giaoHang);
//        if (giaoHangDTO == null) {
//            model.addAttribute("errorDelivery", "Không tìm thấy đối tượng giao hàng");
//        }
//        model.addAttribute("giaoHangDTO", giaoHangDTO);
//        listMauSac = mauSacRepository.findAll();
//        listKichThuoc = kichThuocRepo.findAll();
//        listKieuTay = kieuTayRepo.findAll();
//        listChatLieu = chatLieuRepo.findAll();
//        listKhuyenMai = khuyenMaiRepo.findAll();
//        model.addAttribute("listCTSP", listCTSP);
//        model.addAttribute("listMauSac", listMauSac);
//        model.addAttribute("listKichThuoc", listKichThuoc);
//        model.addAttribute("listChatLieu", listChatLieu);
//        model.addAttribute("listKieuTay", listKieuTay);
//        model.addAttribute("listSanPham", listSanPham);
//        model.addAttribute("listKM", listKhuyenMai);
//        model.addAttribute("listCTSP", listCTSP);
//        model.addAttribute("pageCTSP", listCTSP);
//        return "/view/view_tai/hoa_don/detail_bill.jsp";
//    }
//
//    // Chức năng tìm kiếm hóa đơn
////    @GetMapping("/tim-kiem")
////    public String searchHoaDon(Model model,
////                               @RequestParam(value = "keyword", required = false) String keyword,
//////                               @RequestParam(value = "loaiHoaDon", required = false) Integer loaiHoaDon,
//////                               @RequestParam(value = "ngayTao", required = false) String ngayTaoStr,
////                               @RequestParam(value = "page", defaultValue = "0") int page) {
////        Pageable pageable = PageRequest.of(page, 5, Sort.by(Sort.Direction.DESC, "ngayTao"));
////
////        Page<HoaDon> pageHD = hoaDonRepository.searchByKeyword(keyword,pageable);
////
////        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
////        List<HoaDonDTO> listHoaDonDTO = pageHD.stream()
////                .map(hoaDon -> new HoaDonDTO(
////                        hoaDon.getId().toString(),
////                        hoaDon.getMa(),
////                        hoaDon.getIdKhachHang(),
////                        hoaDon.getIdNhanVien(),
////                        hoaDon.getPhuongThucThanhToan(),
////                        hoaDon.getTongTien(),
////                        hoaDon.getLoaiHoaDon(),
////                        hoaDon.getNgayTao() != null ? hoaDon.getNgayTao().format(dateTimeFormatter) : null,
////                        hoaDon.getNgayThanhToan() != null ? hoaDon.getNgayThanhToan().format(dateTimeFormatter) : null,
////                        hoaDon.getTrangThai()))
////                .collect(Collectors.toList());
////
////        System.out.println(keyword);
////
////        model.addAttribute("hoaDonPageAll", listHoaDonDTO);
////        model.addAttribute("pageHDALL", pageHD);
////        model.addAttribute("keyword", keyword);
////        return "/view/view_sang/bill_Sang.jsp";
////    }
//
//
//    // Chức năng xác nhận đơn hàng
//    @PostMapping("/xac-nhan/{idHD}")
//    public String confirmBill(@PathVariable("idHD") String idHD,
//                              @RequestParam("trangThai") int trangThai,
//                              @RequestParam("moTa") String moTa,
//                              Model model,
//                              RedirectAttributes redirectAttributes) {
//
//        try {
//            HoaDon_Tai hoaDon = _hoaDonRepoTai.findById(idHD).orElse(null);
////            ChiTietHoaDon chiTietHoaDon = _hoaDonChiTietRepo.findHDCTByIdHoaDon(idHD);
//
//            if (hoaDon == null) {
//                model.addAttribute("errorMessage", "Không tìm thấy hóa đơn.");
//                redirectAttributes.addFlashAttribute("confirmError", "Không tìm thấy hóa đơn.");
//                return "redirect:/hoa-don/detail/" + idHD;
//            }
//
//
//            // Cập nhật trạng thái và ngày giờ cụ thể tùy theo từng trường hợp
//            switch (hoaDon.getTrangThai()) {
//                case IHoaDonRepository.CHO_XAC_NHAN:
//                    hoaDon.setTrangThai(IHoaDonRepository.DA_XAC_NHAN);
//                    hoaDon.setNgayDaXacNhan(LocalDateTime.now());
//
//                    // Lấy ra danh sách Chi tiết hóa đơn theo IDHoaDon
//                    List<ChiTietHoaDon> chiTietList = _hoaDonChiTietRepo.findAllByHoaDon_Id(idHD);
//
//                    for (ChiTietHoaDon chiTietHD : chiTietList) {
//                        String idChiTietHoaDon = chiTietHD.getId();
//                        // Lấy ra đối tượng chi tiết sản phẩm từ repository
//                        Optional<ChiTietSanPham> chiTietSanPhamOptional = _chiTietSanPhamRepo.findByHoaDonChiTietId(idChiTietHoaDon);
//                        if (chiTietSanPhamOptional.isPresent()) {
//                            ChiTietSanPham chiTietSanPham = chiTietSanPhamOptional.get();
//
//                            // Kiểm tra và cập nhật số lượng sản phẩm chi tiết
//                            int soLuongConLai = chiTietSanPham.getSoLuong() - chiTietHD.getSoLuong();
//                            if (soLuongConLai >= 0) {
//                                chiTietSanPham.setSoLuong(soLuongConLai);
//                                _chiTietSanPhamRepo.save(chiTietSanPham);
//                                redirectAttributes.addFlashAttribute("confirmSuccess", "Cập nhật số lượng thành công");
//
//
//                            } else {
//                                redirectAttributes.addFlashAttribute("errorProductDetail", "Không đủ số lượng sản phẩm trong kho");
//                                return "redirect:/hoa-don/detail/" + idHD;
//                            }
//                        } else {
//                            redirectAttributes.addFlashAttribute("errorProductDetail", "Không tìm thấy chi tiết sản phẩm có ID = " + idChiTietHoaDon);
//                            return "redirect:/hoa-don/detail/" + idHD;
//                        }
//                    }
//
//
//                    break;
//                case IHoaDonRepository.DA_XAC_NHAN:
//                    hoaDon.setTrangThai(IHoaDonRepository.CHO_GIAO_HANG);
//                    hoaDon.setNgayChoGiaoHang(LocalDateTime.now());
//
//                    break;
//                case IHoaDonRepository.CHO_GIAO_HANG:
//                    hoaDon.setTrangThai(IHoaDonRepository.DANG_GIAO_HANG);
//                    hoaDon.setNgayDangGiaoHang(LocalDateTime.now());
//
//                    break;
//                case IHoaDonRepository.DANG_GIAO_HANG:
//                    hoaDon.setTrangThai(IHoaDonRepository.DA_HOAN_THANH);
//                    hoaDon.setNgayThanhToan(LocalDateTime.now());
//
//                    break;
//                default:
//                    model.addAttribute("errorMessage", "Trạng thái không hợp lệ.");
//                    return "redirect:/hoa-don/detail/" + idHD;
//            }
//
//            if (moTa == null) {
//                redirectAttributes.addFlashAttribute("confirmError", "Vui lòng điền vào mô tả.");
//                return "redirect:/hoa-don/detail/" + idHD;
//            }
//            _hoaDonRepoTai.save(hoaDon);
//            HoaDonDTO hoaDonDTO = HoaDonDTO.fromEntity(hoaDon);
//            redirectAttributes.addFlashAttribute("hoaDonDTO", hoaDonDTO);
//            // Thông báo cập nhật thành công
//            redirectAttributes.addFlashAttribute("confirmSuccess", "Cập nhật trạng thái đơn hàng thành công.");
//        } catch (Exception e) {
//            e.printStackTrace();
//            redirectAttributes.addFlashAttribute("confirmError", "Có lỗi xảy ra khi cập nhật trạng thái đơn hàng.");
//        }
//        return "redirect:/hoa-don/detail/" + idHD;
//    }
//
//
//    @GetMapping("/hoan-tac/{idHD}")
//    public String undoBill(@PathVariable("idHD") String idHD,
//                           Model model,
//                           RedirectAttributes redirectAttributes) {
//        try {
//            HoaDon_Tai hoaDon = _hoaDonRepoTai.findById(idHD).orElse(null);
//
//
//            if (hoaDon == null) {
//                model.addAttribute("errorMessage", "Không tìm thấy hóa đơn.");
//                redirectAttributes.addFlashAttribute("confirmError", "Không tìm thấy hóa đơn.");
//                return "redirect:/hoa-don/detail/" + idHD;
//            }
//
//
//            switch (hoaDon.getTrangThai()) {
//                case IHoaDonRepository.DA_XAC_NHAN:
//                    hoaDon.setTrangThai(IHoaDonRepository.CHO_XAC_NHAN);
//                    hoaDon.setNgayDaXacNhan(null);
//                    break;
//                case IHoaDonRepository.CHO_GIAO_HANG:
//                    hoaDon.setTrangThai(IHoaDonRepository.CHO_XAC_NHAN);
//                    hoaDon.setNgayCapNhat(LocalDateTime.now());
//                    hoaDon.setNgayChoGiaoHang(null);
//                    break;
//                case IHoaDonRepository.DA_HOAN_THANH:
//                    hoaDon.setTrangThai(IHoaDonRepository.CHO_XAC_NHAN);
//                    hoaDon.setNgayCapNhat(LocalDateTime.now());
//                    break;
//                default:
//                    model.addAttribute("errorMessage", "Trạng thái không hợp lệ.");
//                    return "redirect:/hoa-don/detail/" + idHD;
//            }
//
//            // Lưu lại thay đổi
//            _hoaDonRepoTai.save(hoaDon);
//            // Chuyển đổi HoaDon sang HoaDonDTO sau khi cập nhật và thêm vào model
//
//
//            redirectAttributes.addFlashAttribute("confirmSuccess", "Cập nhật trạng thái đơn hàng thành công.");
//        } catch (Exception e) {
//            e.printStackTrace();
//            redirectAttributes.addFlashAttribute("confirmError", "Có lỗi xảy ra khi cập nhật trạng thái đơn hàng.");
//        }
//        return "redirect:/hoa-don/detail/" + idHD;
//    }
//}
