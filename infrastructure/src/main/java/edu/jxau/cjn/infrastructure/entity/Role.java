package edu.jxau.cjn.infrastructure.entity;

import javax.persistence.*;

import java.io.Serializable;

/**
 * 角色数据库对象
 */
@Entity
public class Role implements Serializable {

    private static final long serialVersionUID = 0L;

    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    /**
     * 角色名
     */
    @Column(length = 15)
    private String name;

    /**
     * 角色描述
     */
    @Column(length = 20)
    private String description;

    /**
     * 是否预置角色
     */
    @Column(nullable = false)
    private boolean preset;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isPreset() {
        return preset;
    }

    public void setPreset(boolean preset) {
        this.preset = preset;
    }
}
