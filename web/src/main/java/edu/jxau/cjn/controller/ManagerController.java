package edu.jxau.cjn.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.infrastructure.entity.Order;
import edu.jxau.cjn.service.goods.GoodsService;
import edu.jxau.cjn.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping(value = "manager")
public class ManagerController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping(value = {"index", ""})
    public String dashboard(){
        return "dashboard/goods-list";
    }

    @GetMapping(value = "add/goods")
    public String addGoods(Model model){
        model.addAttribute("goods", new Goods());
        return "dashboard/add-goods";
    }

    @GetMapping(value = "edit/goods/{id}")
    public String editGoods(@PathVariable(value = "id") long id, Model model){
        Goods goods = goodsService.getOne(id);
        model.addAttribute("goods", goods);
        if (goods.getAlbum() != null){
            try {
                model.addAttribute("albums", objectMapper.readValue(goods.getAlbum().getPicAddr(), List.class));
            } catch (IOException e) {
                model.addAttribute("albums", null);
            }
        }
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

    @PostMapping(value = "del/goods/{id}")
    @ResponseBody
    public boolean del(@PathVariable(value = "id") long id){
        return goodsService.obtained(id);
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

}
