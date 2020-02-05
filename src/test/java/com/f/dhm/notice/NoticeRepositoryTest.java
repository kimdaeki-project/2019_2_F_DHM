package com.f.dhm.notice;

import static org.junit.jupiter.api.Assertions.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.annotation.Rollback;

@SpringBootTest
class NoticeRepositoryTest {

	@Autowired
	private NoticeRepository noticeRepository;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeFilesRepository noticeFilesRepository;
	
	@Test
	public void deletefile() throws Exception{

		NoticeVO noticeVO=new NoticeVO();
		List<NoticeFilesVO> noticeFilesVOs=new ArrayList<NoticeFilesVO>();
		noticeVO.setTitle("test title2");
		noticeVO.setContents("test contents2");
		for(int i=0;i<3;i++) {
			NoticeFilesVO files=new NoticeFilesVO();
			files.setFname("fname"+i);
			files.setOname("oname"+i);
			files.setNoticeVO(noticeVO);
			noticeFilesVOs.add(files);
		}
		 noticeVO.setNoticeFilesVOs(noticeFilesVOs);
		 
		 noticeRepository.save(noticeVO);
		 noticeRepository.flush();
	}
	

}
