package edu.jxau.cjn.infrastructure.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Address implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(length = 200)
    private String addr;

    @Column
    private String contact;

    @Column
    private String contactPhone;

    @Column
    private boolean useNext = true;

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
