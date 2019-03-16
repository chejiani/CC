package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

import java.util.Date;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long>, QueryByExampleExecutor<Order> {

    /**
     * 查询所有订单支付截至日期在指定日期之前，并且状态为给定状态的订单
     * @param status 订单状态，#{@link edu.jxau.cjn.infrastructure.entity.OrderStatus }
     * @param date 日期
     * @return 满足条件的所有订单
     */
    List<Order> findByOrderStatusEqualsAndPayDeadlineIsBefore(int status, Date date);

}
