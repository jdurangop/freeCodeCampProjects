package com.jdurangop.jpa.repository.category;

import com.jdurangop.jpa.entity.category.CategoryEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface CategoryJpaRepository
    extends CrudRepository<CategoryEntity, String>, QueryByExampleExecutor<CategoryEntity> {
}
