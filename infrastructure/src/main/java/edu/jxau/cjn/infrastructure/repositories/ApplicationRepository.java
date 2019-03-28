package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Application;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 运用数据库访问对象
 * @author jiani che
 * @version 1.0.0
 */
public interface ApplicationRepository extends JpaRepository<Application, Long> {
}
