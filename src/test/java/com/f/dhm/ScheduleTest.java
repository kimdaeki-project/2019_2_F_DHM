package com.f.dhm;


import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.f.dhm.planner.PlannerRepository;
import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO2;
@SpringBootTest
class ScheduleTest {
	
	@Autowired
	PlannerRepository repository;
	
	@Autowired
	PlannerService service;
	
	@Test
	void test() throws Exception{
		String date = "2020-01-25";
		
		int y = Integer.parseInt(date.substring(0, 4));
		int m = Integer.parseInt(date.substring(5, 7));
		int d = Integer.parseInt(date.substring(8));
		
		Calendar.getInstance().set(y, m, d);
		
		Date s = new Date(Calendar.getInstance().getTimeInMillis());
		
		System.out.println(s);
		
		
	}

}
