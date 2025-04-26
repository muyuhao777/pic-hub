package com.pichub.login.controller;

import com.pichub.login.bean.User;
import com.pichub.login.service.LoginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/login")
@RestController
public class AuthorController {

    @Autowired
    LoginService loginService;

    @GetMapping("/author/{uId}/{uPwd}")
    public User CheckAuthor(@PathVariable String uId, @PathVariable String uPwd) {
        // 返回登录页面的视图名称（将通过视图解析器解析为实际的JSP文件）

        User user = new User();
        user.setUId(Integer.valueOf(uId));
        user.setUPwd(uPwd);
        user.setIsDelete(0);

        // 调用服务层方法
        User loggedInUser = loginService.getUser(user);

        if(loggedInUser != null) {
            return loggedInUser;
        } else {
            // 登录失败，返回登录页面
            return null;
        }
    }

}
