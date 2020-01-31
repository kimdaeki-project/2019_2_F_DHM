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

	@Query("select distinct (select max(arDate) from PlannerVO where plNum=?1)-(select min(deDate) from PlannerVO where plNum=?1) from PlannerVO")
	int days(int plNum) throws Exception;
	
	@Query("select p.plNum,p.id,p.type,p.people,p.title from PlannerVO p where p.id=?1 group by p.plNum, p.id, p.type, p.people,p.title order by p.plNum;")
	List<PlannerVO> plannerList(String id) throws Exception;
}
