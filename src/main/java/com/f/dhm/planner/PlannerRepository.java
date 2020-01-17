package com.f.dhm.planner;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


public interface PlannerRepository extends JpaRepository<PlannerVO, Integer>{


	List<PlannerVO> findById(String id);
	

}
