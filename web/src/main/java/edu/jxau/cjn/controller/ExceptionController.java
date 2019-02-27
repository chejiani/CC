package edu.jxau.cjn.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ExceptionController implements ErrorController {

    @GetMapping(value = "404")
    public String e404(){
        return "404";
    }

    @GetMapping(value = "500")
    @ExceptionHandler(value = Exception.class)
    public String e500(){
        return "500";
    }

    @GetMapping(value = "error")
    public String handleError(HttpServletRequest request){
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        if(statusCode == 404){
            return "404";
        }else {
            return "500";
        }

    }
    @Override
    public String getErrorPath() {
        return "/error";
    }

}
