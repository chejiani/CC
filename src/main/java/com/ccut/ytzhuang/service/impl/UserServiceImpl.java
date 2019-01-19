package com.ccut.ytzhuang.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ccut.ytzhuang.repositories.UserDao;
import com.ccut.ytzhuang.model.User;
import com.ccut.ytzhuang.service.UserService;

@Component("userService")
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public List<User> getAllUser() {
        return userDao.findAll();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean delete(String user_id) {
        userDao.deleteById(Integer.valueOf(user_id));
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean add(User user) {
        userDao.save(user);
        return true;
    }

    @Override
    public User getUserByid(String user_id) {
        return userDao.findUserByUserId(user_id);
    }

    @Override
    public boolean userLogin(User user) {
        return true;
    }

}
