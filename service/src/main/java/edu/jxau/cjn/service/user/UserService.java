package edu.jxau.cjn.service.user;

import edu.jxau.cjn.infrastructure.entity.Role;
import edu.jxau.cjn.infrastructure.entity.User;
import edu.jxau.cjn.infrastructure.repositories.RoleRepository;
import edu.jxau.cjn.infrastructure.repositories.UserRepository;
import edu.jxau.cjn.service.utils.EncryptUtil;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    public User getUserByUserName(String user){
        return userRepository.findUserByNickName(user);
    }

    public boolean register(User user){
        String salt = EncryptUtil.generateSalt(16);
        user.setSalt(salt);
        user.setPassword(Hex.encodeHexString(EncryptUtil.Sha1(salt.getBytes(), user.getPassword().getBytes(), 1024)));
        Role role = roleRepository.findByPresetIsTrue();
        user.setRole(role);
        userRepository.save(user);
        return false;
    }

}
