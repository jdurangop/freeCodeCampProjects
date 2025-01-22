package com.jdurangop.jpa.repository.product;

import com.jdurangop.jpa.entity.product.ProductEntity;
import com.jdurangop.jpa.helper.AdapterOperations;
import com.jdurangop.model.product.Product;
import com.jdurangop.model.product.gateways.ProductRepository;
import org.reactivecommons.utils.ObjectMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProductRepositoryAdapter extends AdapterOperations<Product, ProductEntity, String, ProductJpaRepository>
    implements ProductRepository {

    public ProductRepositoryAdapter(ProductJpaRepository repository, ObjectMapper mapper) {
        /**
         *  Could be use mapper.mapBuilder if your domain model implement builder pattern
         *  super(repository, mapper, d -> mapper.mapBuilder(d,ObjectModel.ObjectModelBuilder.class).build());
         *  Or using mapper.map with the class of the object model
         */
        super(repository, mapper, d -> mapper.map(d, Product.class));
    }
}
