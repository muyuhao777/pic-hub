package com.pichub.login.controller;

import com.pichub.login.bean.User;
import com.pichub.login.repository.LoginRepository;
import com.pichub.login.service.LoginService;
import com.pichub.jwt.JwtUtil;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RequestMapping("/login")
@Controller
public class LoginController {

    @Autowired
    LoginService loginService;

    @Autowired
    LoginRepository loginRepository;

    private final JwtUtil jwtUtil;

    // 让 Spring 注入 JwtUtil
    public LoginController(JwtUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    @RequestMapping ("/page")
    public String showLoginForm() {
        // 返回登录页面的视图名称（将通过视图解析器解析为实际的JSP文件）
        return "login"; // 假设有一个名为login.jsp的页面在正确的视图目录下
    }

    @RequestMapping ("/getc")
    @ResponseBody
    public Integer getPicNum(@RequestParam("u_id") Integer uId) {
//        try {
//            TimeUnit.SECONDS.sleep(2);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        return loginRepository.getCountById(uId);
    }

    @RequestMapping ("/addc")
    @ResponseBody
    public boolean addPicNum(@RequestParam("u_id") Integer uId, @RequestParam("pic_num") Integer picNum) {
//        try {
//            TimeUnit.SECONDS.sleep(10);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        loginRepository.setCountByIdAndPicNum(uId, picNum);
        return true;
    }

    @ResponseBody
    @PostMapping("/page")
    public ResponseEntity<?> login(@RequestParam("u_id") String uId, @RequestParam("u_pwd") String uPwd, HttpServletResponse response){
        User user = new User();
        user.setUId(Integer.valueOf(uId));
        user.setUPwd(uPwd);
        user.setIsDelete(0);

        // 调用服务层方法
        User loggedInUser = loginService.getUser(user);

        if (loggedInUser != null) {

            // 2. 生成JWT Token
            String token = jwtUtil.generateToken(loggedInUser.getName());

            // 3. 返回Token
            Cookie cookie = new Cookie("token", token);
            cookie.setHttpOnly(true);  // 防止XSS
            cookie.setSecure(true);    // 仅HTTPS
            cookie.setPath("/");
            cookie.setDomain("localhost");
            response.addCookie(cookie);
            String redirectUrl = "http://localhost/pic/search"; // 网关代理的地址
            try {
                response.sendRedirect(redirectUrl); // 返回302重定向
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return null; // 不再需要ResponseEntity
        } else {
            // 登录失败，返回登录页面
            String redirectUrl = "http://localhost/login/page"; // 网关代理的地址
            try {
                response.sendRedirect(redirectUrl); // 返回302重定向
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return null; // 不再需要ResponseEntity
        }
    }

//    @PostMapping("/")
//    public String login(@RequestParam("u_id") String uId, @RequestParam("u_pwd") String uPwd, HttpSession session){
//        User user = new User();
//        user.setUId(Integer.valueOf(uId));
//        user.setUPwd(uPwd);
//        user.setIsDelete(0);
//
//        // 调用服务层方法
//        User loggedInUser = loginService.getUser(user);
//
//        if (loggedInUser != null) {
//            // 登录成功，将用户信息存入 Session
//            session.setAttribute("user", loggedInUser);
//            return "redirect:/demo.jsp"; // 重定向到 demo.jsp
//        } else {
//            // 登录失败，返回登录页面
//            return "redirect:/login.jsp";
//        }
//    }

}
