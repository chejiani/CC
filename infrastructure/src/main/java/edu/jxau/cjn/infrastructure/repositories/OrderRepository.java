package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Order;
import edu.jxau.cjn.infrastructure.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

import java.util.Date;
import java.util.List;

/**
 * 订单数据库访问对象
 * @author jiani che
 * @version 1.0.0
 */
public interface OrderRepository extends JpaRepository<Order, Long>, QueryByExampleExecutor<Order> {

    /**
     * 查询所有订单支付截至日期在指定日期之前，并且状态为给定状态的订单
     * @param status 订单状态，#{@link edu.jxau.cjn.infrastructure.entity.OrderStatus }
     * @param date 日期
     * @return 满足条件的所有订单
     */
    List<Order> findByOrderStatusEqualsAndPayDeadlineIsBefore(int status, Date date);

    /**
     * 查询用户的订单
     * @param user 用户id
     * @return 用户的订单
     */
    List<Order> findByUserIs(User user);

}
