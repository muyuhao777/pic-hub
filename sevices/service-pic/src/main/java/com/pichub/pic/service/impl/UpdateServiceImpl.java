package com.pichub.pic.service.impl;

import com.pichub.pic.bean.Picture;
import com.pichub.pic.repository.PictureRepository;
import com.pichub.pic.service.UpdateService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UpdateServiceImpl implements UpdateService {

    private final PictureRepository pictureRepository;

    @Override
    public void update(Picture pic) {
        Picture picExist = pictureRepository.findById(pic.getId()).orElse(null);
        picExist.setContentTypeId(pic.getContentTypeId());
        picExist.setRegionTypeId(pic.getRegionTypeId());
        picExist.setStyleTypeId(pic.getStyleTypeId());
        pictureRepository.save(picExist);
    }
}
