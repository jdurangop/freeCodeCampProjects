package com.jdurangop.jpa.repository.product;

import com.jdurangop.jpa.entity.product.ProductEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface ProductJpaRepository
    extends CrudRepository<ProductEntity, String>, QueryByExampleExecutor<ProductEntity> {
}
