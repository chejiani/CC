package edu.jxau.cjn.infrastructure.entity;

/**
 * 订单状态枚举
 * @author jiani che
 * @version 1.0.0
 */
public enum OrderStatus {
    PRE(0, "待补充地址"),
    WAIT_PAY(1,"待支付"),
    WAIT_SHIP(2,"待发货"),
    WAIT_SIGNING(3,"待签收"),
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
