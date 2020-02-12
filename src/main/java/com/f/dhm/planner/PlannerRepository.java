package com.f.dhm.planner;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


public interface PlannerRepository extends JpaRepository<PlannerVO, Integer>{

	
	List<PlannerVO> findById(String id);
	//PlannerVO save(PlannerVO plannerVO);
	
	@Modifying
	@Query("update PlannerVO p set p.type=?1 where p.plNum=?2")
    void typeUpdate(String type, int plNum)throws Exception;
	
	List<PlannerVO> findAllByOrderByPlStepDesc();

	
	@Query(nativeQuery = true, value = "select distinct p.plNum,p.id,p.type,p.title from planner p, planner p2 where p.id=? and p.plNum=p2.plNum")
	List<MyPlannerVO> plannerList(String id) throws Exception;

	List<PlannerVO> findByIdAndPlNum(String id,int plNum);
	
	@Query(nativeQuery = true, value = "select distinct title from planner where plNum= ?")
	String plannerTitle(int plNum) throws Exception;
	
	@Query(nativeQuery = true, value = "select distinct type from planner where plNum= ?")
	String plannerType(int plNum) throws Exception;
	
	@Query(nativeQuery = true, value = "select sum(bak) from planner where plNum= ?")
	int days(int plNum) throws Exception;
	

}
