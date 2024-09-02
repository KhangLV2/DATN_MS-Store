package com.example.java4.request.QLSP.Store;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HinhAnhStore {
    private String idSPCT;
    @NotEmpty
    private String hinhAnh1;
    @NotEmpty
    private String hinhAnh2;
    @NotEmpty
    private String hinhAnh3;
    @NotEmpty
    private String trangThai;
}
