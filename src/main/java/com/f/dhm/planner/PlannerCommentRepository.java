package com.f.dhm.planner;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PlannerCommentRepository extends JpaRepository<PlannerCommentVO, Integer>{

	
	List<PlannerCommentVO> findByPlNum(int plNum)throws Exception;
	
}
