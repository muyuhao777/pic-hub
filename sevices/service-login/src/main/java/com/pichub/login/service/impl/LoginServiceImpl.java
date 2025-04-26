package com.pichub.login.service.impl;

import com.pichub.login.bean.User;
import com.pichub.login.service.LoginService;
import com.pichub.login.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoginServiceImpl implements LoginService {

    //    @Autowired
    private final LoginRepository loginRepository;

    @Autowired
    public LoginServiceImpl(LoginRepository loginRepository) {
        this.loginRepository = loginRepository;
    }

    public User getUser(User user) {
        return loginRepository.findByUIdAndUPwd(user.getUId(), user.getUPwd());
    }

}
