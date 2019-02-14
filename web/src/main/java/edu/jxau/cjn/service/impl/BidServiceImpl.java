package edu.jxau.cjn.service.impl;

import java.util.ArrayList;
import java.util.List;

import edu.jxau.cjn.model.Bid;
import edu.jxau.cjn.repositories.BidDao;
import edu.jxau.cjn.service.BidService;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Component("bidService")
public class BidServiceImpl implements BidService {

    private BidDao bidDao;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<Bid> getAllBid() {
        return bidDao.findAll();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean delete(String bid_id) {
        bidDao.deleteById(Integer.valueOf(bid_id));
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean add(Bid bid) {
        return bidDao.save(bid) == null;
    }

    @Override
    public Bid getBidById(String bid_id) {
        return bidDao.findById(Integer.valueOf(bid_id)).orElse(null);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean save(Bid bid) {
        bidDao.save(bid);
        return true;
    }

    @Override
    public ArrayList<Bid> search(String username) {
        return (ArrayList<Bid>) bidDao.findAll();
    }

    @Override
    public ArrayList<Bid> getBidByGoodsId(String goods_id) {
        return (ArrayList<Bid>) bidDao.findAll();
    }
}