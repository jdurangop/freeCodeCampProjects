package com.jdurangop.model.image;
import com.jdurangop.model.product.Product;
import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Blob;

@Getter
@Setter
@AllArgsConstructor
@Builder(toBuilder = true)
public class Image {
    private Long id;
    private String fileName;
    private String directoryPath;
    private String fileType;
    private Blob fileContent;
    private String downloadUrl;
    private Product product;
}
