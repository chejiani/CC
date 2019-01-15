package com.ccut.ytzhuang.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeAction {

    @GetMapping(value = "index")
    public String index(){
        return "index";
    }

}
