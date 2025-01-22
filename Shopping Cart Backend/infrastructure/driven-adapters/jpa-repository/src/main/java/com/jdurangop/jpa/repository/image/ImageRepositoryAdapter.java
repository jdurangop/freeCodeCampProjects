package com.jdurangop.jpa.repository.image;

import com.jdurangop.jpa.entity.image.ImageEntity;
import com.jdurangop.jpa.helper.AdapterOperations;
import com.jdurangop.model.image.Image;
import com.jdurangop.model.image.gateways.ImageRepository;
import org.reactivecommons.utils.ObjectMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ImageRepositoryAdapter extends AdapterOperations<Image, ImageEntity, String, ImageJpaRepository>
    implements ImageRepository
{

    public ImageRepositoryAdapter(ImageJpaRepository repository, ObjectMapper mapper) {
        /**
         *  Could be use mapper.mapBuilder if your domain model implement builder pattern
         *  super(repository, mapper, d -> mapper.mapBuilder(d,ObjectModel.ObjectModelBuilder.class).build());
         *  Or using mapper.map with the class of the object model
         */
        super(repository, mapper, d -> mapper.map(d, Image.class));
    }
}
