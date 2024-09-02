package com.example.java4.controller.QLSP;
import com.example.java4.entities.*;
import com.example.java4.repositories.SPCTRepository;
import com.example.java4.repositories.SanPhamRepository;
import com.example.java4.response.SanPhamView;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.Predicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class SearchService {
    @Autowired
    private SPCTRepository spctRepo;
    @Autowired
    private SanPhamRepository spRepo;
    public List<ChiTietSanPham> searchChiTietSanPham(Map<String, Object> params) {
        return spctRepo.findAll((root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            params.forEach((key, value) -> {
                if (value != null) {
                    if (value instanceof String) {
                        predicates.add(criteriaBuilder.like(root.get(key).as(String.class), "%" + value + "%"));
                    } else if (value instanceof Integer) {
                        predicates.add(criteriaBuilder.equal(root.get(key), value));
                    } else if (value instanceof BigDecimal) {
                        predicates.add(criteriaBuilder.equal(root.get(key), value));
                    } else if (value instanceof LocalDateTime) {
                        predicates.add(criteriaBuilder.equal(root.get(key), value));
                    } else if (value instanceof MauSac) {
                        predicates.add(criteriaBuilder.equal(root.get("idMauSac").get("id"), ((MauSac) value).getId()));
                    } else if (value instanceof KichThuoc) {
                        predicates.add(criteriaBuilder.equal(root.get("idKichThuoc").get("id"), ((KichThuoc) value).getId()));
                    } else if (value instanceof ChatLieu) {
                        predicates.add(criteriaBuilder.equal(root.get("idChatLieu").get("id"), ((ChatLieu) value).getId()));
                    } else if (value instanceof KieuTay) {
                        predicates.add(criteriaBuilder.equal(root.get("idKieuTay").get("id"), ((KieuTay) value).getId()));
                    } else if (value instanceof SanPham) {
                        predicates.add(criteriaBuilder.equal(root.get("idSanPham").get("id"), ((SanPham) value).getId()));
                    }
                }
            });
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        });
    }


    public List<ChiTietSanPham> searchChiTietSanPham1(Map<String, Object> params) {
        return spctRepo.findAll((root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            System.out.println("Params: " + params);
            params.forEach((key, value) -> {
                if (value != null && !value.toString().trim().isEmpty()) {
                    Predicate predicate = null;
                    System.out.println("Processing key: " + key + ", value: " + value);
                    switch (key) {
                        case "moTa":
                            if (value instanceof String) {
                                predicate = criteriaBuilder.like(root.get("moTa"), "%" + value + "%");
                            }
                            break;
                        case "soLuong":
                            if (value instanceof Integer) {
                                predicate = criteriaBuilder.equal(root.get("soLuong"), value);
                            }
                            break;
                        case "giaBanMin":
                            if (value instanceof String && !value.toString().trim().isEmpty()) {
                                try {
                                    BigDecimal minPrice = new BigDecimal((String) value);
                                    predicate = criteriaBuilder.greaterThanOrEqualTo(root.get("giaBan"), minPrice);
                                } catch (NumberFormatException e) {
                                    e.printStackTrace();
                                }
                            }
                            break;
                        case "giaBanMax":
                            if (value instanceof String && !value.toString().trim().isEmpty()) {
                                try {
                                    BigDecimal maxPrice = new BigDecimal((String) value);
                                    predicate = criteriaBuilder.lessThanOrEqualTo(root.get("giaBan"), maxPrice);
                                } catch (NumberFormatException e) {
                                    e.printStackTrace();
                                }
                            }
                            break;
                        case "ngayTaoAfter":
                            if (value instanceof String && !value.toString().trim().isEmpty()) {
                                try {
                                    LocalDateTime dateTime = LocalDateTime.parse((String) value);
                                    predicate = criteriaBuilder.greaterThanOrEqualTo(root.get("ngayTao"), dateTime);
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                            break;
                        case "ngayTaoBefore":
                            if (value instanceof String && !value.toString().trim().isEmpty()) {
                                try {
                                    LocalDateTime dateTime = LocalDateTime.parse((String) value);
                                    predicate = criteriaBuilder.lessThanOrEqualTo(root.get("ngayTao"), dateTime);
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                            break;
                        case "idMauSac":
                        case "idKichThuoc":
                        case "idChatLieu":
                        case "idKieuTay":
                        case "idSanPham":
                            if (value instanceof String && isValidGuid((String) value)) {
                                Join<ChiTietSanPham, ?> join = root.join(key);
                                predicate = criteriaBuilder.equal(join.get("id"), value);
                            }
                            break;
                        case "trangThai":
                            if (value instanceof Integer || value instanceof String && !value.toString().trim().isEmpty()) {
                                int trangThaiValue = (value instanceof Integer) ? (Integer) value : Integer.parseInt((String) value);
                                predicate = criteriaBuilder.equal(root.get("trangThai"), trangThaiValue);
                            } else {
                                System.out.println("Invalid data type for key: " + key + ", value: " + value);
                            }
                            break;
                    }

                    if (predicate != null) {
                        predicates.add(predicate);
                        System.out.println("Added predicate: " + predicate);
                    } else {
                        System.out.println("No predicate added for key: " + key);
                    }
                } else {
                    System.out.println("Skipping key: " + key + " due to null or empty value.");
                }
            });

            System.out.println("Number of predicates: " + predicates.size());
            predicates.forEach(p -> System.out.println("Predicate: " + p));

            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        });
    }


    // Helper method to check if a string is a valid GUID
    private boolean isValidGuid(String guid) {
        try {
            UUID.fromString(guid);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }


}
