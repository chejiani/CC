package edu.jxau.cjn.service.order;

import edu.jxau.cjn.infrastructure.entity.Bid;
import edu.jxau.cjn.infrastructure.entity.BidStatus;
import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.infrastructure.entity.User;
import edu.jxau.cjn.infrastructure.repositories.BidRepository;
import edu.jxau.cjn.service.goods.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
public class BidService {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private BidRepository bidRepository;

    public boolean bid(long goodsId, User user, double price){
        Goods goods = goodsService.goodsAuctionAvailable(goodsId);
        if (goods != null){
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

}
