package com.ccut.ytzhuang.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ccut.ytzhuang.repositories.GoodsDao;
import com.ccut.ytzhuang.model.Goods;
import com.ccut.ytzhuang.service.GoodsService;

@Component("goodsService")
public class GoodsServiceImpl implements GoodsService {

    private GoodsDao goodsDao;


    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<Goods> getAllGoods() {
        return goodsDao.findAll();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean delete(String goods_id) {
        goodsDao.deleteById(Long.valueOf(goods_id));
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean add(Goods goods) {
        goodsDao.saveAndFlush(goods);
        return true;
    }

    @Override
    public Goods getGoodsByid(String goods_id) {
        return goodsDao.findByGoodsId(goods_id);
    }

    @Override
    public ArrayList<Goods> getGoodsByName(String ownerName) {
        return goodsDao.findGoodsByGoodsNameLike(ownerName);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean save(Goods goods) {
        goodsDao.saveAndFlush(goods);
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public ArrayList<Goods> search(String goods_name) {
        return goodsDao.findGoodsByGoodsNameLike(goods_name);
    }
}
