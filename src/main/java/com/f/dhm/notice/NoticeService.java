package com.f.dhm.notice;



import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
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
	
	public void increaseHit(int num)throws Exception{
		NoticeVO noticeVO=noticeRepository.findById(num).get();
		int hit=noticeVO.getHit();
		hit++;
		noticeVO.setHit(hit);
		noticeRepository.save(noticeVO);
	}
	
	public void noticeUpdate(NoticeVO noticeVO)throws Exception{
		System.out.println("11111111111111111111111");
		System.out.println("noticeVO.getNum() : "+noticeVO.getNum());
		System.out.println("noticeVO.gettitle : "+noticeVO.getTitle());
		System.out.println("noticeVO.getContents() : "+noticeVO.getContents());
		System.out.println("noticeVO.getId() : "+noticeVO.getId());
		System.out.println("NOTICEvo.DATE() : "+noticeVO.getRegDate());

		NoticeVO ntc=noticeRepository.findById(noticeVO.getNum()).get();
		noticeVO.setRegDate(ntc.getRegDate());
		
		noticeRepository.save(noticeVO);
	}
	
	public void noticeDelete(int num)throws Exception{
		noticeRepository.deleteById(num);
	}
	
	public NoticeVO selectById(int num)throws Exception{
		NoticeVO noticeVO=noticeRepository.findById(num).get();
		System.out.println("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: service print : selectById(int num) ");
		List<NoticeFilesVO> files=noticeVO.getNoticeFilesVOs();
		System.out.println("**get ** ** ok**");
		for(int i=0;i<files.size();i++) {
			System.out.println("files.get(i).getFnum() : "+files.get(i).getFnum());
			System.out.println("files.get(i).getFname() : "+files.get(i).getOname());
		}
		return noticeVO;
	}
	public List<NoticeVO> noticeList()throws Exception{
		 return noticeRepository.findAll();
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
//					File file = filePathGenerator.getUseClassPathResource("upload");
//					String fileName = fileSaver.save(file, multipartFile);
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
