package edu.jxau.cjn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExceptionController {

    @GetMapping(value = "404")
    public String e404(){
        return "404";
    }

    @GetMapping(value = "503")
    public String e503(){
        return "503";
    }

}
