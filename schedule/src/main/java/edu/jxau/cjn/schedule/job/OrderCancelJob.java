package edu.jxau.cjn.schedule.job;

import com.dangdang.ddframe.job.api.ShardingContext;
import com.dangdang.ddframe.job.api.simple.SimpleJob;
import edu.jxau.cjn.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 订单取消作业，取消的订单为超时未支付，
 * @author jiani che
 * @version 1.0.0
 */
public class OrderCancelJob implements SimpleJob {

    @Autowired
    private OrderService orderService;

    @Override
    public void execute(ShardingContext shardingContext) {
        orderService.cancelOrder();
    }

}
