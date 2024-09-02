package com.example.java4.controller.controller_tai;

import com.example.java4.config.UserInfor;
import com.example.java4.entities.ChiTietHoaDon;
import com.example.java4.entities.ChiTietSanPham;
import com.example.java4.entities.HinhAnh;
import com.example.java4.entities.NhanVien;
import com.example.java4.repositories.HinhAnhRepository;
import com.example.java4.repositories.NhanVienRepository;
import com.example.java4.repositories.SPCTRepository;
import com.example.java4.repositories.ThongKeRepository;
import com.example.java4.response.SPCTDTO;
import com.example.java4.response.ThongKeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/thong-ke")
public class ThongKeController {

    private static final Logger logger = LoggerFactory.getLogger(ThongKeController.class);

    @Autowired
    ThongKeRepository _thongKeRepo;

    @Autowired
    NhanVienRepository _nhanVienRepo;

    @Autowired
    SPCTRepository _chiTietSanPhamRepo;

    @Autowired
    HinhAnhRepository _hinhAnhRepo;
    @Autowired
    private ThongKeRepository thongKeRepository;


    @GetMapping("/view")
    public String view(Model model,
                       @RequestParam(value = "page", defaultValue = "0") String pageParam) {

        if (UserInfor.idNhanVien != null) {
            NhanVien nhanVien = _nhanVienRepo.findById(UserInfor.idNhanVien).get();
            model.addAttribute("nv", nhanVien);
        } else {
            return "redirect:/admin/dang-nhap-view";
        }

        LocalDate today = LocalDate.now();
        LocalDate startOfWeek = today.with(TemporalAdjusters.previousOrSame(java.time.DayOfWeek.MONDAY));
        LocalDate startOfMonth = today.withDayOfMonth(1);
        LocalDate startOfYear = today.withDayOfYear(1);

        LocalDate endOfWeek = startOfWeek.plusWeeks(1);
        LocalDate endOfMonth = today.plusMonths(1).withDayOfMonth(1).minusDays(1);
        LocalDate endOfYear = today.plusYears(1).withDayOfYear(1).minusDays(1);

        List<Object[]> dailyResults = _thongKeRepo.getDailyStatistics(today.atStartOfDay());
        List<Object[]> weeklyResults = _thongKeRepo.getWeeklyStatistics(startOfWeek.atStartOfDay(), endOfWeek.atStartOfDay());
        List<Object[]> monthlyResults = _thongKeRepo.getMonthlyStatistics(startOfMonth.atStartOfDay());
        List<Object[]> yearlyResults = _thongKeRepo.getYearlyStatistics(startOfYear.atStartOfDay());

        logger.info("Daily results: {}", dailyResults);
        logger.info("Weekly results: {}", weeklyResults);
        logger.info("Monthly results: {}", monthlyResults);
        logger.info("Yearly results: {}", yearlyResults);

        ThongKeDTO todayStats = ThongKeDTO.mapToThongKeDTO(dailyResults.get(0));
        ThongKeDTO weeklyStats = ThongKeDTO.mapToThongKeDTO(weeklyResults.get(0));
        ThongKeDTO monthlyStats = ThongKeDTO.mapToThongKeDTO(monthlyResults.get(0));
        ThongKeDTO yearlyStats = ThongKeDTO.mapToThongKeDTO(yearlyResults.get(0));

        model.addAttribute("today", todayStats);
        model.addAttribute("week", weeklyStats);
        model.addAttribute("month", monthlyStats);
        model.addAttribute("year", yearlyStats);


        // Hiển thị danh sách sản phẩm sắp hết hàng
        PageRequest pageRequest = PageRequest.of(Integer.valueOf(pageParam), 5);
        Page<ChiTietSanPham> listSanPhamSapHetHang = _thongKeRepo.findProductsLowOnStock(pageRequest);


        // Top selling products
        LocalDateTime currentMonth = LocalDateTime.now();
        Page<SPCTDTO> topSellingProducts = _thongKeRepo.getTopSellingProductsByMonth(currentMonth,0,pageRequest);

        model.addAttribute("topSellingProducts",topSellingProducts);
        model.addAttribute("pageSPSapHetHang", listSanPhamSapHetHang);

        return "/view/ThongKe/view.jsp";
    }

//    Thống kê doanh thu theo Bộ Lọc
    @PostMapping("/tuy-chinh")
    public String thongKeTheoTuyChinh(@RequestParam("startDate") String startDate,
                                      @RequestParam("endDate") String endDate,
                                      RedirectAttributes redirectAttributes) {
        LocalDateTime startDateTime = LocalDate.parse(startDate).atStartOfDay();
        LocalDateTime endDateTime = LocalDate.parse(endDate).atStartOfDay();
        List<Object[]> customResults = _thongKeRepo.getCustomStatistics(startDateTime, endDateTime);
        logger.info("Custom date range results: {}", customResults);
        ThongKeDTO customStats = ThongKeDTO.mapToThongKeDTO(customResults.get(0));
        redirectAttributes.addFlashAttribute("customStats", customStats);
        redirectAttributes.addFlashAttribute("formSuccess", true);
        return "redirect:/admin/thong-ke/view";
    }


    //    Thống kê số lượng hóa đơn và sản phẩm theo tùy chỉnh
    @GetMapping("/tu-ngay-den-ngay")
    @ResponseBody
    public List<Map<String, Object>> thongKeTheoTuyChinh(@RequestParam("startDate") String startDate,
                                                         @RequestParam("endDate") String endDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime startDateTime = LocalDate.parse(startDate, formatter).atStartOfDay();
        LocalDateTime endDateTime = LocalDate.parse(endDate, formatter).atStartOfDay();
        List<Object[]> customResults = thongKeRepository.getCustomDateRangeStatistics(startDateTime, endDateTime);

        return customResults.stream()
                .map(result -> Map.of(
                        "day", result[0],
                        "soLuongHoaDon", result[1],
                        "soLuongSanPham", result[2]
                ))
                .collect(Collectors.toList());
    }




}
