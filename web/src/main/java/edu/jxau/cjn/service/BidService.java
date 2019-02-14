package edu.jxau.cjn.service;

import edu.jxau.cjn.model.Bid;

import java.util.List;

public interface BidService {
    //查询所有订单
    List<Bid> getAllBid();

    //更具id删除订单
    boolean delete(String bid_id);

    //添加订单
    boolean add(Bid bid);

    //根据id查找订单信息
    Bid getBidById(String bid_id);

    //保存修改后订单的信息
    boolean save(Bid bid);

    //查询我的订单
    List<Bid> search(String username);

    //通过商品的id查询该商品关联的订单
    List<Bid> getBidByGoodsId(String goods_id);
}
