package com.pichub.pic.service;

import com.pichub.pic.bean.Picture;
import com.pichub.pic.dto.request.PictureQueryRequest;
import org.springframework.data.domain.Page;

public interface SearchService {
    public Page<Picture> queryPictures(PictureQueryRequest query);
}
