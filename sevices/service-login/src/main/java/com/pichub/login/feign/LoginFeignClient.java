package com.pichub.login.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(value = "service-pic")
public interface LoginFeignClient {
    @GetMapping("")
    void addPicNum();
}
