package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Bid;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface BidRepository extends JpaRepository<Bid, Integer>, PagingAndSortingRepository<Bid, Integer> {

    /**
     * 查询所有商品的竞拍记录
     * @param id 商品id
     * @return 满足条件的商品
     */
    List<Bid> findByGoodsEquals(long id);

}
