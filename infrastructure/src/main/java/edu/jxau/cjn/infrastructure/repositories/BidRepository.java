package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Bid;
import edu.jxau.cjn.infrastructure.entity.Goods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * 竞拍数据库访问你对象
 * @author jiani che
 * @version 1.0.0
 */
public interface BidRepository extends JpaRepository<Bid, Integer>, PagingAndSortingRepository<Bid, Integer> {

    /**
     * 查询所有商品的竞拍记录
     * @param id 商品id
     * @return 满足条件的商品
     */
    List<Bid> findByGoodsEquals(Goods id);

}
