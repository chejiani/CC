package edu.jxau.cjn.infrastructure.entity;

public enum OrderStatus {
    WAIT_PAY("代支付"),
    WAIT_SHIP("代发货"),
    WAIT_SIGNING("代签收"),
    CLOSE("交易关闭"),
    CANCEL("交易取消"),
    END("交易结束");

    private String status;

    OrderStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
