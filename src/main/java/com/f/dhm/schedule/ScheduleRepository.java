package com.f.dhm.schedule;


import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ScheduleRepository extends JpaRepository<ScheduleVO, Integer> {

	List<ScheduleVO> findByPlNum(int plNum);

	@Query(nativeQuery = true, value ="select m.title, s.start, m.addr1, m.firstimage,s.cost,s.tour,s.arCode, s.scName from mytour m join schedule s on m.title=s.tour  and m.plNum=s.plNum where m.title=:title and m.plNum=:plNum")
	Map<String, Object> scheduleInfo (@Param("title") String title, @Param("plNum") Integer plNum) throws Exception;

	ScheduleInfoVO findByScNameAndPlNum(String scName, Integer plNum);

	List<ScheduleVO> findByPlNumAndTour(Integer plNum, String title);
		 

}
