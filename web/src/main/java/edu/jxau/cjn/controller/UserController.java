package edu.jxau.cjn.controller;

import edu.jxau.cjn.infrastructure.entity.Role;
import edu.jxau.cjn.infrastructure.entity.User;
import edu.jxau.cjn.service.DataDuplicateException;
import edu.jxau.cjn.service.user.UserService;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "login")
    public String login(HttpServletRequest request, HttpServletResponse response) {
        if (isAjax(request)) {
            HttpServletResponse httpServletResponse = WebUtils.toHttp(response);
            httpServletResponse.addHeader("REQUIRE_AUTH", "true");
            httpServletResponse.setStatus(HttpStatus.UNAUTHORIZED.value());
        }
        return "user/login";
    }

    @PostMapping(value = "login")
    public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
        model.addAttribute("fail", "用户名或密码错误");
        return "user/login";
    }


    @GetMapping(value = "available/{username}")
    @ResponseBody
    public boolean available(@PathVariable(value = "username") String username) {
        User user = userService.getUserByUserName(username);
        return user == null;
    }

    @GetMapping(value = "register")
    public String register() {
        return "user/register";
    }

    @PostMapping(value = "register")
    public String register(User user, boolean agree) {
        if (agree && userService.register(user)) {
            return "redirect:/user/login";
        } else {
            throw new RuntimeException("用户注册失败");
        }
    }

    @GetMapping(value = "forget")
    public String forget() {
        return "forget";
    }

    @GetMapping(value = "manage/list/user")
    public String userList() {
        return "dashboard/user-list";
    }

    @GetMapping(value = "manage/list/user/data")
    @ResponseBody
    public List<User> getUserList() {
        return userService.getUserWithPagination(PageRequest.of(0, 10)).getContent();
    }

    @GetMapping(value = "manager/list/role")
    public String roleList() {
        return "dashboard/role-list";
    }

    @GetMapping(value = "manager/list/role/data")
    @ResponseBody
    public List<Role> getRoleList() {
        return userService.getRoleWithPagination(PageRequest.of(0, 10)).getContent();
    }

    @PostMapping(value = "manager/add/role")
    public String addRole(Role role) {
        try {
            if (userService.addRole(role)) {
                return "redirect:/user/manager/list/role";
            } else {
                return "redirect:/500";
            }
        } catch (DataDuplicateException e) {
            return "redirect:/user/manager/list/role";
        }
    }

    @GetMapping(value = "manager/add/role")
    public String addRole() {
        return "dashboard/add-role";
    }

    private boolean isAjax(HttpServletRequest request) {
        String requestedWithHeader = request.getHeader("X-Requested-With");
        return "XMLHttpRequest".equals(requestedWithHeader);
    }

}