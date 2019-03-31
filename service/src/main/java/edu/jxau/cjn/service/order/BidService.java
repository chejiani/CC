package edu.jxau.cjn.service.order;

import edu.jxau.cjn.infrastructure.entity.*;
import edu.jxau.cjn.infrastructure.repositories.BidRepository;
import edu.jxau.cjn.infrastructure.repositories.GoodsRepository;
import edu.jxau.cjn.service.goods.GoodsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
public class BidService {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private GoodsRepository goodsRepository;

    @Autowired
    private OrderService orderService;

    @Autowired
    private BidRepository bidRepository;

    @Autowired
    private JavaMailSender javaMailSender;

    public boolean bid(long goodsId, User user, double price) {
        Goods goods = goodsService.goodsAuctionAvailable(goodsId);
        if (goods != null) {
            Bid bid = new Bid();
            bid.setGoods(goods);
            bid.setCurrentReservePrice(goods.getReservePrice());
            bid.setPrice(BigDecimal.valueOf(price));
            bid.setStatus(BidStatus.AUCTIONING.ordinal());
            bid.setUser(user);
            bidRepository.save(bid);
            goods.setReservePrice(goods.getReservePrice().add(bid.getPrice()));
            goodsRepository.save(goods);
            return true;
        } else {
            return false;
        }
    }

    public static void main(String[] args) {
        System.out.println(UUID.randomUUID().toString().length());
    }

    public void generateOrder() {
        List<Goods> goods = goodsRepository.findByAuctionDeadlineBeforeAndAuctionIsTrueAndObtainedIsFalseAndStockGreaterThan(new Date(), 0);
        if (goods != null && goods.size() > 0) {
            goods.forEach(item -> {
                List<Bid> bids = bidRepository.findByGoodsEquals(item.getGoodsId());
                if (bids != null && bids .size() > 0){
                    Bid bid = bids.stream()
                            .max(Comparator.comparing(Bid::getPrice))
                            .get();
                    Order order = new Order();
                    order.setOrderStatus(OrderStatus.WAIT_PAY.getCode());
                    order.setGoods(bid.getGoods());
                    order.setQuantity(1);
                    order.setUnitPrice(bid.getPrice());
                    order.setTotalPrice(bid.getPrice());
                    order.setAddr("");
                    order.setOrderNo(UUID.randomUUID().toString());
                    Calendar calendar = Calendar.getInstance();
                    calendar.set(Calendar.DATE, 1);
                    order.setPayDeadline(calendar.getTime());
                    order.setUser(bid.getUser());
                    orderService.createOrder(order, bid.getGoods().getGoodsId(), bid.getUser().getUserId());
                    if (StringUtils.isNotBlank(bid.getUser().getEmail())){
                        SimpleMailMessage mailMessage = new SimpleMailMessage();
                        mailMessage.setFrom("123456@cjn.com");
                        mailMessage.setTo(bid.getUser().getEmail());
                        mailMessage.setSubject("竞拍成功通知");
                        mailMessage.setText("尊敬的"+ bid.getUser().getNickName()+"您好，你出价的"+bid.getGoods().getGoodsName() + "已成功竞拍,请付款并完成地址补全。");
                        javaMailSender.send(mailMessage);
                    }
                }
            });
        }
    }

}
