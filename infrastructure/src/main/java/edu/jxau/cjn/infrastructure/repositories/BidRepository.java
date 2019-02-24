package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Bid;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BidRepository extends JpaRepository<Bid, Integer>, PagingAndSortingRepository<Bid, Integer> {

    /*//查询我的订单
    public ArrayList<Bid> findBidsByWinnerNameLike(String username);

    //通过商品的id查询该商品关联的订单
    public ArrayList<Bid> findBidsByGoodsId(String goods_id);*/

}
