package com.example.java4.request.QLSP.Store;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamMulStore {
    private String id;
    private String name;
    private List<KichThuocMulStore> size;
    private int amountCBO;
}
