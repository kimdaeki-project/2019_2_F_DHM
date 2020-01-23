package com.f.dhm.schedule;

import java.sql.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ScheduleRepository extends JpaRepository<ScheduleVO, Integer> {

	
//	  @Query("SELECT DAYOFWEEK(?1)") int findDay(Date deDate) throws Exception;
	  
	 

}
