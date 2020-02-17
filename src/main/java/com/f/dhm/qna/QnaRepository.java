package com.f.dhm.qna;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Transient;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.f.dhm.funding.FundingVO;

public interface QnaRepository extends JpaRepository<QnaVO, Integer>{
	
	@Query(nativeQuery = true, value = "select * from qna order by ref desc, step asc" )
	public Page<QnaVO> qnalisst(Pageable pageable)throws Exception;
	
	public List<QnaVO> findByRef(int ref)throws Exception;
	
	public Page<QnaVO> findByTitleContains(String title, Pageable pageable)throws Exception;
	
	
	
}
