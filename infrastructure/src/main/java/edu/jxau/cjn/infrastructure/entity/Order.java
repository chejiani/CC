package edu.jxau.cjn.infrastructure.entity;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
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

    @OneToOne
    @Fetch(FetchMode.JOIN)
    private Address address;

    /**
     * 订单商品
     */
    @OneToOne
    @MapsId
    @Fetch(FetchMode.JOIN)
    private Goods goods;

    @ManyToOne(optional = false)
    @JoinColumn(name = "userId", updatable = false, nullable = false)
    @Fetch(FetchMode.JOIN)
    private User user;

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

    @Column(length = 200)
    private String addr;

    @Column(updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate = new Date();

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date payDate;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date payDeadline;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

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

    public Date getPayDeadline() {
        return payDeadline;
    }

    public void setPayDeadline(Date payDeadline) {
        this.payDeadline = payDeadline;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
