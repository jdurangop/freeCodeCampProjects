package com.jdurangop.jpa.repository.category;

import com.jdurangop.jpa.entity.category.CategoryEntity;
import com.jdurangop.jpa.helper.AdapterOperations;
import com.jdurangop.model.category.Category;
import com.jdurangop.model.category.gateways.CategoryRepository;
import org.reactivecommons.utils.ObjectMapper;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryRepositoryAdapter extends AdapterOperations<Category, CategoryEntity, String, CategoryJpaRepository>
    implements CategoryRepository {

    public CategoryRepositoryAdapter(CategoryJpaRepository repository, ObjectMapper mapper) {
        /**
         *  Could be use mapper.mapBuilder if your domain model implement builder pattern
         *  super(repository, mapper, d -> mapper.mapBuilder(d,ObjectModel.ObjectModelBuilder.class).build());
         *  Or using mapper.map with the class of the object model
         */
        super(repository, mapper, d -> mapper.map(d, Category.class));
    }
}
