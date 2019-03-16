package edu.jxau.cjn.infrastructure.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Watch implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long goodsId;

    @MapsId
    @OneToOne
    public Goods goods;

    @MapsId
    @OneToOne
    public User user;

    public long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(long goodsId) {
        this.goodsId = goodsId;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
