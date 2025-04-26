package com.pichub.pic.feign;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.pichub.pic.feign.fallback.PicFeignClientFallback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.TimeUnit;

@FeignClient(value = "service-login",fallback = PicFeignClientFallback.class)
public interface PicFeignClient {

    @GetMapping("/login/add")  // 与服务端路径一致
    void addPicNum(@RequestParam("u_id") Integer uId);  // 参数名必须匹配

    @RequestMapping("/login/getc")
    public Integer getPicNum(@RequestParam("u_id") Integer uId);

    @RequestMapping ("/login/addc")
    public boolean addPicNum(@RequestParam("u_id") Integer uId, @RequestParam("pic_num") Integer picNum);
}
