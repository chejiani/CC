package edu.jxau.cjn.controller;

import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.infrastructure.entity.Order;
import edu.jxau.cjn.service.goods.GoodsService;
import edu.jxau.cjn.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "order")
public class OrderController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderService orderService;

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


    @GetMapping(value = "/manager/list/order")
    public String orderList(){
        return "dashboard/order-list";
    }

    @GetMapping(value = "/manager/list/order/data")
    @ResponseBody
    public List<Order> getOrderList(){
        return orderService.getGoodsWithPagination(PageRequest.of(0, 10)).getContent();
    }

    @PostMapping(value = "manager/update/order")
    @ResponseBody
    public boolean update(Order order){
        return orderService.update(order);
    }

}
