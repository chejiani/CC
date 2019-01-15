package com.ccut.ytzhuang.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ccut.ytzhuang.model.User;
import com.ccut.ytzhuang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "user")
public class UserAction {

    private User user = new User();
    private static final long serialVersionUID = 2495498540796769368L;

    @Autowired
    private UserService userServiceImpl;
    private String userid;
    private String nick_name;


    public String getUserid() {
        return userid;
    }

    public void setUserid(String user_Id) {
        this.userid = user_Id;
    }

    public String getNick_name() {
        return nick_name;
    }

    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
    }


    public UserAction() {
        System.out.println("UserAction构造方法被执行");
    }

    //用户登录
    @PostMapping(value = "login")
    public String login(HttpServletRequest request) throws Exception {
        if (user.getNickName().equals("") || user.getNickName() == null) {
            //this.addFieldError("username_error", "用户名不能为空！");
            return "User_login_failure";
        }
        if (userServiceImpl.userLogin(user)) {
            System.out.println(user.getUserId());
            user = userServiceImpl.getUserByid(user.getUserId());
            request.getSession().setAttribute("user", user);
            System.out.println("登陆者信息：" + request.getSession().getAttribute("user"));
            System.out.println("登录成功");
            return "User_login_success";
        } else {
            return "User_login_failure";
        }
    }

    //学生注册
    @PostMapping(value = "register")
    public String register(Model model) throws Exception {
        if (user.getNickName().equals("") || user.getNickName() == null) {
            System.out.println("用户名不能为空！");
            //this.addFieldError("register_error", "用户名不能为空！");
            return "User_register_failure";
        }
        if (userServiceImpl.getUserByid(user.getUserId()) != null) {
            System.out.println("该学号已经被注册");
            //this.addFieldError("register_error", "该学号已经被注册！");
            return "User_register_failure";
        }
        if (userServiceImpl.add(user)) {
            System.out.println("注册成功");
            return "User_register_success";
        } else {
            System.out.println("注册失败");
            return "User_register_failure";

        }
    }

    //查询所有学生资料
    @GetMapping(value = "query")
    public String query(HttpServletRequest request) {
        List<User> list = userServiceImpl.getAllUser();
        request.getSession().setAttribute("user_list", list);
        return "Students_query_success";

    }

    //修改学生资料
    @PostMapping(value = "modify")
    public String modify(HttpServletRequest request) {
        User user = userServiceImpl.getUserByid(userid);
        if (user.getUserId() != null) {
            request.getSession().setAttribute("mod_user", user);
            return "User_modify_success";
        } else {
            return "User_modify_failure";
        }
    }

    //保存修改后的学生资料
    @PostMapping(value = "save")
    public String save() {
        System.out.println(userid);
        user.setUserId(userid);
        if (userServiceImpl.save(user)) {
            System.out.println("修改成功");
            return "User_save_success";
        } else {
            System.out.println("修改失败");
            return "User_save_failure";
        }
    }

    //删除学生资料
    @PostMapping(value = "delete")
    public String delete() {
        if (userServiceImpl.delete(userid)) {
            return "User_delete_success";
        } else {
            return "User_delete_failure";
        }
    }

}
