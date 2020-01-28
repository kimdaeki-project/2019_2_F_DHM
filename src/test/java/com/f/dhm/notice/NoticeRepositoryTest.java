package com.f.dhm.notice;

import static org.junit.jupiter.api.Assertions.*;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class NoticeRepositoryTest {

	@Autowired
	private NoticeRepository noticeRepository;
	@Autowired
	private NoticeService noticeService;
	
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
	
	//@Test
	void writeNotice() {
		for(int i=50;i<100;i++) {
			NoticeVO noticeVO=new NoticeVO();
			noticeVO.setId("wirter"+i);
			noticeVO.setTitle("test Write title : "+i);
			noticeVO.setContents("test contents"+i);
			noticeRepository.save(noticeVO);
		}
	}
	
	//@Test
	void calendarGetTime(){
		Calendar calendar= Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat();
		format.applyPattern("yyyy-MM-dd");

		System.out.println("calendar.getTime() : "+format.format(calendar.getTime()));
	}
	
	@Test
	void increaseHit() {
		try {
			noticeService.increaseHit(140);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
