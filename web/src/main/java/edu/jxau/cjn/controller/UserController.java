package edu.jxau.cjn.controller;

import edu.jxau.cjn.service.UserService;
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
        return "redirect:/index";
    }

    @GetMapping(value = "forget")
    public String forget(){
        return "forget";
    }

    private class User implements Serializable {
        private String userName;
        private String password;
        private String phone;
    }

}