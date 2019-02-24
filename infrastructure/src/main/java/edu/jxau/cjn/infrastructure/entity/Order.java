package edu.jxau.cjn.infrastructure.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "JAUX_ORDER")
public class Order implements Serializable {

    /**
     * 订单id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    /**
     * 订单编号
     */
    @Column(length = 20, updatable = false)
    private String orderNo;

    /**
     * 订单商品
     */
    @OneToOne
    @MapsId
    private Goods goods;

    /**
     * 数量
     */
    @Column
    private int quantity;

    /**
     * 单价
     */
    @Column(precision = 12, scale = 2)
    private BigDecimal unitPrice;

    /**
     * 总价
     */
    @Column(precision = 12, scale = 2)
    private BigDecimal totalPrice;

    /**
     * 订单状态
     */
    @Column(precision = 12, scale = 2)
    private int orderStatus;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }
}
