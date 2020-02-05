package com.f.dhm.schedule;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ScheduleRepository extends JpaRepository<ScheduleVO, Integer> {

	List<ScheduleVO> findByPlNum(int plNum);

	
//	  @Query("SELECT DAYOFWEEK(?1)") int findDay(Date deDate) throws Exception;
	  
	 

}
