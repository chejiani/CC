package edu.jxau.cjn.controller;

public class Result {

    public String code;

    public Object data;

    public Result() {
    }

    public Result(String code) {
        this.code = code;
    }

    public Result(int code) {
        this.code = String.valueOf(code);
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
