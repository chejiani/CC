package edu.jxau.cjn.controller;

import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.service.goods.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "manager")
public class ManagerController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping(value = {"index", ""})
    public String dashboard(){
        return "dashboard/index";
    }

    @GetMapping(value = "add/goods")
    public String addGoods(){
        return "dashboard/add-goods";
    }

    @PostMapping(value = "add/goods")
    public String addGoods(Goods goods, String[] pics){
        if (goodsService.save(goods, pics)){
            return "redirect:/manager/list/goods";
        } else {
            return "500";
        }
    }

    @GetMapping(value = "list/goods")
    public String goodsList(){
        return "dashboard/goods-list";
    }

    @GetMapping(value = "list/goods/data")
    @ResponseBody
    public List<Goods> getGoodsList(){
        return goodsService.getGoodsWithPagination(PageRequest.of(0, 10)).getContent();
    }

    @GetMapping(value = "list/order")
    public String orderList(){
        return "dashboard/order-list";
    }

}