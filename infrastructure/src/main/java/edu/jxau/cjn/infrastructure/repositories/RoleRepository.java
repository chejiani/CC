package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * 角色数据库访问对象
 * @author jiani che
 * @version 1.0.0
 */
public interface RoleRepository extends JpaRepository<Role, Integer> {

    Role findByPresetIsTrue();

    Role findByName(String name);

}
