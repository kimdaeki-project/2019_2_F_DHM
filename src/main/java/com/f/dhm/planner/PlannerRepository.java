package com.f.dhm.planner;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface PlannerRepository extends JpaRepository<PlannerVO, Integer>{

	
	List<PlannerVO> findById(String id);
	//PlannerVO save(PlannerVO plannerVO);
	
	@Modifying
	@Query("update PlannerVO p set p.type=?1 where p.id=?2")
    void typeUpdate(String type, String id)throws Exception;
	
	List<PlannerVO> findAllByOrderByPlStepDesc();

}
