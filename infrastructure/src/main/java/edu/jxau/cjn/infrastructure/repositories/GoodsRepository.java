package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Goods;
import org.hibernate.criterion.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.Date;
import java.util.List;

public interface GoodsRepository extends JpaRepository<Goods, Long>, PagingAndSortingRepository<Goods, Long> {

    /**
     * 查询所有拍卖到期，没=有库存没有下架并且库存大于指定值的商品
     * @param date 到期日期
     * @param stock 库存
     * @return 满足条件的商品
     */
    List<Goods> findByAuctionDeadlineBeforeAndAuctionIsTrueAndObtainedIsFalseAndStockGreaterThan(Date date, int stock);

    List<Goods> findByGoodsNameLike(String keywords);

}
