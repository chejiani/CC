package edu.jxau.cjn.service.user;

import edu.jxau.cjn.infrastructure.entity.Role;
import edu.jxau.cjn.infrastructure.entity.User;
import edu.jxau.cjn.infrastructure.repositories.RoleRepository;
import edu.jxau.cjn.infrastructure.repositories.UserRepository;
import edu.jxau.cjn.service.DataDuplicateException;
import edu.jxau.cjn.service.Log;
import edu.jxau.cjn.service.utils.EncryptUtil;
import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class UserService implements Log {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    public User getUserByUserName(String user){
        return userRepository.findUserByNickName(user);
    }

    public boolean register(User user){
        String salt = EncryptUtil.generateSalt(16);
        user.setSalt(Hex.encodeHexString(salt.getBytes()));
        user.setPassword(Hex.encodeHexString(EncryptUtil.Sha1(salt.getBytes(), user.getPassword().getBytes(), 0)));
        Role role = getPresetRole();
        user.setRole(role);
        return null != userRepository.save(user);
    }

    public Role getPresetRole(){
        return roleRepository.findByPresetIsTrue();
    }

    public boolean addRole(Role role){
        if (null == roleRepository.findByName(role.getName())){
            if (null == roleRepository.findByPresetIsTrue()){
                role.setPreset(true);
            }
            if (null != roleRepository.save(role)){
                return true;
            } else {
                error("数据保存失败", null);
                return false;
            }
        } else {
            debug("保存的数据已经存在");
            throw new DataDuplicateException();
        }
    }

    public Page<User> getUserWithPagination(Pageable pageable){
        return userRepository.findAll(pageable);
    }

    public Page<Role> getRoleWithPagination(Pageable pageable){
        return roleRepository.findAll(pageable);
    }

}
