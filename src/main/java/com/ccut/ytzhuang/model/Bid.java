package com.ccut.ytzhuang.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Bid {
    private String bidId;
    private String goodsId;
    private String goodsName;
    private String winnerName;
    private String winnerPhone;
    private double price;
    private String address;
    private Date bidTime;
    private String ownerName;
    private String ownerPhone;
    private String bidState;
    private String bidDesc;

    @Id
    public String getBidId() {
        return bidId;
    }

    public void setBidId(String bidId) {
        this.bidId = bidId;
    }

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

    public String getWinnerName() {
        return winnerName;
    }

    public void setWinnerName(String winnerName) {
        this.winnerName = winnerName;
    }

    public String getWinnerPhone() {
        return winnerPhone;
    }

    public void setWinnerPhone(String winnerPhone) {
        this.winnerPhone = winnerPhone;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBidTime() {
        return bidTime;
    }

    public void setBidTime(Date bidTime) {
        this.bidTime = bidTime;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getOwnerPhone() {
        return ownerPhone;
    }

    public void setOwnerPhone(String ownerPhone) {
        this.ownerPhone = ownerPhone;
    }

    public String getBidState() {
        return bidState;
    }

    public void setBidState(String bidState) {
        this.bidState = bidState;
    }

    public String getBidDesc() {
        return bidDesc;
    }

    public void setBidDesc(String bidDesc) {
        this.bidDesc = bidDesc;
    }
}
