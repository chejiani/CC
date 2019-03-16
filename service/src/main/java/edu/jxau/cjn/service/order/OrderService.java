package edu.jxau.cjn.service.order;

import edu.jxau.cjn.infrastructure.entity.Order;
import edu.jxau.cjn.infrastructure.entity.OrderStatus;
import edu.jxau.cjn.infrastructure.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    public void cancelOrder() {
        List<Order> orders = orderRepository.findByOrderStatusEqualsAndPayDeadlineIsBefore(OrderStatus.WAIT_PAY.getCode(), new Date());
        if (orders != null && orders.size() > 0){
            orders.stream().forEach(item -> {
                item.setOrderStatus(OrderStatus.CLOSE.getCode());
                orderRepository.save(item);
            });
        }
    }

}
