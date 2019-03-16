package edu.jxau.cjn.controller;

import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.infrastructure.entity.Order;
import edu.jxau.cjn.service.goods.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "order")
public class OrderController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping(value = "list/{user}")
    public String list(@PathVariable(value = "user") String user) {
        return "order/list";
    }

    @GetMapping(value = "create/{goodsId}")
    public String createOrder(@PathVariable(value = "goodsId") String goodsId, Model model){
        Goods goods = goodsService.getOne(Long.valueOf(goodsId));
        if (goods == null){
            return "redirect:404";
        } else {
            model.addAttribute("goods", goodsService.getOne(Long.valueOf(goodsId)));
            return "order/create";
        }
    }

    @PostMapping(value = "create")
    public String createOrder(Order order){
        return "order/pay";
    }

}
