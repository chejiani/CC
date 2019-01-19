package com.ccut.ytzhuang.action;

import com.ccut.ytzhuang.model.Admin;

import com.ccut.ytzhuang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "admin")
public class AdminAction {

    private Admin admin = new Admin();

    @Autowired
    private AdminService adminServiceImpl;

    @RequestMapping(value = "login")
    public String login() throws Exception {

        if (admin.getAdminName().equals("") || admin.getAdminName() == null) {
            //this.addFieldError("username_error", "用户名不能为空！");
            return "input";
        }

        if (adminServiceImpl.adminLogin(admin)) {
            System.out.println("登录成功");
            return "success";
        } else {
            return "failure";
        }
    }

}
