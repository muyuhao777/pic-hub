package com.pichub.pic.service;

import com.pichub.pic.bean.Picture;
import com.pichub.pic.dto.request.PictureInsertRequest;

public interface DeleteService {
    public void deletePicture(Picture picture);
}
