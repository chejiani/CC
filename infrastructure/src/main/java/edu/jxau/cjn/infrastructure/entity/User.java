package edu.jxau.cjn.infrastructure.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 用户数据库对象
 */
@Entity
public class User implements Serializable {

    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userId;

    /**
     * 昵称
     */
    @Column(length = 10)
    private String nickName;

    /**
     * 真实姓名
     */
    @Column(length = 10)
    private String realName;

    /**
     * 密码
     */
    @Column(length = 48)
    private String password;

    /**
     * 性别
     */
    @Column(length = 2)
    private String gender;

    /**
     * E-mail地址
     */
    @Column
    private String email;

    /**
     * 电话号码
     */
    @Column(length = 14)
    private String mobile;

    /**
     * 地址
     */
    @Column(length = 100)
    private String address;

    /**
     * 盐
     */
    @Column(nullable = false)
    private String salt;

    /**
     * 创建日期
     */
    @Column(nullable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDateTime = new Date();

    /**
     * 更新日期
     */
    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDateTime;

    /**
     * 是否禁用
     */
    @Column
    private boolean disable;

    /**
     * 角色,角色一个用户可以多个，因此，这里可以考虑多对一关系
     */
    @ManyToOne
    @JoinColumn(name = "roleId",nullable = false, updatable = false)
    private Role role;

    /**
     * 持久化前操作，初始化船舰日期和更新日期
     */
    @PrePersist
    public void prePersist(){
        this.createDateTime = new Date();
        this.updateDateTime = new Date();
    }

    /**
     * 更新前操作
     */
    @PostUpdate
    public void preUpdate(){
        this.updateDateTime = new Date();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isDisable() {
        return disable;
    }

    public void setDisable(boolean disable) {
        this.disable = disable;
    }

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

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Date getCreateDateTime() {
        return createDateTime;
    }

    public void setCreateDateTime(Date createDateTime) {
        this.createDateTime = createDateTime;
    }

    public Date getUpdateDateTime() {
        return updateDateTime;
    }

    public void setUpdateDateTime(Date updateDateTime) {
        this.updateDateTime = updateDateTime;
    }
}
