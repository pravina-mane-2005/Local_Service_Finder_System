package com.rt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rt.dao.UserDao;


import com.rt.Login.User;

@Service
public class UserService {

    @Autowired
   UserDao userDao;
    
    public boolean saveUser(User user) {
    	 return userDao.saveUser(user); 
    }

	public User loginUser(String email, String password) {
    return userDao.loginUser(email,password);
	}
}
