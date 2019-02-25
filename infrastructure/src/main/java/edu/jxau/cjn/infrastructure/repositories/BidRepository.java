package edu.jxau.cjn.infrastructure.repositories;

import edu.jxau.cjn.infrastructure.entity.Bid;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BidRepository extends JpaRepository<Bid, Integer>, PagingAndSortingRepository<Bid, Integer> {

}
