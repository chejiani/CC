package edu.jxau.cjn.controller;

import org.apache.http.HttpResponse;
import org.apache.http.entity.StringEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HomeController {

    private static Logger logger = LoggerFactory.getLogger(HomeController.class);

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

    @PostMapping(value = "put")
    public void put(HttpServletRequest request, HttpServletResponse response){
        try {
            Thread.sleep(4000);
            response.getOutputStream().print("12345678iu,jhmgfvcsawq234565jyr");
        } catch (Exception e){
            e.printStackTrace();
        }
    }

}
