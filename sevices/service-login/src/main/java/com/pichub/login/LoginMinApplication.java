package com.pichub.login;


import com.pichub.jwt.JwtConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

@EnableDiscoveryClient
@SpringBootApplication//(exclude = { DataSourceAutoConfiguration.class })
//@ComponentScan(basePackages = {"com.pichub.login.service", "com.pichub.login.controller", "com.pichub.login"})
//@EntityScan(basePackages = {"com.pichub.login.bean"})
//@EnableJpaRepositories(basePackages = {"com.pichub.login.repository"})
@EnableRedisHttpSession
@EnableFeignClients
@Import(JwtConfiguration.class)
public class LoginMinApplication {
    public static void main(String[] args) {
        SpringApplication.run(LoginMinApplication.class, args);
    }

}
