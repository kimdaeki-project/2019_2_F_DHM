package com.f.dhm;


import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.f.dhm.Member.MemberService;
import com.f.dhm.Member.MemberVO;
import com.f.dhm.location.LocationService;
import com.f.dhm.planner.PlannerRepository;
import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO;
@SpringBootTest
class ScheduleTest {
	
	@Autowired
	PlannerRepository repository;
	
	@Autowired
	PlannerService service;
	
	@Autowired
	LocationService LoService;
	
	@Autowired
	MemberService meService;
	
	@Test
	void test() throws Exception{
		
//		for (int i = 0; i < 20; i++) {
//			MemberVO vo = new MemberVO();
//			vo.setId("test"+i);
//			vo.setPw("t"+i);
//			vo.setName("TT");
//			Calendar c = Calendar.getInstance();
//			Date d = new Date(c.getTimeInMillis());
//			vo.setBirth(d);
//			vo.setEmail("h@h.om");
//			
//			meService.memberJoin(vo);
//			Thread.sleep(200);
//		}
		
		
	}

}
