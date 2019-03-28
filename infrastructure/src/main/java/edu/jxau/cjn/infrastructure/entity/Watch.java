package edu.jxau.cjn.infrastructure.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 关注数据库对象
 * @author jiani che
 * @version 1.0.0
 */
@Entity
public class Watch implements Serializable {

    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long goodsId;

    /**
     * 商品
     */
    @MapsId
    @OneToOne
    public Goods goods;

    /**
     * 用户
     */
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
