package com.f.dhm.planner;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PlannerCommentRepository2 extends JpaRepository<PlannerCommentVO2, Integer>{

	
	List<PlannerCommentVO2> findByPlNum(int plNum)throws Exception;
	
}
