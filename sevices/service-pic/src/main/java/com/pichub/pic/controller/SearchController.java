package com.pichub.pic.controller;

import com.pichub.pic.bean.Picture;
import com.pichub.pic.dto.request.PictureQueryRequest;
import com.pichub.pic.service.SearchService;
import com.pichub.pic.util.PageInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/pic/search")
@RequiredArgsConstructor
public class SearchController {
    private final SearchService searchService;

    @GetMapping
    @PostMapping
    public String getPictures(
            @RequestParam(required = false) String styleName,
            @RequestParam(required = false) String contentTypeName,
            @RequestParam(required = false) String regionName,
            @RequestParam(defaultValue = "0") Integer minHue,
            @RequestParam(defaultValue = "360") Integer maxHue,
            @RequestParam(required = false) Integer minSaturation,
            @RequestParam(required = false) Integer maxSaturation,
            @RequestParam(required = false) Integer minValue,
            @RequestParam(required = false) Integer maxValue,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "12") int size,
            Model model
    ) {
        PictureQueryRequest query = new PictureQueryRequest();
        query.setStyleName(styleName==""?null:styleName);
        query.setContentTypeName(contentTypeName==""?null:contentTypeName);
        query.setRegionName(regionName==""?null:regionName);
        query.setMinHue(minHue);
        query.setMaxHue(maxHue);
        query.setMinSaturation(minSaturation);
        query.setMaxSaturation(maxSaturation);
        query.setMinValue(minValue);
        query.setMaxValue(maxValue);
        query.setPage(page);
        query.setSize(size);

        Page<Picture> pageResult = searchService.queryPictures(query);

        model.addAttribute("pictures", pageResult.getContent());
        model.addAttribute("pageInfo", new PageInfo(pageResult));
//        model.addAttribute("queryParams", Map.of(
//                "styleName", styleName,
//                "contentTypeName", contentTypeName,
//                "regionName", regionName
//        ));
        model.addAttribute("queryParams", Map.of(
                "styleName",
                (styleName != null && !styleName.isEmpty()) ? styleName : "",
                "contentTypeName",
                (contentTypeName != null && !contentTypeName.isEmpty()) ? contentTypeName : "",
                "regionName",
                (regionName != null && !regionName.isEmpty()) ? regionName : "",
                "minHue",
                (minHue != null) ? minHue : 0,
                "maxHue",
                (maxHue != null) ? maxHue : 360
        ));



        return "demo";
    }
}
