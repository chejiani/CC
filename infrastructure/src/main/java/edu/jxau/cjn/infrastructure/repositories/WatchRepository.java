package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Watch;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 关注数据库访问你对象
 * @author jiani che
 * @version 1.0.0
 */
public interface WatchRepository extends JpaRepository<Watch, Long> {
}
