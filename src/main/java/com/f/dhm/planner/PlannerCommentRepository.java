package com.f.dhm.planner;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PlannerCommentRepository extends JpaRepository<PlannerCommentVO, Integer>{

	
	List<PlannerCommentVO> findByPlNum(int plNum)throws Exception;

	@Query(value = "select * from pComment pc left join memberFiles mf on pc.id=mf.id", nativeQuery = true)
	List<PlannerCommentVO> findwithimages()throws Exception;
	
//	@Query(value = "select * from pComment pc left join memberFiles mf on pc.id=mf.id where plNum=:plNum", nativeQuery = true)
//	Map<String, Object> findwithimagesMap(int plNum)throws Exception;
//	

//	@Query(nativeQuery = true, value ="select m.title, s.start, m.addr1, m.firstimage,s.cost,s.tour,s.arCode, s.scName from mytour m join schedule s on m.title=s.tour  and m.plNum=s.plNum where m.title=:title and m.plNum=:plNum")
//	   Map<String, Object> scheduleInfo (@Param("title") String title, @Param("plNum") Integer plNum) throws Exception;
//	레코드 1줄 리턴
	 
	  
	  
}
