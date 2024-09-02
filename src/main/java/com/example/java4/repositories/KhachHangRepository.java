package com.example.java4.repositories;

import com.example.java4.entities.KhachHang;
import com.example.java4.response.ThongTinGiaohangResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface KhachHangRepository
        extends JpaRepository<KhachHang,String>
{
    public static final int ACTIVE  = 1;
    public static final int INACTIVE =0;
//    public Page<KhachHang> findByTrangThai(int trangThai, Pageable pageable);
//    public Optional<KhachHang> findById(Integer id);

    @Query("select kh from KhachHang kh where kh.trangThai=:trangThai")
    public Page<KhachHang> findByTrangThai(@Param("trangThai") int trangThai, Pageable pageable);
    @Query("select kh from KhachHang kh where (kh.hoTen like %?1% or kh.sdt like %?1%) and kh.trangThai=?2")
    public Page<KhachHang> timKiemKhachHang(String key,int trangThai,Pageable pageable);
    public Optional<KhachHang> findById(String id);
    public static final int Lock =2;
//    public Optional<KhachHang> findById(Integer id);
    // Lấy thông tin khách hàng theo Username và Password làm chức năng đăng nhập
    KhachHang findByTaiKhoanAndMatKhau(String taiKhoan, String matKhau);
    KhachHang findByTaiKhoan(String taiKhoan);
    @Query("select kh from KhachHang kh where kh.id = ?1")
    KhachHang findByIdKH(String idKH);

    @Query("select new com.example.java4.response.ThongTinGiaohangResponse(kh.hoTen, kh.sdt, dc.diaChiChiTiet, dc.idPhuongXa, dc.idQuanHuyen, dc.idTinhThanh) from KhachHang kh\n" +
            "join DiaChi dc on dc.idKhachHang.id = kh.id\n" +
            "where kh.id = ?1")
    ThongTinGiaohangResponse getThongTinGiaoHang(String idKH);

    //Tìm kiếm
    @Query("select kh from KhachHang kh where kh.hoTen like %?1% or kh.sdt like %?1% or kh.email like %?1%")
    List<KhachHang> findByHoTenOrSdtOrEmail(String key);

    @Query("select kh from KhachHang kh where kh.ngaySinh between ?1 and ?2")
    List<KhachHang> findByKhoangNgaySinh(Date ngayBatDau, Date ngayKetThuc);

    @Query("select kh from KhachHang kh where (kh.hoTen like %?1% or kh.sdt like %?1% or kh.email like %?1%) and (kh.ngaySinh between ?2 and ?3)")
    List<KhachHang> findByHoTenOrSdtOrEmail_NgaySinh(String key, Date ngayBatDau, Date ngayKetThuc);

    KhachHang findByEmail(String email);
    KhachHang findBySdt(String sdt);
};
