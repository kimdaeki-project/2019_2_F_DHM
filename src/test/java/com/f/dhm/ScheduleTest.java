package com.f.dhm;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.f.dhm.planner.PlannerRepository;
import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO;
@SpringBootTest
class ScheduleTest {
	
	@Autowired
	PlannerRepository repository;
	
	@Autowired
	PlannerService service;
	
	@Test
	void test() throws Exception{
		List<PlannerVO> list = new ArrayList<>();
			
		for (int i = 1; i < 6; i++) {
			PlannerVO pvo = new PlannerVO();
			pvo.setTitle("여행 "+i+"일 째");
			pvo.setId("coo");
			pvo.setBak(1);
			pvo.setRegion("서울");
			pvo.setType("남자끼리");
			pvo.setTransfer("버스");
			pvo.setPeople(5);
			Date d = new Date();
			list.add(pvo);
		}
		
		int plNum = service.getPlnum();
		
		for (PlannerVO plannerVO : list) {
			plannerVO.setPlNum(plNum);
			repository.save(plannerVO);
			Thread.sleep(100);
		}
		
	}

}
