package edu.jxau.cjn.controller;

import edu.jxau.cjn.config.security.ShiroUser;
import edu.jxau.cjn.infrastructure.entity.Address;
import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.infrastructure.entity.Order;
import edu.jxau.cjn.service.goods.GoodsService;
import edu.jxau.cjn.service.order.OrderService;
import org.apache.shiro.SecurityUtils;
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

    @GetMapping(value = "list")
    public String list() {
        return "order/list";
    }

    @GetMapping(value = "create/{goodsId}")
    public String createOrder(@PathVariable(value = "goodsId") String goodsId, Model model) {
        Goods goods = goodsService.getOne(Long.valueOf(goodsId));
        if (goods == null) {
            return "redirect:404";
        } else {
            model.addAttribute("goods", goodsService.getOne(Long.valueOf(goodsId)));
            return "order/create";
        }
    }

    @PostMapping(value = "create")
    public String createOrder(Order order, Address address, long goodsId) {
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        orderService.createOrder(order, address, goodsId, Long.parseLong(shiroUser.id));
        return "order/pay";
    }

    @GetMapping(value = "oper/{id}/{code}")
    @ResponseBody
    public boolean oper(@PathVariable(value = "code") int code,
                        @PathVariable(value = "id") long id) {
        if (1 == code) {
            return true;
        }
        if (2 == code) {
            try {
                orderService.cancelOrder(id);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    @GetMapping(value = "/manager/list/order")
    public String orderList() {
        return "dashboard/order-list";
    }

    @GetMapping(value = "/manager/list/order/data")
    @ResponseBody
    public List<Order> getOrderList() {
        return orderService.getGoodsWithPagination(PageRequest.of(0, 10)).getContent();
    }

    @GetMapping(value = "list/data")
    @ResponseBody
    public List<Order> getOrderListForUser() {
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return orderService.findUsersOrder(Long.parseLong(shiroUser.id));
    }

    @PostMapping(value = "manager/update/order")
    @ResponseBody
    public boolean update(Order order) {
        return orderService.update(order);
    }

    @GetMapping(value = "supplement/{order}")
    public String supplementorderInfo(@PathVariable(value = "order") long order, Model model) {
        Order orderModel = orderService.getOne(order);
        if (orderModel == null){
            throw new IllegalArgumentException("订单不存在");
        }
        model.addAttribute("order", orderModel);
        return "order/supplementOrderInfo";
    }

    @PostMapping(value = "supplement")
    public String saveSupplement(Address address, long order) {
        orderService.supplement(address, order);
        return "order/pay";
    }

}
