package edu.jxau.cjn.controller;

import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.service.goods.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HomeController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping(value = {"index", "/"})
    public String index(Model model){
        model.addAttribute("goodsList", goodsService.getAlL());
        return "index";
    }

    @GetMapping(value = "search/{keyWords}")
    public String search(@PathVariable(name = "keyWords") String keyWords){
        return "goods/search";
    }

    @GetMapping(value = "details/{id}")
    public String detail(@PathVariable(value = "id") String id, Model model){
        Goods goods = goodsService.getOne(Long.valueOf(id));
        if (goods == null){
             return "redirect:404";
        } else {
            model.addAttribute("goods", goodsService.getOne(Long.valueOf(id)));
            return "goods/detail";
        }
    }

}
