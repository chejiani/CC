package edu.jxau.cjn.service.impl;

import edu.jxau.cjn.repositories.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import edu.jxau.cjn.model.Admin;
import edu.jxau.cjn.service.AdminService;

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
