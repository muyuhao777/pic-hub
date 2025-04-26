package com.pichub.pic.util;

import org.springframework.data.domain.Page;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.Map;

public class PageInfo {
    private final Page<?> page;

    public PageInfo(Page<?> page) {
        this.page = page;
    }

    public int getCurrent() {
        return page.getNumber() + 1;
    }

    public int getTotalPages() {
        return page.getTotalPages();
    }

    public boolean hasPrevious() {
        return page.hasPrevious();
    }

    public boolean hasNext() {
        return page.hasNext();
    }

    // 生成分页URL（保留原有查询参数）
    public String getPageUrl(int newPage, Map<String, Object> queryParams) {
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("/pictures")
                .queryParam("page", newPage);

        queryParams.forEach((key, value) -> {
            if (value != null) {
                builder.queryParam(key, value);
            }
        });

        return builder.build().toUriString();
    }
}