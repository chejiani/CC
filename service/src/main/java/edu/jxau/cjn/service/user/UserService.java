package edu.jxau.cjn.service.user;

import edu.jxau.cjn.infrastructure.entity.User;
import edu.jxau.cjn.infrastructure.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User getUserByUserName(String user){
        return userRepository.findUserByNickName(user);
    }

}
