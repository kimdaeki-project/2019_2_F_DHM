package com.f.dhm.funding;



import java.math.BigInteger;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface FundingRepository extends JpaRepository<FundingVO, Integer> {

	Page<FundingVO> findByNumGreaterThan(int num, Pageable pageable) throws Exception;
	
	@Query("SELECT f FROM FundingVO f ORDER BY fNum DESC")
	List<FundingVO> fundingList() throws Exception;
	
	@Query("SELECT f FROM FundingVO f WHERE fNum = ?1")
	FundingVO fundingSelect(int num) throws Exception;
	
	@Modifying
	@Query("UPDATE FundingVO f SET fName = ?1, contents = ?2, price = ?3, goal = ?4, startTime = ?5, endTime = ?6, people = ?7 WHERE fNum = ?8")
	void fundingUpdate(String fName, String contents, BigInteger price, BigInteger goal, java.util.Date startTime, java.util.Date endTime, int people, int num) throws Exception;

}
