package com.pichub.pic.feign.fallback;

import com.pichub.pic.feign.PicFeignClient;
import org.springframework.stereotype.Component;

@Component
public class PicFeignClientFallback implements PicFeignClient {
    @Override
    public void addPicNum(Integer uId) {

    }

    @Override
    public Integer getPicNum(Integer uId) {
        return -1;
    }

    @Override
    public boolean addPicNum(Integer uId, Integer picNum) {
        return false;
    }
}
