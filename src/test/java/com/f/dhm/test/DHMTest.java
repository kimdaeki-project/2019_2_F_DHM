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
	
	
}
