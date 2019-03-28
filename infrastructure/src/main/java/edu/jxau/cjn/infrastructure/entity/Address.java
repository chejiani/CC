package edu.jxau.cjn.infrastructure.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 地址数据库对象
 * @author jiani che
 * @version 1.0.0
 */
@Entity
public class Address implements Serializable {

    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    /**
     * 地址
     */
    @Column(length = 200)
    private String addr;

    /**
     * 联系人
     */
    @Column
    private String contact;

    /**
     * 联系人电话
     */
    @Column
    private String contactPhone;

    /**
     * 是否用于下次使用
     */
    @Column
    private boolean useNext = true;

    /**
     * 归属用户
     */
    @ManyToOne
    @JoinColumn(name="userId", nullable=false, updatable=false)
    private User user;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public boolean isUseNext() {
        return useNext;
    }

    public void setUseNext(boolean useNext) {
        this.useNext = useNext;
    }
}
