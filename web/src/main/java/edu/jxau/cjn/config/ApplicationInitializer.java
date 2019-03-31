package edu.jxau.cjn.config;

import edu.jxau.cjn.infrastructure.entity.Role;
import edu.jxau.cjn.infrastructure.entity.User;
import edu.jxau.cjn.infrastructure.repositories.UserRepository;
import edu.jxau.cjn.service.Log;
import edu.jxau.cjn.service.user.UserService;
import edu.jxau.cjn.service.utils.EncryptUtil;
import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * 运用初始化启动器，初始化运用运行必选参数，目前主要初始化用户角色信息
 * @author jiani che
 * @version 1.0.0
 */
@Component
public class ApplicationInitializer implements CommandLineRunner, Log {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void run(String... args) {
        Role role = userService.getPresetRole();
        if (role == null){
            warn("当前无预置角色，添加默认角色消息：name=[{}]", "admin");
            role = new Role();
            role.setPreset(false);
            role.setName("admin");
            role.setDescription("默认管理员角色");
            userService.addRole(role);

            User user = new User();
            String salt = EncryptUtil.generateSalt(16);
            user.setSalt(Hex.encodeHexString(salt.getBytes()));
            user.setRole(role);
            user.setEmail("123@mail.com");
            user.setNickName("admin");
            user.setPassword("1234567890");
            user.setMobile("000000000");
            user.setPassword(Hex.encodeHexString(EncryptUtil.Sha1(salt.getBytes(), user.getPassword().getBytes(), 0)));
            userRepository.save(user);

            role = new Role();
            role.setPreset(true);
            role.setName("user");
            role.setDescription("默认普通用户");
            userService.addRole(role);
        }
    }
}
