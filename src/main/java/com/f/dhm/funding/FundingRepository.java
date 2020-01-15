package com.f.dhm.funding;



import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface FundingRepository extends JpaRepository<FundingVO, Integer> {

	Page<FundingVO> findByFNumGreaterThan(int fNum, Pageable pageable) throws Exception;
	
	@Query("SELECT f FROM FundingVO f ORDER BY fNum DESC")
	List<FundingVO> fundingList() throws Exception;
	
	@Query("SELECT f FROM FundingVO f WHERE fNum = ?1")
	FundingVO fundingSelect(int fNum) throws Exception;
	
	@Modifying
	@Query("UPDATE FundingVO f SET fName = ?1, contents = ?2, goal = ?3, startTime = ?4, endTime = ?5, people = ?6 WHERE fNum = ?7")
	void fundingUpdate(String fName, String contents, int goal, java.util.Date startTime, java.util.Date endTime, int people, int fNum) throws Exception;

}
