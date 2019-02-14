package edu.jxau.cjn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class HomeController {

    @GetMapping(value = "index")
    public String index(){
        return "index";
    }

    @GetMapping(value = "search/{keyWords}")
    public String search(@PathVariable(name = "keyWords") String keyWords){
        return "goods/search";
    }

    @GetMapping(value = "details/{id}")
    public String detail(@PathVariable(value = "id") String id){
        return "goods/detail";
    }

}
