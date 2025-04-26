package com.pichub.pic;

//import com.alibaba.cloud.nacos.NacosConfigAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class PicMainApplication {
    public static void main(String[] args) {
        SpringApplication.run(PicMainApplication.class, args);
    }
}
