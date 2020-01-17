package com.f.dhm.notice;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class NoticeRepositoryTest {

	@Autowired
	private NoticeRepository noticeRepository;
	
	//@Test
	void test() {
		List<NoticeVO> list=noticeRepository.findAll();
		for(NoticeVO noticeVO:list) {
			System.out.println("TEST : noticeVO"+list);
			System.out.println(noticeVO.getNum());
			System.out.println(noticeVO.getTitle());
			System.out.println(noticeVO.getId());
			System.out.println(noticeVO.getRegDate());
		}
	}
	
	@Test
	void writeNotice() {
		for(int i=50;i<100;i++) {
			NoticeVO noticeVO=new NoticeVO();
			noticeVO.setId("wirter"+i);
			noticeVO.setTitle("test Write title : "+i);
			noticeVO.setContents("test contents"+i);
			noticeRepository.save(noticeVO);
		}
	}

}
