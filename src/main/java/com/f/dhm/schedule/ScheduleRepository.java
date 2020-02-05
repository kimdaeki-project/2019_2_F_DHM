package com.f.dhm.schedule;


import org.springframework.data.jpa.repository.JpaRepository;

public interface ScheduleRepository extends JpaRepository<ScheduleVO, Integer> {

	
//	  @Query("SELECT DAYOFWEEK(?1)") int findDay(Date deDate) throws Exception;
	  
	 

}
