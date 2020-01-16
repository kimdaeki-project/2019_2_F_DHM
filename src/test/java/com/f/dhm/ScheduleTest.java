package com.f.dhm;

import static org.junit.jupiter.api.Assertions.*;


import java.util.Calendar;
import java.util.Date;

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
		
		vo.setPNum(9998);
		vo.setSName("여행 출발");
		vo.setTour("서울");
		vo.setCost(100000);
		
		Date d = (Date)Calendar.getInstance().getTime();
		vo.setStart(d);
		Date s= (Date)Calendar.getInstance().getTime();
		vo.setEnd(s);
		vo.setTransfer("지하철");
		repository.save(vo);
	}

}
