package com.f.dhm;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.f.dhm.planner.PlannerCommentRepository2;
import com.f.dhm.planner.PlannerCommentVO2;

@SpringBootTest
class DhmApplicationTests {
	
	@Autowired
	private PlannerCommentRepository2 plannerCommentRepository;
	
	
	@Test
	void contextLoads() {
	
		
	}

}
