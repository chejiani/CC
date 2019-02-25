package edu.jxau.cjn.controller.model;

import java.io.Serializable;
import java.util.List;

public class Page<T> implements Serializable {

    private int total = 0;

    private List<T> rows;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

}
