package edu.jxau.cjn.infrastructure.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.*;


@Entity
@Table(name = "JAUX_GOODS")
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
    private String goodsName;

    @OneToOne
    private Album album;

    /**
     * 商品描述
     */
    @Column(length = 60)
    private String goodsDesc;

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
    private boolean obtained = true;

    /**
     * 库存
     */
    @Column
    private int stock;

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
}
