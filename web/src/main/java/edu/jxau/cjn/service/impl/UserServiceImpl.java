package edu.jxau.cjn.service.impl;

import java.util.List;

import edu.jxau.cjn.model.User;
import edu.jxau.cjn.repositories.UserDao;
import edu.jxau.cjn.service.UserService;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
