package com.f.dhm.notice;



import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;
	@Autowired
	private NoticeFilesRepository noticeFilesRepository;
	
	public void notice_file_delete(int num)throws Exception{
		noticeFilesRepository.deleteById(num);
	}
	
	public void noticeUpdate(NoticeVO noticeVO, List<MultipartFile> files)throws Exception{
		NoticeVO getDate=noticeRepository.findById(noticeVO.getNum()).get();
		noticeVO.setRegDate(getDate.getRegDate());
		List<NoticeFilesVO> noticeFilesVOs=new ArrayList<NoticeFilesVO>();
		if(files.size()>0) {
			for(int i=0;i<files.size();i++) {
				NoticeFilesVO noticeFilesVO=new NoticeFilesVO();
				noticeFilesVO.setFname(files.get(i).getName());
				noticeFilesVO.setOname(files.get(i).getOriginalFilename());
				noticeFilesVO.setNoticeVO(noticeVO);
				noticeFilesVOs.add(noticeFilesVO);
			}
			noticeVO.setNoticeFilesVOs(noticeFilesVOs);
		}
		noticeRepository.save(noticeVO);
	}
	
	public void increaseHit(int num)throws Exception{
		NoticeVO noticeVO=noticeRepository.findById(num).get();
		int hit=noticeVO.getHit();
		hit++;
		noticeVO.setHit(hit);
		noticeRepository.save(noticeVO);
	}
	
	public void noticeUpdate(NoticeVO noticeVO)throws Exception{
		NoticeVO ntc=noticeRepository.findById(noticeVO.getNum()).get();
		noticeVO.setRegDate(ntc.getRegDate());
		noticeRepository.save(noticeVO);
	}
	
	public void noticeDelete(int num)throws Exception{
		noticeRepository.deleteById(num);
	}
	
	public NoticeVO selectById(int num)throws Exception{
		NoticeVO noticeVO=noticeRepository.findById(num).get();
		List<NoticeFilesVO> files=noticeVO.getNoticeFilesVOs();
		for(int i=0;i<files.size();i++) {
			System.out.println("files.get(i).getFnum() : "+files.get(i).getFnum());
			System.out.println("files.get(i).getFname() : "+files.get(i).getOname());
		}
		return noticeVO;
	}
	public List<NoticeVO> noticeList()throws Exception{
		
		List<NoticeVO> list= noticeRepository.findAll();
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setRegDate(list.get(i).getRegDate());
		}
		return list;
	}
	public void noticeWrite(NoticeVO noticeVO,List<MultipartFile> files)throws Exception{
		List<NoticeFilesVO> noticeFilesVOs=null;
		
		boolean check=false;
		
		if(files.size()>0) {
			for(MultipartFile multipartFile:files) {
				if(multipartFile.getSize()>0) {
					check=true;
					break;
				}
			}
		}
		
		if(check) {
			noticeFilesVOs=new ArrayList<NoticeFilesVO>();
			for(MultipartFile multipartFile:files) {
				if(multipartFile.getSize()>0) {
					NoticeFilesVO noticeFilesVO=new NoticeFilesVO();
					noticeFilesVO.setFname("filename");
					noticeFilesVO.setOname(multipartFile.getOriginalFilename());
					noticeFilesVOs.add(noticeFilesVO);
					noticeFilesVO.setNoticeVO(noticeVO);
				}
				noticeVO.setNoticeFilesVOs(noticeFilesVOs);
			}
		}
		noticeRepository.save(noticeVO);
	}
	
	public Page<NoticeVO> noticeListPage(Pageable pageable,String searchingFor)throws Exception{
		return noticeRepository.findByTitleContains(searchingFor, pageable);
	}
	
}
