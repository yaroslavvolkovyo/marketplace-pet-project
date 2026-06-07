package ru.digua.marketplace.dto;


import lombok.*;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Component
public class ProductDto{

    private Long productId;

    private String name;

    private String description;

    private BigDecimal price;

    private Long sellerId;
}
