package com.f.dhm.planner;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

@SpringBootTest
@Transactional
class PlannerCommentTest {

	@Autowired
	private PlannerCommentRepository2 plannerCommentRepository;
	@Autowired
	private PlannerRepository plannerRepository;
	
	
	//@Test
	@Rollback(false)
	void test() throws Exception{

		PlannerCommentVO2 plannerCommentVO=new PlannerCommentVO2();
		plannerCommentVO.setContents("Caused by: java.sql.SQLException: Field");
		plannerCommentVO.setId("iso-8859-1");
		plannerCommentVO.setPlNum(52);
		
		plannerCommentRepository.save(plannerCommentVO);
		plannerCommentRepository.flush();
	}
	
	@Test
	void test2()throws Exception{
		List<PlannerCommentVO2> commentVOs=plannerCommentRepository.findByPlNum(52);
		commentVOs.forEach(System.out::println);
	}

	
}
