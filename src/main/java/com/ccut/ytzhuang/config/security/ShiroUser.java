package com.ccut.ytzhuang.config.security;

import java.io.Serializable;
import java.util.Objects;

public class ShiroUser implements Serializable {
    private static final long serialVersionUID = -1373760761780840081L;
    public String id;
    public String loginName;
    public String name;
    public String ip;

    public ShiroUser(String id, String loginName, String name, String ip) {
        this.id = id;
        this.loginName = loginName;
        this.name = name;
        this.ip = ip;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return loginName;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(loginName);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        ShiroUser other = (ShiroUser) obj;
        if (loginName == null) {
            return other.loginName == null;
        } else return loginName.equals(other.loginName);
    }
}
