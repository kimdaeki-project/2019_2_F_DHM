package com.f.dhm;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.f.dhm.schedule.ScheduleRepository;
import com.f.dhm.schedule.ScheduleVO;
@SpringBootTest
class ScheduleTest {
	
	@Autowired
	private ScheduleRepository repository;
	
	@Test
	void test() {
		ScheduleVO vo = new ScheduleVO();
		
		
	}

}
