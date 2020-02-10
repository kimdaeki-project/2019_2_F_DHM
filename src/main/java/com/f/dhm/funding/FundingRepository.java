package com.f.dhm.funding;

import java.util.List;

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
	
//	//fundingJoin
//	//펀딩한 사람이 확인
////	@Query(value = "SELECT f.fNum, j.participationPeople, j.price, j.id FROM funding f "
////			+ "RIGHT JOIN fundingJoin j ON f.fNum = j.fNum"
////			+ " WHERE f.fNum = ?1", nativeQuery = true)
//	@Query(value = "SELECT j FROM fundingJoin j WHERE fNum = ?1", nativeQuery = true)
//	List<FundingJoinVO> fundingJoinList(int num) throws Exception;
//

//	//**member 추가 후에 테스트**/
//	//펀딩 참여한 사람이 확인
//	@Query("SELECT f.fNum, f.pNum, f.contents, m.name, m.email, j.price, j.participationPeople, j.participationPeople " + 
//			"FROM funding RIGHT JOIN member ON f.fName = m.name JOIN fundingJoin ON f.fNum = j.fNum WHERE j.id = ?1",  nativeQuery = true)
//	Object[] fundingJoinSelect(String id) throws Exception;
//	
	
}
