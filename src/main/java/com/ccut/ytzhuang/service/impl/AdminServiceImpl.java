package com.ccut.ytzhuang.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ccut.ytzhuang.repositories.AdminDao;
import com.ccut.ytzhuang.model.Admin;
import com.ccut.ytzhuang.service.AdminService;

@Component("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public boolean adminLogin(Admin admin) {
        try {
            int count = adminDao.findAdminByAdminNameAndAdminPassword(admin.getAdminName(), admin.getAdminPassword());

            return count == 1;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
