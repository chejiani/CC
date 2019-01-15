package com.ccut.ytzhuang.repositories;

import java.util.ArrayList;

import com.ccut.ytzhuang.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface UserDao extends JpaRepository<User, Integer>, PagingAndSortingRepository<User, Integer> {

    //根据学号查询学生
    public User findUserByUserId(String user_id);


}
