package edu.jxau.cjn.infrastructure.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "JAUX_ALBUM")
public class Album implements Serializable {

    /**
     * id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(columnDefinition = "longtext null")
    private String picAddr;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPicAddr() {
        return picAddr;
    }

    public void setPicAddr(String picAddr) {
        this.picAddr = picAddr;
    }
}
