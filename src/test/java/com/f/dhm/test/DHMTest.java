package com.f.dhm.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Commit;

import com.f.dhm.Member.MemberRepository;
import com.f.dhm.Member.MemberService;
import com.f.dhm.Member.MemberVO;
import com.f.dhm.planner.PlannerCommentRepository;
import com.f.dhm.planner.PlannerCommentVO;

@SpringBootTest
//@Transactional(rollbackOn = Exception.class)
public class DHMTest {

	@Resource
	private MemberRepository memberRepository;
	
	@Autowired
	private PlannerCommentRepository commentRepository;
	
	
	//@Test
	void test5()throws Exception{
		//List<PlannerCommentVO> commentVOs=commentRepository.findAll();
		//commentVOs.forEach(System.out::println);
		
		//List<PlannerCommentVO> commentVOs=commentRepository.findAll(Sort.by("regDate", "desc"));
		System.out.println("^^^^^^^^^^^^^^^^^");
		List<PlannerCommentVO> commentVOs=commentRepository.findAll();
		//List<PlannerCommentVO> commentVOs=commentRepository.findAllOrderByRegDateDesc();
		commentVOs.forEach(System.out::println);
	}
}
