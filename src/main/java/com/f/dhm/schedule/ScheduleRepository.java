package com.f.dhm.schedule;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ScheduleRepository extends JpaRepository<ScheduleVO, Integer> {

	List<ScheduleVO> findByPlNum(int plNum);

	@Query(nativeQuery = true, value = "select distinct m.title, s.start,m.addr1, m.firstimage,s.cost,s.tour, s.scName from mytour m , schedule s where m.title=?1 and m.plNum=?2")
	ScheduleInfoVO scheduleInfo (String tour, Integer plNum) throws Exception;
		 

}
