package edu.jxau.cjn.service.order;

import edu.jxau.cjn.infrastructure.entity.*;
import edu.jxau.cjn.infrastructure.repositories.BidRepository;
import edu.jxau.cjn.infrastructure.repositories.GoodsRepository;
import edu.jxau.cjn.service.goods.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

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
            return true;
        } else {
            return false;
        }
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
                    Calendar calendar = Calendar.getInstance();
                    calendar.set(Calendar.DATE, 1);
                    order.setPayDeadline(calendar.getTime());
                    order.setUser(bid.getUser());
                    orderService.createOrder(order, bid.getGoods().getGoodsId(), bid.getUser().getUserId());
                }
            });
        }
    }

}
