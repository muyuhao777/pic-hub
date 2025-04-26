package com.pichub.pic.service;

import com.pichub.pic.bean.Picture;
import com.pichub.pic.dto.request.PictureInsertRequest;
import org.springframework.stereotype.Component;

public interface InsertService {
    public Picture uploadPicture(PictureInsertRequest dto);
}
