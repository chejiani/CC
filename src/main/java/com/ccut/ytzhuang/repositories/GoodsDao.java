package com.ccut.ytzhuang.repositories;

import java.util.ArrayList;

import com.ccut.ytzhuang.model.Goods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface GoodsDao extends JpaRepository<Goods, Long>, PagingAndSortingRepository<Goods, Long> {

    //根据商品编号查询商品信息
    Goods findByGoodsId(String goods_id);

    //更具商品编号查询商品信息
    ArrayList<Goods> findGoodsByGoodsNameLike(String ownerName);
}
