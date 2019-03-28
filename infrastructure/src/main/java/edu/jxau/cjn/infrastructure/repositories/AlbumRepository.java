package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Album;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 相册数据库访问对象
 * @author jiani che
 * @version 1.0.0
 */
public interface AlbumRepository extends JpaRepository<Album, Long> {
}
