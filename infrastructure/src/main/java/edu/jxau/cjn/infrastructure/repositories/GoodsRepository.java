package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Goods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface GoodsRepository extends JpaRepository<Goods, Long>, PagingAndSortingRepository<Goods, Long> {

}
