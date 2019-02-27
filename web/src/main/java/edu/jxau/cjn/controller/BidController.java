package edu.jxau.cjn.controller;

import edu.jxau.cjn.config.security.ShiroUser;
import edu.jxau.cjn.service.order.BidService;
import edu.jxau.cjn.service.user.UserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "bid")
public class BidController {

    @Autowired
    private BidService bidService;

    @Autowired
    private UserService userService;

    @GetMapping(value = "{goods}/{price}")
    @ResponseBody
    public Result bid(@PathVariable(value = "goods") long goods,
                    @PathVariable(value = "price") double price) {
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        if (bidService.bid(goods, userService.getUserByUserName(shiroUser.loginName), price)){
            return new Result(200);
        } else {
            return new Result(500);
        }

    }

}