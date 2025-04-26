package com.pichub.pic.controller;

import com.pichub.login.bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.util.List;

//@RefreshScope//@Value("${spring.datasource.url}")自动刷新
@Controller
public class TestController {

    @Autowired
    DiscoveryClient discoveryClient;

    @Autowired
    RestTemplate restTemplate;

    @Autowired
    LoadBalancerClient loadBalancerClient;

    @Value("${spring.datasource.url}")
    String dbUrl;

    @Value("${spring.datasource.username}")
    String dbUsername;

    @RequestMapping("/test")
    @ResponseBody
    public User test() {
        User u = getUserFromRemoteWithLoadBalnceAnnotiation("2", "123456");
        return u;
    }

    private User getUserFromRemote(String uId, String uPwd) {
//        获取ip
         List<ServiceInstance> instances = discoveryClient.getInstances("service-login");

         ServiceInstance instance = instances.get(0);

         String url = instance.getUri() +"/author"+"/"+uId+"/"+uPwd;

         User u = restTemplate.getForObject(url, User.class);

         return u;

    }

    private User getUserFromRemoteWithLoadBalnce(String uId, String uPwd) {
//        获取ip
        ServiceInstance instance = loadBalancerClient.choose("service-login");

        String url = instance.getUri() +"/author"+"/"+uId+"/"+uPwd;

        System.out.println("url:"+url);

        User u = restTemplate.getForObject(url, User.class);

        return u;

    }

    private User getUserFromRemoteWithLoadBalnceAnnotiation(String uId, String uPwd) {
//        获取ip

        String url = "http://service-login/author"+"/"+uId+"/"+uPwd;

        System.out.println("url:"+url);

        User u = restTemplate.getForObject(url, User.class);

        return u;

    }

}
