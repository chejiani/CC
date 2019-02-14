package edu.jxau.cjn.repositories;

import edu.jxau.cjn.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface AdminDao extends JpaRepository<Admin, Integer>, PagingAndSortingRepository<Admin, Integer> {

    int findAdminByAdminNameAndAdminPassword(String name, String password);

}
