package com.f.dhm.planner;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PlannerCommentRepository extends JpaRepository<PlannerCommentVO, Integer>{

	
	List<PlannerCommentVO> findByPlNum(int plNum)throws Exception;

	@Query(value = "select * from pComment pc left join memberFiles mf on pc.id=mf.id", nativeQuery = true)
	List<PlannerCommentVO> findwithimages()throws Exception;
	
	@Query(value = "select * from pComment order by regDate desc", nativeQuery = true)
	List<PlannerCommentVO> findAllOrderByRegDateDesc(PageRequest pageRequest)throws Exception;
}
