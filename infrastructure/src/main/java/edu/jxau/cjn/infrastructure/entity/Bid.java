package edu.jxau.cjn.infrastructure.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.*;

@Entity
@Table(name = "JAUX_BID")
public class Bid implements Serializable {

    /**
     * 出价编号
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long bidId;

    /**
     * 出价商品
     */
    @ManyToOne(optional = false)
    @JoinColumn(name = "goodsId", updatable = false, nullable = false)
    private Goods goods;

    /**
     * 出价用户
     */
    @ManyToOne(optional = false)
    @JoinColumn(name = "userId", updatable = false, nullable = false)
    private User user;

    /**
     * 出价价格
     */
    @Column(precision = 12, scale = 2)
    private BigDecimal price;

    /**
     * 当前底价
     */
    @Column(precision = 12, scale = 2)
    private BigDecimal currentReservePrice;

    @Column
    private int status;

    public long getBidId() {
        return bidId;
    }

    public void setBidId(long bidId) {
        this.bidId = bidId;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getCurrentReservePrice() {
        return currentReservePrice;
    }

    public void setCurrentReservePrice(BigDecimal currentReservePrice) {
        this.currentReservePrice = currentReservePrice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
