package com.f.dhm.test;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import com.f.dhm.Member.MemberFilesRepository;
import com.f.dhm.Member.MemberFilesVO;
import com.f.dhm.Member.MemberRepository;
import com.f.dhm.Member.MemberService;
import com.f.dhm.Member.MemberVO;

@SpringBootTest
//@Transactional(rollbackOn = Exception.class)
public class DHMTest {

	@Resource
	private MemberRepository memberRepository;
	@Autowired
	private MemberFilesRepository memberFilesRepository;

	
	//@Test
	void memberTest()throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("test1");
		memberVO.setPw("pw1");
		memberVO.setName("name1");
		memberVO.setEmail("email1@");
		memberVO.setGender(1);
		memberVO.setBirth(new Date(Calendar.getInstance().getTimeInMillis()));
		memberVO.setMailCheck(1);
		memberVO.setSocial(1);
		memberVO.setGrade(1);
		memberVO = memberRepository.save(memberVO);
		System.out.println(memberVO.getEmail());
		//Optional<MemberVO> mv = memberRepository.findById("test");
		//System.out.println(mv.get().getEmail());
		
	}
	
	@Test
	public void test()throws Exception{
		//MemberFilesVO memberFilesVO=new MemberFilesVO();
		//MemberFilesVO memfiles=memberFilesRepository.findByOname("유금필.png").get();
		//System.out.println("memfiles.getFnum() : "+memfiles.getFnum());
		//int fnum=memberRepository.findById("afkn100").get().getMemberFilesVO().getFnum();
		//System.out.println("fnum : "+fnum);
		MemberVO memberVO=memberRepository.findById("afkn100").get();
		
	}
	
	
	
}
