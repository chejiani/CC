package com.ccut.ytzhuang.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ccut.ytzhuang.model.User;
import com.ccut.ytzhuang.service.UserService;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "user")
public class UserControl {

    @Autowired
    private UserService userService;

    @GetMapping(value = "login")
    public String login(){
        return "login";
    }

    @GetMapping(value = "register")
    public String register(){
        return "register";
    }

    @PostMapping(value = "login")
    public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
        model.addAttribute("fail", "用户名或密码错误");
        return "login";
    }

    @PostMapping(value = "register")
    public String register(User user, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("username", user.getNickName());
        return "redirect:/user/login";
    }

    //查询所有学生资料
    @GetMapping(value = "query")
    public String query(HttpServletRequest request) {
        List<User> list = userService.getAllUser();
        request.getSession().setAttribute("user_list", list);
        return "Students_query_success";

    }

    @GetMapping(value = "modify")
    public String modify(String id, Model model){
        model.addAttribute("user", userService.getUserByid(id));
        return "/user/edit";
    }

    //修改学生资料
    @PostMapping(value = "modify")
    public String modify(User user) {
        //userService
        return "";
    }

    //删除学生资料
    @PostMapping(value = "delete")
    public String delete(String id) {
        if (userService.delete(id)) {
            return "User_delete_success";
        } else {
            return "User_delete_failure";
        }
    }

}
