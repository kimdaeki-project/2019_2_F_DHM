package com.f.dhm;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.f.dhm.planner.PlannerCommentRepository;
import com.f.dhm.planner.PlannerCommentVO;

@SpringBootTest
class DhmApplicationTests {
	
	@Autowired
	private PlannerCommentRepository plannerCommentRepository;
	
	
	@Test
	void contextLoads() {
	
		PlannerCommentVO pc=new PlannerCommentVO();
		pc.setCNum(0);
		pc.setTitle("comment title");
		pc.setContents("contents");
		pc.setId("testID");
		pc.setPlNum(7);
		
		plannerCommentRepository.save(pc);
		plannerCommentRepository.flush();
	}

}
