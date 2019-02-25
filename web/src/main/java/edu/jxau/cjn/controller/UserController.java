package edu.jxau.cjn.controller;

import edu.jxau.cjn.infrastructure.entity.Role;
import edu.jxau.cjn.infrastructure.entity.User;
import edu.jxau.cjn.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.Serializable;

@Controller
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "login")
    public String login(){
        return "user/login";
    }

    @GetMapping(value = "register")
    public String register(){
        return "user/register";
    }

    @PostMapping(value = "register")
    public String register(User user){
        if (userService.register(user)){
            return "redirect:/index";
        } else {
            throw new RuntimeException("用户注册失败");
        }
    }

    @GetMapping(value = "forget")
    public String forget(){
        return "forget";
    }

    @GetMapping(value = "manage/list/user")
    public String userList(){
        return "dashboard/user-list";
    }

    @GetMapping(value = "manager/list/role")
    public String roleList(){
        return "dashboard/role-list";
    }

    @PostMapping(value = "manager/add/role")
    public Result addRole(Role role){
        return new Result();
    }

    @GetMapping(value = "manager/add/role")
    public String addRole(){
        return "dashboard/add-role";
    }

}