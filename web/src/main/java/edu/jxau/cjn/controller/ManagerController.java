package edu.jxau.cjn.controller;

import edu.jxau.cjn.service.GoodsService;
import edu.jxau.cjn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "manager")
public class ManagerController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private UserService userService;

    @GetMapping(value = "index")
    public String dashboard(){
        return "dashboard";
    }

    @GetMapping(value = "list")
    public String listGoods(){
        return "list";
    }

}
