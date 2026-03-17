package com.rt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.dao.LoginDao;
import com.rt.Login.Login;

@Service
public class LoginService {

    @Autowired
    LoginDao loginDao;

    public boolean loginUser(Login login) {
        return loginDao.validateUser(
                login.getUsername(),
                login.getPassword()
        ) != null;
    }
}
