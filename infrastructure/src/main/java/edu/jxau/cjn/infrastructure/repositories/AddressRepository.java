package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 地址数据库访问对象
 * @author jiani che
 * @version 1.0.0
 */
public interface AddressRepository extends JpaRepository<Address, Long> {
}
