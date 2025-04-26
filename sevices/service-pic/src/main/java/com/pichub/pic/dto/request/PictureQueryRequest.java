package com.pichub.pic.dto.request;

import lombok.Data;

@Data
public class PictureQueryRequest {
    private Integer page;          // 当前页码（从1开始）
    private Integer size;          // 每页数量

    private String styleName;      // 风格类型名称
    private String contentTypeName; // 内容类型名称
    private String regionName;     // 地区类型名称

    private Integer minHue;
    private Integer maxHue;

    private Integer minSaturation;
    private Integer maxSaturation;

    private Integer minValue;
    private Integer maxValue;
}
