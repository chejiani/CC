package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * 用户数据库访问对象
 * @author jiani che
 * @version 1.0.0
 */
public interface UserRepository extends JpaRepository<User, Long>, PagingAndSortingRepository<User, Long> {

    //根据学号查询学生
    User findUserByNickName(String nickName);


}
