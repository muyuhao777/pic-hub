package com.pichub.pic.service.impl;

import com.pichub.pic.bean.Picture;
import com.pichub.pic.dto.request.PictureQueryRequest;
import com.pichub.pic.repository.PictureRepository;
import com.pichub.pic.service.SearchService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SearchServiceImpl implements SearchService {


    private final PictureRepository pictureRepository;

    @Override
    public Page<Picture> queryPictures(PictureQueryRequest query) {
        // 1. 参数校验与默认值设置
        if (query.getPage() == null || query.getPage() < 1) {
            query.setPage(1);
        }
        if (query.getSize() == null || query.getSize() < 1 || query.getSize() > 100) {
            query.setSize(12); // 默认每页20条
        }



        // 3. 调用Repository执行查询
        return pictureRepository.findByTypeTrees(
                query.getStyleName(),
                query.getContentTypeName(),
                query.getRegionName(),
                query.getMinHue(),
                query.getMaxHue(),
                query.getMinSaturation(),
                query.getMaxSaturation(),
                query.getMinValue(),
                query.getMaxValue(),
                PageRequest.of(
                        query.getPage() - 1, // Spring分页从0开始
                        query.getSize(),
                        Sort.by(Sort.Direction.DESC, "p_id") // 按ID倒序
                )
        );
    }
}
