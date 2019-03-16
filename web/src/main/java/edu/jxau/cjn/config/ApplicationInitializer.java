package edu.jxau.cjn.config;

import edu.jxau.cjn.infrastructure.entity.Role;
import edu.jxau.cjn.service.Log;
import edu.jxau.cjn.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * 运用初始化启动器，初始化运用运行必选参数，目前主要初始化用户角色信息
 */
@Component
public class ApplicationInitializer implements CommandLineRunner, Log {

    @Autowired
    private UserService userService;

    @Override
    public void run(String... args) {
        Role role = userService.getPresetRole();
        if (role == null){
            warn("当前无预置角色，添加默认角色消息：name=[{}]", "admin");
            role = new Role();
            role.setPreset(true);
            role.setName("admin");
            role.setDescription("默认管理员角色");
            userService.addRole(role);
        }
    }
}
