package edu.jxau.cjn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.Serializable;

@Controller
@RequestMapping(value = "user")
public class UserController {

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

        public static final long serialVersionUID =  0L;

        /* private String userName;
        private String password;
        private String phone; */
    }

}