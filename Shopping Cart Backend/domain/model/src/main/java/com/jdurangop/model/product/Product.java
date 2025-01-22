package com.jdurangop.model.product;
import com.jdurangop.model.category.Category;
import com.jdurangop.model.image.Image;
import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@Builder(toBuilder = true)
public class Product {
    private Long id;
    private String name;
    private String brand;
    private String description;
    private BigDecimal price;
    private Long stock;
    private Category category;
    private List<Image> images;
}
