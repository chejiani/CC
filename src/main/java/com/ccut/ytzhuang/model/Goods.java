package com.ccut.ytzhuang.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class Goods {
    private String goodsId;    //商品编号
    private String goodsName;    //商品名称
    private String goodsClass;    //商品类别
    private String goodsDesc;    //商品描述
    private Date addTime;        //拍卖时间
    private Date endTime;        //拍卖截止时间
    private Double initPrice;    //起步价
    private Double bidPrice;    //竞拍价（默认等于起拍价）
    private Double maxPrice;    //一口价
    private Double eachIncr;    //每次加价
    private String goodsState;    //商品状态
    private String bidArea;    //接单区域
    private String goodsPicture; //商品图片
    private String ownerName;    //拍卖人姓名

    @Id
    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsClass() {
        return goodsClass;
    }

    public void setGoodsClass(String goodsClass) {
        this.goodsClass = goodsClass;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Double getInitPrice() {
        return initPrice;
    }

    public void setInitPrice(Double initPrice) {
        this.initPrice = initPrice;
    }

    public Double getBidPrice() {
        return bidPrice;
    }

    public void setBidPrice(Double bidPrice) {
        this.bidPrice = bidPrice;
    }

    public Double getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Double maxPrice) {
        this.maxPrice = maxPrice;
    }

    public Double getEachIncr() {
        return eachIncr;
    }

    public void setEachIncr(Double eachIncr) {
        this.eachIncr = eachIncr;
    }

    public String getGoodsState() {
        return goodsState;
    }

    public void setGoodsState(String goodsState) {
        this.goodsState = goodsState;
    }

    public String getBidArea() {
        return bidArea;
    }

    public void setBidArea(String bidArea) {
        this.bidArea = bidArea;
    }

    public String getGoodsPicture() {
        return goodsPicture;
    }

    public void setGoodsPicture(String goodsPicture) {
        this.goodsPicture = goodsPicture;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }
}
