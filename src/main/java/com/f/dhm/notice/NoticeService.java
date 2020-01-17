package com.f.dhm.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;
	
	public void noticeDelete(int num)throws Exception{
		noticeRepository.deleteById(num);
	}
	public NoticeVO selectById(int num)throws Exception{
		NoticeVO noticeVO=noticeRepository.findById(num).get();
		int hit=noticeVO.getHit();
		noticeVO.setHit(hit++);
		return noticeVO;
	}
	public List<NoticeVO> noticeList()throws Exception{
		 return noticeRepository.findAll();
	}
	public void noticeWrite(NoticeVO noticeVO)throws Exception{
		noticeRepository.save(noticeVO);
	}
	
	public Page<NoticeVO> noticeListPage(Pageable pageable)throws Exception{
		return noticeRepository.findAll(pageable);
	}
	
}
