package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface UserRepository extends JpaRepository<User, Integer>, PagingAndSortingRepository<User, Integer> {

    //根据学号查询学生
    User findUserByNickName(String nickName);


}
