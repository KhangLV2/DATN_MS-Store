package com.example.java4.request.QLSP.Store;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class KichThuocStore {
    private String id;
    @NotEmpty
    private String ten;
    @NotEmpty
    private String trangThai;
}