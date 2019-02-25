package edu.jxau.cjn.controller;

import edu.jxau.cjn.service.order.BidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "bid")
public class BidController {

    @Autowired
    private BidService bidService;

    @GetMapping(value = "{goods}/{price}")
    public Result bid(@PathVariable(value = "goods") long goods,
                    @PathVariable(value = "price") double price) {
        if (bidService.bid(goods, price)){
            return new Result(200);
        } else {
            return new Result(500);
        }

    }

}
