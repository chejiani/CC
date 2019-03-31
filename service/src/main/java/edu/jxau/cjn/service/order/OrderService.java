package edu.jxau.cjn.service.order;

import edu.jxau.cjn.infrastructure.entity.*;
import edu.jxau.cjn.infrastructure.repositories.AddressRepository;
import edu.jxau.cjn.infrastructure.repositories.GoodsRepository;
import edu.jxau.cjn.infrastructure.repositories.OrderRepository;
import edu.jxau.cjn.infrastructure.repositories.UserRepository;
import edu.jxau.cjn.service.Log;
import jdk.nashorn.internal.ir.annotations.Ignore;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Service
public class OrderService implements Log {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private GoodsRepository goodsRepository;

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JavaMailSender mailSender;

    private ExecutorService service = Executors.newFixedThreadPool(10);

    public void cancelOrder() {
        List<Order> orders = orderRepository.findByOrderStatusEqualsAndPayDeadlineIsBefore(OrderStatus.WAIT_PAY.getCode(), new Date());
        if (orders != null && orders.size() > 0){
            orders.forEach(item -> {
                item.setOrderStatus(OrderStatus.CLOSE.getCode());
                orderRepository.save(item);
            });
        }
    }

    public void cancelOrder(long orderId) {
        Optional<Order> orderOptional = orderRepository.findById(orderId);
        if (orderOptional.isPresent()){
            Order order = orderOptional.get();
            order.setOrderStatus(OrderStatus.CANCEL.getCode());
            orderRepository.save(order);
        } else {
            throw new RuntimeException("order is not exist");
        }
    }

    public Page<Order> getGoodsWithPagination(Pageable pageable){
        return orderRepository.findAll(pageable);
    }

    public boolean update(Order order){
        order = orderRepository.save(order);
        return order != null;
    }

    public List<Order> findUsersOrder(long id){
        Optional<User> userOptional = userRepository.findById(id);
        if (userOptional.isPresent()){
            return orderRepository.findByUserIs(userOptional.get());
        } else {
            return Collections.emptyList();
        }
    }

    public void createOrder(Order order, long goodsId, long userId){
        Goods goods =  goodsRepository.findById(goodsId).orElse(null);
        if (goods == null || goods.getStock() <= 0){
            warn("订单创建失败");
            throw new RuntimeException("商品不存在或者已经下架");
        }
        Optional<User> userOptional = userRepository.findById(userId);
        if (userOptional.isPresent()){
            User user = userOptional.get();
            order.setGoods(goods);
            order.setUser(user);
            order.setUnitPrice(goods.getFixedPrice());
            order.setQuantity(1);
            order.setTotalPrice(goods.getFixedPrice());
            order.setOrderNo(UUID.randomUUID().toString());
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.DATE, 1);
            order.setPayDeadline(calendar.getTime());
            orderRepository.save(order);
            goods.setStock(goods.getStock() - order.getQuantity());
            goods.setObtained(goods.getStock() <= 0);
            goodsRepository.save(goods);
            if (StringUtils.isNotBlank(user.getEmail())){
                service.execute(new Sender(user, goods));
            }
        } else {
            throw new RuntimeException("用户不存在");
        }
    }

    public void createOrder(Order order, Address address, long goodsId, long userId){
        Optional<User> userOptional = userRepository.findById(userId);
        if (userOptional.isPresent()){
            address.setUser(userOptional.get());
        } else {
            throw new RuntimeException("用户不存在");
        }
        address = addressRepository.save(address);
        order.setAddress(address);
        order.setPayDate(new Date());
        createOrder(order, goodsId, userId);
    }

    private class Sender implements Runnable {

        private User user;
        private Goods goods;

        public Sender(User user, Goods goods) {
            this.user = user;
            this.goods = goods;
        }

        @Override
        public void run() {
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setFrom("2364672979@qq.com");
            mailMessage.setTo(user.getEmail());
            mailMessage.setSubject("订单创建成功通知");
            mailMessage.setText("尊敬的"+ user.getNickName()+"您好，你购买的"+goods.getGoodsName() + "已成功创建订单");
            mailSender.send(mailMessage);
        }
    }

}
