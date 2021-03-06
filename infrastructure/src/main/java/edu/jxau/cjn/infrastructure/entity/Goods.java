package edu.jxau.cjn.infrastructure.entity;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.*;

/**
 * 商品数据库对象
 * @author jiani che
 * @version 1.0.0
 */
@Entity
public class Goods implements Serializable {

    /**
     * 商品编号
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long goodsId;

    /**
     * 商品名称
     */
    @Column(length = 30)
    private String goodsName = "";

    /**
     * 相册
     */
    @OneToOne
    @Fetch(value = FetchMode.JOIN)
    private Album album;

    /**
     * 商品描述
     */
    @Column(length = 60)
    private String goodsDesc = "";

    /**
     * 商品描述
     */
    @Column(columnDefinition = "longtext null")
    private String article;

    /**
     * 底价
     */
    @Column(precision = 12, scale = 2)
    private BigDecimal reservePrice;

    /**
     * 一口价
     */
    @Column(precision = 12, scale = 2, updatable = false)
    private BigDecimal fixedPrice;

    /**
     * 创建日期
     */
    @Column(updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate = new Date();

    /**
     * 允许竞拍
     */
    @Column(updatable = false)
    private boolean auction = true;

    @Column(updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date auctionDeadline;

    /**
     * 允许一口价
     */
    @Column(updatable = false)
    private boolean fixed;

    /**
     * 商品所有者
     */
    @OneToOne
    private User owner;

    /**
     * 是否下架
     */
    @Column
    private boolean obtained = false;

    /**
     * 库存
     */
    @Column
    private int stock = 1;

    @OneToMany(orphanRemoval = false)
    @JoinColumn(name = "goods_id")
    private Set<Order> orders;

    /**
     * 持久化前操作，初始化库存
     */
    @PrePersist
    public void prePersist(){
        if (stock <= 0){
            stock = 1;
        }
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(long goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public BigDecimal getReservePrice() {
        return reservePrice;
    }

    public void setReservePrice(BigDecimal reservePrice) {
        this.reservePrice = reservePrice;
    }

    public BigDecimal getFixedPrice() {
        return fixedPrice;
    }

    public void setFixedPrice(BigDecimal fixedPrice) {
        this.fixedPrice = fixedPrice;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public boolean isAuction() {
        return auction;
    }

    public void setAuction(boolean auction) {
        this.auction = auction;
    }

    public boolean isFixed() {
        return fixed;
    }

    public void setFixed(boolean fixed) {
        this.fixed = fixed;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public boolean isObtained() {
        return obtained;
    }

    public void setObtained(boolean obtained) {
        this.obtained = obtained;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Date getAuctionDeadline() {
        return auctionDeadline;
    }

    public void setAuctionDeadline(Date auctionDeadline) {
        this.auctionDeadline = auctionDeadline;
    }
}
