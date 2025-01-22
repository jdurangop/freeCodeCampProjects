package com.jdurangop.jpa.repository.image;

import com.jdurangop.jpa.entity.image.ImageEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface ImageJpaRepository
    extends CrudRepository<ImageEntity, String>, QueryByExampleExecutor<ImageEntity> {
}
