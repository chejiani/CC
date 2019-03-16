package edu.jxau.cjn.infrastructure.entity;

public enum OrderStatus {
    WAIT_PAY(1,"代支付"),
    WAIT_SHIP(2,"代发货"),
    WAIT_SIGNING(3,"代签收"),
    CLOSE(4,"交易关闭"),
    CANCEL(5,"交易取消"),
    END(6,"交易结束");

    private int code;
    private String status;

    OrderStatus(int code, String status) {
        this.code = code;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public int getCode() {
        return code;
    }
}
