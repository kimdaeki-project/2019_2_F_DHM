package com.f.dhm.qna;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class QnaService {

	@Autowired
	private QnaRepository qnaRepository;
	
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
		
		//QnaVO qnaVO2=qnaRepository.findById(num).get();
		qnaVO=qnaRepository.findById(qnaVO.getNum()).get();
		int depth=qnaVO.getDepth();
		depth++;
		qnaVO2.setDepth(depth);
		System.out.println("test : qnaService.qnaVO.getRef : "+qnaVO.getRef());
		qnaVO2.setRef(qnaVO.getRef());////////////////////////////////////////////
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
	
	public Page<QnaVO> qnaListPage(Pageable pageable)throws Exception{
		return qnaRepository.qnalisst(pageable);
	}
}
