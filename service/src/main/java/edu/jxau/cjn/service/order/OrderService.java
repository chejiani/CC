package edu.jxau.cjn.service.order;

import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.infrastructure.entity.Order;
import edu.jxau.cjn.infrastructure.entity.OrderStatus;
import edu.jxau.cjn.infrastructure.repositories.GoodsRepository;
import edu.jxau.cjn.infrastructure.repositories.OrderRepository;
import edu.jxau.cjn.service.Log;
import jdk.nashorn.internal.ir.annotations.Ignore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class OrderService implements Log {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private GoodsRepository goodsRepository;

    public void cancelOrder() {
        List<Order> orders = orderRepository.findByOrderStatusEqualsAndPayDeadlineIsBefore(OrderStatus.WAIT_PAY.getCode(), new Date());
        if (orders != null && orders.size() > 0){
            orders.forEach(item -> {
                item.setOrderStatus(OrderStatus.CLOSE.getCode());
                orderRepository.save(item);
            });
        }
    }

    public void createOrder(Order order, long goodsId, long userId){
        Goods goods =  goodsRepository.findById(goodsId).orElse(null);
        if (goods == null || goods.getStock() <= 0){
            warn("订单创建失败");
            throw new RuntimeException("商品不存在或者已经下架");
        }
        order.setGoods(goods);
        orderRepository.save(order);
        goods.setStock(goods.getStock() - order.getQuantity());
        goods.setObtained(goods.getStock() <= 0);
        goodsRepository.save(goods);
    }

}
