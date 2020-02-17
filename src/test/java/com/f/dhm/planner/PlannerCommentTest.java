package com.f.dhm.planner;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.annotation.Rollback;

@SpringBootTest
@Transactional
class PlannerCommentTest {

	@Autowired
	private PlannerCommentRepository commentRepository;
	@Autowired
	private PlannerRepository plannerRepository;
	
	
	@Test
	void test()throws Exception{
		//List<PlannerCommentVO> commentVOs=commentRepository.findAll(Sort.by("regDate", "desc"));
		System.out.println("^^^^^^^^^^^^^^^^^");
		//List<PlannerCommentVO> commentVOs=commentRepository.findAll();
		List<PlannerCommentVO> commentVOs=commentRepository.findAllOrderByRegDateDesc(PageRequest.of(0, 10));
		commentVOs.forEach(System.out::println);
	}
	
	
	
}
