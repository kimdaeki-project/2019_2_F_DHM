package com.f.dhm.funding;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface FundingRepository extends JpaRepository<FundingVO, Integer> {
	
	//funding
	Page<FundingVO> findByNumGreaterThan(int num, Pageable pageable) throws Exception;
	
	@Query("SELECT f FROM FundingVO f ORDER BY fNum DESC")
	List<FundingVO> fundingList() throws Exception;
	
	@Query("SELECT f FROM FundingVO f WHERE fNum = ?1")
	FundingVO fundingSelect(int num) throws Exception;
	
//	@Modifying
//	@Query("UPDATE FundingVO f SET fName = ?1, contents = ?2, price = ?3, goal = ?4, startTime = ?5, endTime = ?6, people = ?7 WHERE fNum = ?8")
//	void fundingUpdate(String fName, String contents, BigInteger price, BigInteger goal, java.util.Date startTime, java.util.Date endTime, int people, int num) throws Exception;
	
	@Transactional
	@Modifying
	@Query("UPDATE FundingVO f SET status = ?1, gage = ?2, participationPeople = ?3 WHERE fNum = ?4")
	void fundingUpdate(int status, int gage, int participationPeople, int fNum) throws Exception;
	
//	@Query("SELECT f FROM FundingVO f WHERE participationId = ?1")
	@Query(value = "SELECT new list (f.name, f.id, f.startTime, f.endTime, j.price, j.participationPeople) "
			+ "FROM FundingVO f RIGHT JOIN f.fundingJoinVOs j WHERE j.participationId = ?1")
//	Object[] fundingJoinSelect(String participationId) throws Exception;
//	Optional<FundingVO> fundingJoinSelect(String participationId) throws Exception;
//	Map<String, Object> fundingJoinSelect(String participationId) throws Exception;
	List<FundingVO> fundingJoinSelect(String participationId) throws Exception;
	
	
	List<FundingVO> findByFundingJoinVOsParticipationId(String participationId) throws Exception;
}
