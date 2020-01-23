package com.f.dhm.qna;

import java.util.List;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.f.dhm.funding.FundingVO;

public interface QnaRepository extends JpaRepository<QnaVO, Integer>{

	//public void findByNumOrderByStepAsc()throws Exception;
	
//	public List<QnaVO> findAllOrderByRefDesc()throws Exception;
	
//	@Query("SELECT f FROM FundingVO f WHERE fNum = ?1")
//	FundingVO fundingSelect(int num) throws Exception;
	
	@Query("select q from QnaVO q order by ref desc")
	public List<QnaVO> qnalisst()throws Exception;
	
	public List<QnaVO> findByRef(int ref)throws Exception;
	
	
	
}
