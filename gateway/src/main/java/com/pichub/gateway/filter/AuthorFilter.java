package com.pichub.gateway.filter;

import com.alibaba.cloud.commons.lang.StringUtils;
import com.pichub.jwt.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpCookie;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.net.URI;
import java.util.List;

@Component
public class AuthorFilter implements GlobalFilter, Ordered {

    private final JwtUtil jwtUtil;

    // 构造器注入
    public AuthorFilter(JwtUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        String path = request.getPath().toString();

        // 跳过不需要鉴权的路径
        if (path.startsWith("/login")) {
            return chain.filter(exchange);
        }

        // 1. 从Cookie获取Token
        String token = null;
        List<HttpCookie> cookies = request.getCookies().get("token");
        if (cookies != null && !cookies.isEmpty()) {
            token = cookies.get(0).getValue(); // 获取第一个 Cookie 的值
        }

        // 2. 验证Token
        if (token == null || !jwtUtil.validateToken(token)) {
            ServerHttpResponse response = exchange.getResponse();

            // 设置重定向状态码和位置
            response.setStatusCode(HttpStatus.SEE_OTHER);
            response.getHeaders().setLocation(URI.create("http://localhost/login/page"));

            return response.setComplete();
        }

        // 3. 放行请求
        return chain.filter(exchange);

    }

    @Override
    public int getOrder() {
        return 0;
    }
}
