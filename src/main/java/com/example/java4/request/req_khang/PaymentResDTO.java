package com.example.java4.request.req_khang;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PaymentResDTO {

    private String status;
    private String message;
    private String URL;
}
