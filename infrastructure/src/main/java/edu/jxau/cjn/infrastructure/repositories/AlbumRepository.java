package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Album;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlbumRepository extends JpaRepository<Album, Long> {
}
