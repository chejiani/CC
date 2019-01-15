package com.ccut.ytzhuang.service;

import java.util.ArrayList;
import java.util.List;

import com.ccut.ytzhuang.model.User;

public interface UserService {
	//用户登录
	public boolean userLogin(User user);
	//查询所有学生
	public List<User> getAllUser();
	//根据id删除学生
	public boolean delete(String user_id);
	//添加新学生
	public boolean add(User user);
	//根据学号查询学生
	public User getUserByid(String user_id);
	//修改学生资料
	public boolean save(User user);
}
