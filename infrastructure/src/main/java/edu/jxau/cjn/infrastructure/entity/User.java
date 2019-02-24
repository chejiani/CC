package edu.jxau.cjn.infrastructure.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "JAUX_USER")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userId;

    @Column(length = 10)
    private String nickName;

    @Column(length = 10)
    private String realName;

    @Column(length = 16)
    private String password;

    @Column(length = 2)
    private String gender;

    @Column(length = 14)
    private String mobile;

    @Column(length = 100)
    private String address;

    @ManyToOne
    @JoinColumn(name = "roleId",nullable = false, updatable = false)
    private Role role;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
