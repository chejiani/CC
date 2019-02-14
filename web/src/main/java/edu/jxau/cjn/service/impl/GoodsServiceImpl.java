package edu.jxau.cjn.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import edu.jxau.cjn.repositories.GoodsDao;
import edu.jxau.cjn.model.Goods;
import edu.jxau.cjn.service.GoodsService;

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
        return goodsDao.findById(Long.valueOf(goods_id)).get();
    }

    @Override
    public ArrayList<Goods> getGoodsByName(String ownerName) {
        return (ArrayList<Goods>) goodsDao.findAll();
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
        return (ArrayList<Goods>) goodsDao.findAll();
    }
}
