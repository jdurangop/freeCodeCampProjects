package com.jdurangop.model.category;
import com.jdurangop.model.product.Product;
import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@Builder(toBuilder = true)
public class Category {
    private Long id;
    private String name;
    private List<Product> products;
}
