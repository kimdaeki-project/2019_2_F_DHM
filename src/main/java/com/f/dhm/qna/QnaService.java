package com.f.dhm.qna;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jdk.nashorn.internal.runtime.FindProperty;

@Service
@Transactional
public class QnaService {

	@Autowired
	private QnaRepository qnaRepository;
	

	public void qnaUpdate(QnaVO qnaVO)throws Exception{
		QnaVO forGetDate=qnaRepository.findById(qnaVO.getNum()).get();
		qnaVO.setRegDate(forGetDate.getRegDate());
		qnaRepository.save(qnaVO);
	}
	
	public QnaVO getQnaUpdate(int num)throws Exception{
		Optional<QnaVO> opt=qnaRepository.findById(num);
		QnaVO qnaVO=opt.get();
		return qnaVO;
	}
	

	public void increaseHit(int num) {
		QnaVO qnaVO=qnaRepository.findById(num).get();
		int hit=qnaVO.getHit();
		hit++;
		qnaVO.setHit(hit);
		qnaRepository.save(qnaVO);
	}
	public void qnaDeleteAll()throws Exception{
		qnaRepository.deleteAll();
	}
	public void qnaDelete(int num)throws Exception{
		qnaRepository.deleteById(num);
		
		List<QnaVO> qnalist=qnaRepository.findByRef(num);
		for(int i=0;i<qnalist.size();i++) {
			qnaRepository.deleteById(qnalist.get(i).getNum());
		}
	}
	public void qnaComment(QnaVO qnaVO)throws Exception{
		QnaVO qnaVO2=new QnaVO();
		qnaVO2.setTitle(qnaVO.getTitle());
		qnaVO2.setContents(qnaVO.getContents());
		qnaVO2.setWriter(qnaVO.getWriter());	
		qnaVO=qnaRepository.findById(qnaVO.getNum()).get();
		qnaVO2.setRef(qnaVO.getRef());
		qnaVO2.setDepth(qnaVO.getDepth()+1);
		int step=qnaVO.getStep()+1;
		qnaVO2.setStep(step);
		List<QnaVO> stepIncreaseList=qnaRepository.findByRef(qnaVO.getRef());
		for( int i=0;i<stepIncreaseList.size();i++) {
			if(stepIncreaseList.get(i).getStep()>=step) {
				stepIncreaseList.get(i).setStep(stepIncreaseList.get(i).getStep()+1);
			}
		}
		qnaRepository.saveAll(stepIncreaseList);		
		qnaRepository.save(qnaVO2);	
	}
	
	public void qnaWrite(QnaVO qnaVO)throws Exception{
		qnaVO.setRegDate(new Date(Calendar.getInstance().getTimeInMillis()));
		qnaVO.setReDate(new Date(Calendar.getInstance().getTimeInMillis()));
		qnaRepository.save(qnaVO);
		qnaVO.setRef(qnaVO.getNum());
		qnaRepository.save(qnaVO);
	}
	
	public QnaVO qnaSelect(int num)throws Exception{
		QnaVO qnaVO=qnaRepository.findById(num).get();
		return qnaVO;
	}
	
	public Page<QnaVO> qnaListPage(Pageable pageable,String searchingFor)throws Exception{
		if(searchingFor!=null) {
			return qnaRepository.findByTitleContains(searchingFor, pageable);
		}else {
			
			return qnaRepository.qnalisst(pageable);
		}
	}
}
